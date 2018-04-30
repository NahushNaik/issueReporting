using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Globalization;
using System.Data.SqlClient;
using unirest_net.http;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.LoginButton.Attributes.Add("onclick", DisableTheButton(this.Page, this.LoginButton));
        lblBuildId.Text = "201804012 10:52 PM";
    }

    private void doOnce()
    {
        try
        {
            lblBuildId.Text = Application["RTC"].ToString();
            Session.RemoveAll();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        string user = txtUsername.Text;
        string pass = txtPassword.Text;
        string userDb = "";
        if (Request.QueryString["id"] != null && Request.QueryString["page"] != null)
        {
            if (user.Contains("@sanjeevgroup.com"))
            {
                userDb = user;
            }
            else
            {
                user = user + "@sanjeevgroup.com";
            }
            Session[PublicMethods.ConstUserEmail] = user;
            Session[PublicMethods.ConstUserId] = DBNulls.NumberValue(DBUtils.SqlSelectScalar(new SqlCommand("SELECT User_Id FROM tbl_User_Master WHERE User_Email ='" + Session[PublicMethods.ConstUserEmail] + "'")));
            string link = Request.QueryString["page"] + ".aspx?id=" + Request.QueryString["id"] + "";
            Response.Redirect(link);
        }
        else
        {



       
          
            bool flagGotoDashboard = false;

            bool isConnected = PublicMethods.CheckForInternetConnection();
            if (isConnected == false)
            {
                lblError.Visible = true;
                if (CultureInfo.CurrentCulture.Name == "es-ES")
                {
                    lblError.Text = "Sin conexión a Internet";
                }
                else
                {
                    lblError.Text = "No Internet Connection";
                }

            }
            else
            {
                lblError.Visible = false;
            }


            //Validate sanjeev group user
            if (user.Contains("@sanjeevgroup.com"))
            {
                userDb = user;
            }
            else
            {
                user = user + "@sanjeevgroup.com";
            }

            try
            {
                string value = System.Configuration.ConfigurationManager.AppSettings["demoMode"];

                var authentication = fnAuntheticateUserXML(user, pass);


                //if (value == "yes") {
                //    authentication = null;

                //}
                if (authentication == "Invalid User")
                {
                    //if (userDb != user)
                    //{
                    lblError.Visible = true;
                    if (CultureInfo.CurrentCulture.Name == "es-ES")
                    {
                        lblError.Text = "Por favor, compruebe el nombre de usuario y la contraseña. También es obligatoria la conexión a Internet para iniciar sesión en el trabajo...";
                    }
                    else
                    {
                        lblError.Text = "Please check User name and Password. Also internet connection is mandatory for login to work...";
                    }
                    txtUsername.Text = "";
                    txtPassword.Text = "";
                    //}
                }
                else
                {
                    //Update login user email
                    Session[PublicMethods.ConstUserEmail] = user;


                    //Check user profile status
                    bool profileStatus = CheckProfileIsValid(user);

                    if (!profileStatus)
                    {
                        flagGotoDashboard = false;
                        Response.Redirect("UserProfile.aspx");
                    }
                    else
                    {
                        //start working on session
                        Session[PublicMethods.ConstUserId] = DBNulls.NumberValue(DBUtils.SqlSelectScalar(new SqlCommand("SELECT User_Id FROM tbl_User_Master WHERE User_Email ='" + Session[PublicMethods.ConstUserEmail] + "'")));

                        string RTC = string.Empty;
                        string Date = PublicMethods.fnGetDateTimeNow();
                        RTC = PublicMethods.fnGetUsableRTC_sec(DateTime.Now);
                        string qryToInsertLog = "INSERT INTO [tbl_UserLog] ([User_Id] ,[Entry_Type],[RTC],[Date]) VALUES('" + Session[PublicMethods.ConstUserId] + "','Login','" + RTC + "','" + Date + "')";
                        DBUtils.ExecuteSQLCommand(new SqlCommand(qryToInsertLog));

                        fnUpdateTicketCompletionStatus();

                        flagGotoDashboard = true;
                        //Response.Redirect("UserDash.aspx");
                    }

                }


            }
            catch (Exception ex)
            {
                string script;
                if (CultureInfo.CurrentCulture.Name == "es-ES")
                {
                    script = "alert('Error de inicio de sesion');";
                }
                else
                {
                    script = "alert('Login Failed');";
                }
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script, true);
                throw ex;
            }



            if (flagGotoDashboard == true)
            {

                //By Pavan Ambhure 20171121
                //Redirect Admin to view form
                string qry = "SELECT isAdmin FROM  tbl_User_Master where User_Email='" + Session[PublicMethods.ConstUserEmail] + "'";
                string admin = DBUtils.SqlSelectScalar(new SqlCommand(qry));
                if (checkBoxAdmin.Checked == true && admin == "Y")
                {
                    Response.Redirect("form_AdminDashboard.aspx");
                }
                else
                {
                    Response.Redirect("UserDash.aspx");
                }


            }
            else
            {
                //mahesh temp comment 20171109    
                //Response.Redirect("UserProfile.aspx");                           

            }
        }
    }

    protected void fnUpdateTicketCompletionStatus()
    {
        //Replace below code with database function
        string qryToInsertLog = "SELECT (((select COUNT(*) FROM [tbl_Ticket_Master] WHERE Status = '1' AND Created_By = " + DBNulls.StringValue(Session[PublicMethods.ConstUserId]) + ")*100)/(select COUNT(*) FROM [tbl_Ticket_Master] WHERE Created_By = " + DBNulls.StringValue(Session[PublicMethods.ConstUserId]) + ")) as per FROM [tbl_Ticket_Master] WHERE Created_By = " + DBNulls.StringValue(Session[PublicMethods.ConstUserId]) + "";

        Session["ticketCompletion"] = DBNulls.NumberValue(DBUtils.SqlSelectScalar(new SqlCommand(qryToInsertLog)));
    }

    public String fnAuntheticateUserXML(string user, string password)
    {
        unirest_net.http.HttpResponse<string> response = null;

        try
        {
            response = unirest_net.http.Unirest.get("https://outlook.office365.com/api/v1.0/me/")
                .basicAuth(user, password).asJson<string>();
            if (DBNulls.StringValue(response.Code) == "200")
            {
                return null;
            }
            else
            {
                return "Invalid User";
            }
        }
        catch (Exception)
        {
            return "Invalid User";
        }

        //if (response.Code == 200)
        //{

        //    return null;

        //}

        //return "Invalid User";

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

    private string DisableTheButton(Control pge, Control btn)
    {

        System.Text.StringBuilder sb = new System.Text.StringBuilder();

        sb.Append("if (typeof(Page_ClientValidate) == 'function') {");

        sb.Append("if (Page_ClientValidate() == false) { return false; }} ");

        if (CultureInfo.CurrentCulture.Name == "es-ES")
        {
            sb.Append("this.value = 'por favor espera...';");
        }
        else
        {
            sb.Append("this.value = 'Please wait...';");
        }

        sb.Append("this.disabled = true;");

        sb.Append(pge.Page.GetPostBackEventReference(btn));

        sb.Append(";");

        return sb.ToString();
    }

    protected void checkBoxAdmin_CheckedChanged(object sender, EventArgs e)
    {

    }
}