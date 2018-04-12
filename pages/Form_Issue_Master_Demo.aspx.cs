using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_Form_Issue_Master_Demo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RadGrid1_PreRender(object sender, EventArgs e)
    {
        if (!this.IsPostBack && this.RadGrid1.MasterTableView.Items.Count > 1)
        {
            this.RadGrid1.MasterTableView.Items[1].Edit = true;
            this.RadGrid1.MasterTableView.Rebind();
        }
    }
    protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {

        try
        {
            LoadData(false);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    private void LoadData(Boolean doRebind)
    {
        try
        {


            String qry = "SELECT tbl_Issue_Master.Issue_Id, tbl_Issue_Master.Issue_Name, tbl_Issue_Master.Type_Id, tbl_Issue_Master.Application_Id, tbl_Type_Master.Type_Name,tbl_Application_Master.Application_Name FROM tbl_Issue_Master INNER JOIN        tbl_Type_Master ON tbl_Issue_Master.Type_Id = tbl_Type_Master.Type_Id INNER JOIN tbl_Application_Master ON tbl_Issue_Master.Application_Id = tbl_Application_Master.Application_Id";
            DataTable dt = DBUtils.SQLSelect(new SqlCommand(qry));
            RadGrid1.DataSource = dt;
            if (doRebind == true)
            {
                RadGrid1.DataBind();
            }

        }
        catch (Exception ex)
        {
            throw ex;

        }
    }
    protected void RadGrid1_UpdateCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {

    }
    protected void RadGrid1_InsertCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {

    }
    protected void RadGrid1_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {

    }
}