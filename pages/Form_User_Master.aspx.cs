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

public partial class pages_Form_User_Master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]).Equals(""))
        {
            Response.Redirect("Login.aspx");
        }

        PublicMethods.LocalizeRadGridFilters(rgUserMaster);
    }
    protected void rgUserMaster_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        try {
            LoadData(false);
        }

        catch(Exception ex) {
            throw ex;
        }
    }

    private void LoadData(Boolean doRebind)
    {
        try
        {


            String qry = "SELECT tbl_User_Master.User_Id, tbl_User_Master.User_Email, tbl_User_Master.User_First_Name, tbl_User_Master.User_Last_Name,tbl_User_Master.Contact_No, tbl_User_Master.Plant_Id,tbl_User_Master.Department_Id, tbl_User_Master.isAdmin,tbl_Plant_Master.Plant_Name, tbl_Department_Master.Department_Name FROM tbl_User_Master INNER JOIN tbl_Plant_Master ON tbl_User_Master.Plant_Id = tbl_Plant_Master.Plant_Id INNER JOIN tbl_Department_Master ON tbl_User_Master.Department_Id = tbl_Department_Master.Department_Id";
            DataTable dt = DBUtils.SQLSelect(new SqlCommand(qry));
            rgUserMaster.DataSource = dt;
            if (doRebind == true)
            {
                rgUserMaster.DataBind();
            }

        }
        catch (Exception ex)
        {
            throw ex;

        }
    }
    protected void rgUserMaster_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {

    }
    protected void rgUserMaster_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        try
        {

            if (e.CommandName == "Delete")
            {
                GridDataItem item = (GridDataItem)e.Item;
                var User_Id = item.GetDataKeyValue("User_Id").ToString();



                var strsql = "DELETE FROM [tbl_User_Master] WHERE [User_Id]='" + User_Id + "'";
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
    protected void rgUserMaster_InsertCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        try
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
            Hashtable newValues = new Hashtable();
            e.Item.OwnerTableView.ExtractValuesFromItem(newValues, editedItem);


            //Load controls
            RadTextBox txtEmail = (RadTextBox)editedItem.FindControl("txtEmail");
            RadTextBox txtFirstName = (RadTextBox)editedItem.FindControl("txtFirstName");
            RadTextBox txtLastName = (RadTextBox)editedItem.FindControl("txtLastName");
          
            RadTextBox txtContact = (RadTextBox)editedItem.FindControl("txtContact");
            RadDropDownList ddlPlant = (RadDropDownList)editedItem.FindControl("ddlPlant");
            RadDropDownList ddlDepartment = (RadDropDownList)editedItem.FindControl("ddlDepartment");




            //Insert query
            var strsql = "INSERT INTO tbl_User_Master(User_Email,[User_First_Name],[User_Last_Name],[Contact_No],[Plant_Id],[Department_Id]) VALUES ('" + txtEmail.Text + "','" + txtFirstName.Text + "','" + txtLastName.Text + "','" + txtContact.Text + "','" + ddlPlant.SelectedValue + "','" + ddlDepartment.SelectedValue + "');";
            int i = DBUtils.ExecuteSQLCommand(new SqlCommand(strsql));
            if (i > 0)
            {

                rmw1.RadAlert("User:  " + txtFirstName.Text + " Inserted Successfully", 400, 100, "Success", null);
                LoadData(true);
            }
            else
            {
                rmw1.RadAlert("Error occured during insertion", 400, 100, "Success", null);
                return;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void rgUserMaster_UpdateCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {

        try
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
            Hashtable newValues = new Hashtable();
            e.Item.OwnerTableView.ExtractValuesFromItem(newValues, editedItem);

            var User_Id = editedItem.GetDataKeyValue("User_Id").ToString();
            //Load controls
            RadTextBox txtEmail = (RadTextBox)editedItem.FindControl("txtEmail");
            RadTextBox txtFirstName = (RadTextBox)editedItem.FindControl("txtFirstName");
            RadTextBox txtLastName = (RadTextBox)editedItem.FindControl("txtLastName");

            RadTextBox txtContact = (RadTextBox)editedItem.FindControl("txtContact");
            RadDropDownList ddlPlant = (RadDropDownList)editedItem.FindControl("ddlPlant");
            RadDropDownList ddlDepartment = (RadDropDownList)editedItem.FindControl("ddlDepartment");



            string qry = "select User_Email from tbl_User_Master where User_Email='" + txtEmail.Text + "'   ";
            string emailID = DBUtils.SqlSelectScalar(new SqlCommand(qry));
            if (emailID != "") {
                rmw1.RadAlert("Duplicate Email", 400, 100, "Success", null);
                return;
            }


            //Update query
            var strsql = "UPDATE tbl_User_Master set User_Email = '" + txtEmail.Text + "', User_First_Name = '" + txtFirstName.Text + "',[User_Last_Name]='" + txtLastName.Text + "',[Contact_No]='" + txtContact.Text + "',[Plant_Id]='" + ddlPlant.SelectedValue + "',[Department_Id]='" + ddlDepartment.SelectedValue + "' where [User_Id] = '" + User_Id + "'";
            int i = DBUtils.ExecuteSQLCommand(new SqlCommand(strsql));
            if (i > 0)
            {
                rmw1.RadAlert("User: " + txtFirstName.Text + " Updated Successfully", 400, 100, "Success", null);
            }
            else
            {
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