using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_IssueDetailsCS : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadTypeData();
    }
    private void LoadTypeData()
    {
        try
        {
            string query = "select * from tbl_Type_Master";

            DataTable dt = DBUtils.SQLSelect(new SqlCommand(query));
            ddlType.DataTextField = "Type_Name";
            ddlType.DataValueField = "Type_Id";
            ddlType.DataBind();
            ddlType.Items.Insert(0, new ListItem("--Select Type--", "--Select--"));
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(" + ex.Message + ")", true);
        }
    }

}