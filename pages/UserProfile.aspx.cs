using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Globalization;
using System.Web.UI.WebControls;

public partial class pages_User : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //Check Login
        if (DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]).Equals(""))
        {
            Response.Redirect("Login.aspx");
        }

        //Load user details first time
        if (!IsPostBack)
        {
            LoadUserProfile();
        }

        PopulateTicketDetails();

    }

    protected void PopulateTicketDetails()
    {
        try
        {
            lblTicketOpen.Text = DBNulls.NumberValue(DBUtils.SqlSelectScalar(new SqlCommand("SELECT COUNT(*) AS CNT FROM TBL_TICKET_MASTER WHERE Created_By = '" + DBNulls.StringValue(Session[PublicMethods.ConstUserId]) + "' AND STATUS = 0"))).ToString();
            lblTicketOpen.PostBackUrl = "UserTicketReports.aspx?status=" + PublicMethods.ConstTicketOpen;

            lblTicketsClosed.Text = DBNulls.NumberValue(DBUtils.SqlSelectScalar(new SqlCommand("SELECT COUNT(*) AS CNT FROM TBL_TICKET_MASTER WHERE Created_By = '" + DBNulls.StringValue(Session[PublicMethods.ConstUserId]) + "' AND STATUS = 1"))).ToString();
            lblTicketsClosed.PostBackUrl = "UserTicketReports.aspx?status=" + PublicMethods.ConstTicketClosed;

            lblTicketsAll.Text = DBNulls.NumberValue(DBUtils.SqlSelectScalar(new SqlCommand("SELECT COUNT(*) AS CNT FROM TBL_TICKET_MASTER WHERE Created_By = '" + DBNulls.StringValue(Session[PublicMethods.ConstUserId]) + "'"))).ToString();
            lblTicketsAll.PostBackUrl = "UserTicketReports.aspx?status=" + PublicMethods.ConstTicketAll;
        }
        catch (Exception ex)
        { }
    }


    protected void LoadUserProfile()
    {
        //Load profile details
        DataTable dt = DBUtils.SQLSelect(new SqlCommand("SELECT [User_Id],[User_Email],[User_First_Name],[User_Last_Name],[Contact_No],[Plant_Id],[Department_Id] FROM tbl_User_Master where User_Email='" + DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]) + "'"));

        if (dt.Rows.Count < 1)
        {

            txtEmail.Text = DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]);
            lblUserName.Text = DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]).ToUpper().Replace("@SANJEEVGROUP.COM", "");

            //Load combos for new profile
            LoadCombos();
        }
        else
        {
            //Update controls
            txtEmail.Text = DBNulls.StringValue(dt.Rows[0]["User_Email"]);
            txtFirstName.Text = DBNulls.StringValue(dt.Rows[0]["User_First_Name"]);
            txtLastName.Text = DBNulls.StringValue(dt.Rows[0]["User_Last_Name"]);
            txtContactDetails.Text = DBNulls.StringValue(dt.Rows[0]["Contact_No"]);

            if (!DBNulls.StringValue(dt.Rows[0]["User_First_Name"]).Equals(""))
            {
                lblUserName.Text = DBNulls.StringValue(dt.Rows[0]["User_First_Name"]);
            }
            else
            {
                lblUserName.Text = DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]).ToUpper().Replace("SANJEEVGROUP.COM", "");
            }

            //Load combos for update profile
            LoadCombos();

            //set combo selected values
            DataTable dtCombos = DBUtils.SQLSelect(new SqlCommand("SELECT Plant_Id, Department_Id FROM tbl_User_Master WHERE User_Email = '" + DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]) + "'"));

            if (dtCombos.Rows.Count > 0)
            {
                DropDownListPlant.Items.FindByValue(DBNulls.StringValue(dtCombos.Rows[0]["Plant_Id"])).Selected = true;
                DropDownListDepartment.Items.FindByValue(DBNulls.StringValue(dtCombos.Rows[0]["Department_Id"])).Selected = true;
            }

        }
    }

    protected void LoadCombos()
    {
        //Load Combos
        DataTable dtPlants = DBUtils.SQLSelect(new SqlCommand("SELECT [Plant_Id],[Plant_Name] FROM [tbl_Plant_Master]"));
        DropDownListPlant.DataValueField = "Plant_Id";
        DropDownListPlant.DataTextField = "Plant_Name";
        DropDownListPlant.DataSource = dtPlants;
        DropDownListPlant.DataBind();

        DataTable dtDepartments = DBUtils.SQLSelect(new SqlCommand("SELECT [Department_Id],[Department_Name] FROM [tbl_Department_Master]"));
        DropDownListDepartment.DataValueField = "Department_Id";
        DropDownListDepartment.DataTextField = "Department_Name";
        DropDownListDepartment.DataSource = dtDepartments;
        DropDownListDepartment.DataBind();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        double plantCode = DBNulls.NumberValue(DropDownListPlant.SelectedItem.Value);
        double departmentCode = DBNulls.NumberValue(DropDownListDepartment.SelectedItem.Value);

        double exists = DBNulls.NumberValue(DBUtils.SqlSelectScalar(new SqlCommand("select count(*) from tbl_User_Master WHERE User_Email = '" + DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]) + "'")));

        if (exists > 0)
        {
            string qryToUpdateLog = "UPDATE [tbl_User_Master] SET [User_First_Name] = '" + DBNulls.StringValue(txtFirstName.Text.Replace("'", "''").ToString()).ToUpper() + "' ,[User_Last_Name] = '" + DBNulls.StringValue(txtLastName.Text).ToUpper() + "' ,[Contact_No] = '" + DBNulls.StringValue(txtContactDetails.Text).ToUpper() + "' ,[Plant_Id] = " + DBNulls.StringValue(plantCode) + " ,[Department_Id] = " + DBNulls.StringValue(departmentCode) + " WHERE[User_Id] = '" + DBNulls.StringValue(Session[PublicMethods.ConstUserId]) + "'";
            int executeStatus = DBUtils.ExecuteSQLCommand(new SqlCommand(qryToUpdateLog));
            PublicMethods.TProf = "1";
          
        //    Response.Redirect("LogOut.aspx");
            var page = HttpContext.Current.CurrentHandler as Page;
            if (CultureInfo.CurrentCulture.Name == "es-ES")
            {
                ScriptManager.RegisterStartupScript(page, page.GetType(), "Éxito", "alert('Detalles guardados, por favor inicie sesión nuevamente');window.location ='LogOut.aspx';", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(page, page.GetType(), "Success", "alert('Details Saved, Please Login Again');window.location ='LogOut.aspx';", true);
            }
           // rwm1.RadAlert("Details Saved,Please Login Again", 200, 100, "Sucess", null);
        }
        else
        {
            string qryToInsertLog = "INSERT INTO [tbl_User_Master] ([User_Email],[User_First_Name],[User_Last_Name],[Contact_No],[Plant_Id],[Department_Id]) VALUES ('" + DBNulls.StringValue(Session[PublicMethods.ConstUserEmail]).ToUpper() + "','" + DBNulls.StringValue(txtFirstName.Text).ToUpper() + "','" + DBNulls.StringValue(txtLastName.Text).ToUpper() + "','" + DBNulls.StringValue(txtContactDetails.Text).ToUpper() + "','" + plantCode + "','" + departmentCode + "')";
            int executeStatus = DBUtils.ExecuteSQLCommand(new SqlCommand(qryToInsertLog));
            var page = HttpContext.Current.CurrentHandler as Page;
            if (CultureInfo.CurrentCulture.Name == "es-ES")
            {
                ScriptManager.RegisterStartupScript(page, page.GetType(), "Éxito", "alert('Detalles guardados, por favor inicie sesión nuevamente');window.location ='LogOut.aspx';", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(page, page.GetType(), "Success", "alert('Details Saved,Please Login Again');window.location ='Login.aspx';", true);
            }
           // Response.Redirect("Login.aspx");
          //  rwm1.RadAlert("Details Saved,Please Login Again", 200, 100, "Sucess", null);
        }
    }
}