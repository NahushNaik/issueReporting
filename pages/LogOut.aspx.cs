﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_LogOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PublicMethods.TProf == "1")
        {
            Label1.Text = "Your profile has been set now please Login again to create ticket...";
        }

        if (!IsPostBack)
        {
            string req = Request.QueryString["page"];
            if (req == "feedback")
            {
                Label1.Text = "Thank you." + Environment.NewLine + "for taking time out to provide feedback.We truly value the information you have provided ";
            
            }
            else {
                Label1.Text = "You have successfully logged out.";
                string RTC = string.Empty;
                string Date = PublicMethods.fnGetDateTimeNow();
                RTC = PublicMethods.fnGetUsableRTC_sec(DateTime.Now);
                //Insert logout entry
                string qryToInsertLog = "INSERT INTO [tbl_UserLog] ([User_Id] ,[Entry_Type],[RTC],[Date]) VALUES('" + Session[PublicMethods.ConstUserId] + "','LogOut','" + RTC + "','" + Date + "')";
                DBUtils.ExecuteSQLCommand(new SqlCommand(qryToInsertLog));
            }
          

            Session[PublicMethods.ConstUserEmail] = "";
            Session[PublicMethods.ConstUserId] = "";

            Session.Clear();
            Session.RemoveAll();
        }




    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        
        Response.Redirect("Login.aspx");
    }
}