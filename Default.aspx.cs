﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Redirect("~/pages/Login.aspx");
        //Response.Redirect("~/Pages/Dashboard.aspx?Role=" + Session["Role"].ToString()+"&User="+Session["LoginUserEmail"].ToString());
    }
}