//created by pavan ambhure

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Text;
using System.Drawing;

using System.Web.Configuration;
using System.Net.Mime;
using System.Globalization;
public partial class pages_ManageTicket : System.Web.UI.Page
{
    SqlConnection constr = DBUtils.getConnection();
    double TicketNo;
    string typeName = string.Empty;
    string applicationName = string.Empty;
    string issueName = string.Empty;
    string issueDetails = string.Empty;
    string priority = string.Empty;
    string createdBy = string.Empty;
    string createdAt = string.Empty;
    string ticketValid = string.Empty;

    string typeId = string.Empty;
    string applictionsId = string.Empty;
    static int tStatus;
    static DataTable table;


    string resType = string.Empty;
    string resAppl = string.Empty;






    string Ticket_Id = String.Empty;

    string Type_Id = String.Empty;
    string Application_Id = String.Empty;
    string Issue_Id = String.Empty;
    string Issue_Details = String.Empty;
    string Priority = String.Empty;
    string Is_Screenshots_Attached = String.Empty;
    string Created_By = String.Empty;
    string Created_Time = String.Empty;
    string Updated_Time = String.Empty;
    string Status = String.Empty;
    string hours = String.Empty;
    string isValid = String.Empty;
    string user = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]).Equals(""))
        {
            Response.Redirect("Login.aspx");
        }
        string Id = Request.QueryString["id"];

        if (Id == null)
        {
            Response.Redirect("Login.aspx");

        }

     


        if (!IsPostBack)
        {
         
            LoadTypeData();
            string queryToFetchAllData = "SELECT tbl_Issue_Master.Issue_Name, tbl_Ticket_Master.*,tbl_Type_Master.Type_Name, tbl_Application_Master.Application_Name FROM  tbl_Ticket_Master INNER JOIN tbl_Type_Master ON tbl_Ticket_Master.Type_Id = tbl_Type_Master.Type_Id INNER JOIN tbl_Application_Master ON tbl_Ticket_Master.Application_Id =tbl_Application_Master.Application_Id INNER JOIN tbl_Issue_Master ON tbl_Ticket_Master.Issue_Id = tbl_Issue_Master.Issue_Id where tbl_Ticket_Master.Ticket_Id='" + Id + "' ";
            DataTable dtAllData = DBUtils.SQLSelect(new SqlCommand(queryToFetchAllData));

            string dt = dtAllData.Rows[0]["Created_Time"].ToString();

            lblCreatedAt.Text = " Created At : " + Convert.ToDateTime(dt).ToString("dd/MMM/yyyy HH:mm:ss tt", CultureInfo.InvariantCulture);
            drpDownType.SelectedValue = dtAllData.Rows[0]["Type_Id"].ToString();
            resType = dtAllData.Rows[0]["Type_Id"].ToString();
            LoadApplicationData();
            drpDownApplication.SelectedValue = dtAllData.Rows[0]["Application_Id"].ToString();
            resAppl = dtAllData.Rows[0]["Application_Id"].ToString();
            LoadIssueData();
            DrpIssueType.SelectedValue = dtAllData.Rows[0]["Issue_Id"].ToString();





        }
        else {
            resType = drpDownType.SelectedValue;
        }



        string query = "select * from fnGetTicketDetail('" + Id + "')";
        table = DBUtils.SQLSelect(new SqlCommand(query));

        typeName = table.Rows[0]["Type Name"].ToString();
        applicationName = table.Rows[0]["Application Name"].ToString();
        issueName = table.Rows[0]["Issue Name"].ToString();


        drpStatus.DataSource = table;
        drpStatus.DataTextField = "Status";
        drpStatus.DataBind();
        lblStatus.Text = DBNulls.StringValue(table.Rows[0]["Status"].ToString());
        if (lblStatus.Text.Equals("Open"))
        {

            lblStatus.ForeColor = System.Drawing.Color.Green;

            txt_Comments.Enabled = true;
            btn_UpdateComment.Enabled = true;
            UpdateButton.Visible = true;
            lbl_Massage.Visible = true;
            ddlStatus.Enabled = true;
            txtRemark.Enabled = true;
        }
        else
        {

            query = "select  Remark  from tbl_Ticket_Manage where Ticket_Id= '" + Id + "'";
            txtRemark.Text = DBNulls.StringValue(DBUtils.SqlSelectScalar(new SqlCommand(query)));
            query = "select  hours  from tbl_Ticket_Master where Ticket_Id= '" + Id + "'";
            txtHours.Text = DBNulls.StringValue(DBUtils.SqlSelectScalar(new SqlCommand(query)));

            query = "select  isValid  from tbl_Ticket_Master where Ticket_Id= '" + Id + "'";
            string isValid=DBUtils.SqlSelectScalar(new SqlCommand(query));
            if (isValid == "") {

                isValid = "Yes";
            }
            ddlIsValid.SelectedItem.Text =isValid;


            lblStatus.ForeColor = System.Drawing.Color.Red;
            txt_Comments.Enabled = true;
            btn_UpdateComment.Enabled = true;
            UpdateButton.Visible = false;
            lbl_Massage.Visible = false;
            ddlStatus.Enabled = false;
            txtRemark.Enabled = false;
            txtHours.Enabled = false;
            ddlIsValid.Enabled = false;
            btnReassign.Visible = false;
            drpDownType.Enabled = false;
            drpDownApplication.Enabled = false;
            DrpIssueType.Enabled = false;

        }






        query = "select * from tbl_Attachment_Master where Ticket_Id= '" + Id + "'";
        DataTable dtfile = DBUtils.SQLSelect(new SqlCommand(query));
        foreach (DataRow dr in dtfile.Rows)
        {
            txtFileName.Text = dr["File_Name"].ToString();

        }

        if (txtFileName.Text == "")
        {
            txtFileName.Text = "No File";
            lnkDownload.Visible = false;

        }




        TicketID.Text = table.Rows[0]["Ticket No"].ToString();
       
        IssueDetail.Text = table.Rows[0]["Issue Details"].ToString();
        DrpPriority.DataSource = table;
        DrpPriority.DataTextField = "Priority";
        DrpPriority.DataBind();

        //assign values
        //typeName = drpDownType.SelectedItem.Text;
        //applicationName = drpDownApplication.SelectedItem.Text;
        issueDetails = IssueDetail.Text;
       // issueName = DrpIssueType.Text;
        priority = DrpPriority.Text;
        createdBy = table.Rows[0]["User_Id"].ToString();
        createdAt = table.Rows[0]["Created Time"].ToString();

        string queryUserName = "SELECT    SUBSTRING(tbl_User_Master.User_Email, 0, CHARINDEX('@', tbl_User_Master.User_Email)) AS User_Email FROM         tbl_User_Master where [User_Id]=" + createdBy + "";
        user = DBUtils.SqlSelectScalar(new SqlCommand(queryUserName));
        lblUser.Text = "(" + user + ")";
        string qry = "SELECT Type_Id FROM tbl_Type_Master where [Type_Name]='" + typeName + "'";
        typeId = DBUtils.SqlSelectScalar(new SqlCommand(qry));

        ddlStatus.SelectedValue = "1";

        //Query For Closed Details
        query = "select * from fnManageTicketDetails() where Ticket_Id='" + Id + "'";
        DataTable dtCloseTicketDet = DBUtils.SQLSelect(new SqlCommand(query));

        if (dtCloseTicketDet.Rows.Count > 0)
        {
            lblClosedAt.Text = "Closed At  : " + Convert.ToDateTime(dtCloseTicketDet.Rows[0]["Updated_At"].ToString()).ToString("dd/MMM/yyyy HH:mm:ss tt", CultureInfo.InvariantCulture);

            lblClosedBy.Text = "Closed By : " + dtCloseTicketDet.Rows[0]["User_Email"].ToString();
        }

        if (!IsPostBack) {
            fillData();
        }
    }


    private void LoadTypeData()
    {
        try
        {
            string query = "select * from tbl_Type_Master";

            DataTable dtType = DBUtils.SQLSelect(new SqlCommand(query));
            drpDownType.DataSource = dtType;
            drpDownType.DataTextField = "Type_Name";
            drpDownType.DataValueField = "Type_Id";
            drpDownType.DataBind();
            drpDownType.Items.Insert(0, new ListItem("--Select Type--", "--Select--"));
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(" + ex.Message + ")", true);
        }
    }

    private void LoadApplicationData()
    {
        try
        {
            string query = "select * from tbl_Application_Master where Type_Id='" + resType + "'";
            DataTable dtApplication = DBUtils.SQLSelect(new SqlCommand(query));

            drpDownApplication.DataSource = dtApplication;
            drpDownApplication.DataTextField = "Application_Name";
            drpDownApplication.DataValueField = "Application_Id";
            drpDownApplication.DataBind();
            drpDownApplication.Items.Insert(0, new ListItem("--Select Application--", "Select"));
            drpDownApplication.SelectedValue = resAppl;

            resAppl = drpDownApplication.SelectedValue;
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(" + ex.Message + ")", true);
        }
    }

    private void LoadIssueData()
    {
        try
        {
            string query = "select * from tbl_Issue_Master where Application_Id='" + resAppl + "'";
            DataTable dtIssue = DBUtils.SQLSelect(new SqlCommand(query));
            DrpIssueType.DataSource = dtIssue;
            DrpIssueType.DataTextField = "Issue_Name";
            DrpIssueType.DataValueField = "Issue_Id";
            DrpIssueType.Items.Insert(0, new ListItem("--Select Issue--", "Select"));
            DrpIssueType.DataBind();

            DrpPriority.Items.Clear();

            DrpPriority.Items.Insert(0, new ListItem("--Select Priority--", "Select"));
            DrpPriority.Items.Insert(1, new ListItem("High", "High"));
            DrpPriority.Items.Insert(2, new ListItem("Medium", "Medium"));
            DrpPriority.Items.Insert(3, new ListItem("Low", "Low"));
            DrpPriority.DataBind();

            drpStatus.Items.Clear();
            drpStatus.Items.Insert(1, new ListItem("Open", "1"));
            drpStatus.Items.Insert(0, new ListItem("Close", "0"));
            drpStatus.DataBind();
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(" + ex.Message + ")", true);
        }
        finally
        {
            constr.Close();
        }
    }
    public static string MimeType(string Extension)
    {
        string mime = "application/octetstream";
        if (string.IsNullOrEmpty(Extension))
            return mime;
        string ext = Extension.ToLower();
        Microsoft.Win32.RegistryKey rk = Microsoft.Win32.Registry.ClassesRoot.OpenSubKey(ext);
        if (rk != null && rk.GetValue("Content Type") != null)
            mime = rk.GetValue("Content Type").ToString();
        return mime;
    }

    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        try
        {
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {
                if (fnCheckEmail(drpDownType.SelectedValue) == false)
                {
                    string alertmsg = "alert('Mail recipient is empty,Please Add To and CC Email for respective type');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", alertmsg, true);
                    return;

                }


            string Minute = txtHours.Text.Substring(txtHours.Text.LastIndexOf('.') + 1);


          
            if (Convert.ToInt32(Minute) > 60)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Enter Valid Minute", "alert('Enter Valid Minute'); ", true);
            }
            else {
                updateTicketMaster();
                addLogDetails();
                fnSendMailXML();

               

                    //string alertmsg = "alert('Ticket created sucessfully');";
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", alertmsg, true);
                    Response.Redirect("form_AdminDashboard.aspx");
                //System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Record Saved');window.location ='ViewTicket_Admin.aspx';", true);
            }

            }
            else
            {
                return;
            }

           
        }
        catch (Exception ex)
        {
            Response.Redirect("form_AdminDashboard.aspx");
            throw ex;
        }
    }


    protected void fnSendMailXML()
    {
        string UserId = DBNulls.StringValue(Session[PublicMethods.ConstUserId].ToString());
        try
        {

            string body = "";
            string emailId = "", password = "";
            string ticketID = Request.QueryString["id"];

            //LOAD SMTP SETTINGS
            SqlDataAdapter db = new SqlDataAdapter("SELECT * FROM tblSMTPSettingsMaster", ConfigurationManager.ConnectionStrings["ConnectionWeb"].ToString());
            DataSet ds = new DataSet();
            db.Fill(ds);
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            SmtpClient smtp = new SmtpClient();
            smtp.Timeout = 2 * 300000;

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


           

           string bodyAdmin = PopulateBodyApplication(ticketID, typeName, applicationName, issueName, issueDetails, priority, createdBy, createdAt,"admin");
           body = PopulateBodyApplication(ticketID, typeName, applicationName, issueName, issueDetails, priority, createdBy, createdAt, "user");

            string userICC = "";
            smtp.Credentials = new System.Net.NetworkCredential(emailId, password);

            mail.From = new MailAddress(emailId, "displayName");
            mail.Subject = "Ticket Closed: " + ticketID;

            //Load TO Email ID's

            var userSqlTo = "SELECT [To_Email_Id] FROM [tbl_Email_TO_Master] WHERE [TYPE_ID]='" + typeId + "'";

            SqlDataAdapter dbUserTo = new SqlDataAdapter(userSqlTo, ConfigurationManager.ConnectionStrings["ConnectionWeb"].ToString());
            DataSet dsTo = new DataSet();
            dbUserTo.Fill(dsTo);
            foreach (DataTable tbl in dsTo.Tables)
            {
                foreach (DataRow row1 in tbl.Rows)
                {
                   string userIdTo = row1["To_Email_Id"].ToString();
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
                    string userIdCC = row1["CC_Email_Id"].ToString();
                    mail.CC.Add(userIdCC);
                }

            }

            // mail.CC.Add(Session["LoginUserEmail"].ToString());





            //   mail.CC.Add(Session["LoginUserEmail"].ToString());
            mail.IsBodyHtml = true;
            mail.Body = bodyAdmin;
            smtp.Send(mail);


            System.Net.Mail.MailMessage mail1 = new System.Net.Mail.MailMessage();

            var qry = "SELECT  [User_Email] FROM tbl_User_Master WHERE [User_Id]='" + createdBy + "'";
            String tktOwner = DBUtils.SqlSelectScalar(new SqlCommand(qry));
            mail1.From = new MailAddress(emailId, "displayName");
            mail1.Subject = "Ticket Closed: " + ticketID;
            mail1.To.Add(tktOwner);
            mail1.IsBodyHtml = true;
            mail1.Body = body;





            smtp.Send(mail1);




        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected string PopulateBodyApplication(string ticketID, string ticketType, string applicationName, string issue, string issueDescription, string priority, string createdBy, string createdDate,string person)
    {
        string body, name = "", email = "";
        String contact = "";
        //  ticketID = TicketNo.ToString();
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
        if (person == "user")
        {

            readTemplateFile = new StreamReader(Server.MapPath("Email_Body/email_temp_Closed.html"));
        }
        else if (person == "admin")
        {
            readTemplateFile = new StreamReader(Server.MapPath("Email_Body/Admin_email_Ticket_Closed.html"));
        }



        string allContents = readTemplateFile.ReadToEnd();

        string Color = "";
        if (ddlIsValid.SelectedItem.Text == "Yes")
        {
            Color = "Green";
        }
        else if (ddlIsValid.SelectedItem.Text == "No")
        {
            Color = "Red";
        }


        allContents = allContents.Replace("@#Color_Code#@", Color);

        allContents = allContents.Replace("@#TICKET_NO#@", ticketID);
        allContents = allContents.Replace("@#TICKET_TYPE#@", ticketType);
        allContents = allContents.Replace("@#TICKET_APPLICATION#@", applicationName);
        //allContents = allContents.Replace("@#TICKET_TITLE#@", issue);
        allContents = allContents.Replace("@#TICKET_DETAILS#@", issueDescription);
        allContents = allContents.Replace("@#TICKET_PRIORITY#@", priority);
        allContents = allContents.Replace("@#TICKET_OWNER#@", name);
        allContents = allContents.Replace("@#TICKET_CONTACT#@", contact);
        allContents = allContents.Replace("@#TICKET_EMAIL#@", email);
        allContents = allContents.Replace("@#TICKET_TIME#@", Convert.ToDateTime(createdDate).ToString("dd/MMM/yyyy HH:mm:ss tt", CultureInfo.InvariantCulture));
        allContents = allContents.Replace("@#Remark#@", txtRemark.Text);
        allContents = allContents.Replace("@#TICKET_Valid#@", ddlIsValid.SelectedItem.Text);


        if(person=="user") {
            allContents = allContents.Replace("@#visible#@", "visible");
            allContents = allContents.Replace("@#visibleContact#@", "collapse");
        }
        else if(person=="admin") {
           
            allContents = allContents.Replace("@#visibleContact#@", "visible");
        }



       





        body = allContents;
        return body;
    }
    private void addLogDetails()
    {
        try
        {
            string status = ddlStatus.SelectedValue;
            string qryUserId = "SELECT  User_Id FROM tbl_User_Master  where User_Email='" + Session[PublicMethods.ConstUserEmail].ToString() + "'";
            string userId = DBUtils.SqlSelectScalar(new SqlCommand(qryUserId));
            string qryToLogDetails = "INSERT INTO [tbl_Ticket_Manage] ([Ticket_Id],[Updated_By],[Updated_At],[Status],[Remark])  VALUES ('" + TicketID.Text + "','" + userId + "','" + DateTime.Now.ToString() + "','" + status + "','" + txtRemark.Text.Replace("'", "''").ToString() + "')";
            DBUtils.ExecuteSQLCommand(new SqlCommand(qryToLogDetails));
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    //private void fnReassignDetails() {

    //    try
    //    {
    //        string status = ddlStatus.SelectedValue;
    //        string qryUserId = "SELECT  User_Id FROM tbl_User_Master  where User_Email='" + Session[PublicMethods.ConstUserEmail].ToString() + "'";
    //        string userId = DBUtils.SqlSelectScalar(new SqlCommand(qryUserId));
    //        string qryReassignDetails = "INSERT INTO [tbl_Reassigned_Details] ([Ticket_Id],[Updated_By],[Reassigned_At],[Status],[Remark])  VALUES ('" + TicketID.Text + "','" + userId + "','" + DateTime.Now + "','" + status + "','" + txtRemark.Text.Replace("'", "''").ToString() + "')";
    //        DBUtils.ExecuteSQLCommand(new SqlCommand(qryReassignDetails));
    //    }
    //    catch (Exception ex) {
    //        throw ex;
    //    }
    //}
    private void LoadTicketNo()
    {
        try
        {
            string res = string.Empty;
            string query = "select max(Ticket_Id) as Ticket_Id from tbl_Ticket_Master";
            SqlCommand cmd = new SqlCommand(query, constr);
            res = DBUtils.SqlSelectScalar(cmd);
            TicketNo = DBNulls.NumberValue(res);
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(" + ex.Message + ")", true);
        }
    }

    private void updateTicketMaster()
    {
        try
        {
            string status = ddlStatus.SelectedValue;
            string hours = String.Format("{0:0.##}", Convert.ToDouble(txtHours.Text));
            string isValid = ddlIsValid.SelectedItem.Text;
            string qry = "UPDATE[tbl_Ticket_Master] SET Updated_Time ='" + DateTime.Now.ToString() + "' ,Status='" + status + "',hours='" + txtHours.Text + "',isValid='" + isValid + "'  WHERE Ticket_Id='" + TicketID.Text + "' ";
            DBUtils.ExecuteSQLCommand(new SqlCommand(qry));
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void btn_UpdateComment_Click(object sender, EventArgs e)
    {
        try
        {
            string qryToLogDetails = "INSERT INTO [tbl_Ticket_Comments] ([Comment],[Commented_By],[Ticket_ID],[Created_Datetime])  VALUES ('" + txt_Comments.Text + "','" + DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]) + "','" + TicketID.Text + "','" + DateTime.Now + "')";
            DBUtils.ExecuteSQLCommand(new SqlCommand(qryToLogDetails));
            txt_Comments.Text = "";

            fillData();

            fnSendMailXML(TicketID.Text);
            Response.Redirect("form_AdminDashboard.aspx");
        }
        catch (Exception ex)
        {
            Response.Redirect("form_AdminDashboard.aspx");
            throw ex;
        }

    }

    protected void fnSendMailXML(string Ticket_Id)
    {
        try
        {
            string body = "";
            string emailId = "", password = "";
            //string ticketID = "";

            //LOAD SMTP SETTINGS
            SqlDataAdapter db = new SqlDataAdapter("SELECT * FROM tblSMTPSettingsMaster", ConfigurationManager.ConnectionStrings["ConnectionWeb"].ToString());
            DataSet ds = new DataSet();
            db.Fill(ds);
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            SmtpClient smtp = new SmtpClient();
            smtp.Timeout = 2 * 300000;

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


            body = PopulateBodyApplication(Ticket_Id);

            string userIdCC = "", userIdTo = "";
            smtp.Credentials = new System.Net.NetworkCredential(emailId, password);

            mail.From = new MailAddress(emailId, "displayName");
            mail.Subject = "Comments Against Ticket: " + Ticket_Id;

            //Load TO Email ID's

            string query = " select Type_Id from tbl_Type_Master where Type_Name='" + DBNulls.StringValue(drpDownType.SelectedItem.Text) + "'";
            double Type_ID = DBNulls.NumberValue(DBUtils.SqlSelectScalar(new SqlCommand(query)));

            var userSqlTo = "SELECT [To_Email_Id] FROM [tbl_Email_TO_Master] WHERE [TYPE_ID]='" + Type_ID + "'";

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
            var userSqlCC = "SELECT [CC_Email_Id] FROM [tbl_Email_CC_Master] WHERE [TYPE_ID]='" + Type_ID + "'";
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

            // mail.CC.Add(Session["LoginUserEmail"].ToString());

            mail.IsBodyHtml = true;
            mail.Body = body;
            smtp.Send(mail);

         
            string queryEmail = "SELECT    tbl_User_Master.User_Email FROM         tbl_User_Master where [User_Id]=" + createdBy + "";
            string user = DBUtils.SqlSelectScalar(new SqlCommand(queryEmail));
            System.Net.Mail.MailMessage mail1 = new System.Net.Mail.MailMessage();
            mail1.From = new MailAddress(emailId, "displayName");
            mail1.Subject = "Comments Against Ticket: " + Ticket_Id;
            mail1.To.Add(user.ToString());
            mail1.IsBodyHtml = true;
            string bodyUser = PopulateBodyApplication(Ticket_Id);
            mail1.Body = bodyUser;
            smtp.Send(mail1);


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected string PopulateBodyApplication(string Ticket_Id)
    {
        string body, name = "", email = "";
        String contact = "";
        //ticketID = TicketNo.ToString();

        //To read html file
        StreamReader readTemplateFile = null;
        //Read email template file 
        readTemplateFile = new StreamReader(Server.MapPath("Email_Body/Email_Comment.html"));
        string allContents = "";//readTemplateFile.ReadToEnd();


        //string query = "Select  Comment,Ticket_ID,Created_Datetime,  User_First_Name + ' ' + User_Last_Name AS UserName,case when tbl_User_Master.isAdmin= 'Y' then 'Admin' else 'User' end as isAdmin from tbl_Ticket_Comments ,tbl_User_Master where tbl_User_Master.User_Email=tbl_Ticket_Comments.Commented_By and Ticket_ID ='" + Request.QueryString["id"] + "'  Order by Comment_ID Desc ";


        //string query = "SELECT tbl_Ticket_Comments.Comment, tbl_Ticket_Comments.Ticket_ID, tbl_Ticket_Comments.Created_Datetime, tbl_User_Master.User_First_Name + ' ' + tbl_User_Master.User_Last_Name AS UserName,CASE WHEN tbl_User_Master.isAdmin = 'Y' and tbl_User_Master.User_Email ='" + DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]) + "'  THEN 'Admin' ELSE 'User' END AS isAdmin, tbl_User_Master.User_Email FROM tbl_Ticket_Comments INNER JOIN   tbl_User_Master ON tbl_Ticket_Comments.Commented_By = tbl_User_Master.User_Email WHERE     (tbl_Ticket_Comments.Ticket_ID = '"+ Request.QueryString["id"] + "') ORDER BY tbl_Ticket_Comments.Comment_ID DESC";


      

        string query = "SELECT tbl_Ticket_Comments.Comment, tbl_Ticket_Comments.Ticket_ID, tbl_Ticket_Comments.Created_Datetime, tbl_User_Master.User_First_Name + ' ' + tbl_User_Master.User_Last_Name AS UserName,CASE WHEN SUBSTRING(tbl_User_Master.User_Email, 0, CHARINDEX('@', tbl_User_Master.User_Email)) = '" + user + "' THEN 'User' ELSE 'Admin' END AS isAdmin FROM tbl_Ticket_Comments INNER JOIN tbl_User_Master ON tbl_Ticket_Comments.Commented_By = tbl_User_Master.User_Email WHERE (tbl_Ticket_Comments.Ticket_ID = '" + Request.QueryString["id"] + "') ORDER BY tbl_Ticket_Comments.Comment_ID DESC";

        DataTable dt = DBUtils.SQLSelect(new SqlCommand(query));


        StringBuilder sb = new StringBuilder();


        allContents = "<!DOCTYPE html><html><head><style>table {   font-family: arial, sans-serif;    border-collapse: collapse;    width: 100%;}td, th {    border: 2px solid #dddddd;    text-align: left;    padding: 8px;}tr:nth-child(even) {    background-color: #dddddd;}</style></head><body> <table bgcolor='#42A6A8' align='left' valign='top' width='100%' border='0' cellpadding='0' cellspacing='0'> <tr> <td align='left' colspan='2' style='color:#ffffff; font-family:'Segoe UI', Arial, Helvetica, sans-serif; font-size: 36px; font-weight:200; padding-bottom:20px; padding-left:20px;padding-top:10px'> <img src='@@sajeevlogo@@'  />                            </td>                        </tr>          </table><table width='100%' border='0' cellpadding='0' cellspacing='0'> <tr>  <td  style='color:#5c2d91;font-size:20pt; text-align:Center; '>    Ticket ID : @TicketID@                                        </td>                                    </tr>                                    <tr> <td style='color:#5c2d91; font-size:20pt; '>                                          Comment's:                 </td>                                    </tr>     </table><table  style='border: 1px solid black; '>  <tr  style='border: 1px solid black; '>    <th  style='border: 1px solid black; '>Commented By</th>    <th  style='border: 1px solid black; '>Comment's</th><th  style='border: 1px solid black; '>Time</th>      </tr> ";

        string directoryPath = WebConfigurationManager.AppSettings["Website"];

        allContents = allContents.Replace("@@sajeevlogo@@", Path.Combine(directoryPath + "pages/images/sanjeevlogo.png"));






        allContents = allContents.Replace("@TicketID@", Ticket_Id);



        StringBuilder sb1 = new StringBuilder();
        foreach (DataRow dr in dt.Rows)
        {
            string abc = "<tr style='border: 1px solid black; background-color: #dddddd; ' >    <td style='border: 1px solid black;color:#5c2d91; ' >@User_Name@</td>    <td style='border: 1px solid black; word-break:break-all;' >@User_Comment@</td> <td style='border: 1px solid black; word-break:break-all;' >@time@</td> </tr>";
            abc = abc.Replace("@User_Name@", dr["isAdmin"].ToString());
            abc = abc.Replace("@User_Comment@", dr["Comment"].ToString());
            abc = abc.Replace("@time@", Convert.ToDateTime(dr["Created_Datetime"].ToString()).ToString("dd/MMM/yyyy HH:mm:ss tt", CultureInfo.InvariantCulture));
            sb1.Append(abc);
        }

        sb.Append(allContents);
        sb.Append(sb1.ToString());

        string bodybottom = " </table> <br/> 	PLEASE DO NOT REPLY TO THIS MAIL. THIS IS AN AUTO GENERATED MAIL AND REPLIES TO THIS EMAIL ID ARE NOT ATTENDED TOO.    </body></html>";
        sb.Append(bodybottom);

        string Color = "";



        //allContents = allContents.Replace("@#Color_Code#@", Color);

        //allContents = allContents.Replace("@#TICKET_TYPE#@", ticketType);
        //allContents = allContents.Replace("@#TICKET_APPLICATION#@", applicationName);
        ////allContents = allContents.Replace("@#TICKET_TITLE#@", issue);
        //allContents = allContents.Replace("@#TICKET_DETAILS#@", issueDescription);
        //allContents = allContents.Replace("@#TICKET_PRIORITY#@", priority);
        //allContents = allContents.Replace("@#TICKET_OWNER#@", name);
        //allContents = allContents.Replace("@#TICKET_CONTACT#@", contact);
        //allContents = allContents.Replace("@#TICKET_EMAIL#@", email);
        //allContents = allContents.Replace("@#TICKET_TIME#@", createdDate);

        //body = allContents;

        return sb.ToString();
    }


    private void fillData()
    {
        //SqlConnection con = new SqlConnection(cs);
        //con.Open();
        DataTable dt = new DataTable();
        //SqlDataAdapter adapt = new SqlDataAdapter("Select * from tbl_Comment Order by Id Desc", con);
        //adapt.Fill(dt);
        //con.Close();


        //string query = "Select Comment,Ticket_ID,Created_Datetime,  User_First_Name + ' ' + User_Last_Name AS UserName,case when tbl_User_Master.isAdmin= 'Y' then 'Admin' else 'User' end as isAdmin from tbl_Ticket_Comments ,tbl_User_Master where tbl_User_Master.User_Email=tbl_Ticket_Comments.Commented_By and Ticket_ID ='" + Request.QueryString["id"] + "'  Order by Comment_ID Desc ";


        //string query = "SELECT tbl_Ticket_Comments.Comment, tbl_Ticket_Comments.Ticket_ID, tbl_Ticket_Comments.Created_Datetime, tbl_User_Master.User_First_Name + ' ' + tbl_User_Master.User_Last_Name AS UserName,CASE WHEN tbl_User_Master.isAdmin = 'Y' and tbl_User_Master.User_Email ='" + DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]) + "'  THEN 'Admin' ELSE 'User' END AS isAdmin, tbl_User_Master.User_Email FROM tbl_Ticket_Comments INNER JOIN   tbl_User_Master ON tbl_Ticket_Comments.Commented_By = tbl_User_Master.User_Email WHERE     (tbl_Ticket_Comments.Ticket_ID = '" + Request.QueryString["id"] + "') ORDER BY tbl_Ticket_Comments.Comment_ID DESC";

        string query = "SELECT tbl_Ticket_Comments.Comment, tbl_Ticket_Comments.Ticket_ID, tbl_Ticket_Comments.Created_Datetime, tbl_User_Master.User_First_Name + ' ' + tbl_User_Master.User_Last_Name AS UserName,CASE WHEN SUBSTRING(tbl_User_Master.User_Email, 0, CHARINDEX('@', tbl_User_Master.User_Email)) = '" + user + "' THEN 'User' ELSE 'Admin' END AS isAdmin FROM tbl_Ticket_Comments INNER JOIN tbl_User_Master ON tbl_Ticket_Comments.Commented_By = tbl_User_Master.User_Email WHERE (tbl_Ticket_Comments.Ticket_ID = '" + Request.QueryString["id"] + "') ORDER BY tbl_Ticket_Comments.Comment_ID DESC";

        dt = DBUtils.SQLSelect(new SqlCommand(query));

        PagedDataSource pds = new PagedDataSource();
        DataView dv = new DataView(dt);
        pds.DataSource = dv;
        pds.AllowPaging = true;
        pds.PageSize = 4;
        pds.CurrentPageIndex = PageNumber;
        if (pds.PageCount > 1)
        {
            rptPaging.Visible = true;
            ArrayList arraylist = new ArrayList();
            for (int i = 0; i < pds.PageCount; i++)
                arraylist.Add((i + 1).ToString());
            rptPaging.DataSource = arraylist;
            rptPaging.DataBind();
        }
        else
        {
            rptPaging.Visible = false;
        }
        Repeater1.DataSource = pds;
        Repeater1.DataBind();
    }

    public int PageNumber
    {
        get
        {
            if (ViewState["PageNumber"] != null)
                return Convert.ToInt32(ViewState["PageNumber"]);
            else
                return 0;
        }
        set
        {
            ViewState["PageNumber"] = value;
        }
    }
    protected void rptPaging_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
        fillData();
    }
    protected void lnkDownload_Click(object sender, EventArgs e)
    {
        string query = "select * from tbl_Attachment_Master where Ticket_Id= '" + Request.QueryString["id"].ToString() + "'";
        DataTable dtfile = DBUtils.SQLSelect(new SqlCommand(query));
       
        if (dtfile.Rows.Count > 0) {
            string filePath = dtfile.Rows[0]["File_Path"].ToString();

            if (Directory.Exists(filePath))
            {


                string[] fileArray = Directory.GetFiles(filePath);
                if (fileArray == null || fileArray.Length == 0)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "File Not Found", "alert('File Not Found'); ", true);
                    return;

                }
                foreach (var item in fileArray)
                {
                    FileInfo fi = new FileInfo(item);
                    long sz = fi.Length;

                    Response.ClearContent();
                    Response.ContentType = MimeType(Path.GetExtension(item));
                    Response.AddHeader("Content-Disposition", string.Format("attachment; filename = {0}", System.IO.Path.GetFileName(item)));
                    Response.AddHeader("Content-Length", sz.ToString("F0"));
                    Response.TransmitFile(item);
                    Response.End();
                }

            }
            else {

                ClientScript.RegisterClientScriptBlock(this.GetType(), "Directory Not Found", "alert('Directory Not Found'); ", true);
                return;
            }
        }
       

        //foreach (DataRow dr in dtfile.Rows)
        //{
        //    txtFileName.Text = dr["File_Name"].ToString();
        //    FilePath = dr["File_Path"].ToString() + dr["File_Name"].ToString();

        //}

        //if (txtFileName.Text != "No File")
        //{

        //    if (File.Exists(FilePath))
        //    {
        //        Response.Clear();
        //        Response.ContentType = ContentType;
        //        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(FilePath));
        //        Response.WriteFile(FilePath);
        //        Response.Flush();
        //        Response.End();
        //    }
        //    else
        //    {
        //        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "File Not Found", "alert('File Not Found'); ", true);
        //    }


         




            //Response.Redirect(Request.RawUrl, true);
            //Response.End();

        


    }
    protected void btnReassign_Click(object sender, EventArgs e)
    {
        try
        {
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {

                if (txtHours.Text != "")
                {


                    string alertmsg = "alert('No Need to add TIME while reassigning ticket');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", alertmsg, true);
                    return;


                }


            if (drpDownType.Text == "--Select--" || drpDownType.SelectedValue.ToString() == "--Select--" || drpDownType.Text == "")
            {
                

                string alertmsg = "alert('Please Select Type');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", alertmsg, true);
                return;


            }

            if (drpDownApplication.Text == "Select" || drpDownApplication.SelectedValue.ToString() == "Select" || drpDownApplication.Text == "")
            {
               
                string alertmsg = "alert('Please Select Application');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", alertmsg, true);
                return;


            }

            if (DrpPriority.Text == "--Select Priority--" || DrpPriority.Text == "Select" || DrpPriority.Text == "")
            {
              
                string alertmsg = "alert('Please Select Priority');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", alertmsg, true);
                return;
            }

            if (txtRemark.Text.Trim() == "")
            {

                string alertmsg = "alert('Please add remark');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", alertmsg, true);
                return;
            }


            if (fnCheckEmail(drpDownType.SelectedValue) == false)
            {
                string alertmsg = "alert('Mail recipient is empty,Please Add To and CC Email');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", alertmsg, true);
                return;

            }

            sendMail_TicketTypeChanged();
          
            }
            else
            {
                return;
            }
            
        }
        catch (Exception ex) {
            Response.Redirect("form_AdminDashboard.aspx", true);
            throw ex;
        }
    }

    protected Boolean fnCheckEmail(string Tid)
    {
        try
        {
            string qry = "SELECT [To_Email_Id] FROM [tbl_Email_TO_Master] WHERE [TYPE_ID]='" + Tid + "'";
            DataTable dtTo = DBUtils.SQLSelect(new SqlCommand(qry));
            qry = "SELECT [CC_Email_Id] FROM [tbl_Email_CC_Master] WHERE [TYPE_ID]='" + Tid + "'";
            DataTable dtCC = DBUtils.SQLSelect(new SqlCommand(qry));

            if (dtTo.Rows.Count == 0 || dtCC.Rows.Count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    private void sendMail_TicketTypeChanged()
    {
        try
        {


           fnGetOldData();


           if (Type_Id == drpDownType.SelectedValue && Application_Id == drpDownApplication.SelectedValue && Issue_Id == DrpIssueType.SelectedValue && Issue_Details == IssueDetail.Text)
           {
               string alertmsg = "alert('You can not update old ticket,Change details if you want to update details');";
               ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", alertmsg, true);
               return;
           }


            string body = "";
            string emailId = "", password = "";
            //string ticketID = "";

            //LOAD SMTP SETTINGS
            string qrySMTPsettings = "SELECT * FROM tblSMTPSettingsMaster";
            DataTable table = DBUtils.SQLSelect(new SqlCommand(qrySMTPsettings));



            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            SmtpClient smtp = new SmtpClient();
            smtp.Timeout = 2 * 300000;


            foreach (DataRow dr in table.Rows)
            {
                smtp.Host = dr["Servername"].ToString();
                smtp.Port = Convert.ToInt16(dr["Portno"].ToString());
                smtp.EnableSsl = Convert.ToBoolean(dr["EnableSsl"].ToString());
                emailId = dr["Emailid"].ToString();
                password = dr["Usrpassword"].ToString();
            }



            body = PopulateBody_TypeChanged(Ticket_Id, typeName, applicationName, issueName, Issue_Details, Priority, createdBy, Created_Time,"Admin");

        
            smtp.Credentials = new System.Net.NetworkCredential(emailId, password);


            string userIdCC = "", userIdTo = "";
            smtp.Credentials = new System.Net.NetworkCredential(emailId, password);

            mail.From = new MailAddress(emailId, "displayName");
            mail.Subject = "Ticket Type has been changed by admin for ticket No: " + Ticket_Id;

            //Load TO Email ID's
            var userSqlTo = "SELECT [To_Email_Id] FROM [tbl_Email_TO_Master] WHERE [TYPE_ID]='" + Type_Id + "'";

            DataTable tbl = DBUtils.SQLSelect(new SqlCommand(userSqlTo));

            foreach (DataRow row1 in tbl.Rows)
            {
                userIdTo = row1["To_Email_Id"].ToString();
                mail.To.Add(userIdTo);
            }



            //Load CC Email ID's
            var userSqlCC = "SELECT [CC_Email_Id] FROM [tbl_Email_CC_Master] WHERE [TYPE_ID]='" + Type_Id + "'";

            DataTable tbl1 = DBUtils.SQLSelect(new SqlCommand(userSqlCC));

            foreach (DataRow row1 in tbl1.Rows)
            {
                userIdCC = row1["CC_Email_Id"].ToString();
                mail.CC.Add(userIdCC);
            }



            mail.IsBodyHtml = true;
            mail.Body = body;
            smtp.Send(mail);








           string queryEmail = "SELECT    tbl_User_Master.User_Email FROM         tbl_User_Master where [User_Id]=" + createdBy + "";
           string user = DBUtils.SqlSelectScalar(new SqlCommand(queryEmail));
            System.Net.Mail.MailMessage mail1 = new System.Net.Mail.MailMessage();
             mail1.From = new MailAddress(emailId, "displayName");
            mail1.Subject = "Ticket Type has been changed by admin for ticket No: " + TicketID.Text;
            mail1.To.Add(user.ToString());
            mail1.IsBodyHtml = true;
           string bodyUser = PopulateBody_TypeChanged(Ticket_Id, typeName, applicationName, issueName, Issue_Details, Priority, createdBy, Created_Time, "user");
           mail1.Body = bodyUser;
            smtp.Send(mail1);
            fnUpdateTicketMaster();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void drpDownType_SelectedIndexChanged(object sender, EventArgs e)
    {
        resType = drpDownType.SelectedValue;
        LoadApplicationData();
    }
    protected void drpDownApplication_SelectedIndexChanged(object sender, EventArgs e)
    {
        resAppl = drpDownApplication.SelectedValue;
        LoadIssueData();
    }

    private void fnGetOldData()
    {
        try
        {
            string qry = "select * from tbl_Ticket_Master where [Ticket_Id]='" + Request.QueryString["id"] + "'";
            DataTable dtOldDetails = DBUtils.SQLSelect(new SqlCommand(qry));
            foreach (DataRow dr in dtOldDetails.Rows)
            {
                Ticket_Id = dr["Ticket_Id"].ToString();
                Type_Id = dr["Type_Id"].ToString();
                Application_Id = dr["Application_Id"].ToString();
                Issue_Id = dr["Issue_Id"].ToString();
                Issue_Details = dr["Issue_Details"].ToString();
                Priority = dr["Priority"].ToString();
                Is_Screenshots_Attached = dr["Is_Screenshots_Attached"].ToString();
                Created_By = dr["Created_By"].ToString();
                Created_Time = dr["Created_Time"].ToString();
                Updated_Time = dr["Updated_Time"].ToString();
                Status = dr["Status"].ToString();
                hours = dr["hours"].ToString();
                isValid = dr["isValid"].ToString();

            }
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }


    protected string PopulateBody_TypeChanged(string Ticket_Id, string ticketType, string applicationName, string issue, string issueDescription, string priority, string createdBy, string createdDate, string visibleTo)
    {
        fnGetOldData();
        string body, name = "", email = "";
        String contact = "";
        //ticketID = TicketNo.ToString();
        var qry = "SELECT User_First_Name, User_Last_Name,[User_Email],[Contact_No] FROM tbl_User_Master WHERE [User_Id]='" + createdBy + "'";
        DataTable dt = DBUtils.SQLSelect(new SqlCommand(qry));


        foreach (DataRow row in dt.Rows)
        {
            name = DBNulls.StringValue(row["User_First_Name"].ToString()) + " " + DBNulls.StringValue(row["User_Last_Name"].ToString());
            email = DBNulls.StringValue(row["User_Email"].ToString());
            contact = DBNulls.StringValue(row["Contact_No"].ToString());
        }

        //To read html file
        StreamReader readTemplateFile = null;
        //Read email template file 
        readTemplateFile = new StreamReader(Server.MapPath("Email_Body/email_Ticket_Type_Changed.html"));
        string allContents = readTemplateFile.ReadToEnd();
        allContents = allContents.Replace("@#TICKET_NO#@", Ticket_Id);

        string Color = "";
        if (priority == "High")
        {
            Color = "Red";
        }
        else if (priority == "Medium")
        {
            Color = "Orange";
        }
        else if (priority == "Low")
        {
            Color = "Blue";
        }


        allContents = allContents.Replace("@#Color_Code#@", Color);

        allContents = allContents.Replace("@#TICKET_TYPE#@", ticketType);
        allContents = allContents.Replace("@#TICKET_APPLICATION#@", applicationName);

        allContents = allContents.Replace("@#TICKET_DETAILS#@", issueDescription);
        allContents = allContents.Replace("@#TICKET_PRIORITY#@", priority);
        allContents = allContents.Replace("@#TICKET_OWNER#@", name);
        allContents = allContents.Replace("@#TICKET_CONTACT#@", contact);
        allContents = allContents.Replace("@#TICKET_EMAIL#@", email);
        allContents = allContents.Replace("@#TICKET_TIME#@", Convert.ToDateTime(createdDate).ToString("dd/MMM/yyyy HH:mm:ss tt", CultureInfo.InvariantCulture));

        allContents = allContents.Replace("@#Admin_Remark#@", txtRemark.Text);
        //

        //
        allContents = allContents.Replace("@#TICKET_TYPE_New#@", drpDownType.SelectedItem.Text);
        allContents = allContents.Replace("@#TICKET_APPLICATION_New#@", drpDownApplication.SelectedItem.Text);


        allContents = allContents.Replace("@#TICKET_PRIORITY_New#@", priority);
        allContents = allContents.Replace("@#TICKET_OWNER_New#@", name);
        allContents = allContents.Replace("@#TICKET_CONTACT#@", contact);
        allContents = allContents.Replace("@#TICKET_EMAIL_New#@", email);
        allContents = allContents.Replace("@#TICKET_TIME_New#@", DateTime.Now.ToString("dd/MMM/yyyy HH:mm:ss tt", CultureInfo.InvariantCulture));

        allContents = allContents.Replace("@#TICKET_DETAILS_NEW#@", IssueDetail.Text);

        if (visibleTo == "Admin")
        {
            allContents = allContents.Replace("@#visibleTo#@", "visible");
        }
        if (visibleTo == "user")
        {
            allContents = allContents.Replace("@#visibleTo#@", "collapse");
        }
        body = allContents;
        return body;
    }


    private void fnUpdateTicketMaster()
    {
        try
        {

            string query = "UPDATE [tbl_Ticket_Master] SET [Type_Id] = '" + drpDownType.SelectedValue + "',[Application_Id] ='" + drpDownApplication.SelectedValue + "',[Issue_Id] = '" + DrpIssueType.SelectedValue + "',[Created_Time] = '" + DateTime.Now + "',Issue_Details='" + IssueDetail.Text.Replace("'", "''").ToString() + "',[ReassignRemark]='" + txtRemark.Text.Replace("'", "''").ToString() + "' WHERE Ticket_Id='" + TicketID.Text + "' ";

            int i = DBUtils.ExecuteSQLCommand(new SqlCommand(query));
            if (i > 0)
            {

                sendMail_New_TicketType();
            
                Response.Redirect("form_AdminDashboard.aspx", true);
            }
            else
            {
                string alertmsg = "alert('Update Failed');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", alertmsg, true);
                return;
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("form_AdminDashboard.aspx", true);
            throw ex;
        }
    }


    private void sendMail_New_TicketType()
    {
        try
        {
            string body = "";
            string emailId = "", password = "";
            //string ticketID = "";

            //LOAD SMTP SETTINGS
            string qrySMTPsettings = "SELECT * FROM tblSMTPSettingsMaster";
            DataTable table = DBUtils.SQLSelect(new SqlCommand(qrySMTPsettings));



            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            SmtpClient smtp = new SmtpClient();
            smtp.Timeout = 2 * 300000;


            foreach (DataRow dr in table.Rows)
            {
                smtp.Host = dr["Servername"].ToString();
                smtp.Port = Convert.ToInt16(dr["Portno"].ToString());
                smtp.EnableSsl = Convert.ToBoolean(dr["EnableSsl"].ToString());
                emailId = dr["Emailid"].ToString();
                password = dr["Usrpassword"].ToString();
            }



            body = PopulateBodyApplication_Created(Ticket_Id, drpDownType.SelectedItem.Text, drpDownApplication.SelectedItem.Text, DrpIssueType.SelectedItem.Text, IssueDetail.Text, DrpPriority.SelectedItem.Text, createdBy, Created_Time);

            string userIdCC = "", userIdTo = "";
            smtp.Credentials = new System.Net.NetworkCredential(emailId, password);

            string queryForFileAttach = "select * from tbl_Attachment_Master where Ticket_Id='" + Ticket_Id + "'";
            table = DBUtils.SQLSelect(new SqlCommand(queryForFileAttach));
            string fName = "";
            if (table.Rows.Count > 0)
            {
                string filePath = table.Rows[0]["File_Path"].ToString();
                if (Directory.Exists(filePath))
                {

                    string[] fileArray = Directory.GetFiles(filePath);

                    foreach (var item in fileArray)
                    {
                        fName = item;
                    }

                }
            }


            if (fName != "")
            {
                mail.Attachments.Add(new Attachment(fName));
            }
            mail.From = new MailAddress(emailId, "displayName");
            mail.Subject = "New Ticket Created: " + Ticket_Id;

            //Load TO Email ID's
            var userSqlTo = "SELECT [To_Email_Id] FROM [tbl_Email_TO_Master] WHERE [TYPE_ID]='" + drpDownType.SelectedValue + "'";

            DataTable tbl = DBUtils.SQLSelect(new SqlCommand(userSqlTo));

            foreach (DataRow row1 in tbl.Rows)
            {
                userIdTo = row1["To_Email_Id"].ToString();
                mail.To.Add(userIdTo);
            }



            //Load CC Email ID's
            var userSqlCC = "SELECT [CC_Email_Id] FROM [tbl_Email_CC_Master] WHERE [TYPE_ID]='" + drpDownType.SelectedValue + "'";

            DataTable tbl1 = DBUtils.SQLSelect(new SqlCommand(userSqlCC));

            foreach (DataRow row1 in tbl1.Rows)
            {
                userIdCC = row1["CC_Email_Id"].ToString();
                mail.CC.Add(userIdCC);
            }



            // mail.CC.Add(Session["LoginUserEmail"].ToString());


            mail.IsBodyHtml = true;
            mail.Body = body;
            smtp.Send(mail);

            //System.Net.Mail.MailMessage mail1 = new System.Net.Mail.MailMessage();


            //var qry = "SELECT  [User_Email] FROM tbl_User_Master WHERE [User_Id]='" + createdBy + "'";
            //String tktOwner = DBUtils.SqlSelectScalar(new SqlCommand(qry));



            //mail1.From = new MailAddress(emailId, "displayName");
            //mail1.Subject = "New Ticket Created: " + Ticket_Id;
            //mail1.To.Add(tktOwner);
            //mail1.IsBodyHtml = true;
            //mail1.Body = body;
            //smtp.Send(mail1);

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected string PopulateBodyApplication_Created(string Ticket_Id, string ticketType, string applicationName, string issue, string issueDescription, string priority, string createdBy, string createdDate)
    {
        string body, name = "", email = "";
        String contact = "";
        //ticketID = TicketNo.ToString();
        var qry = "SELECT User_First_Name, User_Last_Name,[User_Email],[Contact_No] FROM tbl_User_Master WHERE [User_Id]='" + createdBy + "'";
        DataTable dt = DBUtils.SQLSelect(new SqlCommand(qry));


        foreach (DataRow row in dt.Rows)
        {
            name = DBNulls.StringValue(row["User_First_Name"].ToString()) + " " + DBNulls.StringValue(row["User_Last_Name"].ToString());
            email = DBNulls.StringValue(row["User_Email"].ToString());
            contact = DBNulls.StringValue(row["Contact_No"].ToString());
        }

        //To read html file
        StreamReader readTemplateFile = null;
        //Read email template file 
        readTemplateFile = new StreamReader(Server.MapPath("Email_Body/email_temp.html"));
        string allContents = readTemplateFile.ReadToEnd();
        allContents = allContents.Replace("@#TICKET_NO#@", Ticket_Id);

        string Color = "";
        if (priority == "High")
        {
            Color = "Red";
        }
        else if (priority == "Medium")
        {
            Color = "Orange";
        }
        else if (priority == "Low")
        {
            Color = "Blue";
        }


        allContents = allContents.Replace("@#Color_Code#@", Color);

        allContents = allContents.Replace("@#TICKET_TYPE#@", ticketType);
        allContents = allContents.Replace("@#TICKET_APPLICATION#@", applicationName);
        //allContents = allContents.Replace("@#TICKET_TITLE#@", issue);
        allContents = allContents.Replace("@#TICKET_DETAILS#@", issueDescription);
        allContents = allContents.Replace("@#TICKET_PRIORITY#@", priority);
        allContents = allContents.Replace("@#TICKET_OWNER#@", name);
        allContents = allContents.Replace("@#TICKET_CONTACT#@", contact);
        allContents = allContents.Replace("@#TICKET_EMAIL#@", email);
        allContents = allContents.Replace("@#TICKET_TIME#@", Convert.ToDateTime(createdDate).ToString("dd/MMM/yyyy HH:mm:ss tt", CultureInfo.InvariantCulture));

        body = allContents;
        return body;
    }
    protected void btnViewLogs_Click(object sender, EventArgs e)
    {
        Response.Redirect("viewTicketLogs.aspx?id=" + Request.QueryString["id"] + "");
    }


}