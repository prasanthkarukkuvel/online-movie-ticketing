using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Rainbow;
using System.Globalization;

public partial class manage_manage : System.Web.UI.Page
{
    MySqlConnection sql = new MySqlConnection();
    Show shw = new Show();
    User u = new User();
    int movid = 0;
    int feedid = 0;
    int suc = 0;
    string mapshow = "";
    string scrid = "";

    protected bool getResponse(int movid)
    {
        try
        {
            sql.cpn();
            foreach (string a in shw.mapday)
            {
                foreach (string c in shw.screenid)
                {
                    sql.com.CommandText = "select * from " + a + " where " + c + "=" + movid;
                    sql.dr = sql.com.ExecuteReader();
                    if (sql.dr.HasRows)
                    {
                        sql.rcls();
                        return true;
                    }
                    sql.rcls();
                }
            }
            sql.cls();

            return false;
        }
        catch { return true; }
    }
    private void getFeeds()
    {
        sql.cpn();
        sql.com.CommandText = "select * from feedback";
        sql.dr = sql.com.ExecuteReader();
        while (sql.dr.Read())
        {
            Response.Write("<div class='feed-content'><p><span>" + u.getFirstLastName(sql.dr.GetInt32(0)) + "</span><span>" + u.getEmail(sql.dr.GetInt32(0)) + "</span></p><div>" + sql.dr.GetString(1) + "</div><div><span class='feedclass' id='" + sql.dr.GetInt32(3) + "'>delete</span><span>" + sql.dr.GetString(2) + "</span></div></div>");
        }
        sql.rcls();
        sql.cls();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["delmov"] != "" && Request.QueryString["delmov"] != null)
            {
                movid = Convert.ToInt32(Request.Form["delmoviecontrol"]);
                if (getResponse(movid))
                {
                    Response.Write("<div id='errpanel'>cannot delete currently running movies</div>");
                }
                else
                {
                    sql.cpn();
                    sql.com.CommandText = "select mname from mdetail where mid=" + movid;
                    sql.dr = sql.com.ExecuteReader();
                    if (sql.dr.HasRows)
                    {
                        sql.rcls();
                        sql.com.CommandText = "delete from mdetail where mid=" + movid;
                        suc = sql.com.ExecuteNonQuery();
                        if (suc == 1)
                        {
                            File.Delete(Server.MapPath("../Images/movie/" + movid + "-left.jpg"));
                            File.Delete(Server.MapPath("../Images/movie/" + movid + "-banner.jpg"));
                            Response.Write("<div id='uppanel'>movie deleted successfully</div>");
                        }
                        else
                        {
                            Response.Write("<div id='errpanel'>error occured while deleting movie</div>");
                        }
                    }
                    else
                    {
                        sql.rcls();
                        Response.Write("<div id='errpanel'>sorry movie not found</div>");
                    }
                }

            }
            if (Request.QueryString["feedback"] != "" && Request.QueryString["feedback"] != null)
            {
                if (Request.QueryString["feedback"] == "1")
                {
                    getFeeds();
                }
                else
                {
                    feedid = Convert.ToInt32(Request.Form["feedid"]);
                    sql.cpn();
                    sql.com.CommandText = "delete from feedback where fid=" + feedid;
                    suc=sql.com.ExecuteNonQuery();
                    if (suc == 1)
                    {
                        getFeeds();
                    }
                    
                }
               
            }
            else if (Request.QueryString["upshow"] != "" && Request.QueryString["upshow"] != null)
            {
                try
                {
                    movid = Convert.ToInt32(Request.Form["updatemovie"]);
                    mapshow = Request.Form["updateshow"];
                    scrid = Request.Form["updatescreen"];
                    sql.cpn();
                    if (mapshow == "ALL")
                    {
                        foreach (string s in shw.showmd)
                        {
                            sql.com.CommandText = "update " + shw.mapday[Array.IndexOf(shw.dayid, (DateTime.Now.AddDays(6).DayOfWeek).ToString().ToUpper())] + " set " + scrid + "=" + movid + " where showmd='" + s + "'";
                            suc = sql.com.ExecuteNonQuery();
                            if (suc == 1)
                            {
                                sql.com.CommandText = "update mdetail set screen=1 where mid=" + movid;
                                suc = sql.com.ExecuteNonQuery();
                                if (suc == 1)
                                {
                                    Response.Write("<div id='uppanel'>updation successful on : " + CultureInfo.CurrentCulture.TextInfo.ToTitleCase((s).ToLower()) + " shows</div>");
                                }
                                else
                                    Response.Write("<div id='errpanel'>error occured while adding to list</div>");
                            }
                            else
                                Response.Write("<div id='errpanel'>updation failed on : " + CultureInfo.CurrentCulture.TextInfo.ToTitleCase((s).ToLower()) + " shows</div>");
                        }

                    }
                    else
                    {
                        sql.com.CommandText = "update " + shw.mapday[Array.IndexOf(shw.dayid, (DateTime.Now.AddDays(6).DayOfWeek).ToString().ToUpper())] + " set " + scrid + "=" + movid + " where showmd='" + mapshow + "'";
                        suc = sql.com.ExecuteNonQuery();
                        if (suc == 1)
                        {

                            sql.com.CommandText = "update mdetail set screen=1 where mid=" + movid;
                            suc = sql.com.ExecuteNonQuery();
                            if (suc == 1)
                            {
                                Response.Write("<div id='uppanel'>updation successful on : " + CultureInfo.CurrentCulture.TextInfo.ToTitleCase((mapshow).ToLower()) + " shows</div>");
                            }
                            else
                                Response.Write("<div id='errpanel'>error occured while adding to list</div>");
                        }
                        else
                            Response.Write("<div id='errpanel'>updation failed on : " + CultureInfo.CurrentCulture.TextInfo.ToTitleCase((mapshow).ToLower()) + " shows</div>");

                    }
                    sql.cls();
                }
                catch (System.Data.SqlClient.SqlException sqle)
                {
                    Response.Write("<div id='errpanel'>error occured : " + sqle.Message + "</div>");
                }
                catch (Exception ee)
                {
                    Response.Write("<div id='errpanel'>error occured : " + ee.Message + "</div>");
                }
            }
        }
        catch (System.Data.SqlClient.SqlException sqle)
        {
            Response.Write("<div id='errpanel'>error occured : " + sqle.Message + "</div>");
        }
        catch (Exception ee)
        {
            Response.Write("<div id='errpanel'>error occured : " + ee.Message + "</div>");
        }
    }


}