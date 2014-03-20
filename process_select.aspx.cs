using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Collections;
using Rainbow;

public partial class process_select : System.Web.UI.Page
{

    string gmov = "MOV-1000-2346";
    int movid = 0;
    string gday = "MONDAY-12-Jan-2012";
    int nseat = 6;
    string text = "", tmpgday = "";
    int map = 0;
    string[] shwday = new string[5];
    int count = 0;
    DateTime systime;
    DateTime shwtime;
    DataSet ds = new DataSet();
    Show shw = new Show();
    Screen scr = new Screen();
    MySqlConnection sql = new MySqlConnection();
    CryptoSystem cry = new CryptoSystem();
    ArrayList shwlist = new ArrayList();
    ArrayList scrlist = new ArrayList();
    ArrayList rowlist = new ArrayList();
    ArrayList shwdaylist = new ArrayList();
    ArrayList sumrow = new ArrayList();
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        Response.Cache.SetNoStore();
        try
        {
            gmov = Request.Form["select_form_movie"];
            gday = Request.Form["select_form_date"];
            nseat = Convert.ToInt32(Request.Form["select_form_seat"]);
            if (nseat <= 10)
            {
                gmov = gmov.Substring(gmov.IndexOf("-") + 1);
                gmov = gmov.Substring(0, gmov.IndexOf("-"));
                tmpgday = gday;
                gday = gday.Substring(0, gday.IndexOf("/"));
                movid = Convert.ToInt32(gmov);
                map = Array.IndexOf(shw.dayid, gday);

                sql.cpn();
                for (int i = 0; i < 5; i++)
                {
                    sql.com.CommandText = "select showmd from " + shw.mapday[map] + " where " + shw.screenid[i] + "=" + movid;
                    sql.dr = sql.com.ExecuteReader();
                    if (sql.dr.HasRows)
                    {
                        while (sql.dr.Read())
                        {
                            shwday[count] = sql.dr.GetString(0);
                            count++;
                        }
                        count = 0;
                        sql.rcls();
                    }
                    sql.rcls();
                    for (int j = 0; j < shwday.Length; j++)
                    {
                        sql.com.CommandText = "select " + shw.screenid[i] + " from movie_on_days where shownd='" + shwday[j] + "'";
                        sql.dr = sql.com.ExecuteReader();
                        while (sql.dr.Read())
                        {
                            scrlist.Add(shw.screenid[i]);
                            shwdaylist.Add(shwday[j]);
                            shwlist.Add(sql.dr.GetString(0));
                        }
                        sql.rcls();
                    }
                    Array.Clear(shwday, 0, shwday.Length);
                }
                count = 0;
                foreach (string s in shwlist)
                {
                    sql.com.CommandText = "select rowid from select_row where showid='" + s + "' and dayid='" + gday + "'";
                    sql.dr = sql.com.ExecuteReader();
                    while (sql.dr.Read())
                        rowlist.Add(sql.dr.GetString(0));
                    sql.rcls();
                }
                count = 0;
                foreach (string s in rowlist)
                {
                    for (int i = 0; i < shw.row_name.Length; i++)
                    {
                        sql.com.CommandText = "select " + shw.query_sum_of_row + " from " + shw.row_name[i] + " where rowid='" + s + "'";
                        sql.dr = sql.com.ExecuteReader();
                        while (sql.dr.Read())
                            count += sql.dr.GetInt32(0);
                        sql.rcls();
                    }
                    sumrow.Add(count);
                    count = 0;

                }
                sql.cls();
                count = 0;

                foreach (string s in shwlist)
                {
                    systime = DateTime.Now.AddMinutes(30);
                    shwtime = Convert.ToDateTime(shw.getShowTime(s, (string)scrlist[count]));

                    if (systime.DayOfWeek.ToString().ToUpper() == gday)
                    {
                        if ((DateTime.Compare(systime, shwtime) == -1))
                        {
                            if ((189 - ((int)sumrow[count])) >= nseat)
                            {
                                text = movid + "/" + scr.getScreenName((string)scrlist[count]) + "/" + shw.getShowTime(s, (string)scrlist[count]) + "/" + shwdaylist[count] + "/" + shwlist[count] + "/" + rowlist[count] + "/" + tmpgday + "/" + nseat + "/";
                                text = cry.encString(text);

                                text = Server.UrlEncode(text);

                                Response.Write("<div class='show-content'><p class='show-screen'>" + scr.getScreenName((string)scrlist[count]) + "</p><div class='show-content-avail'><div>" + shwdaylist[count].ToString().ToLower() + " show</div><div>" + shw.getShowTime(s, (string)scrlist[count]) + "</div><div>" + nseat + " Seats</div><div>Rs. 120 *" + nseat + " tickets + " + (nseat * 20) + " charges = Rs. " + ((120 * nseat) + (20 * nseat)) + "</div><a href='session_create.aspx?sessionSequenceID=" + text + "'><div>book now</div></a></div></div>");
                            }
                            else
                            {
                                Response.Write("<div class='show-content'><p class='show-screen'>" + scr.getScreenName((string)scrlist[count]) + "</p><div class='show-content-unavail'><div>" + shwdaylist[count].ToString().ToLower() + " show</div><div>Selected no. of Seats not available</div></a></div></div>");
                            }
                        }
                        else
                        {
                            Response.Write("<div class='show-content'><p class='show-screen'>" + scr.getScreenName((string)scrlist[count]) + "</p><div class='show-content-unavail'><div>" + shwdaylist[count].ToString().ToLower() + " show</div><div>Booking Closed</div></a></div></div>");
                        }
                        count++;
                    }
                    else
                    {
                        if ((189 - ((int)sumrow[count])) >= nseat)
                        {
                            text = movid + "/" + scr.getScreenName((string)scrlist[count]) + "/" + shw.getShowTime(s, (string)scrlist[count]) + "/" + shwdaylist[count] + "/" + shwlist[count] + "/" + rowlist[count] + "/" + tmpgday + "/" + nseat + "/";
                            text = cry.encString(text);

                            text = Server.UrlEncode(text);
                            Response.Write("<div class='show-content'><p class='show-screen'>" + scr.getScreenName((string)scrlist[count]) + "</p><div class='show-content-avail'><div>" + shwdaylist[count].ToString().ToLower() + " show</div><div>" + shw.getShowTime(s, (string)scrlist[count]) + "</div><div>" + nseat + " Seats</div><div>Rs. 120 *" + nseat + " tickets + " + (nseat * 20) + " charges = Rs. " + ((120 * nseat) + (20 * nseat)) + "</div><a href='session_create.aspx?sessionSequenceID=" + text + "'><div>book now</div></a></div></div>");
                        }
                        else
                        {
                            Response.Write("<div class='show-content'><p class='show-screen'>" + scr.getScreenName((string)scrlist[count]) + "</p><div class='show-content-unavail'><div>" + shwdaylist[count].ToString().ToLower() + " show</div><div>Selected no. of Seats not available</div></a></div></div>");
                        }
                        count++;
                    }

                }
                count = 0;
            }
            else
            { throw new Exception("Invalid Seat Selection"); }
        }
        catch (Exception se) { Response.Write("<p>An error occured while processing your request. Please try again.Error info : " + se.Message+"</p>"); }
    }



}