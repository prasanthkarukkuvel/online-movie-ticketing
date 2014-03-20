using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Rainbow;
using System.Globalization;

public partial class process : System.Web.UI.Page
{
    object[] u;
    static string[] seat_selected;
    static string edatetime = "";
    string s = "", rowid = "", tname = "", seatid = "", tmp = "", gcode = "", res = "", mres = "", date = "", cname = "";
    int resp = 0, booked = 0, nseats = 0;

    MySqlConnection sql = new MySqlConnection();
    Movie mov = new Movie();
    GPassword g = new GPassword();
    MService mail = new MService();
    User cu = new User();
    SMSClient sms = new SMSClient();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        Response.Cache.SetNoStore();
        Panel1.Visible = true;
        Panel2.Visible = false;
        if (!IsPostBack)
        {
            if ((bool)Session["booking"] == true)
            {
                if (Session["user"] != null)
                {
                    init_user();
                    nseats = Convert.ToInt32(u[8]);
                    seat_selected = new string[nseats];
                    for (int i = 0; i < nseats; i++)
                    {
                        string r = "nval" + i;
                        if (Request.Form[r] != "0")
                        {
                            seat_selected[i] = Request.Form[r];
                        }
                        else
                        {
                            Session["userid"] = null;
                            Session["booking"] = false;
                            Response.Redirect("booking.aspx");
                        }
                    }
                    nscreen.InnerText = (string)u[1];
                    nmovie.InnerText = mov.getMovieName(Convert.ToInt32(u[0]));
                    ndate.InnerText = CultureInfo.CurrentCulture.TextInfo.ToTitleCase((u[6] + "").ToLower()) + ", " + (u[7].ToString()).Replace("-", " ");

                    ntime.InnerText = u[2] + ", " + CultureInfo.CurrentCulture.TextInfo.ToTitleCase((u[3] + "").ToLower()) + " Show";
                    edatetime = u[7].ToString().Substring(0, (u[7].ToString().LastIndexOf("-"))) + "," + u[2].ToString().Replace(" ", "");
                    foreach (string a in seat_selected)
                    {
                        if (a != null)
                            tmp += (a.Substring(a.IndexOf("_") + 1, 1)).ToUpper() + a.Substring(a.LastIndexOf("-") + 2) + ", ";
                        else
                        {
                            Session["userid"] = null;
                            Session["booking"] = false;
                            Response.Redirect("booking.aspx");
                        }
                    }
                    nseat.InnerText = tmp;
                    nticket.InnerText = u[8] + " tickets";
                    nprice.InnerText = "Rs. " + Convert.ToInt32(u[8]) * 140 + "/-";

                }
                else { Response.Redirect("booking.aspx"); }
            }
            else { Response.Redirect("booking.aspx"); }
        }
    }
    protected void book_tickets()
    {


    }
    public void init_user()
    {
        u = getUserInfo();
    }
    public object[] getUserInfo()
    {
        return Session["user"] as object[];
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            Button1.Visible = false;

            sql.cpn();
            for (int i = 0; i < seat_selected.Length; i++)
            {
                s = seat_selected[i];

                rowid = s.Substring(0, s.IndexOf("-"));
                s = s.Substring(s.IndexOf("-") + 1);
                tname = s.Substring(0, s.IndexOf("-"));
                seatid = s.Substring(s.IndexOf("-") + 1);

                sql.com.CommandText = "select " + seatid + " from " + tname + " where " + seatid + "=1 and rowid='" + rowid + "'";
                sql.dr = sql.com.ExecuteReader();
                if (sql.dr.HasRows)
                {

                    booked = 1;
                    break;
                }
                sql.dr.Close();
            }
            sql.cls();
            if (booked == 0)
            {
                sql.cpn();
                for (int i = 0; i < seat_selected.Length; i++)
                {
                    s = seat_selected[i];
                    rowid = s.Substring(0, s.IndexOf("-"));
                    s = s.Substring(s.IndexOf("-") + 1);
                    tname = s.Substring(0, s.IndexOf("-"));
                    seatid = s.Substring(s.IndexOf("-") + 1);
                    sql.dr.Close();
                    sql.com.CommandText = "update " + tname + " set " + seatid + "=1 where " + seatid + "=0 and rowid='" + rowid + "'";
                    resp = sql.com.ExecuteNonQuery();
                    if (resp == 1)
                    {
                        booked = 0;
                    }
                    else
                    {
                        booked = 1;
                    }
                }
                if (booked == 0)
                {
                    u = getUserInfo();
                    gcode = g.rs(10).ToUpper() + Session["userid"];
                    sql.cpn();
                    sql.com.CommandText = "select fname,lname,umail,umob from udetails where uid=" + Session["userid"];
                    sql.dr = sql.com.ExecuteReader();
                    if (sql.dr.HasRows)
                    {
                        while (sql.dr.Read())
                        {
                            cu.fname = sql.dr.GetString(0);
                            cu.lname = sql.dr.GetString(1);
                            cu.umail = sql.dr.GetString(2);
                            cu.umobile = sql.dr.GetString(3);
                        }
                        sql.rcls();

                    }
                    sql.cls();
                    sql.cpn();
                    cname = cu.fname + " " + cu.lname;
                    sql.com.CommandText = "insert into booking values('" + gcode + "','" + nscreen.InnerText + "','" + nmovie.InnerText + "','" + ndate.InnerText + "','" + ntime.InnerText + "','" + nseat.InnerText + "','" + nticket.InnerText + "','" + nprice.InnerText + "','" + cname + "')";
                    resp = sql.com.ExecuteNonQuery();

                    if (resp == 1)
                    {
                        date = DateTime.Now.Date.ToString("MMMM") + ", " + DateTime.Now.Date.ToString("dd") + " " + DateTime.Now.Date.ToString("yyyy");
                        mres = "BookingID:" + gcode + ",Movie:" + nmovie.InnerText + ",Show:" + edatetime + ",Seats:" + ((nseat.InnerText).Replace(" ", "")) + "Thank you";
                        res = @"<table bgcolor='#ff9900' border='0' cellpadding='7' cellspacing='2' width='600' style='font-family: Verdana; font-size: 18px;'><tr bgcolor='#333' style='color: #fff; font-size: 20px' height='30px'><td colspan='2'> Rainbow Entertainments Inc. </td></tr><tr style='border: #fff thin solid'><td colspan='2' bgcolor='#fff' style='font-size: 20px;'><span>Hello! <span style='color: #026a96'>" + cu.fname + " " + cu.lname + "</span></span><p style='font-size: 15px; text-indent: 10px;'> Below are your order details for the tickets you booked at www.rainbowcinemas.in on " + date + "</p></td></tr><tr bgcolor='#fff'><td colspan='2'><span>Booking ID<span style='color: #546604; font-size: 25px; padding-left: 35px;'>" + gcode + "</span></span></td></tr><tr><td width='130'> movie </td><td bgcolor='#fff'>" + nmovie.InnerText + "</td></tr><tr><td> screen </td><td bgcolor='#fff'>" + nscreen.InnerText + "</td></tr><tr><td> show date </td><td bgcolor='#fff'>" + ndate.InnerText + "</td></tr><tr><td> show time </td><td bgcolor='#fff'>" + ntime.InnerText + "</td></tr><tr><td> seats </td><td bgcolor='#fff'>" + nseat.InnerText + "</td></tr><tr><td> no. of tickets </td><td bgcolor='#fff'>" + nticket.InnerText + "</td></tr><tr><td> price </td><td bgcolor='#fff'>" + nprice.InnerText + "</td></tr><tr bgcolor='#fff'><td colspan='2'><p style='font-size: 14px;padding:5px 5px 0 5px' >Please note that your tickets are confirmed; we will not release the tickets under any circumstances. You can collect your tickets even if you are late for the movie.</p><p style='font-size: 15px;padding:5px 5px 0 5px' >Thank you for choosing Rainbow Entertainments !!</p></td></tr></table>";
                        sms.send(mres, cu.umobile);
                        if (mail.SendMail(res, cu.umail))
                        {
                            res = @"<tr><td align='center' style='color:#fff' id='tresp' runat='server'><p style='font-size:30px;color:#a0d105;margin-top:35px'>hooray!! booking successfull</p><p style='font-size:25px;color:#ef9c02;margin-top:10px;'>Booking ID : " + gcode + "</p><p style='width:450px;padding:10px 30px 0 30px;color:#f13e07'>error oocured while sending email to following address</p><p style='font-size:25px;color:#0ab6dc;margin-top:10px;'>" + cu.umail + "</p><p style='width:450px;padding:10px 30px 0 30px;'>please make a note on Booking ID.thank you for choosing Rainbow Entertainments!!</p></td></tr>";
                            tresp.InnerHtml = res;
                            Panel2.Visible = true;
                            Panel1.Visible = false;
                            Session["booking"] = false;

                        }
                        else
                        {
                            res = @"<tr><td align='center' style='color:#fff' id='tresp' runat='server'><p style='font-size:30px;color:#a1d105;margin-top:35px'>hooray!! booking successfull</p><p style='font-size:25px;color:#ef9c02;margin-top:10px;'>Booking ID : " + gcode + "</p><p style='width:450px;padding:10px 30px 0 30px;'>your booking information are sent to your registered email address</p><p style='font-size:25px;color:#0ab6dc;margin-top:10px;'>" + cu.umail + "</p><p style='width:450px;padding:10px 30px 0 30px;'>thank you for choosing Rainbow Entertainments!!</p></td></tr>";
                            tresp.InnerHtml = res;
                            Panel2.Visible = true;
                            Panel1.Visible = false;
                            Session["booking"] = false;
                        }
                    }
                    else
                    {
                        res = @"<tr><td align='center' style='color:#fff' id='tresp' runat='server'><p style='font-size:30px;color:#ef3c03;margin-top:35px'>oops!! booking failed</p><p style='width:450px;padding:10px 30px 0 30px;'>Error occured while collection your information, please try again</p></td></tr>";
                        tresp.InnerHtml = res;
                        Panel2.Visible = true;
                        Panel1.Visible = false;
                        Session["booking"] = false;
                    }
                }


                sql.cls();
            }

            else
            {
                res = @"<tr><td align='center' style='color:#fff' id='tresp' runat='server'><p style='font-size:30px;color:#ef3c03;margin-top:35px'>oops!! booking failed</p><p style='width:450px;padding:10px 30px 0 30px;'>Requested seats alreay taken by other users, please try again</p></td></tr>";
                tresp.InnerHtml = res;
                Panel2.Visible = true;
                Panel1.Visible = false;
                Session["booking"] = false;
            }
        }
        catch (System.Data.SqlClient.SqlException sqle)
        {
            res = @"<tr><td align='center' style='color:#fff' id='tresp' runat='server'><p style='font-size:30px;color:#ef3c03;margin-top:35px'>oops!! booking failed</p><p style='width:450px;padding:10px 30px 0 30px;'>following error occured while booking tickets</p><p style='width:450px;padding:10px 30px 0 30px;'>" + sqle.Message + ", please try again</p></td></tr>";
            tresp.InnerHtml = res;
            Panel2.Visible = true;
            Panel1.Visible = false;
            Session["booking"] = false;

        }
        catch (Exception ee)
        {
            res = @"<tr><td align='center' style='color:#fff' id='tresp' runat='server'><p style='font-size:30px;color:#ef3c03;margin-top:35px'>oops!! booking failed</p><p style='width:450px;padding:10px 30px 0 30px;'>following error occured while booking tickets</p><p style='width:450px;padding:10px 30px 0 30px;'>" + ee.Message + ", please try again</p></td></tr>";
            tresp.InnerHtml = res;
            Panel2.Visible = true;
            Panel1.Visible = false;
            Session["booking"] = false;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Session["userid"] = null;
        Session["booking"] = false;
        Response.Redirect("booking.aspx");

    }
}