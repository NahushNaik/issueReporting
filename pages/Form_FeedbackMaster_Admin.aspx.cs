using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_Form_FeedbackMaster_Admin : System.Web.UI.Page
{
    string UserId;
    static int tStatus;
    public static string userEmail = string.Empty;
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
        catch (Exception ex)
        {
            throw ex;
        }
    }
    private void fnLoadData(Boolean DoRebind)
    {
        try
        {



            string query = "SELECT     tbl_User_Feedback.Ticket_Id, tbl_User_Feedback.Feedback,  tbl_User_Feedback.Created_Time, tbl_Type_Master.Type_Name,(  tbl_User_Master.User_First_Name + ' ' + tbl_User_Master.User_Last_Name) as userName FROM  tbl_Type_Master INNER JOIN tbl_Ticket_Master ON tbl_Type_Master.Type_Id = tbl_Ticket_Master.Type_Id INNER JOIN  tbl_User_Feedback ON tbl_Ticket_Master.Ticket_Id = tbl_User_Feedback.Ticket_Id INNER JOIN tbl_User_Master ON tbl_Ticket_Master.Created_By = tbl_User_Master.User_Id and tbl_Ticket_Master.Type_Id IN (SELECT     Type_Id FROM fnAdminAccess() where user_Email='" + userEmail + "')  order by  tbl_User_Feedback.Created_Time desc";

            DataTable dt = DBUtils.SQLSelect(new SqlCommand(query));

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