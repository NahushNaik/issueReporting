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

public partial class pages_Frm_Departmentwise_Drilldown : System.Web.UI.Page
{
    private SqlConnection con = new SqlConnection();
  
    string Dept = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]).Equals(""))
        {
            Response.Redirect("Login.aspx");
        }
        Dept = Request.QueryString["Dept"];
        fnLoadCloseTickets(true);
      
        lblDapartment.Text = "Department :" + Dept;
        fnLoadTickets(true);
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
                query = "SELECT  tbl_Ticket_Master.Ticket_Id, tbl_Department_Master.Department_Name, tbl_Type_Master.Type_Name, tbl_Application_Master.Application_Name, tbl_Ticket_Master.Issue_Details, tbl_Ticket_Master.Priority, tbl_Ticket_Master.Created_Time, CASE WHEN status = 0 THEN 'Open' ELSE 'Closed' END AS Status, SUBSTRING(tbl_User_Master.User_Email ,0, CHARINDEX('@', tbl_User_Master.User_Email ) ) AS userName  , tbl_Ticket_Master.Updated_Time,DATEDIFF(DAY, Created_Time, GETDATE()) as createdDays  FROM  tbl_Ticket_Master INNER JOIN  tbl_Application_Master ON tbl_Ticket_Master.Application_Id = tbl_Application_Master.Application_Id INNER JOIN tbl_Type_Master ON tbl_Ticket_Master.Type_Id = tbl_Type_Master.Type_Id INNER JOIN tbl_User_Master ON tbl_Ticket_Master.Created_By = tbl_User_Master.User_Id INNER JOIN  tbl_Department_Master ON tbl_User_Master.Department_Id = tbl_Department_Master.Department_Id WHERE     (tbl_Department_Master.Department_Name = '" + Dept + "') and status = 0 ORDER BY tbl_Ticket_Master.Created_Time asc";
               
            }
          DataTable dt= DBUtils.SQLSelect(new SqlCommand(query));

            rgvDetails.DataSource = dt;
            //if (DoRebind == true)
            //    rgvDetails.DataBind();
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

    public void fnGetSummary() {
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
        catch (Exception ex) {
            throw ex;
        }
    }
    public void fnGetAverageTime() {
        string qry = "";
        string result="";
        int total=0;
        try
        {
            //Averaege
            qry = "Select DATEDIFF(MINUTE, Created_Time, Updated_Time) as diffrence from tbl_Ticket_Master inner join tbl_User_Master on Created_By=tbl_User_Master.User_Id inner join tbl_Department_Master on tbl_User_Master.Department_Id=tbl_Department_Master.Department_Id Where Department_Name='" + Dept + "' And Status=1";
            DataTable dt = DBUtils.SQLSelect(new SqlCommand(qry));
            foreach (DataRow dr in dt.Rows) {
                total = total + (int)dr["diffrence"];
            }

            string totalTime = spanDates(total);
            lblTotalSpentTime.Text = totalTime;
            int average = total / (dt.Rows.Count);
            string days = spanDates(average);
            lblAverageClosedTime.Text = days;
             
            //new Flow For Average
          

            qry = "Select  AVG(cast(hours as decimal(10,2))) as diffrence from tbl_Ticket_Master inner join tbl_User_Master on Created_By=tbl_User_Master.User_Id inner join tbl_Department_Master on tbl_User_Master.Department_Id=tbl_Department_Master.Department_Id Where Department_Name='" + Dept + "' And Status=1";

            string closeTimeAVG = DBUtils.SqlSelectScalar(new SqlCommand(qry));

            if (closeTimeAVG == "")
            {

                closeTimeAVG = "0.0";
            }

            string avgCloseTime = String.Format("{0:0.00}", Convert.ToDouble(closeTimeAVG));


        
            string Minutes = (avgCloseTime.Split('.')[1]);
            string Hours = (avgCloseTime.Split('.')[0]);
            lblAverageClosedTime.Text = Hours + " Hours" + " :  " + Minutes + " Minutes";


            //suggested by asmita


            int ttlMin = 0;
            string Q1 = "Select  AVG(cast(hours as decimal(10,2))) as time from tbl_Ticket_Master inner join tbl_User_Master on Created_By=tbl_User_Master.User_Id inner join tbl_Department_Master on tbl_User_Master.Department_Id=tbl_Department_Master.Department_Id Where Department_Name='" + Dept + "' And Status=1";
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

            qry = "Select MIN(DATEDIFF(MINUTE, Created_Time, Updated_Time)) as diffrence from tbl_Ticket_Master inner join tbl_User_Master on Created_By=tbl_User_Master.User_Id inner join tbl_Department_Master on tbl_User_Master.Department_Id=tbl_Department_Master.Department_Id Where Department_Name='" + Dept + "' And Status=1";
            result = DBUtils.SqlSelectScalar(new SqlCommand(qry));

            lblFastestClosedTime.Text = spanDates(Convert.ToInt32(result));


            //new Flow for Fast Closed time
                    qry = "Select  MIN(cast(hours as decimal(10,2))) as diffrence from tbl_Ticket_Master inner join tbl_User_Master on Created_By=tbl_User_Master.User_Id inner join tbl_Department_Master on tbl_User_Master.Department_Id=tbl_Department_Master.Department_Id Where Department_Name='" + Dept + "' And Status=1";
            string fastCloseTime = DBUtils.SqlSelectScalar(new SqlCommand(qry));
            if (fastCloseTime == "")
            {

                fastCloseTime = "0.0";
            }
            //Minutes = fastCloseTime.Substring(avgCloseTime.LastIndexOf('.') + 1);
            Minutes = (fastCloseTime.Split('.')[1]);
            Hours = (fastCloseTime.Split('.')[0]);

            lblFastestClosedTime.Text = Hours + " Hours" + " :  " + Minutes + " Minutes";

            //slow closed time

            qry = "Select MAX(DATEDIFF(MINUTE, Created_Time, Updated_Time)) as diffrence from tbl_Ticket_Master inner join tbl_User_Master on Created_By=tbl_User_Master.User_Id inner join tbl_Department_Master on tbl_User_Master.Department_Id=tbl_Department_Master.Department_Id Where Department_Name='" + Dept + "' And Status=1";
            result = DBUtils.SqlSelectScalar(new SqlCommand(qry));

            lblSlowestClosedTime.Text = spanDates(Convert.ToInt32(result));



            //new Flow for  slow  Closed  Time
          
            qry = "Select MAX(cast(hours as decimal(10,2))) as diffrence from tbl_Ticket_Master inner join tbl_User_Master on Created_By=tbl_User_Master.User_Id inner join tbl_Department_Master on tbl_User_Master.Department_Id=tbl_Department_Master.Department_Id Where Department_Name='" + Dept + "' And Status=1";
            string sloweCloseTime = DBUtils.SqlSelectScalar(new SqlCommand(qry));

            if (sloweCloseTime == "")
            {

                sloweCloseTime = "0.0";
            }
          //  Minutes = sloweCloseTime.Substring(avgCloseTime.LastIndexOf('.') + 1);

            Minutes = (sloweCloseTime.Split('.')[1]);
            Hours = (sloweCloseTime.Split('.')[0]);
            lblSlowestClosedTime.Text = Hours + " Hours" + " :  " + Minutes + " Minutes"; ;
        }
        catch (Exception ex) { 
        
        
        }
    
    }

    
    public static string spanDates(int total)
    {

        TimeSpan span = TimeSpan.FromMinutes(total);

      string result=  String.Format("{0} days, {1} hours, {2} minutes",
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
    private void fnLoadCloseTickets(Boolean DoRebind)
    {
        try
        {
            string query = string.Empty;
            if (Dept != null)
            {
                query = "SELECT  tbl_Ticket_Master.Ticket_Id, tbl_Department_Master.Department_Name, tbl_Type_Master.Type_Name, tbl_Application_Master.Application_Name, tbl_Ticket_Master.Issue_Details, tbl_Ticket_Master.Priority, tbl_Ticket_Master.Created_Time, CASE WHEN status = 0 THEN 'Open' ELSE 'Closed' END AS Status, SUBSTRING(tbl_User_Master.User_Email ,0, CHARINDEX('@', tbl_User_Master.User_Email ) ) AS userName  , tbl_Ticket_Master.Updated_Time,DATEDIFF(DAY, Created_Time, Updated_Time) as closedDays ,cast(tbl_Ticket_Master.hours as decimal(10,2)) as hours,tbl_Ticket_Master.isValid  FROM  tbl_Ticket_Master INNER JOIN  tbl_Application_Master ON tbl_Ticket_Master.Application_Id = tbl_Application_Master.Application_Id INNER JOIN tbl_Type_Master ON tbl_Ticket_Master.Type_Id = tbl_Type_Master.Type_Id INNER JOIN tbl_User_Master ON tbl_Ticket_Master.Created_By = tbl_User_Master.User_Id INNER JOIN  tbl_Department_Master ON tbl_User_Master.Department_Id = tbl_Department_Master.Department_Id WHERE     (tbl_Department_Master.Department_Name = '" + Dept + "') and Status=1 order by Updated_Time desc ";

            }
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