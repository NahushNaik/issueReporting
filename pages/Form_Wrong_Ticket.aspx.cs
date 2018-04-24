﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_Form_Wrong_Ticket : System.Web.UI.Page
{

    string id;
    public static string userEmail = string.Empty;
    string userId = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        //Check Login
        if (DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]).Equals(""))
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            userEmail = Session[PublicMethods.ConstUserEmail].ToString();
            //Check user profile status
            bool profileStatus = CheckProfileIsValid(DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]));

            if (!profileStatus)
            {
                Response.Redirect("UserProfile.aspx");
            }

            //id = Request.QueryString["id"];
        }
        if (!IsPostBack)
        {
            fnLoadData(true);

        }

        PublicMethods.LocalizeRadGridFilters(rgTicketLogs);
    }

    protected bool CheckProfileIsValid(string userEMail)
    {

        try
        {

            DataTable dt = DBUtils.SQLSelect(new SqlCommand("SELECT [User_Id],[User_Email],[User_First_Name],[User_Last_Name],[Contact_No],[Plant_Id],[Department_Id] FROM tbl_User_Master where User_Email='" + userEMail + "'"));

            if (dt.Rows.Count > 0)
            {
                userId = DBNulls.StringValue(dt.Rows[0]["User_Id"]).ToString();
                if (DBNulls.StringValue(dt.Rows[0]["User_Id"]).Trim().Equals("") || DBNulls.StringValue(dt.Rows[0]["User_Email"]).Trim().Equals("") || DBNulls.StringValue(dt.Rows[0]["User_First_Name"]).Trim().Equals("") || DBNulls.StringValue(dt.Rows[0]["User_Last_Name"]).Trim().Equals("") || DBNulls.StringValue(dt.Rows[0]["Contact_No"]).Trim().Equals("") || DBNulls.StringValue(dt.Rows[0]["Plant_Id"]).Trim().Equals("") || DBNulls.StringValue(dt.Rows[0]["Department_Id"]).Trim().Equals(""))
                {
                    Session[PublicMethods.ConstUserId] = DBNulls.StringValue(dt.Rows[0]["User_Id"]);
                    return false;
                }
                else
                {
                    Session[PublicMethods.ConstUserId] = DBNulls.StringValue(dt.Rows[0]["User_Id"]);
                    return true;
                }
            }
            else
            {
                return false;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void rgTicketLogs_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        try
        {
            fnLoadData(false);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    private void fnLoadData(Boolean DoRebind)
    {
        try
        {
           
            //string query = "SELECT tbl_Ticket_Master_shadow.Ticket_Id, tbl_Ticket_Master_shadow.Type_Id, tbl_Ticket_Master_shadow.Application_Id, tbl_Ticket_Master_shadow.Issue_Id, tbl_Ticket_Master_shadow.Created_Time,tbl_Ticket_Master_shadow.Updated_Time, tbl_Ticket_Master_shadow.Status, tbl_Ticket_Master_shadow.hours, tbl_Ticket_Master_shadow.isValid, CASE WHEN tbl_Ticket_Master_shadow.Updated_Time IS NULL THEN 'Update' WHEN tbl_Ticket_Master_shadow.Updated_Time IS NOT NULL THEN 'Closed' END AS AuditAction,tbl_Ticket_Master_shadow.Issue_Details, tbl_Ticket_Master_shadow.AuditDate,tbl_Type_Master.Type_Name, tbl_Application_Master.Application_Name,tbl_Issue_Master.Issue_Name,tbl_User_Master_1.User_Email, tbl_Ticket_Master_shadow.ReassignRemark FROM         tbl_User_Master AS tbl_User_Master_1 INNER JOIN tbl_Ticket_Master_shadow INNER JOIN tbl_Type_Master ON tbl_Ticket_Master_shadow.Type_Id = tbl_Type_Master.Type_Id INNER JOIN tbl_Application_Master ON tbl_Ticket_Master_shadow.Application_Id = tbl_Application_Master.Application_Id INNER JOIN tbl_Issue_Master ON tbl_Ticket_Master_shadow.Issue_Id = tbl_Issue_Master.Issue_Id ON tbl_User_Master_1.User_Id = tbl_Ticket_Master_shadow.Created_By AND tbl_User_Master_1.User_Email = '" + userEmail + "' And tbl_Ticket_Master_shadow.ReassignRemark IS NOT NULL ORDER BY tbl_Ticket_Master_shadow.Ticket_Id DESC";



            string query = "SELECT tbl_Ticket_Master_shadow.Ticket_Id, tbl_Type_Master.Type_Name, tbl_Application_Master.Application_Name,tbl_Issue_Master.Issue_Name, tbl_Ticket_Master_shadow.Issue_Details,tbl_Ticket_Master_shadow.Created_Time,tbl_Ticket_Master_shadow.Updated_Time, tbl_Ticket_Master_shadow.ReassignRemark, tbl_Ticket_Master_shadow.AuditAction as a1,Case When tbl_Ticket_Master_shadow.AuditAction='I' THEN 'CREATED' WHEN tbl_Ticket_Master_shadow.AuditAction='U' THEN 'UPDATED' END AS AuditAction ,tbl_Ticket_Master_shadow.AuditDate FROM tbl_Ticket_Master_shadow INNER JOIN tbl_Type_Master ON tbl_Ticket_Master_shadow.Type_Id = tbl_Type_Master.Type_Id INNER JOIN tbl_Application_Master ON tbl_Ticket_Master_shadow.Application_Id = tbl_Application_Master.Application_Id INNER JOIN                     tbl_Issue_Master ON tbl_Ticket_Master_shadow.Issue_Id = tbl_Issue_Master.Issue_Id where tbl_Ticket_Master_Shadow.Ticket_Id IN (select Ticket_Id from tbl_Ticket_Master where ReassignRemark IS NOT NULL and Created_By='"+userId+"')";
            DataTable dt = DBUtils.SQLSelect(new SqlCommand(query));
            if (dt.Rows.Count > 0)
            {
                rgTicketLogs.DataSource = dt;
                if (DoRebind == true)
                    rgTicketLogs.DataBind();
            }
            else
            {
                return;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
   
}