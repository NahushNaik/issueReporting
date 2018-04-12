using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;
using System.IO;
using System.Net.Mail;

public partial class pages_UserDash : System.Web.UI.Page
{
    string typeId = string.Empty;
    string createdBy = string.Empty;
    string UserId;

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
            UserId = DBNulls.StringValue(Session[PublicMethods.ConstUserId].ToString());
            if (!profileStatus)
            {
                Response.Redirect("UserProfile.aspx");
            }

            UserId = DBNulls.StringValue(Session[PublicMethods.ConstUserId].ToString());
        }

        //Load user details first time
        if (!IsPostBack)
        {
            //One tume details loading
        }

        populateTicketStaus();
        fnUpdateTicketCompletionStatus();
        fnnFeedbackCount();
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

    protected void fnUpdateTicketCompletionStatus()
    {
        //Replace below code with database function
        string qryToInsertLog = "SELECT (((select COUNT(*) FROM [tbl_Ticket_Master] WHERE Status = '1' AND Created_By = " + DBNulls.StringValue(Session[PublicMethods.ConstUserId]) + ")*100)/(select COUNT(*) FROM [tbl_Ticket_Master] WHERE Created_By = " + DBNulls.StringValue(Session[PublicMethods.ConstUserId]) + ")) as per FROM [tbl_Ticket_Master] WHERE Created_By = " + DBNulls.StringValue(Session[PublicMethods.ConstUserId]) + "";

        Session["ticketCompletion"] = DBNulls.NumberValue(DBUtils.SqlSelectScalar(new SqlCommand(qryToInsertLog)));
    }

    protected void populateTicketStaus()
    {


        //Closed ticket details

        //Assign Count
        string closedCount = DBNulls.NumberValue(DBUtils.SqlSelectScalar(new SqlCommand("SELECT COUNT(*) AS CNT FROM TBL_TICKET_MASTER WHERE Created_By = '" + DBNulls.StringValue(Session[PublicMethods.ConstUserId]) + "' AND STATUS = 1"))).ToString();  //(1=Open)
        HyperLinkTicketsClosed.Text = PublicMethods.ConstTicketClosed.ToUpper();
        HyperLinkTicketsClosedCount.Text = closedCount;

        //Assign URL
        HyperLinkTicketsClosed.NavigateUrl = "UserTicketReports?status=" + PublicMethods.ConstTicketClosed;
        HyperLinkTicketsClosedCount.NavigateUrl = "UserTicketReports?status=" + PublicMethods.ConstTicketClosed;
        HyperLinkTicketClosedViewList.NavigateUrl = "UserTicketReports?status=" + PublicMethods.ConstTicketClosed;




        //Open ticket details

        //Assign Count
        string openCount = DBNulls.NumberValue(DBUtils.SqlSelectScalar(new SqlCommand("SELECT COUNT(*) AS CNT FROM TBL_TICKET_MASTER WHERE Created_By = '" + DBNulls.StringValue(Session[PublicMethods.ConstUserId]) + "' AND STATUS = 0"))).ToString(); //(0=Close)
        HyperLinkTicketsOpen.Text = PublicMethods.ConstTicketOpen.ToUpper();
        HyperLinkTicketsOpenCount.Text = openCount;

        //Assign URL
        HyperLinkTicketsOpen.NavigateUrl = "UserTicketReports?status=" + PublicMethods.ConstTicketOpen;
        HyperLinkTicketsOpenCount.NavigateUrl = "UserTicketReports?status=" + PublicMethods.ConstTicketOpen;
        HyperLinkTicketOpenViewList.NavigateUrl = "UserTicketReports?status=" + PublicMethods.ConstTicketOpen;


        //Recent ticket details

        //Assign Count
        string recentDays = DBNulls.NumberValue(DBUtils.SqlSelectScalar(new SqlCommand("SELECT DATEDIFF(day, tbl_Ticket_Master.Created_Time,GETDATE()) as CNT FROM TBL_TICKET_MASTER WHERE Created_By = '" + DBNulls.StringValue(Session[PublicMethods.ConstUserId]) + "' ORDER BY tbl_Ticket_Master.Created_Time DESC"))).ToString();
        //HyperLinkTicketRecent.Text = recentDays + " days ago..";
        HyperLinkTicketDays.Text = recentDays + " days ago";

        //Assign URL
        HyperLinkTicketDays.NavigateUrl = "UserTicketReports?status=" + PublicMethods.ConstTicketRecent;
        HyperLinkTicketRecentView.NavigateUrl = "UserTicketReports?status=" + PublicMethods.ConstTicketRecent;


    }

    protected void fnSendUserMailXML()
    {
        try
        {
            string body = "";
            string emailId = "", password = "";
            string ticketID = "";

            //LOAD SMTP SETTINGS
            SqlDataAdapter db = new SqlDataAdapter("SELECT * FROM tblSMTPSettingsMaster", ConfigurationManager.ConnectionStrings["ConnectionWeb"].ToString());
            DataSet ds = new DataSet();
            db.Fill(ds);
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            SmtpClient smtp = new SmtpClient();
            smtp.Timeout = 2 * 100000;

            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow dr in table.Rows)
                {
                    smtp.Host = dr["Servername"].ToString();
                    smtp.Port = Convert.ToInt16(dr["Portno"].ToString());
                    smtp.EnableSsl = Convert.ToBoolean(dr["EnableSsl"].ToString());
                    emailId = dr["Emailid"].ToString();
                    password = dr["Usrpassword"].ToString();
                }
            }


            body = PopulateUserBodyApplication(ticketID);

            string userIdCC = "", userIdTo = "";
            smtp.Credentials = new System.Net.NetworkCredential(emailId, password);
            mail.From = new MailAddress(emailId, "displayName");
            mail.Subject = "User Query: ";

            //Load TO Email ID's
            var userSqlTo = "SELECT [Escalation_ID] FROM [tbl_EscalationEmail_Master] WHERE [TYPE_ID]='" + typeId + "'";

            SqlDataAdapter dbUserTo = new SqlDataAdapter(userSqlTo, ConfigurationManager.ConnectionStrings["ConnectionWeb"].ToString());
            DataSet dsTo = new DataSet();
            dbUserTo.Fill(dsTo);
            foreach (DataTable tbl in dsTo.Tables)
            {
                foreach (DataRow row1 in tbl.Rows)
                {
                    userIdTo = row1["To_Email_Id"].ToString();
                    mail.To.Add(userIdTo);
                }

            }

            //Load CC Email ID's
            var userSqlCC = "SELECT [CC_Email_Id] FROM [tbl_Email_CC_Master] WHERE [TYPE_ID]='" + typeId + "'";
            SqlDataAdapter dbUserCC = new SqlDataAdapter(userSqlCC, ConfigurationManager.ConnectionStrings["ConnectionWeb"].ToString());
            DataSet dsCC = new DataSet();
            dbUserCC.Fill(dsCC);
            foreach (DataTable tbl1 in dsCC.Tables)
            {
                foreach (DataRow row1 in tbl1.Rows)
                {
                    userIdCC = row1["CC_Email_Id"].ToString();
                    mail.CC.Add(userIdCC);
                }

            }

            mail.CC.Add(Session["LoginUserEmail"].ToString());
            mail.IsBodyHtml = true;
            mail.Body = body;
            smtp.Send(mail);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected string PopulateUserBodyApplication(string ticketID)
    {
        string body, name = "", email = "";
        String contact = "";
        ticketID = txtEscalation.Text;
        var qry = "SELECT User_First_Name, User_Last_Name,[User_Email],[Contact_No] FROM tbl_User_Master WHERE [USER_ID]='" + createdBy + "'";

        SqlDataAdapter db = new SqlDataAdapter(qry, ConfigurationManager.ConnectionStrings["ConnectionWeb"].ToString());
        DataTable dt = new DataTable();
        db.Fill(dt);

        foreach (DataRow row in dt.Rows)
        {
            name = DBNulls.StringValue(row["User_First_Name"].ToString()) + " " + DBNulls.StringValue(row["User_Last_Name"].ToString());
            email = DBNulls.StringValue(row["User_Email"].ToString());
            contact = DBNulls.StringValue(row["Contact_No"].ToString());
        }

        //To read html file
        StreamReader readTemplateFile = null;
        //Read email template file 
        readTemplateFile = new StreamReader(Server.MapPath("Email_Body/Email_Body_UserResponse.html"));
        string allContents = readTemplateFile.ReadToEnd();
        allContents = allContents.Replace("@#TICKET_DETAILS#@", ticketID);
        allContents = allContents.Replace("@#TICKET_CONTACT#@", contact);

        body = allContents;
        return body;
    }

    protected void btnEscalate_Click(object sender, EventArgs e)
    {
        createdBy = UserId;
        fnSendUserMailXML();
        txtEscalation.Text = "";
        
    }

    protected void fnnFeedbackCount() {
        string qry = "SELECT  count(distinct tbl_User_Feedback.Ticket_Id) FROM tbl_Type_Master INNER JOIN tbl_Ticket_Master ON tbl_Type_Master.Type_Id = tbl_Ticket_Master.Type_Id INNER JOIN tbl_User_Feedback ON tbl_Ticket_Master.Ticket_Id = tbl_User_Feedback.Ticket_Id INNER JOIN tbl_User_Master ON tbl_Ticket_Master.Created_By = tbl_User_Master.User_Id INNER JOIN tbl_Feedback_Master ON tbl_User_Feedback.Feedback = tbl_Feedback_Master.feedback where tbl_Feedback_Master.status='Good' and tbl_Ticket_Master.Created_By='" + UserId + "'";
        hplFeedbackCountPositiveText.Text = DBUtils.SqlSelectScalar(new SqlCommand(qry));

        qry = "SELECT COUNT( distinct tbl_User_Feedback.Ticket_Id) FROM tbl_Type_Master INNER JOIN tbl_Ticket_Master ON tbl_Type_Master.Type_Id = tbl_Ticket_Master.Type_Id INNER JOIN tbl_User_Feedback ON tbl_Ticket_Master.Ticket_Id = tbl_User_Feedback.Ticket_Id INNER JOIN tbl_User_Master ON tbl_Ticket_Master.Created_By = tbl_User_Master.User_Id INNER JOIN tbl_Feedback_Master ON tbl_User_Feedback.Feedback = tbl_Feedback_Master.feedback where tbl_Feedback_Master.status='Bad' and tbl_Ticket_Master.Created_By='" + UserId + "'";
        hplFeedbackCountNegativeText.Text = DBUtils.SqlSelectScalar(new SqlCommand(qry));
        
    }
}