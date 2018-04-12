using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class pages_formDummyTicket_DurationView : System.Web.UI.Page
{
    string fromTime = "";
    string toTime = "";
    string tStatus;

    protected void Page_Load(object sender, EventArgs e)
    {

        //if (DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]).Equals(""))
        //{
        //    Response.Redirect("Login.aspx");
        //}


        string type = Request.QueryString["type"];
        string status = Request.QueryString["status"];
        if (type != null)
        {
            ddlStatus.Enabled = false;
            dtpFromDate.Enabled = false;
            dtpToDate.Enabled = false;
            if (status == "open")
            {

                tStatus = "Open";
                fnCallDates(type);
            }
            else if (status == "close")
            {
                tStatus = "Closed";
                fnCallDates(type);

            }

            else
            {
                tStatus = "All";
                dtpFromDate.SelectedDate = DateTime.Now.AddDays(-180);
                dtpToDate.SelectedDate = DateTime.Now;
            }
        }

        fromTime = dtpFromDate.SelectedDate.ToString();
        toTime = dtpToDate.SelectedDate.ToString();
        rgTickets.DataSource = GetTable(tStatus, fromTime, toTime);
        rgTickets.DataBind();


    }


    private void fnCallDates(string type)
    {

        if (type == "recent")
        {
            dtpFromDate.SelectedDate = DateTime.Now.AddDays(-1);
            dtpToDate.SelectedDate = DateTime.Now;
        }
        else if (type == "withinWeek")
        {


            dtpFromDate.SelectedDate = DateTime.Now.AddDays(-3);
            dtpToDate.SelectedDate = DateTime.Now.AddDays(-1);
        }
        else if (type == "MoreThanWeekOpen")
        {

            dtpFromDate.SelectedDate = DateTime.Now.AddDays(-360);
            dtpToDate.SelectedDate = DateTime.Now.AddDays(-3);
        }
    }
    static DataTable GetTable(string status, string fromTime, string toTime)
    {
      //  string Username = HttpContext.Current.Session[PublicMethods.ConstUserId].ToString();
        // Here we create a DataTable with four columns.
        DataTable table = new DataTable();

        table.Columns.Add("Ticket ID", typeof(int));
        table.Columns.Add("Priority", typeof(string));
        table.Columns.Add("Status", typeof(string));


        table.Columns.Add("Application Name", typeof(string));
        table.Columns.Add("Issue Name", typeof(string));
        table.Columns.Add("Date", typeof(string));


        string query = "";

        if (status == "All")
        {
            query = "select Status,[Ticket No],Priority,[Type Name],[Application Name],[Issue Name],[Issue Details],[Created Time],User_Email,Updated_Time from fnGetTicketAllDetail() where [Created Time] BETWEEN '" + fromTime + "' and '" + toTime + "' ";
        }
        else if (status == "Open")
        {
            query = "select Status,[Ticket No]  ,Priority,[Type Name],[Application Name],[Issue Name],[Issue Details],[Created Time],User_Email,Updated_Time from fnGetTicketAllDetail() where [Created Time] BETWEEN '" + fromTime + "' and '" + toTime + "' ";
        }
        else if (status == "Closed")
        {
            query = "select Status,[Ticket No] ,Priority,[Type Name],[Application Name],[Issue Name],[Issue Details],[Created Time],User_Email,Updated_Time from fnGetTicketAllDetail()  where [Updated_Time] BETWEEN '" + fromTime + "' and '" + toTime + "' and Status='Close' ";
        }

        table = DBUtils.SQLSelect(new SqlCommand(query));

        return table;
    }
    protected void rgTickets_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
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


        }
    }
    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        string Username = Session[PublicMethods.ConstUserId].ToString();

        string res = string.Empty;
        string query = string.Empty;
        if (ddlStatus.SelectedValue == "Open")
        {
            res = "Open";
            query = "select Status,[Ticket No],Priority,[Type Name],[Application Name],[Issue Name],[Issue Details],[Created Time],User_Email from fnGetOpenTicketDetail('" + Username + "')";
        }
        else if (ddlStatus.SelectedValue == "Closed")
        {
            res = "Close";
            query = "select Status,[Ticket No],Priority,[Type Name],[Application Name],[Issue Name],[Issue Details],[Created Time],User_Email from fnGetCloseTicketDetail('" + Username + "')";
        }
        else
        {
            res = "All";
            query = "select Status,[Ticket No],Priority,[Type Name],[Application Name],[Issue Name],[Issue Details],[Created Time],User_Email from fnGetTicketAllDetail() where User_Id='" + Username + "'";
        }
        DataTable table = new DataTable();
        table = DBUtils.SQLSelect(new SqlCommand(query));
        rgTickets.DataSource = table;

    }


    protected void btnApply_Click(object sender, EventArgs e)
    {

    }
}