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

public partial class pages_Form_DummyDepartmentWise_View : System.Web.UI.Page
{
    private SqlConnection con = new SqlConnection();

    string Dept = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
     

        Dept = Request.QueryString["Dept"];
        lblDapartment.Text = "Department :" + Dept;
        fnLoadTickets(true);
        fnLoadCloseTickets(true);
        fnGetSummary();
        fnGetAverageTime();

    }
    private void fnLoadTickets(Boolean DoRebind)
    {
        try
        {
            string query = string.Empty;
            if (Dept != null)
            {
                query = "SELECT  tbl_Ticket_Master.Ticket_Id, tbl_Department_Master.Department_Name, tbl_Type_Master.Type_Name, tbl_Application_Master.Application_Name, tbl_Ticket_Master.Issue_Details, tbl_Ticket_Master.Priority, tbl_Ticket_Master.Created_Time, CASE WHEN status = 0 THEN 'Open' ELSE 'Closed' END AS Status, SUBSTRING(tbl_User_Master.User_Email ,0, CHARINDEX('@', tbl_User_Master.User_Email ) ) AS userName  , tbl_Ticket_Master.Updated_Time,DATEDIFF(DAY, Created_Time, GETDATE()) as createdDays FROM  tbl_Ticket_Master INNER JOIN  tbl_Application_Master ON tbl_Ticket_Master.Application_Id = tbl_Application_Master.Application_Id INNER JOIN tbl_Type_Master ON tbl_Ticket_Master.Type_Id = tbl_Type_Master.Type_Id INNER JOIN tbl_User_Master ON tbl_Ticket_Master.Created_By = tbl_User_Master.User_Id INNER JOIN  tbl_Department_Master ON tbl_User_Master.Department_Id = tbl_Department_Master.Department_Id WHERE     (tbl_Department_Master.Department_Name = '" + Dept + "') and Status=0";

            }
            DataTable dt = DBUtils.SQLSelect(new SqlCommand(query));

            rgvDetails.DataSource = dt;
            if (DoRebind == true)
                rgvDetails.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void fnLoadCloseTickets(Boolean DoRebind)
    {
        try
        {
            string query = string.Empty;
            if (Dept != null)
            {
                query = "SELECT  tbl_Ticket_Master.Ticket_Id, tbl_Department_Master.Department_Name, tbl_Type_Master.Type_Name, tbl_Application_Master.Application_Name, tbl_Ticket_Master.Issue_Details, tbl_Ticket_Master.Priority, tbl_Ticket_Master.Created_Time, CASE WHEN status = 0 THEN 'Open' ELSE 'Closed' END AS Status, SUBSTRING(tbl_User_Master.User_Email ,0, CHARINDEX('@', tbl_User_Master.User_Email ) ) AS userName  , tbl_Ticket_Master.Updated_Time,DATEDIFF(DAY, Created_Time, Updated_Time) as closedDays  FROM  tbl_Ticket_Master INNER JOIN  tbl_Application_Master ON tbl_Ticket_Master.Application_Id = tbl_Application_Master.Application_Id INNER JOIN tbl_Type_Master ON tbl_Ticket_Master.Type_Id = tbl_Type_Master.Type_Id INNER JOIN tbl_User_Master ON tbl_Ticket_Master.Created_By = tbl_User_Master.User_Id INNER JOIN  tbl_Department_Master ON tbl_User_Master.Department_Id = tbl_Department_Master.Department_Id WHERE     (tbl_Department_Master.Department_Name = '" + Dept + "') and Status=1 order by Updated_Time desc ";

            }
            DataTable dt = DBUtils.SQLSelect(new SqlCommand(query));

            rgClosedTicket.DataSource = dt;
            if (DoRebind == true)
                rgClosedTicket.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void rgvDetails_ColumnCreated(object sender, Telerik.Web.UI.GridColumnCreatedEventArgs e)
    {

    }

    protected void rgvDetails_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        fnLoadTickets(false);
    }



    //public DataTable GetDataTable(string field)
    //{

    //    try
    //    {

    //        DataTable myDataTable = new DataTable();
    //        string query = string.Empty;

    //        query = string.Format("SELECT DISTINCT {0} from tbl_Ticket_Master inner join tbl_Application_Master on tbl_Ticket_Master.Application_Id=tbl_Application_Master.Application_Id inner join tbl_Type_Master on tbl_Ticket_Master.Type_Id=tbl_Type_Master.Type_Id inner join tbl_User_Master on Created_By=tbl_User_Master.User_Id inner join tbl_Department_Master on tbl_User_Master.Department_Id=tbl_Department_Master.Department_Id Where Department_Name='" + Dept + "' And Status=0", field);

    //        myDataTable = DBUtils.SQLSelect(new SqlCommand(query));

    //        return myDataTable;

    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }

    //}

    public void fnGetSummary()
    {
        string qry = "";
        string result = "";
        try
        {
            qry = "Select COUNT(*) from tbl_Ticket_Master inner join tbl_Application_Master on tbl_Ticket_Master.Application_Id=tbl_Application_Master.Application_Id inner join tbl_Type_Master on tbl_Ticket_Master.Type_Id=tbl_Type_Master.Type_Id inner join tbl_User_Master on Created_By=tbl_User_Master.User_Id inner join tbl_Department_Master on tbl_User_Master.Department_Id=tbl_Department_Master.Department_Id  Where Department_Name='" + Dept + "'";
            result = DBUtils.SqlSelectScalar(new SqlCommand(qry));
            lblTotalTickets.Text = result;
            qry = "Select COUNT(*) from tbl_Ticket_Master inner join tbl_Application_Master on tbl_Ticket_Master.Application_Id=tbl_Application_Master.Application_Id inner join tbl_Type_Master on tbl_Ticket_Master.Type_Id=tbl_Type_Master.Type_Id inner join tbl_User_Master on Created_By=tbl_User_Master.User_Id inner join tbl_Department_Master on tbl_User_Master.Department_Id=tbl_Department_Master.Department_Id  Where Department_Name='" + Dept + "'  and Status=0";
            result = DBUtils.SqlSelectScalar(new SqlCommand(qry));
            lblOpenTickets.Text = result;
            qry = "Select COUNT(*) from tbl_Ticket_Master inner join tbl_Application_Master on tbl_Ticket_Master.Application_Id=tbl_Application_Master.Application_Id inner join tbl_Type_Master on tbl_Ticket_Master.Type_Id=tbl_Type_Master.Type_Id inner join tbl_User_Master on Created_By=tbl_User_Master.User_Id inner join tbl_Department_Master on tbl_User_Master.Department_Id=tbl_Department_Master.Department_Id  Where Department_Name='" + Dept + "'  and Status=1";
            result = DBUtils.SqlSelectScalar(new SqlCommand(qry));
            lblCloseTickets.Text = result;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void fnGetAverageTime()
    {
        string qry = "";
        string result = "";
        int total = 0;
        try
        {
            //Averaege
            qry = "Select DATEDIFF(MINUTE, Created_Time, Updated_Time) as diffrence from tbl_Ticket_Master inner join tbl_User_Master on Created_By=tbl_User_Master.User_Id inner join tbl_Department_Master on tbl_User_Master.Department_Id=tbl_Department_Master.Department_Id Where Department_Name='" + Dept + "' And Status=1";
            DataTable dt = DBUtils.SQLSelect(new SqlCommand(qry));
            foreach (DataRow dr in dt.Rows)
            {
                total = total + (int)dr["diffrence"];
            }

            string totalTime = spanDates(total);
            lblTotalSpentTime.Text = totalTime;
            int average = total / (dt.Rows.Count);
            string days = spanDates(average);
            lblAverageClosedTime.Text = days;

            //Fast closed time

            qry = "Select MIN(DATEDIFF(MINUTE, Created_Time, Updated_Time)) as diffrence from tbl_Ticket_Master inner join tbl_User_Master on Created_By=tbl_User_Master.User_Id inner join tbl_Department_Master on tbl_User_Master.Department_Id=tbl_Department_Master.Department_Id Where Department_Name='" + Dept + "' And Status=1";
            result = DBUtils.SqlSelectScalar(new SqlCommand(qry));

            lblFastestClosedTime.Text = spanDates(Convert.ToInt32(result));

            //slow closed time

            qry = "Select MAX(DATEDIFF(MINUTE, Created_Time, Updated_Time)) as diffrence from tbl_Ticket_Master inner join tbl_User_Master on Created_By=tbl_User_Master.User_Id inner join tbl_Department_Master on tbl_User_Master.Department_Id=tbl_Department_Master.Department_Id Where Department_Name='" + Dept + "' And Status=1";
            result = DBUtils.SqlSelectScalar(new SqlCommand(qry));

            lblSlowestClosedTime.Text = spanDates(Convert.ToInt32(result));
        }
        catch (Exception ex)
        {


        }

    }


    public static string spanDates(int total)
    {

        TimeSpan span = TimeSpan.FromMinutes(total);

        string result = String.Format("{0} days, {1} hours, {2} minutes",
              span.Days, span.Hours, span.Minutes);
        return result;
    }
    protected void rgvDetails_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            //Get the instance of the right type
            GridDataItem dataBoundItem = e.Item as GridDataItem;
            //if(dataBoundItem.GetDataKeyValue("ID").ToString() == "you Compared Text") // you can also use datakey also
            if (dataBoundItem["Status"].Text == "Open")
            {
                dataBoundItem["Status"].ForeColor = Color.Red; // chanmge particuler cell
                //e.Item.BackColor = System.Drawing.Color.LightGoldenrodYellow; // for whole row
                //dataItem.CssClass = "MyMexicoRowClass";
            }

        }
    }
    protected void rgClosedTicket_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        fnLoadCloseTickets(false);
    }
    protected void rgClosedTicket_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            //Get the instance of the right type
            GridDataItem dataBoundItem = e.Item as GridDataItem;

            if (dataBoundItem["Status"].Text == "Closed")
            {
                dataBoundItem["Status"].ForeColor = Color.Green; // chanmge particuler cell
                //e.Item.BackColor = System.Drawing.Color.LightGoldenrodYellow; // for whole row

            }


        }

    }
}