using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class pages_Form_Pending_Feedback : System.Web.UI.Page
{
    string UserId;
    static int tStatus;
    protected void Page_Load(object sender, EventArgs e)
    {
        //Check Login
        if (DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]).Equals(""))
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            //Check user profile status
            bool profileStatus = CheckProfileIsValid(DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]));

            if (!profileStatus)
            {
                Response.Redirect("UserProfile.aspx");
            }

            UserId = DBNulls.StringValue(Session[PublicMethods.ConstUserId].ToString());
        }
        if (!IsPostBack)
        {
            fnLoadData(true);

        }
    }

    protected bool CheckProfileIsValid(string userEMail)
    {

        try
        {

            DataTable dt = DBUtils.SQLSelect(new SqlCommand("SELECT [User_Id],[User_Email],[User_First_Name],[User_Last_Name],[Contact_No],[Plant_Id],[Department_Id] FROM tbl_User_Master where User_Email='" + userEMail + "'"));

            if (dt.Rows.Count > 0)
            {

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
    protected void rgUserFeedback_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        try
        {
            fnLoadData(false);
        }
        catch (Exception ex) {
            throw ex;
        }
    }
    private void fnLoadData(Boolean DoRebind)
    {
        try
        {



            //string query = "select Ticket_Id from tbl_Ticket_Master where Created_By='" + UserId + "'   and Status=1 and   tbl_Ticket_Master.Ticket_Id NOT IN (SELECT tbl_User_Feedback.Ticket_Id FROM  tbl_User_Feedback INNER JOIN tbl_Ticket_Master ON tbl_User_Feedback.Ticket_Id = tbl_Ticket_Master.Ticket_Id )";


            string query = "SELECT tbl_Ticket_Master.Ticket_Id, fnGetTicketAllDetail.[Type Name], fnGetTicketAllDetail.[Application Name], fnGetTicketAllDetail.[Issue Details], fnGetTicketAllDetail.[Created Time], fnGetTicketAllDetail.[Issue Name] FROM tbl_Ticket_Master INNER JOIN fnGetTicketAllDetail() AS fnGetTicketAllDetail ON tbl_Ticket_Master.Ticket_Id = fnGetTicketAllDetail.[Ticket No] WHERE  (tbl_Ticket_Master.Created_By = '" + UserId + "') AND (tbl_Ticket_Master.Status = 1) AND (tbl_Ticket_Master.Ticket_Id NOT IN (SELECT     tbl_User_Feedback.Ticket_Id FROM tbl_User_Feedback INNER JOIN tbl_Ticket_Master AS tbl_Ticket_Master_1 ON tbl_User_Feedback.Ticket_Id = tbl_Ticket_Master_1.Ticket_Id))";

            DataTable dt = DBUtils.SQLSelect(new SqlCommand(query));



            //dt.Columns.Add("Good");
            //dt.Columns.Add("Bad");
            //dt.Columns.Add("Moderate");

            //foreach (DataRow dr in dt.Rows) {
            //    dr["Good"] = "You're on Fire";
            //    dr["Bad"] = "I have Major Concerns";
            //    dr["Moderate"] = "I have few Concerns";
            //}



            rgUserFeedback.DataSource = dt;
            if (DoRebind == true)
                rgUserFeedback.DataBind();

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

}