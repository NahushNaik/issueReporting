using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DBNulls
/// </summary>
public class DBNulls
{
    public DBNulls()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static double NumberValue(object invalue)
    {
        try
        {
            return Convert.ToDouble(invalue);
        }
        catch (Exception)
        {
           return 0;
        }
    }

    public static string StringValue(object invalue)
    {
        try
        {
            return Convert.ToString(invalue);
        }
        catch (Exception)
        {
            return "";
        }
    }
}