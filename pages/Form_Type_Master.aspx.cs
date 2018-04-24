using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class pages_Form_Type_Master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]).Equals(""))
        {
            Response.Redirect("Login.aspx");
        }

        PublicMethods.LocalizeRadGridFilters(rgTypeMaster);

    }
    protected void rgTypeMaster_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
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


            String qry = "select * from [tbl_Type_Master]";
            DataTable dt = DBUtils.SQLSelect(new SqlCommand(qry));
            rgTypeMaster.DataSource = dt;
            if (doRebind == true)
            {
                rgTypeMaster.DataBind();
            }

        }
        catch (Exception ex)
        {
            throw ex;

        }
    }
    protected void rgTypeMaster_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        GridEditableItem item = e.Item as GridEditableItem;
        if (item != null && e.Item.IsInEditMode && e.Item.ItemIndex != -1)
        {
           
            loadControls(item, e);
        }
    }

    private void loadControls(GridEditableItem item, GridItemEventArgs e)
    {
        try
        {
            if (item.DataItem == null)
                return;
            if (item.IsInEditMode)
            {
                if (item.DataItem == null)
                    return;

                var Type_Id = item.GetDataKeyValue("Type_Id").ToString();

                //Loading of Type

                string qry = "select * from tbl_Type_Master where Type_Id='" + Type_Id + "'  ";
                DataTable dt = DBUtils.SQLSelect(new SqlCommand(qry));
              
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void rgTypeMaster_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        try
        {

            if (e.CommandName == "Delete")
            {
                GridDataItem item = (GridDataItem)e.Item;
                var Type_Id = item.GetDataKeyValue("Type_Id").ToString();
               string  qry = "select * from [tbl_Ticket_Master] where [Type_Id]='" + Type_Id + "' ";
               DataTable dt = DBUtils.SQLSelect(new SqlCommand(qry));

                if (dt.Rows.Count > 0)
                {
                    rmw1.RadAlert("There are some dependent Tickets for This Type", 400, 100, "Success", null);
                    return;
                }
                else
                {

                    var strsql = "DELETE FROM [tbl_Type_Master] WHERE [Type_Id]='" + Type_Id + "'";
                    int i =DBUtils.ExecuteSQLCommand(new SqlCommand(strsql));

                    if (i > 0)
                    {
                        rmw1.RadAlert("Deleted Successfully", 400, 100, "Success", null);
                        LoadData(true);
                    }
                    else {
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
    protected void rgTypeMaster_InsertCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        try
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
            Hashtable newValues = new Hashtable();
            e.Item.OwnerTableView.ExtractValuesFromItem(newValues, editedItem);


            //Load controls
            RadTextBox txtTypeName = (RadTextBox)editedItem.FindControl("txtTypeName");
        


            //Insert query
            var strsql = "INSERT INTO tbl_Type_Master(Type_Name) VALUES ('" + txtTypeName.Text + "');";
            int i = DBUtils.ExecuteSQLCommand(new SqlCommand(strsql));
            if (i > 0)
            {

              
                rmw1.RadAlert("Now add To and CC Email id For Type Name "+ txtTypeName.Text,400, 100, "Success", null);
                rmw1.RadAlert("Type Name:  " + txtTypeName.Text + " Inserted Successfully", 400, 100, "Success", null);
                LoadData(true);
            }
            else {
                rmw1.RadAlert("Error occured during insertion", 400, 100, "Success", null);
                return;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void rgTypeMaster_UpdateCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        try
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
            Hashtable newValues = new Hashtable();
            e.Item.OwnerTableView.ExtractValuesFromItem(newValues, editedItem);

            var Type_Id = editedItem.GetDataKeyValue("Type_Id").ToString();
            //Load controls
            RadTextBox txtTypeName = (RadTextBox)editedItem.FindControl("txtTypeName");
           
            //Insert query
            var strsql = "UPDATE tbl_Type_Master set [Type_Name] = '" + txtTypeName.Text + "' where [Type_Id] = '" + Type_Id + "'";
            int i = DBUtils.ExecuteSQLCommand(new SqlCommand(strsql));
            if (i > 0)
            {
                rmw1.RadAlert("Type Name: " + txtTypeName.Text + " Updated Successfully", 400, 100, "Success", null);
            }
            else {
                rmw1.RadAlert("Error occured during Update", 400, 100, "Success", null);
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}