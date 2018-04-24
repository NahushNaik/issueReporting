using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Globalization;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class pages_Form_Master_To : System.Web.UI.Page
{
    string UserId;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]).Equals(""))
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            //Check user profile status
            bool profileStatus = CheckProfileIsValid(DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]));

            if (!profileStatus)
            {
                Response.Redirect("UserProfile.aspx");
            }

            UserId = DBNulls.StringValue(Session[PublicMethods.ConstUserId].ToString());
        }
        if (!IsPostBack)
        {
            fnLoadData(true);
           
        }
        PublicMethods.LocalizeRadGridFilters(rgTo);
    }
    
    protected bool CheckProfileIsValid(string userEMail)
    {

        try
        {

            DataTable dt = DBUtils.SQLSelect(new SqlCommand("SELECT [User_Id],[User_Email],[User_First_Name],[User_Last_Name],[Contact_No],[Plant_Id],[Department_Id] FROM tbl_User_Master where User_Email='" + userEMail + "'"));

            if (dt.Rows.Count > 0)
            {

                if (DBNulls.StringValue(dt.Rows[0]["User_Id"]).Trim().Equals("") || DBNulls.StringValue(dt.Rows[0]["User_Email"]).Trim().Equals("") || DBNulls.StringValue(dt.Rows[0]["User_First_Name"]).Trim().Equals("") || DBNulls.StringValue(dt.Rows[0]["User_Last_Name"]).Trim().Equals("") || DBNulls.StringValue(dt.Rows[0]["Contact_No"]).Trim().Equals("") || DBNulls.StringValue(dt.Rows[0]["Plant_Id"]).Trim().Equals("") || DBNulls.StringValue(dt.Rows[0]["Department_Id"]).Trim().Equals(""))
                {
                    Session[PublicMethods.ConstUserId] = DBNulls.StringValue(dt.Rows[0]["User_Id"]);
                    return false;
                }
                else
                {
                    Session[PublicMethods.ConstUserId] = DBNulls.StringValue(dt.Rows[0]["User_Id"]);
                    return true;
                }
            }
            else
            {
                return false;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    private void fnLoadData(Boolean DoRebind)
    {
        try
        {



            string query = "SELECT  tbl_Email_TO_Master.To_Id, tbl_Email_TO_Master.To_Email_Id, tbl_Type_Master.Type_Name,tbl_Type_Master.Type_Id FROM  tbl_Email_TO_Master INNER JOIN tbl_Type_Master ON tbl_Email_TO_Master.Type_Id = tbl_Type_Master.Type_Id";

            DataTable dt = DBUtils.SQLSelect(new SqlCommand(query));

            rgTo.DataSource = dt;
            if (DoRebind == true)
                rgTo.DataBind();

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    


    protected void rgTo_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        try
        {
            fnLoadData(false);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void rgTo_ItemCreated(object sender, GridItemEventArgs e)
    {

    }
    protected void rgTo_InsertCommand(object sender, GridCommandEventArgs e)
    {
        try
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
            Hashtable newValues = new Hashtable();
            e.Item.OwnerTableView.ExtractValuesFromItem(newValues, editedItem);


            //Load controls
            RadTextBox txtEmail = (RadTextBox)editedItem.FindControl("txtEmail");
            RadDropDownList ddlType = (RadDropDownList)editedItem.FindControl("ddlType");


            //Insert query
            var strsql = "INSERT INTO [tbl_Email_TO_Master]([To_Email_Id],Type_Id) VALUES ('" + txtEmail.Text + "', '" + ddlType.SelectedValue + "');";
            int i = DBUtils.ExecuteSQLCommand(new SqlCommand(strsql));
            if (i > 0)
            {


                rmw1.RadAlert("Email:  " + txtEmail.Text + " Inserted Successfully", 400, 100, "Success", null);
                fnLoadData(true);
            }
            else
            {

                rmw1.RadAlert("Insertion Error", 400, 100, "Success", null);
                return;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void rgTo_ItemCommand(object sender, GridCommandEventArgs e)
    {
        try
        {

            if (e.CommandName == "Delete")
            {
                GridDataItem item = (GridDataItem)e.Item;
                var To_Id = item.GetDataKeyValue("To_Id").ToString();




                var strsql = "DELETE FROM [tbl_Email_TO_Master] WHERE [To_Id]='" + To_Id + "'";
                int i = DBUtils.ExecuteSQLCommand(new SqlCommand(strsql));

                if (i > 0)
                {
                    rmw1.RadAlert("Deleted Successfully", 400, 100, "Success", null);
                    fnLoadData(true);
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
    protected void rgTo_UpdateCommand(object sender, GridCommandEventArgs e)
    {
        try
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
            Hashtable newValues = new Hashtable();
            e.Item.OwnerTableView.ExtractValuesFromItem(newValues, editedItem);

            var To_Id = editedItem.GetDataKeyValue("To_Id").ToString();
            //Load controls
            RadTextBox txtEmail = (RadTextBox)editedItem.FindControl("txtEmail");
            RadDropDownList ddlType = (RadDropDownList)editedItem.FindControl("ddlType");
            //Insert query
            var strsql = "UPDATE tbl_Email_TO_Master set To_Email_Id = '" + txtEmail.Text + "', Type_Id = '" + ddlType.SelectedValue + "' where To_Id = '" + To_Id + "'";
            int i = DBUtils.ExecuteSQLCommand(new SqlCommand(strsql));
            if (i > 0)
            {
                rmw1.RadAlert("Email: " + txtEmail.Text + " Updated Successfully", 400, 100, "Success", null);
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