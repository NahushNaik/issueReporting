using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text.Equals("bhushanchikhalikar@gmail.com") && TextBox2.Text.Equals("bhushan1995"))
        {
            //session declare
            string user = TextBox1.Text;
            Session[PublicMethods.ConstUserEmail] = user;
            Response.Redirect("UserProfile.aspx");
        }
    }
}