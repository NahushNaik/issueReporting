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

public partial class pages_Form_Issue_Master : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]).Equals(""))
        {
            Response.Redirect("Login.aspx");
        }
        if (!IsPostBack) {
            Session["Type_Id"] = null;
        }

    }
    protected void rgIssueMaster_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
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
            rgIssueMaster.DataSource = dt;
            if (doRebind == true)
            {
                rgIssueMaster.DataBind();
            }

        }
        catch (Exception ex)
        {
            throw ex;

        }
    }
    protected void rgIssueMaster_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        try
        {

            if (e.CommandName == "Delete")
            {
                GridDataItem item = (GridDataItem)e.Item;
                var Issue_Id = item.GetDataKeyValue("Issue_Id").ToString();
                string qry = "select * from [tbl_Ticket_Master] where [Issue_Id]='" + Issue_Id + "' ";
                DataTable dt = DBUtils.SQLSelect(new SqlCommand(qry));

                if (dt.Rows.Count > 0)
                {
                    rmw1.RadAlert("There are some dependent Tickets for This Issue", 400, 100, "Success", null);
                    return;
                }
                else
                {

                    var strsql = "DELETE FROM [tbl_Issue_Master] WHERE [Issue_Id]='" + Issue_Id + "'";
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
    protected void rgIssueMaster_InsertCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        try
        {
           





            GridEditableItem editedItem = e.Item as GridEditableItem;
            Hashtable newValues = new Hashtable();
            e.Item.OwnerTableView.ExtractValuesFromItem(newValues, editedItem);


            //Load controls
            RadTextBox txtIssueName = (RadTextBox)editedItem.FindControl("txtIssueName");
            RadComboBox ddlType = (RadComboBox)editedItem.FindControl("ddlType");
            RadComboBox ddlApplication = (RadComboBox)editedItem.FindControl("ddlApplication");


            string qry = "SELECT [Type_Name]  FROM [tbl_Type_Master] where Type_Id='" + ddlType.SelectedValue + "' ";
            string type = DBUtils.SqlSelectScalar(new SqlCommand(qry));
            if (type == "") {
                rmw1.RadAlert("Please select type properly", 400, 100, "Success", null);
                return;
            }

            qry = "SELECT [Application_Id],[Application_Name]  FROM  [tbl_Application_Master]where Type_Id='" + ddlType.SelectedValue + "' and Application_Id='" + ddlApplication.SelectedValue + " ' ";
            string application = DBUtils.SqlSelectScalar(new SqlCommand(qry));
            if (application == "")
            {
                rmw1.RadAlert("Please select Application properly", 400, 100, "Success", null);
                return;
            }

            //Insert query
            var strsql = "INSERT INTO tbl_Issue_Master(Issue_Name,Type_Id,Application_Id) VALUES ('" + txtIssueName.Text + "', '" + ddlType.SelectedValue + "','" + ddlApplication.SelectedValue + "');";
            int i = DBUtils.ExecuteSQLCommand(new SqlCommand(strsql));
            if (i > 0)
            {


                rmw1.RadAlert("Issue Name:  " + txtIssueName.Text + " Inserted Successfully", 400, 100, "Success", null);
                Session["Type_Id"] = null;
                LoadData(true);
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
    protected void rgIssueMaster_UpdateCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        try
        {

           


            GridEditableItem editedItem = e.Item as GridEditableItem;
            Hashtable newValues = new Hashtable();
            e.Item.OwnerTableView.ExtractValuesFromItem(newValues, editedItem);

            var Issue_Id = editedItem.GetDataKeyValue("Issue_Id").ToString();
            //Load controls

            RadTextBox txtIssueName = (RadTextBox)editedItem.FindControl("txtIssueName");
            RadComboBox ddlType = (RadComboBox)editedItem.FindControl("ddlType");
            RadComboBox ddlApplication = (RadComboBox)editedItem.FindControl("ddlApplication");




            string qry = "SELECT [Type_Name]  FROM [tbl_Type_Master] where Type_Id='" + ddlType.SelectedValue + "' ";
            string type = DBUtils.SqlSelectScalar(new SqlCommand(qry));
            if (type == "")
            {
                rmw1.RadAlert("Please select type properly", 400, 100, "Success", null);
                return;
            }

            qry = "SELECT [Application_Id],[Application_Name]  FROM  [tbl_Application_Master]where Type_Id='" + ddlType.SelectedValue + "' and Application_Id='" + ddlApplication.SelectedValue + " ' ";
            string application = DBUtils.SqlSelectScalar(new SqlCommand(qry));
            if (application == "")
            {
                rmw1.RadAlert("Please select Application properly", 400, 100, "Success", null);
                return;
            }



            //Update query
            var strsql = "UPDATE tbl_Issue_Master set Issue_Name = '" + txtIssueName.Text + "', Type_Id = '" + ddlType.SelectedValue + "',Application_Id='" + ddlApplication.SelectedValue + "' where Issue_Id = '" + Issue_Id + "'";
            int i = DBUtils.ExecuteSQLCommand(new SqlCommand(strsql));
            if (i > 0)
            {
                rmw1.RadAlert("Issue Name: " + txtIssueName.Text + " Updated Successfully", 400, 100, "Success", null);
                Session["Type_Id"] = null;
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
    protected void ddlType_SelectedIndexChanged(object sender, DropDownListEventArgs e)
    {
        try
        {
             RadComboBox ddlType = (RadComboBox)sender;
             Session["Type_Id"] = ddlType.SelectedValue;
             string qry = "SELECT [Application_Id],[Application_Name],[Type_Id] FROM [tbl_Application_Master] where Type_Id= '" + Session["Type_Id"].ToString() + "' "; ;
        


        }
        catch (Exception ex) {
            throw ex;
        }
    }
  
    
    protected void ddlType_SelectedIndexChanged1(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
    {
        RadComboBox ddlType = (RadComboBox)sender;


       // Session["Type_Id"] = ddlType.SelectedValue;


        var rcbInsurance = (RadComboBox)sender;

        string asd = DBNulls.StringValue(e.Value.ToString());

        var item = (GridEditableItem)rcbInsurance.NamingContainer;
        var rdSubDocument_Category = (RadComboBox)item.FindControl("ddlApplication");
        if (rdSubDocument_Category != null)
        {

          string  query = "SELECT * FROM [tbl_Application_Master] where [Type_Id]= '" + asd + "' ";
          DataTable dtrdSubDocument_Category = DBUtils.SQLSelect(new SqlCommand(query));
       

            rdSubDocument_Category.SelectedValue = "";
            rdSubDocument_Category.Text = "";
            rdSubDocument_Category.Items.Clear();

            rdSubDocument_Category.SelectedValue = "";
            rdSubDocument_Category.Text = "";
            rdSubDocument_Category.DataTextField = "Application_Name";
            rdSubDocument_Category.DataValueField = "Application_Id";
            rdSubDocument_Category.DataSource = dtrdSubDocument_Category;
            rdSubDocument_Category.DataBind();


           

        }
















    }
    //protected void ddlApplication_ItemsRequested(object sender, RadComboBoxItemsRequestedEventArgs e)
    //{
    //    var s = Session["Type_Id"];

    //    if (s == null)
    //    {
    //        rmw1.RadAlert("Select Type ", 400, 100, "Success", null);
    //        return;
    //    }

    //    else
    //    {
    //        RadComboBox ddlAppType = (RadComboBox)sender;
    //        ddlAppType.Text = "";

    //        string qry = "SELECT * from tbl_Application_Master where [Type_Id]='" + Session["Type_Id"].ToString() + "'  ";


    //        DataTable dt = DBUtils.SQLSelect(new SqlCommand(qry));

    //        ddlAppType.Items.Clear();

    //        foreach (DataRow row in dt.Rows)
    //        {
    //            RadComboBoxItem item = new RadComboBoxItem();
    //            item.Text = row["Application_Name"].ToString();
    //            item.Value = row["Application_Id"].ToString();
    //            //item.Attributes.Add("User_Code", row.Display_Name.ToString());

    //            ddlAppType.Items.Add(item);
    //            ddlAppType.SelectedIndex = 0;
    //            item.DataBind();
    //            //ddlAppType.DataBind();

    //        }
    //    }

    //}
    protected void rgIssueMaster_ItemDataBound(object sender, GridItemEventArgs e)
    {



      
        if (e.Item is GridEditableItem && e.Item.IsInEditMode)
        {
            GridEditableItem item = (GridEditableItem)e.Item;
            RadComboBox ddlType = (RadComboBox)e.Item.FindControl("ddlType");
            RadComboBox ddlApplication = (RadComboBox)e.Item.FindControl("ddlApplication");
            string query = "select * from tbl_Type_Master";
            DataTable dt = DBUtils.SQLSelect(new SqlCommand(query));
            ddlType.DataTextField = "Type_Name";
            ddlType.DataValueField = "Type_Id";
            ddlType.DataSource = dt;
            ddlType.DataBind();



             query = "select * from [tbl_Application_Master]";
             dt = DBUtils.SQLSelect(new SqlCommand(query));
             ddlApplication.DataTextField = "Application_Name";
             ddlApplication.DataValueField = "Application_Id";
             ddlApplication.DataSource = dt;
             ddlApplication.DataBind();




           
            
            


            //drpDownType.Items.Insert(0, new ListItem("--Select Type--", "--Select--"));
        }

        ///for populating  second dropdown from first and showing there selected value
        if (e.Item != null && e.Item.IsInEditMode && e.Item.ItemIndex != -1)
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
            var Issue_Id = editedItem.GetDataKeyValue("Issue_Id").ToString();
            GridEditableItem item = (GridEditableItem)e.Item;
            RadComboBox ddlType = (RadComboBox)e.Item.FindControl("ddlType");

            RadComboBox ddlApplication = (RadComboBox)e.Item.FindControl("ddlApplication");
            //string query = "select * from tbl_Type_Master";
            //DataTable dt = DBUtils.SQLSelect(new SqlCommand(query));
            //ddlType.DataTextField = "Type_Name";
            //ddlType.DataValueField = "Type_Id";
            //ddlType.DataSource = dt;
           // ddlType.DataBind();

            string qry = "SELECT tbl_Issue_Master.Issue_Id, tbl_Issue_Master.Issue_Name, tbl_Issue_Master.Type_Id, tbl_Issue_Master.Application_Id, tbl_Type_Master.Type_Name,tbl_Application_Master.Application_Name FROM tbl_Issue_Master INNER JOIN        tbl_Type_Master ON tbl_Issue_Master.Type_Id = tbl_Type_Master.Type_Id INNER JOIN tbl_Application_Master ON tbl_Issue_Master.Application_Id = tbl_Application_Master.Application_Id where tbl_Issue_Master.[Issue_Id]='" + Issue_Id + "'";
            DataTable issueDetailsDt = DBUtils.SQLSelect(new SqlCommand(qry));

            foreach (DataRow dr in issueDetailsDt.Rows) {
                ddlType.SelectedValue = dr["Type_Id"].ToString();
                ddlType.SelectedItem.Text = dr["Type_Name"].ToString();


                string query = "select * from [tbl_Application_Master] where Type_Id='" + ddlType.SelectedValue + "'";
                 DataTable  dt = DBUtils.SQLSelect(new SqlCommand(query));
                ddlApplication.DataTextField = "Application_Name";
                ddlApplication.DataValueField = "Application_Id";
                ddlApplication.DataSource = dt;
                ddlApplication.DataBind();


                ddlApplication.SelectedValue = dr["Application_Id"].ToString();
                ddlApplication.SelectedItem.Text = dr["Application_Name"].ToString();
            }



        }
    }
}

    
