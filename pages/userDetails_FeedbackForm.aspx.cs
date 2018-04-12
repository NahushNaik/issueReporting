using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class pages_userDetails_FeedbackForm : System.Web.UI.Page
{
    string ticket_id = "";
    string status = "";
    DataTable dtUsers;
    Dictionary<string, string> dicUser = new Dictionary<string, string>();
    protected void Page_Load(object sender, EventArgs e)
    {
        
       
        ticket_id = Request.QueryString["Ticket_Id"];
         status = Request.QueryString["Status"];
         if (status == "Good")
         {
             statusImg.ImageUrl = "../Images/h.PNG";
         }
         else if (status == "Moderate")
         {
             statusImg.ImageUrl = "../Images/m.PNG";
         }
         else if (status == "Bad")
         {
             statusImg.ImageUrl = "../Images/s.PNG";
         
         
         }

      
         fnCommentedUser();
         if (!IsPostBack)
         {

             fnLoadData(true);
             fillData();
           //  lblStatus.Text = status + " Feedback";
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
             lblFeedback.Visible = true;
         }
         else
         {
             ddlReasons.Enabled = true;
             btnSendFeedBack.Enabled = true;
         }
    }
    protected void rgTicketLogs_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
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
    private void fnLoadData(Boolean DoRebind)
    {
        try
        {




            string query = "SELECT     tbl_Ticket_Master_shadow.Ticket_Id, tbl_Ticket_Master_shadow.Type_Id, tbl_Ticket_Master_shadow.Application_Id, tbl_Ticket_Master_shadow.Issue_Id, tbl_Ticket_Master_shadow.Created_Time,tbl_Ticket_Master_shadow.Updated_Time, tbl_Ticket_Master_shadow.Status, tbl_Ticket_Master_shadow.hours, tbl_Ticket_Master_shadow.isValid,CASE WHEN tbl_Ticket_Master_shadow.AuditAction = 'I' THEN 'Created' WHEN tbl_Ticket_Master_shadow.AuditAction = 'U' THEN 'Updated' END AS AuditAction, tbl_Ticket_Master_shadow.Issue_Details, tbl_Ticket_Master_shadow.AuditDate, tbl_Type_Master.Type_Name, tbl_Application_Master.Application_Name, tbl_Issue_Master.Issue_Name,tbl_User_Master_1.User_Email FROM tbl_User_Master AS tbl_User_Master_1 INNER JOIN tbl_Ticket_Master_shadow INNER JOIN tbl_Type_Master ON tbl_Ticket_Master_shadow.Type_Id = tbl_Type_Master.Type_Id INNER JOIN tbl_Application_Master ON tbl_Ticket_Master_shadow.Application_Id = tbl_Application_Master.Application_Id INNER JOIN tbl_Issue_Master ON tbl_Ticket_Master_shadow.Issue_Id = tbl_Issue_Master.Issue_Id ON tbl_User_Master_1.User_Id = tbl_Ticket_Master_shadow.Created_By where  tbl_Ticket_Master_shadow.Ticket_Id='" + ticket_id + "' order by tbl_Ticket_Master_shadow.Ticket_Id desc";

            DataTable dt = DBUtils.SQLSelect(new SqlCommand(query));
            if (dt.Rows.Count > 0)
            {
                rgTicketLogs.DataSource = dt;
                if (DoRebind == true)
                    rgTicketLogs.DataBind();
            }
            else
            {
                return;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void fillData()
    {
    
        DataTable dt = new DataTable();



        string query = "Select Comment,Ticket_ID,Created_Datetime,  User_First_Name + ' ' + User_Last_Name AS UserName,case when tbl_User_Master.isAdmin= 'Y' then 'Admin' else 'User' end as isAdmin  from tbl_Ticket_Comments ,tbl_User_Master where tbl_User_Master.User_Email=tbl_Ticket_Comments.Commented_By and Ticket_ID ='" + ticket_id + "'  Order by Comment_ID Desc ";
        dt = DBUtils.SQLSelect(new SqlCommand(query));

        PagedDataSource pds = new PagedDataSource();
        DataView dv = new DataView(dt);
        pds.DataSource = dv;
        pds.AllowPaging = true;
        pds.PageSize = 4;
        pds.CurrentPageIndex = PageNumber;
        if (pds.PageCount > 1)
        {
            rptPaging.Visible = true;
            ArrayList arraylist = new ArrayList();
            for (int i = 0; i < pds.PageCount; i++)
                arraylist.Add((i + 1).ToString());
            rptPaging.DataSource = arraylist;
            rptPaging.DataBind();
        }
        else
        {
            rptPaging.Visible = false;
        }
        Repeater1.DataSource = pds;
        Repeater1.DataBind();
    }
    public int PageNumber
    {
        get
        {
            if (ViewState["PageNumber"] != null)
                return Convert.ToInt32(ViewState["PageNumber"]);
            else
                return 0;
        }
        set
        {
            ViewState["PageNumber"] = value;
        }
    }
    protected void rptPaging_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
        fillData();
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

     protected void btnSendFeedBack_Click(object sender, EventArgs e)
     {
         try
         {

             string reason = ddlReasons.Text;
             string id = Request.QueryString["Ticket_Id"];
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
         catch (Exception ex)
         {
             throw ex;
         }
     }
     protected void Repeater1_ItemCreated(object sender, RepeaterItemEventArgs e)
     {
        
         //Label lbl1 = (Label)Repeater1.FindControl("Label5");
         

         //if (e.Item.ItemType == ListItemType.AlternatingItem )
         //{
         //    //HtmlTableCell td = (HtmlTableCell)e.Item.FindControl("TD1");
         //    HtmlTableRow tr = (HtmlTableRow)e.Item.FindControl("Tr1");
         //    HtmlTableRow tr2 = (HtmlTableRow)e.Item.FindControl("Tr2");
         //    tr.Attributes.Add("style", "background-color:skyblue;");
         //    tr2.Attributes.Add("style", "background-color:skyblue;");
           
         //}
     }

     protected void fnCommentedUser() {
         string[] color = { "#50b0f3"," #f1f350","#f350c4","#f36d50", " #81f350", " #80564d ", "#b1b845", " #45b8a5 ", " #b845b6 ", " #b6ccbe " };
         //string qry = "Select distinct  (User_First_Name + ' ' + User_Last_Name) AS UserName from tbl_Ticket_Comments ,tbl_User_Master where tbl_User_Master.User_Email=tbl_Ticket_Comments.Commented_By and Ticket_ID ='" + ticket_id + "'";


         string qry = "Select distinct  (case when tbl_User_Master.isAdmin= 'Y' then 'Admin' else 'User' end )as isAdmin  from tbl_Ticket_Comments ,tbl_User_Master where tbl_User_Master.User_Email=tbl_Ticket_Comments.Commented_By and Ticket_ID ='" + ticket_id + "'";
         dtUsers = DBUtils.SQLSelect(new SqlCommand(qry));
         if (dtUsers.Rows.Count > 0)
         {
         foreach (DataRow dr in dtUsers.Rows) {

             dicUser.Add(dr["isAdmin"].ToString(), color[dtUsers.Rows.IndexOf(dr)]);
         }
      
        
             
          
         }
     }

     protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
     {


         //if ( e.Item.ItemType == ListItemType.Item)
         //{
             Label lbl = e.Item.FindControl("UserName") as Label;
             string user = lbl.Text;
             if (dicUser.ContainsKey(user))
             {

              
                 HtmlTableRow tr = (HtmlTableRow)e.Item.FindControl("Tr1");
                 HtmlTableRow tr2 = (HtmlTableRow)e.Item.FindControl("Tr2");
                 tr.Attributes.Add("style", "background-color:" + dicUser[user] + ";");
                 tr2.Attributes.Add("style", "background-color:" + dicUser[user] + ";");
             }
        // }
        

       
        
     }
}