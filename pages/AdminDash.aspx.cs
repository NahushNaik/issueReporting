using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class pages_AdminDash : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateGrid();
    }

    protected void PopulateGrid()
    {
        RadGrid1.DataSource = GetTable();
    }

    static DataTable GetTable()
    {
        // Here we create a DataTable with four columns.
        DataTable table = new DataTable();
        table.Columns.Add("Ticket ID", typeof(int));
        table.Columns.Add("Ticket Details", typeof(string));
        table.Columns.Add("Module", typeof(string));
        table.Columns.Add("Date", typeof(string));
        table.Columns.Add("Status", typeof(string));

        // Here we add five DataRows.
        table.Rows.Add(25, "Unable to login to SAP", "SAP", DateTime.Now.ToShortDateString(), "Pending");
        table.Rows.Add(32, "Application Not working", "Production Confirmation", DateTime.Now.ToShortDateString(), "Pending");
        table.Rows.Add(43, "Unable to find expected PO", "VConnect", DateTime.Now.ToShortDateString(), "Closed");
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
            if (dataBoundItem["Status"].Text == "Pending")
            {
                dataBoundItem["Status"].ForeColor = Color.Red; // chanmge particuler cell
                e.Item.BackColor = System.Drawing.Color.LightGoldenrodYellow; // for whole row
            }
            else if (dataBoundItem["Status"].Text == "Closed")
            {
                dataBoundItem["Status"].ForeColor = Color.Green; // chanmge particuler cell
                e.Item.BackColor = System.Drawing.Color.LightGray; // for whole row
            }

            //Assign hyperlink
            GridDataItem item = (GridDataItem)e.Item;
            HyperLink link = (HyperLink)item["View"].Controls[0];
            link.CssClass = "hidelink";
            link.NavigateUrl = "TicketView.aspx?id=" + dataBoundItem["Ticket ID"].Text;
        }
    }
}