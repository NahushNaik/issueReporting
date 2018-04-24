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

public partial class pages_add : System.Web.UI.Page
{
    SqlConnection constr = DBUtils.getConnection();
    DataTable dt = new DataTable();
    string resType = string.Empty;
    string resAppl = string.Empty;
    protected System.Web.UI.HtmlControls.HtmlInputFile File1;
    //double TicketNo;
    string UserId;

    //Email Fields
    string typeName = string.Empty;
    string applicationName = string.Empty;
    string issueName = string.Empty;
    string issueDetails = string.Empty;
    string priority = string.Empty;
    string createdBy = string.Empty;
    string createdAt = string.Empty;
    string fileName = string.Empty;
    string typeId = string.Empty;
    string applictionsId = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {

        IssueDetail.Attributes.Add("placeholder", Resources.Global.IssueDetails);

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
            Satus_Group.Visible = false;
            LoadTypeData();
            TicketID.Text = "New";
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


    //private void LoadTicketNo()
    //{
    //    try
    //    {
    //        string res = string.Empty;
    //        string query = "select max(Ticket_Id) as Ticket_Id from tbl_Ticket_Master";
    //        SqlCommand cmd = new SqlCommand(query, constr);
    //        res = DBUtils.SqlSelectScalar(cmd);
    //        TicketNo = DBNulls.NumberValue(res);
    //    }
    //    catch (Exception ex)
    //    {
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(" + ex.Message + ")", true);
    //    }
    //}


    public string Fn_Get_Ticket_NO()
    {
        try
        {

            SqlCommand com = new SqlCommand();
            string Ticket_Number = "";
            com.CommandType = CommandType.StoredProcedure;
            com.Connection = constr;
            constr.Open();

            com.Parameters.Add(new SqlParameter("@Ticket_Number", SqlDbType.VarChar, 50)).Value = "";

            com.Parameters["@Ticket_Number"].Direction = ParameterDirection.Output;


            com.CommandText = "InProgress_Ticket_Number";
            com.ExecuteNonQuery();

            com.CommandType = CommandType.Text;
            Ticket_Number = DBNulls.StringValue(com.Parameters["@Ticket_Number"].Value);
            constr.Close();
            return Ticket_Number;

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void LoadTypeData()
    {
        try
        {
            string query = "select * from tbl_Type_Master";
            SqlCommand cmd = new SqlCommand(query, constr);
            dt = DBUtils.SQLSelect(cmd);
            drpDownType.DataSource = dt;
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
            SqlCommand cmd = new SqlCommand(query, constr);
            dt = DBUtils.SQLSelect(cmd);
            drpDownApplication.DataSource = dt;
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
            SqlCommand cmd = new SqlCommand(query, constr);
            dt = DBUtils.SQLSelect(cmd);
            DrpIssueType.DataSource = dt;
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

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {

            lbl_Massage.Visible = true;

            //System.Threading.Thread.Sleep(15000);

            if (drpDownType.Text == "--Select--" || drpDownType.SelectedValue.ToString() == "--Select--" || drpDownType.Text == "")
            {
                btnSave.Enabled = true;

                string alertmsg = "alert('Please Select Type');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", alertmsg, true);
                return;


            }

            if (drpDownApplication.Text == "Select" || drpDownApplication.SelectedValue.ToString() == "Select" || drpDownApplication.Text == "")
            {
                btnSave.Enabled = true;
                string alertmsg = "alert('Please Select Application');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", alertmsg, true);
                return;


            }

            if (DrpPriority.Text == "--Select Priority--" || DrpPriority.Text == "Select" || DrpPriority.Text == "")
            {
                btnSave.Enabled = true;
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

            

            string Ticket_Id = Fn_Get_Ticket_NO();


            string query = "insert into tbl_Ticket_Master(Ticket_Id,Type_Id,Application_Id,Issue_Id,Issue_Details,Priority,Created_By,Created_Time,Status) values('" + Ticket_Id + "', " + drpDownType.SelectedValue + "," + drpDownApplication.SelectedValue + "," + DrpIssueType.SelectedValue + ",'" + IssueDetail.Text.Replace("'", "''").ToString() + "','" + DrpPriority.SelectedItem + "','" + UserId + "','" + DateTime.Now.ToString() + "','0')";
            int executeStatus = DBUtils.ExecuteSQLCommand(new SqlCommand(query));

            if (executeStatus != -1)
            {
                typeName = DBNulls.StringValue(drpDownType.SelectedItem.Text);
                applicationName = DBNulls.StringValue(drpDownApplication.SelectedItem.Text);
                issueName = DBNulls.StringValue(DrpIssueType.Text);
                issueDetails = DBNulls.StringValue(IssueDetail.Text);
                priority = DBNulls.StringValue(DrpPriority.Text);
                createdBy = UserId;
                createdAt = PublicMethods.fnGetDateTimeNow();
                typeId = DBNulls.StringValue(drpDownType.SelectedValue);
                applictionsId = DBNulls.StringValue(drpDownApplication.SelectedValue);

                if (UploadDoc.HasFile)
                {
                    try
                    {
                        string filename = Path.GetFileName(UploadDoc.FileName);
                        string folderPath = Server.MapPath("Files/" + Ticket_Id.ToString() + "/");

                        if (!Directory.Exists(folderPath))
                        {
                            Directory.CreateDirectory(folderPath);
                        }
                        UploadDoc.SaveAs(Server.MapPath("Files/" + Ticket_Id.ToString() + "/") + filename);
                        string queryFile = "Insert into tbl_Attachment_Master(Ticket_Id,File_Path,File_Name) values(" + Ticket_Id + ",'" + folderPath + "','" + filename + "')";
                        DBUtils.ExecuteSQLCommand(new SqlCommand(queryFile));
                        fileName = "files/" + Ticket_Id + "/" + filename;

                        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Ticket creation is successfull')", true);

                        string alertmsg = "alert(''Ticket creation is successfull');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", alertmsg, true);

                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(" + ex.Message + ")", true);
                    }
                }
                //Send Email

                fnSendMailXML(Ticket_Id);
                btnSave.Enabled = false;
                string alertmsg1 = "alert('Ticket created sucessfully');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", alertmsg1, true);


                Response.Redirect("UserDash.aspx", true);
            }
            else
            {
                string alertmsg = "alert(''Insertion Error');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", alertmsg, true);
                btnSave.Enabled = true;

                return;
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("UserDash.aspx", true);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(" + ex.Message + ")", true);
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


            body = PopulateBodyApplication(Ticket_Id, typeName, applicationName, issueName, issueDetails, priority, createdBy, createdAt,"Admin");

            string userIdCC = "", userIdTo = "";
            smtp.Credentials = new System.Net.NetworkCredential(emailId, password);
            if (fileName != "")
            {
                mail.Attachments.Add(new Attachment(Server.MapPath(fileName)));
            }
            mail.From = new MailAddress(emailId, "displayName");
            mail.Subject = "New Ticket Created: " + Ticket_Id;

            //Load TO Email ID's
            var userSqlTo = "SELECT [To_Email_Id] FROM [tbl_Email_TO_Master] WHERE [TYPE_ID]='" + typeId + "'";

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

            // mail.CC.Add(Session["LoginUserEmail"].ToString());

            //if (mail.CC.Count==0 && mail.To.Count==0) {
            //    Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Please Contact Admin'); alert('Mail recipient is empty');", true);
            //    return;
            //}
            mail.IsBodyHtml = true;
            mail.Body = body;
            smtp.Send(mail);

            System.Net.Mail.MailMessage mail1 = new System.Net.Mail.MailMessage();

            if (fileName != "")
            {
                mail1.Attachments.Add(new Attachment(Server.MapPath(fileName)));
            }
            string bodyUser = PopulateBodyApplication(Ticket_Id, typeName, applicationName, issueName, issueDetails, priority, createdBy, createdAt, "user");
            mail1.From = new MailAddress(emailId, "displayName");
            mail1.Subject = "New Ticket Created: " + Ticket_Id;
            mail1.To.Add(Session["LoginUserEmail"].ToString());
            mail1.IsBodyHtml = true;
            mail1.Body = bodyUser;
            smtp.Send(mail1);

        }
        catch (Exception ex)
        {
            Response.Redirect("UserDash.aspx", true);
            throw ex;
        }
    }

    protected string PopulateBodyApplication(string Ticket_Id, string ticketType, string applicationName, string issue, string issueDescription, string priority, string createdBy, string createdDate,string visibleTo)
    {
        string body, name = "", email = "";
        String contact = "";
        //ticketID = TicketNo.ToString();
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
        allContents = allContents.Replace("@#TICKET_TIME#@", createdDate);
        if (visibleTo == "Admin") {
            allContents = allContents.Replace("@#visibleTo#@", "visible");
        }
        if (visibleTo == "user")
        {
            allContents = allContents.Replace("@#visibleTo#@", "collapse");
        }


        body = allContents;
        return body;
    }


    protected Boolean fnCheckEmail(string Tid) {
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
            else {
                return true;
            }
        }
        catch (Exception ex) {
            throw ex;
        }
    }

}

