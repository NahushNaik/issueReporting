using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_Form_UserFeedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string ticket_id = Request.QueryString["Ticket_Id"];
        string status = Request.QueryString["Status"];
        if (!IsPostBack)
        {
                lblStatus.Text = status + " Feedback";
         lblTktId.Text = ticket_id;
         string query = "SELECT [Ticket No], [Type Name], [Application Name], [Issue Details],Convert(varchar(20),[Created Time],113) as [Created Time] FROM  fnGetTicketDetail('" + ticket_id + "')";
         DataTable table = DBUtils.SQLSelect(new SqlCommand(query));

         foreach (DataRow dr in table.Rows)
         {

             lblTicketType.Text = dr["Type Name"].ToString();
             lblTktApplication.Text = dr["Application Name"].ToString();
             //    lblTktApplication.Text = dr["Issue Details"].ToString();
             lblCreatedDate.Text = dr["Created Time"].ToString();
             lblTicketDetails.Text = dr["Issue Details"].ToString();
            
         }


         fnPopulateFeedBack();

        
        }
        string qry = "SELECT  Ticket_Id, Feedback FROM tbl_User_Feedback where Ticket_Id='" + ticket_id + "'";
        DataTable dt = DBUtils.SQLSelect(new SqlCommand(qry));
        if (dt.Rows.Count > 0)
        {
          
            foreach (DataRow dr in dt.Rows)
            {
                ddlReasons.SelectedItem.Text = dr["Feedback"].ToString();
            }
            ddlReasons.Enabled = false;
            btnSendFeedBack.Enabled = false;
        }
        else {
            ddlReasons.Enabled = true;
            btnSendFeedBack.Enabled = true;
        }

       
    }
    protected void btnSendFeedBack_Click(object sender, EventArgs e)
    {
        try
        {

            string reason = ddlReasons.Text;
           string id= Request.QueryString["Ticket_Id"];
           string query = "INSERT INTO [tbl_User_Feedback] ([Ticket_Id],[Feedback],[Created_Time]) VALUES ('" + id + "','" + reason + "','" + DateTime.Now + "')";
           int i = DBUtils.ExecuteSQLCommand(new SqlCommand(query));
           if (i > 0)
           {
               Response.Redirect("LogOut.aspx?page=feedback");
           }
           else
           {
               ClientScript.RegisterClientScriptBlock(this.GetType(), "Error", "alert('Error!'); ", true);
           }
            
            
        }
        catch (Exception ex) {
            throw ex; 
        }
    }
    protected void fnPopulateFeedBack() {
        try
        {
            string status = Request.QueryString["Status"];
               string query = "SELECT [status],[feedback] FROM [tbl_Feedback_Master] where status='" + status + "' ";

            DataTable dt = DBUtils.SQLSelect(new SqlCommand (query));
         
            
            ddlReasons.DataSource = dt;
            ddlReasons.DataTextField = "feedback";
           // ddlReasons.DataValueField = "status";
            ddlReasons.DataBind();
            //ddlReasons.SelectedIndex = 0;
            
        
        }
        catch (Exception ex) {
            throw ex;
        }
    
    
    }
}