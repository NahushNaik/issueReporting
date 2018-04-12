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

public partial class pages_form_TypeWise_DrillDown : System.Web.UI.Page
{
    string id = string.Empty;
    string AppType = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["id"];

        fnLoadCloseTickets(true);
        fnLoadOpenTickets(true);
        fnGetSummary();
        fnGetAverageTime();
        lblType.Text = "Type :" +fnGetType();
    }
    private void fnLoadOpenTickets(Boolean DoRebind)
    {
        try
        {

            string query = "Select Ticket_Id, Type_Name,Application_Name ,Issue_Details,Priority,Created_Time,Updated_Time,case when status=0 then 'Open' Else 'Closed' End As [Status], SUBSTRING(tbl_User_Master.User_Email ,0, CHARINDEX('@', tbl_User_Master.User_Email ) ) AS userName,DATEDIFF(DAY, Created_Time, GETDATE()) as createdDays from tbl_Ticket_Master inner join tbl_Application_Master on tbl_Ticket_Master.Application_Id=tbl_Application_Master.Application_Id inner join tbl_Type_Master on tbl_Ticket_Master.Type_Id=tbl_Type_Master.Type_Id INNER JOIN tbl_User_Master ON tbl_Ticket_Master.Created_By = tbl_User_Master.User_Id  Where tbl_Ticket_Master.Type_Id='" + id + "' and status=0 ORDER BY Created_Time asc";
                   
               
            
            DataTable dt = DBUtils.SQLSelect(new SqlCommand(query));

            rgvDetails.DataSource = dt;
            
            //if (DoRebind == true)
            //    rgvDetails.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void rgvDetails_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        fnLoadOpenTickets(false);
    }

    public void fnGetSummary()
    {
        string qry = "";
        string result = "";
        try
        {
            qry = "Select COUNT(*) from tbl_Ticket_Master Where Type_Id='"+id+"'";
            result = DBUtils.SqlSelectScalar(new SqlCommand(qry));
            lblTotalTickets.Text = result;
            qry = "Select COUNT(*) from tbl_Ticket_Master Where Type_Id='" + id + "' and Status=0";
            result = DBUtils.SqlSelectScalar(new SqlCommand(qry));
            lblOpenTickets.Text = result;
            qry = "Select COUNT(*) from tbl_Ticket_Master Where Type_Id='" + id + "' and Status=1";
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
            qry = "Select DATEDIFF(MINUTE, Created_Time, Updated_Time) as diffrence from tbl_Ticket_Master Where Type_Id="+id+" And Status=1";
            DataTable dt = DBUtils.SQLSelect(new SqlCommand(qry));
            foreach (DataRow dr in dt.Rows)
            {
                total = total + (int)dr["diffrence"];
            }

            string totalTime = spanDates(total);
            lblTotalSpentTime.Text = totalTime;
            int average = total / (dt.Rows.Count);
            string days = spanDates(average);
          //  lblAverageClosedTime.Text = days;


            //New Flow For Average
            qry = "SELECT AVG(cast(hours as decimal(10,2)))   FROM [tbl_Ticket_Master] Where Type_Id=" + id + " And Status=1";
            string closeTimeAVG = DBUtils.SqlSelectScalar(new SqlCommand(qry));
            if (closeTimeAVG == "")
            {

                closeTimeAVG = "0.0";
            }
            string avgCloseTime = String.Format("{0:0.00}", Convert.ToDouble(closeTimeAVG));

           
            //string Minutes = avgCloseTime.Substring(avgCloseTime.LastIndexOf('.') + 1);
            string Minutes = (avgCloseTime.Split('.')[1]);
            string Hours = (avgCloseTime.Split('.')[0]);
       //     lblAverageClosedTime.Text = Hours + " Hours" + " :  " + Minutes + " Minutes";







            int ttlMin = 0;
            string Q1 = "SELECT cast(hours as decimal(10,2)) as time   FROM [tbl_Ticket_Master]   Where Type_Id=" + id + " And Status=1";
            DataTable dt1 = DBUtils.SQLSelect(new SqlCommand(Q1));
            if (dt1.Rows.Count > 0)
            {
                foreach (DataRow dr in dt1.Rows)
                {
                    string avgTim = String.Format("{0:0.00}", Convert.ToDouble(dr["time"]));
                    string Minutes1 = (avgTim.Split('.')[1]);
                    string Hours1 = (avgTim.Split('.')[0]);

                    int min = 60 * Convert.ToInt32(Hours1);

                    int totMin = min + Convert.ToInt32(Minutes1);
                    ttlMin = ttlMin + totMin;
                }


                double result11 = ttlMin / dt1.Rows.Count;
                string ttlAvgCloseTime = spanMin(result11);
                lblAverageClosedTime.Text = ttlAvgCloseTime;
            }







            //Fast closed time

            qry = "Select MIN(DATEDIFF(MINUTE, Created_Time, Updated_Time)) as diffrence from tbl_Ticket_Master where Type_Id="+id+" And Status=1";
            result = DBUtils.SqlSelectScalar(new SqlCommand(qry));

            lblFastestClosedTime.Text = spanDates(Convert.ToInt32(result));


            //new Flow for fast closed time
            qry = "Select MIN(cast(hours as decimal(10,2))) as diffrence from tbl_Ticket_Master   where TYPE_ID=" + id + " And Status=1";
            string fastCloseTime = DBUtils.SqlSelectScalar(new SqlCommand(qry));
            if (fastCloseTime == "")
            {

                fastCloseTime = "0.0";
            }
           // Minutes = fastCloseTime.Substring(avgCloseTime.LastIndexOf('.') + 1);

            Minutes = (fastCloseTime.Split('.')[1]);
            Hours = (fastCloseTime.Split('.')[0]);

            lblFastestClosedTime.Text = Hours + " Hours" + " :  " + Minutes + " Minutes";


            //slow closed time

            qry = "Select MAX(DATEDIFF(MINUTE, Created_Time, Updated_Time)) as diffrence from tbl_Ticket_Master where TYPE_ID="+id+" And Status=1";
            result = DBUtils.SqlSelectScalar(new SqlCommand(qry));

            lblSlowestClosedTime.Text = spanDates(Convert.ToInt32(result));


            //new Flow For Slow Closed Time

            qry = "Select MAX(cast(hours as decimal(10,2))) as diffrence from tbl_Ticket_Master  where TYPE_ID=" + id + " And Status=1";
            string sloweCloseTime = DBUtils.SqlSelectScalar(new SqlCommand(qry));
            if (sloweCloseTime == "")
            {

                sloweCloseTime = "0.0";
            }
            //Minutes = sloweCloseTime.Substring(avgCloseTime.LastIndexOf('.') + 1);

            Minutes = (sloweCloseTime.Split('.')[1]);
            Hours = (sloweCloseTime.Split('.')[0]);
            lblSlowestClosedTime.Text = Hours + " Hours" + " :  " + Minutes + " Minutes"; 
        }
        catch (Exception ex)
        {


        }

    }
    public  string  fnGetType() {
        string qry = "select [Type_Name] from [tbl_Type_Master] where [Type_Id]=" + id + "";
        string result = DBUtils.SqlSelectScalar(new SqlCommand(qry));
        return result;
    }

    public static string spanDates(int total)
    {

        TimeSpan span = TimeSpan.FromMinutes(total);

        string result = String.Format("{0} days, {1} hours, {2} minutes",
              span.Days, span.Hours, span.Minutes);
        return result;
    }
    protected void rgvDetails_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        //Is it a GridDataItem
        if (e.Item is GridDataItem)
        {
           
            GridDataItem dataBoundItem = e.Item as GridDataItem;
           
            if (dataBoundItem["Status"].Text == "Open")
            {
                dataBoundItem["Status"].ForeColor = Color.Red; // chanmge particuler cell
                //e.Item.BackColor = System.Drawing.Color.LightGoldenrodYellow; // for whole row
               
            }
           

        }
    }
    private void fnLoadCloseTickets(Boolean DoRebind)
    {
        try
        {

            string query = "Select Ticket_Id, Type_Name,Application_Name ,Issue_Details,Priority,Created_Time,Updated_Time,case when status=0 then 'Open' Else 'Closed' End As [Status], SUBSTRING(tbl_User_Master.User_Email ,0, CHARINDEX('@', tbl_User_Master.User_Email ) ) AS userName,DATEDIFF(DAY, Created_Time, Updated_Time) as closedDays,cast(tbl_Ticket_Master.hours as decimal(10,2)) as hours,tbl_Ticket_Master.isValid from tbl_Ticket_Master inner join tbl_Application_Master on tbl_Ticket_Master.Application_Id=tbl_Application_Master.Application_Id inner join tbl_Type_Master on tbl_Ticket_Master.Type_Id=tbl_Type_Master.Type_Id INNER JOIN tbl_User_Master ON tbl_Ticket_Master.Created_By = tbl_User_Master.User_Id  Where tbl_Ticket_Master.Type_Id='" + id + "' and status=1 order by Updated_Time desc";



            DataTable dt = DBUtils.SQLSelect(new SqlCommand(query));

            rgClosedTicket.DataSource = dt;

            //if (DoRebind == true)
            //    rgClosedTicket.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void rgClosedTicket_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        fnLoadCloseTickets(false);
    }
    protected void rgClosedTicket_ItemDataBound(object sender, GridItemEventArgs e)
    {
        //Is it a GridDataItem
        if (e.Item is GridDataItem)
        {
            //Get the instance of the right type
            GridDataItem dataBoundItem = e.Item as GridDataItem;
           
            if (dataBoundItem["Status"].Text == "Closed")
            {
                dataBoundItem["Status"].ForeColor = Color.Green; // chanmge particuler cell
              //  e.Item.BackColor = System.Drawing.Color.LightGoldenrodYellow; // for whole row
                //dataItem.CssClass = "MyMexicoRowClass";
            }
           

        }
    }
    public static string spanMin(double total)
    {
        try
        {
            TimeSpan span = TimeSpan.FromMinutes(total);

            string result = String.Format("{0} Hours : {1} Minutes", span.Hours, span.Minutes);
            return result;
        }
        catch (Exception ex)
        {
            throw ex;
        }


    }
}