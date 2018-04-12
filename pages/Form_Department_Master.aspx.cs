using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class pages_Form_Department_Master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]).Equals(""))
        {
            Response.Redirect("Login.aspx");
        }
    }
    protected void rgDepartmentMaster_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
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


            String qry = "select * from [tbl_Department_Master]";
            DataTable dt = DBUtils.SQLSelect(new SqlCommand(qry));
            rgDepartmentMaster.DataSource = dt;
            if (doRebind == true)
            {
                rgDepartmentMaster.DataBind();
            }

        }
        catch (Exception ex)
        {
            throw ex;

        }
    }
    protected void rgDepartmentMaster_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {

    }
    protected void rgDepartmentMaster_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        try
        {

            if (e.CommandName == "Delete")
            {
                GridDataItem item = (GridDataItem)e.Item;
                var Department_Id = item.GetDataKeyValue("Department_Id").ToString();

                //string qry = "SELECT  tbl_Ticket_Master.Ticket_Id, tbl_User_Master.User_Id, tbl_Department_Master.Department_Name FROM  tbl_Ticket_Master INNER JOIN tbl_User_Master ON tbl_Ticket_Master.Created_By = tbl_User_Master.User_Id INNER JOIN tbl_Department_Master ON tbl_User_Master.Department_Id = tbl_Department_Master.Department_Id";

                //DataTable dtDept = DBUtils.SQLSelect(new SqlCommand(qry));
                //if (dtDept.Rows.Count < 0) { 
                    
                
                //}
                var strsql = "DELETE FROM [tbl_Department_Master] WHERE [Department_Id]='" + Department_Id + "'";
                    int i = DBUtils.ExecuteSQLCommand(new SqlCommand(strsql));

                    if (i > 0)
                    {
                        rmw1.RadAlert("Deleted Successfully", 400, 100, "Success", null);
                        LoadData(true);
                    }
                    else
                    {
                        rmw1.RadAlert("Error", 400, 100, "Success", null);
                    }
                
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void rgDepartmentMaster_InsertCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        GridEditableItem editedItem = e.Item as GridEditableItem;
        Hashtable newValues = new Hashtable();
        e.Item.OwnerTableView.ExtractValuesFromItem(newValues, editedItem);


        //Load controls
        RadTextBox txtDepartmentName = (RadTextBox)editedItem.FindControl("txtDepartmentName");



        //Insert query
        var strsql = "INSERT INTO tbl_Department_Master(Department_Name) VALUES ('" + txtDepartmentName.Text + "');";
        int i = DBUtils.ExecuteSQLCommand(new SqlCommand(strsql));
        if (i > 0)
        {

            rmw1.RadAlert("Department Name:  " + txtDepartmentName.Text + " Inserted Successfully", 400, 100, "Success", null);
            LoadData(true);
        }
        else
        {
            rmw1.RadAlert("Error occured during insertion", 400, 100, "Success", null);
            return;
        }
    }
    protected void rgDepartmentMaster_UpdateCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        try
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
            Hashtable newValues = new Hashtable();
            e.Item.OwnerTableView.ExtractValuesFromItem(newValues, editedItem);

            var Department_Id = editedItem.GetDataKeyValue("Department_Id").ToString();
            //Load controls
            RadTextBox txtDepartmentName = (RadTextBox)editedItem.FindControl("txtDepartmentName");

            //Insert query
            var strsql = "UPDATE tbl_Department_Master set [Department_Name] = '" + txtDepartmentName.Text + "' where [Department_Id] = '" + Department_Id + "'";
            int i = DBUtils.ExecuteSQLCommand(new SqlCommand(strsql));
            if (i > 0)
            {
                rmw1.RadAlert("Department Name: " + txtDepartmentName.Text + " Updated Successfully", 400, 100, "Success", null);
            }
            else
            {
                rmw1.RadAlert("Error occured during Update", 400, 100, "Success", null);
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}