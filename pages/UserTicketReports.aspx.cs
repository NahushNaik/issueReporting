using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.HtmlControls;

public partial class pages_Reports : System.Web.UI.Page
{
    string UserId;
    static int tStatus;
    static string  orderBy = string.Empty;
    static string orderType = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {

        //Check Login
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

        string pageStatus = Request.QueryString["status"];
        if (pageStatus == "closed")
        {
            DropDownList1.Enabled = false;
            tStatus = 1;
            DropDownList1.SelectedValue= "Closed";

            orderBy = ddlMenu.SelectedItem.Text;
            orderType = ddlOrder.SelectedValue;
        }
        else if (pageStatus == "open")
        {
            DropDownList1.Enabled = false;
            tStatus = 2;
            DropDownList1.SelectedValue = "Open";
            orderBy = ddlMenu.SelectedItem.Text;
            orderType = ddlOrder.SelectedValue;
        }
        else if (pageStatus == "recent")
        {
            DropDownList1.Enabled = false;
            tStatus = 3;
            DropDownList1.SelectedValue = "All";
            orderBy = ddlMenu.SelectedItem.Text;
            orderType = ddlOrder.SelectedValue;
        }
        else if (pageStatus == null) {
            tStatus = 4;
            orderBy = ddlMenu.SelectedItem.Text;
            orderType = ddlOrder.SelectedValue;
        }




        PublicMethods.LocalizeRadGridFilters(RadGrid1);

        PopulateGrid();

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


    protected void PopulateGrid()
    {
        RadGrid1.DataSource = GetTable();
    }


    static DataTable GetTable()
    {
        string Username = HttpContext.Current.Session[PublicMethods.ConstUserId].ToString();
        // Here we create a DataTable with four columns.
        DataTable table = new DataTable();
        table.Columns.Add("Status", typeof(string));
        table.Columns.Add("Ticket ID", typeof(int));
        table.Columns.Add("Priority", typeof(string));
        table.Columns.Add("Issue Details", typeof(string));
        table.Columns.Add("Type Name", typeof(string));
        table.Columns.Add("Application Name", typeof(string));
        table.Columns.Add("Issue Name", typeof(string));
        table.Columns.Add("Date", typeof(string));

        // Here we add five DataRows.
        //table.Rows.Add(25, "Unable to login to SAP", "SAP", DateTime.Now.ToShortDateString(), "Pending");
        //table.Rows.Add(32, "Application Not working", "Production Confirmation", DateTime.Now.ToShortDateString(), "Pending");
        //table.Rows.Add(43, "Unable to find expected PO", "VConnect", DateTime.Now.ToShortDateString(), "Closed");

        string query;
        if (tStatus == 1)
        {
            query = "select Status,[Ticket No],Priority,[Type Name],[Application Name],[Issue Name],[Issue Details], [Created Time] from fnGetCloseTicketDetail('" + Username + "') order  by '" + orderBy + "' " + orderType + "";
        }
        else if (tStatus == 2)
        {
            query = "select Status,[Ticket No],Priority,[Type Name],[Application Name],[Issue Name],[Issue Details], [Created Time] from fnGetOpenTicketDetail('" + Username + "') order  by '" + orderBy + "' " + orderType + "";
        }
        else if (tStatus == 3)
        {
            query = "select  Status,[Ticket No],Priority,[Type Name],[Application Name],[Issue Name],[Issue Details], [Created Time] from fnGetRecentTicketDetail('" + Username + "') order  by '" + orderBy + "' " + orderType + "";
        }
        else
        {
            query = "select Status,[Ticket No],Priority,[Type Name],[Application Name],[Issue Name],[Issue Details], [Created Time] from fnGetTicketAllDetail() where User_Id='" + Username + "'  order  by '" + orderBy + "' " + orderType + "";
        }

        table = DBUtils.SQLSelect(new SqlCommand(query));

        return table;
    }


    protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        //Is it a GridDataItem
        if (e.Item is GridDataItem)
        {
            //Get the instance of the right type
            GridDataItem dataBoundItem = e.Item as GridDataItem;
            //if(dataBoundItem.GetDataKeyValue("ID").ToString() == "you Compared Text") // you can also use datakey also
            if (dataBoundItem["Status"].Text == "Open")
            {
                dataBoundItem["Status"].ForeColor = Color.Red; // chanmge particuler cell
                e.Item.BackColor = System.Drawing.Color.LightGoldenrodYellow; // for whole row
                                                                              //dataItem.CssClass = "MyMexicoRowClass";
            }
            else if (dataBoundItem["Status"].Text == "Close")
            {
                dataBoundItem["Status"].ForeColor = Color.Green; // chanmge particuler cell
                e.Item.BackColor = System.Drawing.Color.LightGray; // for whole row
                                                                   //dataItem.CssClass = "MyMexicoRowClass";
            }

            //Assign hyperlink
            GridDataItem item = (GridDataItem)e.Item;
            HyperLink link = (HyperLink)item["View"].Controls[0];
            link.CssClass = "hidelink";
            link.NavigateUrl = "UserTicketView.aspx?id="+ dataBoundItem["Ticket No"].Text;


            HyperLink linkUpdate = (HyperLink)item["updateLink"].Controls[0];
            linkUpdate.NavigateUrl = "Form_Edit_TicketDetails.aspx?id="+ dataBoundItem["Ticket No"].Text;
          
            if (dataBoundItem["Status"].Text == "Close")
            {
                linkUpdate.Visible = false;
            }
            else if (dataBoundItem["Status"].Text == "Open")
            {
                linkUpdate.Enabled = true;
            }

          
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string Username = Session[PublicMethods.ConstUserId].ToString();
        //if (!IsPostBack)
        //{
            string res = string.Empty;
            string query = string.Empty;
            if (DropDownList1.SelectedValue == "Open")
            {
                res = "Open";
                query = "select Status,[Ticket No],Priority,[Type Name],[Application Name],[Issue Name],[Issue Details],[Created Time] from fnGetOpenTicketDetail('" + Username + "')";
            }
            else if (DropDownList1.SelectedValue == "Closed")
            {
                res = "Close";
                query="select Status,[Ticket No],Priority,[Type Name],[Application Name],[Issue Name],[Issue Details],[Created Time] from fnGetCloseTicketDetail('" + Username + "')";
            }
            else
            {
                res = "All";
                query = "select Status,[Ticket No],Priority,[Type Name],[Application Name],[Issue Name],[Issue Details],[Created Time] from fnGetTicketAllDetail() where User_Id='" + Username + "'";
            }
            DataTable table = new DataTable();
            table = DBUtils.SQLSelect(new SqlCommand(query));
            RadGrid1.DataSource = table;
            RadGrid1.DataBind();
        //}
    }
    protected void btnFilterApply_Click(object sender, EventArgs e)
    {
        try
        {
            if (DropDownList1.SelectedValue == "Closed")
            {
                tStatus =1 ;
                orderBy = ddlMenu.SelectedItem.Text;
                orderType = ddlOrder.SelectedValue;
            }
            else if (DropDownList1.SelectedValue == "Open")
            {
                tStatus = 2;
                orderBy = ddlMenu.SelectedItem.Text;
                orderType = ddlOrder.SelectedValue;
            }
            else if (DropDownList1.SelectedValue == "All")
            {
                tStatus = 4;
                orderBy = ddlMenu.SelectedItem.Text;
                orderType = ddlOrder.SelectedValue;
            }


            RadGrid1.DataSource = GetTable();
            RadGrid1.DataBind();
        }
        catch (Exception ex) {
            throw ex;
            }
    }
   
}