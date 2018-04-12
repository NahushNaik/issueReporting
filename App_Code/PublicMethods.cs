using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Web;
using System.Data;
using System.Data.SqlClient;

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