//Code By :Pavan Ambhure


using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_Form_Edit_TicketDetails : System.Web.UI.Page
{
    DataTable table = new DataTable();
    SqlConnection constr = DBUtils.getConnection();
    DataTable dt = new DataTable();
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

    string typeName = string.Empty;
    string applicationName = string.Empty;
    string issueName = string.Empty;
    string createdBy = string.Empty;

    

    protected void Page_Load(object sender, EventArgs e)
    {
        string Id = Request.QueryString["id"];

        if (Id == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }
        else if (DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]).Equals(""))
        {
            Response.Redirect("Login.aspx");
            return;
        }


        if (!IsPostBack)
        {
            
            LoadTypeData();
            string queryToFetchAllData = "SELECT tbl_Issue_Master.Issue_Name, tbl_Ticket_Master.*,tbl_Type_Master.Type_Name, tbl_Application_Master.Application_Name FROM  tbl_Ticket_Master INNER JOIN tbl_Type_Master ON tbl_Ticket_Master.Type_Id = tbl_Type_Master.Type_Id INNER JOIN tbl_Application_Master ON tbl_Ticket_Master.Application_Id =tbl_Application_Master.Application_Id INNER JOIN tbl_Issue_Master ON tbl_Ticket_Master.Issue_Id = tbl_Issue_Master.Issue_Id where tbl_Ticket_Master.Ticket_Id='" + Id + "' ";
            DataTable dtAllData = DBUtils.SQLSelect(new SqlCommand(queryToFetchAllData));
            drpDownType.SelectedValue = dtAllData.Rows[0]["Type_Id"].ToString();
            resType = dtAllData.Rows[0]["Type_Id"].ToString();
            LoadApplicationData();
            drpDownApplication.SelectedValue = dtAllData.Rows[0]["Application_Id"].ToString();
            resAppl = dtAllData.Rows[0]["Application_Id"].ToString();
            LoadIssueData();
            DrpIssueType.SelectedValue = dtAllData.Rows[0]["Issue_Id"].ToString();





        }
        else
        {
            resType = drpDownType.SelectedValue;
        }

        createdBy = DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]);

         //Query to prevent changes in URL 
        //User can change query string and access other tickets so this query prevent this condition
         string queryToGetUserId = "SELECT [User_Id] FROM [tbl_User_Master] where [User_Email]='" + DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]) + "'";
         string userId = DBUtils.SqlSelectScalar(new SqlCommand(queryToGetUserId));


         string query = "select * from fnGetTicketDetail('" + Id + "')  where User_Id='" + userId + "'";
        table = DBUtils.SQLSelect(new SqlCommand(query));

        foreach (DataRow drDetails in table.Rows) {
            typeName = drDetails["Type Name"].ToString();
            applicationName = drDetails["Application Name"].ToString();
            issueName = drDetails["Issue Name"].ToString();
        }





        drpStatus.DataSource = table;
        drpStatus.DataTextField = "Status";
        drpStatus.DataBind();
        lblStatus.Text = DBNulls.StringValue(table.Rows[0]["Status"].ToString());
        if (lblStatus.Text.Equals("Open"))
        {

            btn_Edit_Details.Visible = true;
        }
      

        lblStatus.ForeColor = System.Drawing.Color.Green;
      

        TicketID.Text = table.Rows[0]["Ticket No"].ToString();
        drpDownType.DataSource = table;




        if (!IsPostBack)
        {
            IssueDetail.Text = table.Rows[0]["Issue Details"].ToString();
        }
        DrpPriority.DataSource = table;
        DrpPriority.DataTextField = "Priority";
        DrpPriority.DataBind();

        query = "select * from tbl_Attachment_Master where Ticket_Id='" + Id + "'";
        table = DBUtils.SQLSelect(new SqlCommand(query));
        if (table.Rows.Count > 0)
        {
            FileDownload.Enabled = true;
            txtFileName.Text = table.Rows[0]["File_Name"].ToString();
        }
        else
        {
            FileDownload.Enabled = false;
        }
     

    }
   




    //Load DropDown data:Start
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

    //DropDown Data End
    protected void drpDownApplication_SelectedIndexChanged(object sender, EventArgs e)
    {
        resAppl = drpDownApplication.SelectedValue;
        LoadIssueData();
    }
    protected void drpDownType_SelectedIndexChanged(object sender, EventArgs e)
    {
        resType = drpDownType.SelectedValue;
        LoadApplicationData();
    }
    protected void DrpIssueType_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btn_Edit_Details_Click(object sender, EventArgs e)
    {
        try
        {
            if (drpDownType.Text == "--Select--" || drpDownType.SelectedValue.ToString() == "--Select--" || drpDownType.Text == "")
            {
                btn_Edit_Details.Enabled = true;

                string alertmsg = "alert('Please Select Type');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", alertmsg, true);
                return;


            }

            if (drpDownApplication.Text == "Select" || drpDownApplication.SelectedValue.ToString() == "Select" || drpDownApplication.Text == "")
            {
                btn_Edit_Details.Enabled = true;
                string alertmsg = "alert('Please Select Application');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", alertmsg, true);
                return;


            }

            if (DrpPriority.Text == "--Select Priority--" || DrpPriority.Text == "Select" || DrpPriority.Text == "")
            {
                btn_Edit_Details.Enabled = true;
                string alertmsg = "alert('Please Select Priority');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", alertmsg, true);
                return;
            }

            if (fnCheckEmail(drpDownType.SelectedValue) == false)
            {
                string alertmsg = "alert('Please contact Administrator');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", alertmsg, true);
                return;

            }

          
            fnAddLogMaster();
           
        }
        catch (Exception ex) {
            throw ex;
        }
    }

    private void fnAddLogMaster()  
    {
        try
        {
            fnGetOldData();
            if (Type_Id == drpDownType.SelectedValue && Application_Id == drpDownApplication.SelectedValue && Issue_Id == DrpIssueType.SelectedValue && Issue_Details == IssueDetail.Text) {
                string alertmsg = "alert('You can not update old ticket,Change details if you want to update details');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", alertmsg, true);
                return;
            }

         
                sendMail_TicketTypeChanged();
                fnUpdateTicketMaster();
           
        }
        catch (Exception ex) {
            throw ex;
        }
    }

    private void fnUpdateTicketMaster()
    {
        try
        {
            string query = "UPDATE [tbl_Ticket_Master] SET [Type_Id] = '" + drpDownType.SelectedValue + "',[Application_Id] ='" + drpDownApplication.SelectedValue + "',[Issue_Id] = '" + DrpIssueType.SelectedValue + "',[Created_Time] = '" + DateTime.Now + "',Issue_Details='" + IssueDetail.Text.Replace("'", "''").ToString() + "' WHERE Ticket_Id='" + TicketID.Text + "' ";

            int i = DBUtils.ExecuteSQLCommand(new SqlCommand(query));
            if (i > 0)
            {

                sendMail_New_TicketType();
                Response.Redirect("UserDash.aspx", true);
            }
            else {
                string alertmsg = "alert('Update Failed');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", alertmsg, true);
                return;
            }
        }
        catch (Exception ex)
        {
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



            body = PopulateBodyApplication(Ticket_Id, drpDownType.SelectedItem.Text, drpDownApplication.SelectedItem.Text, DrpIssueType.SelectedItem.Text, IssueDetail.Text, DrpPriority.SelectedItem.Text, createdBy, Created_Time);

            string userIdCC = "", userIdTo = "";
            smtp.Credentials = new System.Net.NetworkCredential(emailId, password);

             string  queryForFileAttach = "select * from tbl_Attachment_Master where Ticket_Id='" + Ticket_Id + "'";
        table = DBUtils.SQLSelect(new SqlCommand(queryForFileAttach));
        string fName = "";
        if (table.Rows.Count > 0)
        {
            string filePath = table.Rows[0]["File_Path"].ToString();
            string fileName = txtFileName.Text;
             fName = filePath + fileName;
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

            //Send Mail to ticker Owner Patch >> Suggestion by vikram sir
            
            //System.Net.Mail.MailMessage mail1 = new System.Net.Mail.MailMessage();


            //mail1.From = new MailAddress(emailId, "displayName");
            //mail1.Subject = "New Ticket Created: " + Ticket_Id;
            //mail1.To.Add(Session["LoginUserEmail"].ToString());
            //mail1.IsBodyHtml = true;
            //mail1.Body = body;
            //smtp.Send(mail1);

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

            string userIdCC = "", userIdTo = "";
            smtp.Credentials = new System.Net.NetworkCredential(emailId, password);
           
            mail.From = new MailAddress(emailId, "displayName");
            mail.Subject = "Ticket Type has been changed for ticket No: " + Ticket_Id;

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

            

            // mail.CC.Add(Session["LoginUserEmail"].ToString());


            mail.IsBodyHtml = true;
            mail.Body = body;
            smtp.Send(mail);

            System.Net.Mail.MailMessage mail1 = new System.Net.Mail.MailMessage();

            string bodyUser = PopulateBody_TypeChanged(Ticket_Id, typeName, applicationName, issueName, Issue_Details, Priority, createdBy, Created_Time, "user");
            mail1.From = new MailAddress(emailId, "displayName");
            mail1.Subject = "Ticket Type has been changed for ticket No: " + Ticket_Id;
            mail1.To.Add(Session["LoginUserEmail"].ToString());
            mail1.IsBodyHtml = true;
            mail1.Body = bodyUser;
            smtp.Send(mail1);

        }
        catch (Exception ex)
        {
            string alertmsg = "alert('Please check network connection');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", alertmsg, true);
            return;
            throw ex;
        }
    }


    protected string PopulateBodyApplication(string Ticket_Id, string ticketType, string applicationName, string issue, string issueDescription, string priority, string createdBy, string createdDate)
    {
        string body, name = "", email = "";
        String contact = "";
        //ticketID = TicketNo.ToString();
        var qry = "SELECT User_First_Name, User_Last_Name,[User_Email],[Contact_No] FROM tbl_User_Master WHERE [User_Email]='" + createdBy + "'";
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






    protected string PopulateBody_TypeChanged(string Ticket_Id, string ticketType, string applicationName, string issue, string issueDescription, string priority, string createdBy, string createdDate, string visibleTo)
    {
        string body, name = "", email = "";
        String contact = "";
        //ticketID = TicketNo.ToString();
        var qry = "SELECT User_First_Name, User_Last_Name,[User_Email],[Contact_No] FROM tbl_User_Master WHERE [User_Email]='" + createdBy + "'";
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
        readTemplateFile = new StreamReader(Server.MapPath("Email_Body/email_Ticket_Type_Changed_User.html"));
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

        string emptyText = "Ticket Type has been changed by Ticket owner";
        allContents = allContents.Replace("@#Color_Code#@", Color);
        allContents = allContents.Replace("@#Admin_Remark#@", emptyText);


        allContents = allContents.Replace("@#TICKET_TYPE#@", ticketType);
        allContents = allContents.Replace("@#TICKET_APPLICATION#@", applicationName);
       
        allContents = allContents.Replace("@#TICKET_DETAILS#@", issueDescription);
        allContents = allContents.Replace("@#TICKET_PRIORITY#@", priority);
        allContents = allContents.Replace("@#TICKET_OWNER#@", name);
        allContents = allContents.Replace("@#TICKET_CONTACT#@", contact);
        allContents = allContents.Replace("@#TICKET_EMAIL#@", email);
        allContents = allContents.Replace("@#TICKET_TIME#@", Convert.ToDateTime(createdDate).ToString("dd/MMM/yyyy HH:mm:ss tt", CultureInfo.InvariantCulture));
        //

        //
        allContents = allContents.Replace("@#TICKET_TYPE_New#@", drpDownType.SelectedItem.Text);
        allContents = allContents.Replace("@#TICKET_APPLICATION_New#@",drpDownApplication.SelectedItem.Text);

      
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



    private void fnGetOldData() {
        try
        {
            string qry = "select * from tbl_Ticket_Master where [Ticket_Id]='" + Request.QueryString["id"] + "'";
            DataTable dtOldDetails = DBUtils.SQLSelect(new SqlCommand(qry));
            foreach(DataRow dr in dtOldDetails.Rows) {
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
        catch (Exception ex) {
            throw ex;
        }
    
    }



    protected void FileDownload_Click(object sender, EventArgs e)
    {
        
        string query;
        string Id = Request.QueryString["id"];
        query = "select * from tbl_Attachment_Master where Ticket_Id='" + Id + "'";
        table = DBUtils.SQLSelect(new SqlCommand(query));
        if (table.Rows.Count > 0)
        {
            string filePath = table.Rows[0]["File_Path"].ToString();
            string fileName = txtFileName.Text;
            string fName = filePath + fileName;
            FileInfo fi = new FileInfo(fName);
            long sz = fi.Length;

            Response.ClearContent();
            Response.ContentType = MimeType(Path.GetExtension(fName));
            Response.AddHeader("Content-Disposition", string.Format("attachment; filename = {0}", System.IO.Path.GetFileName(fName)));
            Response.AddHeader("Content-Length", sz.ToString("F0"));
            Response.TransmitFile(fName);
            Response.End();
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
}