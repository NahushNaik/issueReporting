using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;

public static class DBUtils
{
    public static SqlConnection getConnection()
    {
        try
        {
            string conConnectionString = ConfigurationManager.ConnectionStrings["ConnectionWeb"].ConnectionString;
            SqlConnection SQLDatabaseConnection = new SqlConnection(conConnectionString);
            return SQLDatabaseConnection;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    /// Returns the results of a SQL Query in the form of a DataTable
    public static DataTable SQLSelect(SqlCommand cmdSQLQuery)
    {
        try
        {
            SqlConnection con = getConnection();
            cmdSQLQuery.Connection = con;
            DataSet dsPageInfo = new DataSet();
            SqlDataAdapter daPageInfo = new SqlDataAdapter(cmdSQLQuery);
            con.Open();
            daPageInfo.Fill(dsPageInfo);
            con.Close();
            return dsPageInfo.Tables[0];
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    /// Executes a SQL Command
    public static int ExecuteSQLCommand(SqlCommand CommandToExecute)
    {
        try
        {
            //get connection sring
            SqlConnection con = getConnection();
            //execute command
            CommandToExecute.Connection = con;
            con.Open();
            int rowsAffected = CommandToExecute.ExecuteNonQuery();
            con.Close();
            return rowsAffected;
        }
        catch
        {
            return -1;
        }
    }
    /// For Single Result
    public static string SqlSelectScalar(SqlCommand cmdSQLQuery)
    {
        try
        {
            string result = "";
            SqlConnection con = getConnection();
            cmdSQLQuery.Connection = con;
            con.Open();
            if (cmdSQLQuery.ExecuteScalar() != null)
            {
                result = cmdSQLQuery.ExecuteScalar().ToString();
            }
            con.Close();
            return result;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static bool isExists(SqlCommand CommandToExcecute)
    {
        try
        {
            SqlConnection con = getConnection();
            //execute command
            CommandToExcecute.Connection = con;
            con.Open();
            object res = CommandToExcecute.ExecuteScalar();
            con.Close();
            if (res != null)
                return true;
            else
                return false;

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}