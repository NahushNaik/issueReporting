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

public partial class pages_Form_Application_Master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]).Equals(""))
        {
            Response.Redirect("Login.aspx");
        }
    }
    protected void rgApplicationMaster_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
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


            String qry = "SELECT tbl_Application_Master.Application_Id, tbl_Application_Master.Application_Name, tbl_Application_Master.Type_Id, tbl_Type_Master.Type_Name FROM  tbl_Application_Master INNER JOIN  tbl_Type_Master ON tbl_Application_Master.Type_Id = tbl_Type_Master.Type_Id";
            DataTable dt = DBUtils.SQLSelect(new SqlCommand(qry));
            rgApplicationMaster.DataSource = dt;
            if (doRebind == true)
            {
                rgApplicationMaster.DataBind();
            }

        }
        catch (Exception ex)
        {
            throw ex;

        }
    }
    protected void rgApplicationMaster_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
       
    }
    protected void rgApplicationMaster_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        try
        {

            if (e.CommandName == "Delete")
            {
                GridDataItem item = (GridDataItem)e.Item;
                var Application_Id = item.GetDataKeyValue("Application_Id").ToString();
                string qry = "select * from [tbl_Ticket_Master] where [Application_Id]='" + Application_Id + "' ";
                DataTable dt = DBUtils.SQLSelect(new SqlCommand(qry));

                if (dt.Rows.Count > 0)
                {
                    rmw1.RadAlert("There are some dependent Tickets for This Application", 400, 100, "Success", null);
                    return;
                }
                else
                {

                    var strsql = "DELETE FROM [tbl_Application_Master] WHERE [Application_Id]='" + Application_Id + "'";
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

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void rgApplicationMaster_InsertCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        try
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
            Hashtable newValues = new Hashtable();
            e.Item.OwnerTableView.ExtractValuesFromItem(newValues, editedItem);


            //Load controls
            RadTextBox txtApplicationName = (RadTextBox)editedItem.FindControl("txtApplicationName");
            RadDropDownList ddlType = (RadDropDownList)editedItem.FindControl("ddlType");


            //Insert query
            var strsql = "INSERT INTO tbl_Application_Master(Application_Name,Type_Id) VALUES ('" + txtApplicationName.Text + "', '" + ddlType.SelectedValue + "');";
            int i = DBUtils.ExecuteSQLCommand(new SqlCommand(strsql));
            if (i > 0)
            {


                rmw1.RadAlert("Application Name:  " + txtApplicationName.Text + " Inserted Successfully", 400, 100, "Success", null);
                LoadData(true);
            }
            else {

                rmw1.RadAlert("Insertion Error", 400, 100, "Success", null);
                return;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void rgApplicationMaster_UpdateCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        try
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
            Hashtable newValues = new Hashtable();
            e.Item.OwnerTableView.ExtractValuesFromItem(newValues, editedItem);

            var Application_Id = editedItem.GetDataKeyValue("Application_Id").ToString();
            //Load controls
            RadTextBox txtApplicationName = (RadTextBox)editedItem.FindControl("txtApplicationName");
            RadDropDownList ddlType = (RadDropDownList)editedItem.FindControl("ddlType");
            //Insert query
            var strsql = "UPDATE tbl_Application_Master set Application_Name = '" + txtApplicationName.Text + "', Type_Id = '" + ddlType.SelectedValue + "' where Application_Id = '" + Application_Id + "'";
            int i=DBUtils.ExecuteSQLCommand(new SqlCommand(strsql));
            if (i > 0)
            {
                rmw1.RadAlert("Application Name: " + txtApplicationName.Text + " Updated Successfully", 400, 100, "Success", null);
            }
            else {
                rmw1.RadAlert("Error.", 400, 100, "Success", null);
                return;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}