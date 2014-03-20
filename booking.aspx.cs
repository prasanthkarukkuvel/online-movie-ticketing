using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Rainbow;
using System.Data.SqlClient;
using System.Data;

public partial class booking : System.Web.UI.Page
{
    MySqlConnection sql = new MySqlConnection();
    Movie mov = new Movie();
    DataSet ds = new DataSet();
    Random r = new Random();
    DateTime t = DateTime.Now.AddMinutes(30);
    private string sub = "";
    

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        Response.Cache.SetNoStore();
       
        if ((bool)Session["booking"] == true)
        {
            Response.Redirect("selection.aspx?booking=1");

        }
       
        Session["booking"] = false;
        
    }
    public void getMovieDetails()
    {
        sql.cpn();
        sql.adr = new SqlDataAdapter("select mid,mname from mdetail where screen=1", sql.con);

        sql.adr.Fill(ds);
        sql.cls();
        foreach (DataRow row in ds.Tables[0].Rows)
        {
            sub = row[1] + "";
            if (sub.Length > 16)
            {
                sub = sub.Substring(0, 16);
                sub += "..";
            }
            Response.Write("<div class='mov-select' id='MOV-" + row[0] + "-" + r.Next(2222, 9999) + "'> <img src='Images/movie/" + row[0] + "-left.jpg' width='150' height='170' alt='" + row[1] + "' name='" + row[1] + "' /><p>" + sub + "</p></div>");
        }
    }
    public void getDateDetails()
    {
        for (int x = 1; x <= 8; x++)
        {

            if (x < 7)
            {
                Response.Write("<div class='date-avail' id='" + t.DayOfWeek.ToString().ToUpper() + "/" + t.Day + "-" + t.ToString("MMM") + "-" + t.Year + "' data-name='" + t.DayOfWeek + ", " + t.Day + " " + t.ToString("MMM") + " " + t.Year + "'>" + t.Day + " " + t.ToString("MMM") + " " + t.Year + "<p>" + t.DayOfWeek + "</p></div>");
                
            }
            else
            {
                Response.Write("<div class='date-unavail'>" + t.Day + " " + t.ToString("MMM") + " " + t.Year + "<p>" + t.DayOfWeek + "</p></div>");
            }

            t = t.AddDays(1);
        }
 
    }
}