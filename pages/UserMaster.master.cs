

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_UserMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblUserName.Text = DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]).ToUpper().Replace("@SANJEEVGROUP.COM", "");

        //Pavan Ambhure
      
        //To check the master menus
        string pageName = Path.GetFileName(Request.Path);
      
        
        if (pageName == "ViewTicket_Admin.aspx" || 
            pageName == "ManageTicket.aspx" ||
            pageName == "form_AdminDashboard.aspx" ||
            pageName == "Frm_Departmentwise_Drilldown.aspx" ||
            pageName == "form_TicketDuration.aspx" ||
            pageName == "form_TypeWise_DrillDown.aspx" ||
            pageName == "Form_FeedbackMaster_Admin.aspx" ||
            pageName == "Form_MasterMenu.aspx" ||
            pageName == "Form_Type_Master.aspx" ||
            pageName == "Form_Application_Master.aspx" ||
             pageName == "Form_Department_Master.aspx" ||
            pageName == "Form_User_Master.aspx" ||
            pageName == "Form_Issue_Master.aspx" ||
           pageName=="Form_Master_To.aspx" ||
            pageName == "Form_Master_CC.aspx" ||
            pageName == "viewTicketLogs.aspx")
        {
            lbl_ISadmin.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB5E28");
            lbl_ISadmin.Text = "(Admin) ";
            userName.HRef = "form_AdminDashboard.aspx";
            dashboardLink.HRef = "form_AdminDashboard.aspx";
            logoLink.HRef = "form_AdminDashboard.aspx";
            userProfile.Visible = false;
            reports.Visible = false;
            ticketAdd.Visible = false;
            sanjeevLogo.HRef = "form_AdminDashboard.aspx";
            viewStatus.Visible = true;
            feedback_Link.HRef = "Form_FeedbackMaster_Admin.aspx";
            liMaster.Visible = true;
            logMaster.Visible = true;
        }
        else
        {
            lbl_ISadmin.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB5E28");
            lbl_ISadmin.Text = "(User) ";
        }
    }
}
