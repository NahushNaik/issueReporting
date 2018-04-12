using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Collections;
using System.Web.Configuration;
using System.Net.Mail;
using System.Text;
using System.Drawing;



public partial class pages_View : System.Web.UI.Page
{
    DataTable table = new DataTable();

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

        string query = "select * from fnGetTicketDetail('" + Id + "')";
        table = DBUtils.SQLSelect(new SqlCommand(query));
        if (table.Rows.Count < 1) {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "No Data Found", "alert('No Data Found...'); ", true);
            return;
        }


        drpStatus.DataSource = table;
        drpStatus.DataTextField = "Status";
        drpStatus.DataBind();
        lblStatus.Text = DBNulls.StringValue(table.Rows[0]["Status"].ToString());
        if (lblStatus.Text.Equals("Open"))
        {

            btn_Edit_Details.Visible = true;
        }
        txt_Comments.Enabled = true;
        btn_UpdateComment.Enabled = true;

        lblStatus.ForeColor = System.Drawing.Color.Green;
        //}
        //else
        //{
            //lblStatus.ForeColor = System.Drawing.Color.Red;
            //txt_Comments.Enabled = false;
            //btn_UpdateComment.Enabled = false;

        //}

        TicketID.Text = table.Rows[0]["Ticket No"].ToString();
        drpDownType.DataSource = table;

      


        drpDownType.DataTextField = "Type Name";
        drpDownType.DataBind();
        drpDownApplication.DataSource = table;
        drpDownApplication.DataTextField = "Application Name";
        drpDownApplication.DataBind();
        DrpIssueType.DataSource = table;
        DrpIssueType.DataTextField = "Issue Name";
        DrpIssueType.DataBind();
        IssueDetail.Text = table.Rows[0]["Issue Details"].ToString();
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
        if (!IsPostBack)
        {

            fillData();
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
    protected void rptPaging_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
        fillData();
    }
    protected void btn_UpdateComment_Click(object sender, EventArgs e)
    {
        try
        {

            if (fnCheckEmail(drpDownType.SelectedValue) == false)
            {
                string alertmsg = "alert('Please contact Administrator');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertscript", alertmsg, true);
                return;

            }

            string qryToLogDetails = "INSERT INTO [tbl_Ticket_Comments] ([Comment],[Commented_By],[Ticket_ID],[Created_Datetime])  VALUES ('" + txt_Comments.Text.Replace("'", "''").ToString() + "','" + DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]) + "','" + TicketID.Text + "','" + DateTime.Now + "')";
            DBUtils.ExecuteSQLCommand(new SqlCommand(qryToLogDetails));
            txt_Comments.Text = "";

            fillData();

            fnSendMailXML(TicketID.Text);


        }
        catch (Exception ex)
        {
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

           string query = " select Type_Id from tbl_Type_Master where Type_Name='" + DBNulls.StringValue(drpDownType.SelectedValue) + "'";
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


        string query = "Select  Comment,Ticket_ID,Created_Datetime,  User_First_Name + ' ' + User_Last_Name AS UserName,case when tbl_User_Master.isAdmin= 'Y' then 'Admin' else 'User' end as isAdmin from tbl_Ticket_Comments ,tbl_User_Master where tbl_User_Master.User_Email=tbl_Ticket_Comments.Commented_By and Ticket_ID ='" + Request.QueryString["id"] + "'  Order by Comment_ID Desc ";
       DataTable dt = DBUtils.SQLSelect(new SqlCommand(query));


        StringBuilder sb = new StringBuilder();


        allContents = "<!DOCTYPE html><html><head><style>table {   font-family: arial, sans-serif;    border-collapse: collapse;    width: 100%;}td, th {    border: 2px solid #dddddd;    text-align: left;    padding: 8px;}tr:nth-child(even) {    background-color: #dddddd;}</style></head><body> <table bgcolor='#42A6A8' align='left' valign='top' width='100%' border='0' cellpadding='0' cellspacing='0'> <tr> <td align='left' colspan='2' style='color:#ffffff; font-family:'Segoe UI', Arial, Helvetica, sans-serif; font-size: 36px; font-weight:200; padding-bottom:20px; padding-left:20px;padding-top:10px'> <img src='@@sajeevlogo@@'  />                            </td>                        </tr>          </table><table width='100%' border='0' cellpadding='0' cellspacing='0'> <tr>  <td  style='color:#5c2d91;font-size:20pt; text-align:Center; '>    Ticket ID : @TicketID@                                        </td>                                    </tr>                                    <tr> <td style='color:#5c2d91; font-size:20pt; '>                                          Comment's:                 </td>                                    </tr>                                    </table><table  style='border: 1px solid black; '>  <tr  style='border: 1px solid black; '>    <th  style='border: 1px solid black; '>User Name</th>    <th  style='border: 1px solid black; '>Comment's</th> <th  style='border: 1px solid black; '>Time</th>  </tr> ";

        string directoryPath = WebConfigurationManager.AppSettings["Website"];

        allContents = allContents.Replace("@@sajeevlogo@@", Path.Combine(directoryPath + "pages/images/sanjeevlogo.png"));
        allContents = allContents.Replace("@TicketID@", Ticket_Id);

      

        StringBuilder sb1 = new StringBuilder();
        foreach (DataRow dr in dt.Rows)
        {
            string abc = "<tr style='border: 1px solid black; background-color: #dddddd; ' >    <td style='border: 1px solid black;color:#5c2d91; ' >@User_Name@</td>    <td style='border: 1px solid black;word-break:break-all;' >@User_Comment@</td><td style='border: 1px solid black;word-break:break-all;' >@time@</td> </tr>";
            abc = abc.Replace("@User_Name@", dr["isAdmin"].ToString());
            abc = abc.Replace("@User_Comment@", dr["Comment"].ToString());
            abc = abc.Replace("@time@", dr["Created_Datetime"].ToString());
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


        //string query = "Select Comment,Ticket_ID,Created_Datetime,  User_First_Name + ' ' + User_Last_Name AS UserName from tbl_Ticket_Comments ,tbl_User_Master where tbl_User_Master.User_Email=tbl_Ticket_Comments.Commented_By and Ticket_ID ='" + Request.QueryString["id"] + "'  Order by Comment_ID Desc ";
        string query = " Select Comment,Ticket_ID,Created_Datetime,  User_First_Name + ' ' + User_Last_Name AS UserName,case when tbl_User_Master.isAdmin= 'Y' then 'Admin' else 'User' end as isAdmin from tbl_Ticket_Comments ,tbl_User_Master where tbl_User_Master.User_Email=tbl_Ticket_Comments.Commented_By and Ticket_ID  ='" + Request.QueryString["id"] + "'  Order by Comment_ID Desc ";
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
    protected void btn_Edit_Details_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("Form_Edit_TicketDetails.aspx?id="+Request.QueryString["id"]+"");
        }
        catch (Exception ex) {
            throw ex;
        }
    }

    protected Boolean fnCheckEmail(string Tid)
    {
        try
        {
            string typeId = "select Type_Id from [tbl_Type_Master] where Type_Name='" + Tid + "'";
            string ti = DBUtils.SqlSelectScalar(new SqlCommand(typeId));

            string qry = "SELECT [To_Email_Id] FROM [tbl_Email_TO_Master] WHERE [TYPE_ID]='" + ti + "'";
            DataTable dtTo = DBUtils.SQLSelect(new SqlCommand(qry));
            qry = "SELECT [CC_Email_Id] FROM [tbl_Email_CC_Master] WHERE [TYPE_ID]='" + ti + "'";
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