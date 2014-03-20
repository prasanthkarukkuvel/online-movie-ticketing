using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Rainbow;

public partial class manage_page_admin : System.Web.UI.Page
{
    MySqlConnection sql = new MySqlConnection();
    Show shw = new Show();
    Screen scr = new Screen();
    Movie mov = new Movie();
    HttpCookie getcookie = new HttpCookie("now");
    TimeSpan time;
    protected void Page_Load(object sender, EventArgs e)
    {

        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        Response.Cache.SetNoStore();

        getcookie = Request.Cookies["updaterow"];
        if ((bool)Session["booking"] == true)
        {
            Response.Redirect("../selection.aspx?booking=1");
        }

        else if ((bool)Session["emp"] == true)
        {
            Response.Redirect("page_emp.aspx");
        }
        else if ((bool)Session["admin"] == false)
        {
            Response.Redirect("Default.aspx");
        }

        else if (getcookie != null && getcookie.Value != null)
        {
            if (getcookie.Name == "updaterow")
            {
                time = DateTime.Now - Convert.ToDateTime(getcookie.Value);
                if (time.Days < 1)
                {
                    if (time.Hours < 12)
                        Panel1.Visible = false;
                    else
                        Panel1.Visible = true;
                }
                else
                    Panel1.Visible = true;
            }
            else
                Panel1.Visible = true;
        }
        else
            Panel1.Visible = true;
    }
    public void show_summary()
    {
        sql.cpn();
        foreach (string s in shw.dayid)
        {
            Response.Write("<div class='show-details'><div class='show-content'><div class='show-day'>" + s.ToLower() + "</div><div class='show-content-view'>");
            foreach (string r in shw.screenid)
            {
                Response.Write("<div class='v-z'><div class='screen-detail'>" + scr.getScreenName(r) + "</div>");
                sql.com.CommandText = "select showmd," + r + " from " + shw.mapday[Array.IndexOf(shw.dayid, s)];
                sql.dr = sql.com.ExecuteReader();
                while (sql.dr.Read())
                {
                    Response.Write("<div class='day-details'><div class='m-n'><div>" + (sql.dr.GetString(0)).ToLower() + "</div><span>" + mov.getMovieName(sql.dr.GetInt32(1)) + "</span></div></div>");
                }
                Response.Write("</div>");
                sql.rcls();
            }
            Response.Write("</div></div></div>");
        }
        sql.cls();
    }
    public void getSelectOptions()
    {
        sql.cpn();
        sql.com.CommandText = "select mid,mname from mdetail";
        sql.dr = sql.com.ExecuteReader();
        Response.Write("<option value='-1'>-select movie-</option>");
        while (sql.dr.Read())
        {
            Response.Write("<option value='" + sql.dr.GetInt32(0) + "'>" + sql.dr.GetString(1) + "</option>");
        }
        sql.rcls();
        sql.cls();
    }
    public void getSelectMovies()
    {
        sql.cpn();
        sql.com.CommandText = "select scrid,scrname from screen_info";
        sql.dr = sql.com.ExecuteReader();
        Response.Write("<option value='-1'>-select screen-</option>");
        while (sql.dr.Read())
        {
            Response.Write("<option value='" + sql.dr.GetString(0) + "'>" + sql.dr.GetString(1) + "</option>");
        }
        sql.rcls();
        sql.cls();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string s = Convert.ToString(DateTime.Now);
            ArrayList row = new ArrayList();
            string dy = (DateTime.Now.AddDays(6).DayOfWeek).ToString().ToUpper();
            sql.cpn();
            foreach (string r in shw.showid)
            {
                sql.com.CommandText = "select rowid from select_row where showid='" + r + "' and dayid='" + dy + "'";
                sql.dr = sql.com.ExecuteReader();
                while (sql.dr.Read())
                {
                    row.Add(sql.dr.GetString(0));
                }
                sql.rcls();
                foreach (string a in row)
                {
                    foreach (string b in shw.row_name)
                    {
                        sql.com.CommandText = "update " + b + " set " + shw.query_update_row + " where rowid='" + a + "'";
                        sql.com.ExecuteNonQuery();
                    }
                }
            }
            sql.cls();
            HttpCookie cookie = new HttpCookie("updaterow", s);
            cookie.Expires = DateTime.Now.AddHours(24);
            cookie.HttpOnly = true;
            Response.Cookies.Add(cookie);
            Panel1.Visible = false;
        }
        catch (System.Data.SqlClient.SqlException sg)
        {

        }
        catch
        {
        }
        finally { sql.cls(); }
    }
}