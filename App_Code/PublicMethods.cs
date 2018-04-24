using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using Telerik.Web.UI;

/// <summary>
/// Summary description for PublicMethods
/// </summary>
public static class PublicMethods
{
    public static string ConstUserEmail = "LoginUserEmail";
    public static string ConstUserId = "LoginUserId";
    public static string ConstTicketOpen = "open";
    public static string ConstTicketClosed = "closed";
    public static string ConstTicketAll = "all";
    public static string ConstTicketRecent = "recent";
    public static string TProf = "0";

    public static string fnGetUsableRTC_milisec(System.DateTime vDate)
    {
        return string.Format("{0:yyyyMMddHHmmssfff}", vDate);
    }
    public static string fnGetUsableRTC_sec(System.DateTime vDate)
    {
        return string.Format("{0:yyyyMMddHHmmss}", vDate);
    }

    public static string fnGetTimeNow()
    {
        string ret = "";
        try
        {
            ret = string.Format("{0:HH:mm}", DateTime.Now);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return ret;
    }

    public static string fnGetTimeWithSecondsNow()
    {
        string ret = "";
        try
        {
            ret = string.Format("{0:HH:mm:ss}", DateTime.Now);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return ret;
    }

    public static string fnGetDateTimeNow()
    {
        string ret = "";
        DateTime dt = DateTime.Now;
        try
        {
            ret = dt.ToString("dd/MMM/yyyy HH:mm:ss tt", CultureInfo.InvariantCulture);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return ret;
    }

    public static bool CheckForInternetConnection()
    {
        try
        {
            using (var client = new WebClient())
            {
                using (client.OpenRead("https://www.google.co.in"))
                {
                    return true;
                }
            }
        }
        catch
        {
            return false;
        }
    }    

    public static void LocalizeRadGridFilters(RadGrid grid)
    {
        if (CultureInfo.CurrentCulture.Name == "es-ES")
        {
            GridFilterMenu menu = grid.FilterMenu;
            foreach (RadMenuItem item in menu.Items)
            {
                if (item.Text == "NoFilter")
                {
                    item.Text = "Sin filtro";
                }
                else if (item.Text == "Contains")
                {
                    item.Text = "Contiene";
                }
                else if (item.Text == "DoesNotContain")
                {
                    item.Text = "No contiene";
                }
                else if (item.Text == "StartsWith")
                {
                    item.Text = "Comienza con";
                }
                else if (item.Text == "EndsWith")
                {
                    item.Text = "Termina con";
                }
                else if (item.Text == "EqualTo")
                {
                    item.Text = "Igual a";
                }
                else if (item.Text == "NotEqualTo")
                {
                    item.Text = "No igual a";
                }
                else if (item.Text == "GreaterThan")
                {
                    item.Text = "Mas grande que";
                }
                else if (item.Text == "LessThan")
                {
                    item.Text = "Menos que";
                }
                else if (item.Text == "GreaterThanOrEqualTo")
                {
                    item.Text = "Mayor qué o igual a";
                }
                else if (item.Text == "LessThanOrEqualTo")
                {
                    item.Text = "Menos que o igual a";
                }
                else if (item.Text == "Between")
                {
                    item.Text = "Entre";
                }
                else if (item.Text == "NotBetween")
                {
                    item.Text = "No entre";
                }
                else if (item.Text == "IsEmpty")
                {
                    item.Text = "Esta vacio";
                }
                else if (item.Text == "NotIsEmpty")
                {
                    item.Text = "No es vacio";
                }
                else if (item.Text == "IsNull")
                {
                    item.Text = "Es nulo";
                }
                else if (item.Text == "NotIsNull")
                {
                    item.Text = "No es nulo";
                }
            }
        }
    }

    //public static bool CheckProfileIsValid(string userEMail)
    //{

    //    try
    //    {

    //        DataTable dt = DBUtils.SQLSelect(new SqlCommand("SELECT [User_Id],[User_Email],[User_First_Name],[User_Last_Name],[Contact_No],[Plant_Id],[Department_Id] FROM tbl_User_Master where User_Email='" + userEMail + "'"));

    //        if (dt.Rows.Count > 0)
    //        {

    //            if (DBNulls.StringValue(dt.Rows[0]["User_Id"]).Trim().Equals("") || DBNulls.StringValue(dt.Rows[0]["User_Email"]).Trim().Equals("") || DBNulls.StringValue(dt.Rows[0]["User_First_Name"]).Trim().Equals("") || DBNulls.StringValue(dt.Rows[0]["User_Last_Name"]).Trim().Equals("") || DBNulls.StringValue(dt.Rows[0]["Contact_No"]).Trim().Equals("") || DBNulls.StringValue(dt.Rows[0]["Plant_Id"]).Trim().Equals("") || DBNulls.StringValue(dt.Rows[0]["Department_Id"]).Trim().Equals(""))
    //            {
    //                Session[PublicMethods.ConstUserId] = DBNulls.StringValue(dt.Rows[0]["User_Id"]);
    //                return false;
    //            }
    //            else
    //            {
    //                Session[PublicMethods.ConstUserId] = DBNulls.StringValue(dt.Rows[0]["User_Id"]);
    //                return true;
    //            }
    //        }
    //        else
    //        {
    //            return false;
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //}

}