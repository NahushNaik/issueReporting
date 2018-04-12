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


public partial class pages_Form_DummyDashboardView : System.Web.UI.Page
{
    string result = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        fnGetSummary();
        fnGetAverageTime();
        fnLoadTypewiseGrid();
        fnLoadUserDeptwiseGrid();

        fnTicketRecent();
    }


    private void fnTicketRecent()
    {
        //string hr_8 =    DateTime.Now.AddDays(-1).ToString();
        //string now = DateTime.Now.ToString();
        //string hr_24 = DateTime.Now.AddDays(-3).ToString();
        //string hr_72 = DateTime.Now.AddDays(-360).ToString();

        string todayEnd = System.DateTime.Now.ToShortDateString() + " 23:59:59";
        string todayStart = System.DateTime.Now.ToShortDateString() + " 00:00:01";

        string last3DaysEnd = System.DateTime.Now.AddDays(-1).ToShortDateString() + " 23:59:59";
        string last3DaysStart = System.DateTime.Now.AddDays(-3).ToShortDateString() + " 00:00:01";

        string before3DayEnd = System.DateTime.Now.AddDays(-4).ToShortDateString() + " 23:59:59";
        string before3DayStart = System.DateTime.Now.AddDays(-365).ToShortDateString() + " 00:00:01";

        //string hr_8 = System.DateTime.Now.ToShortDateString() + " 00:00:01";
        //string now = System.DateTime.Now.ToShortDateString() + " 23:59:59";
        //string hr_24 = System.DateTime.Now.AddDays(-3).ToShortDateString() + " 00:00:01";
        //string hr_72 = System.DateTime.Now.AddDays(-360).ToShortDateString() + " 00:00:01";

        queryToFnTicketRecent(todayStart, todayEnd, "open");
        lbl_RecentOpen.Text = result;
        queryToFnTicketRecent(todayStart, todayEnd, "closed");
        lbl_RecentClose.Text = result;

        queryToFnTicketRecent(last3DaysStart, last3DaysEnd, "open");
        lbl_WeekOpen.Text = result;
        queryToFnTicketRecent(last3DaysStart, last3DaysEnd, "closed");
        lbl_WeekClose.Text = result;

        queryToFnTicketRecent(before3DayStart, before3DayEnd, "open");
        lbl_MoreThanWeekOpen.Text = result;
        queryToFnTicketRecent(before3DayStart, before3DayEnd, "closed");
        lbl_MoreThanWeekClose.Text = result;

    }

    private void queryToFnTicketRecent(string fromDate, string toDate, string status)
    {
        string qry = "";
        if (status == "open")
        {


            qry = "select COUNT([Ticket_Id]) from tbl_Ticket_Master where  [Created_Time] BETWEEN '" + fromDate + "' and '" + toDate + "'";
        }
        else if (status == "closed")
        {
            qry = "select COUNT([Ticket_Id]) from tbl_Ticket_Master where Status=1 and  Updated_Time BETWEEN '" + fromDate + "' and '" + toDate + "'";
        }

        result = DBUtils.SqlSelectScalar(new SqlCommand(qry));

    }
    public void fnGetSummary()
    {
        string qry = "";
        string result = "";
        try
        {
            qry = "Select COUNT(*) from tbl_Ticket_Master";
            result = DBUtils.SqlSelectScalar(new SqlCommand(qry));
            lblTotalTickets.Text = result;
            qry = "Select COUNT(*) from tbl_Ticket_Master Where Status=0";
            result = DBUtils.SqlSelectScalar(new SqlCommand(qry));
            lblOpenTickets.Text = result;
            qry = "Select COUNT(*) from tbl_Ticket_Master   Where Status=1";
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
        double total = 0;
        try
        {
            //Averaege
            qry = "Select SUM(DATEDIFF(MINUTE, Created_Time, Updated_Time)) as diffrence from tbl_Ticket_Master  Where   Status=1";
            //DataTable dt = DBUtils.SQLSelect(new SqlCommand(qry));
            //foreach (DataRow dr in dt.Rows)
            //{
            //    total = total + (int)DBNulls.NumberValue(dr["diffrence"]);
            //}

            total = DBNulls.NumberValue(DBUtils.SqlSelectScalar(new SqlCommand(qry)));

            string totalTime = spanDates(Convert.ToInt32(total));
            lblTotalSpentTime.Text = totalTime;

            qry = "Select AVG(DATEDIFF(MINUTE, Created_Time, Updated_Time)) as diffrence from tbl_Ticket_Master  Where   Status=1";

            double average = 0;
            //try
            //{
            //    average = total / (dt.Rows.Count);
            //}
            //catch (Exception)
            //{ }

            average = DBNulls.NumberValue(DBUtils.SqlSelectScalar(new SqlCommand(qry)));

            string days = spanDates(Convert.ToInt32(average));
            lblAverageClosedTime.Text = days;

            //Fast closed time

            qry = "Select MIN(DATEDIFF(MINUTE, Created_Time, Updated_Time)) as diffrence from tbl_Ticket_Master  where Status=1";
            result = DBUtils.SqlSelectScalar(new SqlCommand(qry));

            lblFastestClosedTime.Text = spanDates(Convert.ToInt32(DBNulls.NumberValue(result)));

            //slow closed time

            qry = "Select MAX(DATEDIFF(MINUTE, Created_Time, Updated_Time)) as diffrence from tbl_Ticket_Master where Status=1";
            result = DBUtils.SqlSelectScalar(new SqlCommand(qry));

            lblSlowestClosedTime.Text = spanDates(Convert.ToInt32(DBNulls.NumberValue(result)));
        }
        catch (Exception ex)
        {

            throw ex;
        }

    }
    private void fnLoadTypewiseGrid()
    {
        string query = "Select Type_Id  ,(Select Count(*) AS [Total] From tbl_Ticket_Master Where  Type_Id=T.Type_Id  ) as [Total],(Select Count(*) As [This_Month] From tbl_Ticket_Master Where DATEPART(MM,Created_Time)=MONTH(GETDATE()) And Type_Id=T.Type_Id  ) As [This_Month],(Select Count(*) AS [Open] From tbl_Ticket_Master Where  Type_Id=T.Type_Id And Status=0 ) as [Open] From tbl_Ticket_Master  T  group by Type_Id";
        DataTable dt = DBUtils.SQLSelect(new SqlCommand(query));

        DataTable dtFinal = new DataTable();
        dtFinal.Columns.Add("Type_Id");
        dtFinal.Columns.Add("Type");
        dtFinal.Columns.Add("Total");
        dtFinal.Columns.Add("This_Month");
        dtFinal.Columns.Add("Open");
        foreach (DataRow dr in dt.Rows)
        {
            query = "Select Type_Name From tbl_Type_Master Where Type_Id='" + dr["Type_Id"] + "'";
            string Type_Name = DBUtils.SqlSelectScalar(new SqlCommand(query));
            DataRow drNew = dtFinal.NewRow();
            drNew["Type_Id"] = dr["Type_Id"];
            drNew["Type"] = Type_Name;
            drNew["Total"] = dr["Total"];
            drNew["This_Month"] = dr["This_Month"];
            drNew["Open"] = dr["Open"];
            dtFinal.Rows.Add(drNew);
        }
        rgvTypeWise.DataSource = dtFinal;
        rgvTypeWise.DataBind();

    }



    private void fnLoadUserDeptwiseGrid()
    {
        string query = "Select Department_Name As [Department] ,SUM(Total) as Total,SUM(This_Month) As [This_Month],SUM(Total_Open) as [Open] from( Select Distinct Department_Name, (Select COUNT(*) from tbl_Ticket_Master inner join tbl_User_Master on tbl_Department_Master.Department_Id = tbl_User_Master.Department_Id where tbl_Ticket_Master.Created_By = tbl_User_Master.User_Id and tbl_User_Master.Department_Id = tbl_Department_Master.Department_Id  ) as Total,(Select COUNT(*) from tbl_Ticket_Master inner join tbl_User_Master on tbl_Department_Master.Department_Id = tbl_User_Master.Department_Id where tbl_Ticket_Master.Created_By = tbl_User_Master.User_Id and tbl_User_Master.Department_Id = tbl_Department_Master.Department_Id And DATEPART(MM,Created_Time)=MONTH(GETDATE()) ) as This_Month,(Select COUNT(*) from tbl_Ticket_Master inner join tbl_User_Master on tbl_Department_Master.Department_Id = tbl_User_Master.Department_Id where tbl_Ticket_Master.Created_By = tbl_User_Master.User_Id and tbl_User_Master.Department_Id = tbl_Department_Master.Department_Id   and Status=0) as Total_Open  from tbl_Department_Master inner join tbl_User_Master on tbl_Department_Master.Department_Id = tbl_User_Master.Department_Id inner join tbl_Ticket_Master on tbl_User_Master.User_Id = tbl_Ticket_Master.Created_By  )as a group by Department_Name";


        DataTable dt = DBUtils.SQLSelect(new SqlCommand(query));

        rgvUserDeptwise.DataSource = dt;
        rgvUserDeptwise.DataBind();
    }
    public static string spanDates(int total)
    {
        try
        {
            TimeSpan span = TimeSpan.FromMinutes(total);

            string result = String.Format("{0} days, {1} hours, {2} minutes",
                  span.Days, span.Hours, span.Minutes);
            return result;
        }
        catch (Exception ex)
        {
            throw ex;
        }


    }
}