using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_error : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label2.Text = DBNulls.StringValue(Session["TheException"]);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DBNulls.StringValue(Session["LoginUserEmail"]).Equals(""))
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            string loginType = string.Empty;
            loginType = DBNulls.StringValue(Session["LoginType"]);

            if (loginType == "ADMIN")
            {
                Response.Redirect("AdminDash.aspx");
            }
            else if (loginType == "USER")
            {
                Response.Redirect("UserDash.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        if (DBNulls.StringValue(Session["LoginUserEmail"]).Equals(""))
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            string backUrl = string.Empty;
            backUrl = DBNulls.StringValue(Session["LoginType"]);

            if (backUrl.Equals(""))
            {
                Response.Redirect("Login.aspx");
            }
            if (!backUrl.Equals(""))
            {
                Response.Redirect(backUrl);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }


}