using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_AdminTicketView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox1.Attributes.Add("placeholder", Resources.Global.FirstName);
        TextBox2.Attributes.Add("placeholder", Resources.Global.LastName);
        TextBox3.Attributes.Add("placeholder", Resources.Global.FirstName);
        TextBox4.Attributes.Add("placeholder", Resources.Global.LastName);
        TextBox5.Attributes.Add("placeholder", Resources.Global.Issue);
        TextBox6.Attributes.Add("placeholder", Resources.Global.IssueDetails);
        TextBox7.Attributes.Add("placeholder", Resources.Global.Priority);
        TextBox8.Attributes.Add("placeholder", Resources.Global.Status);
        TextBox9.Attributes.Add("placeholder", Resources.Global.Document);
        TextBox10.Attributes.Add("placeholder", Resources.Global.NotificationDetails);
    }
}