using System;
using System.Globalization;
using System.Collections.Generic;
using System.Collections;

using System.Xml;
using System.Data.SqlClient;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Rainbow;
using System.Reflection;


public partial class _Default : System.Web.UI.Page
{
    int i = 1;
    int j = 0;

    public UserInfo u = new UserInfo();
    public User cu = new User();
    public Screen scr = new Screen();
    public MySqlConnection sql = new MySqlConnection();
    public Seats seat = new Seats();
    string logo = "<img src='Images/logo.png'  />";
    string clogo = "&nbsp;<sup><sup style='color:#88d104;'>l</sup><sub style='color:#0797ef;'>l</sub><sup style='color:#ec1f71;'>l</sup></sup>";

    public string trailerID = "";

    delegate void f_load();
    f_load a;
    ArrayList currinfo = new ArrayList();

    XmlDocument xml = new XmlDocument();

    protected String getGenre(int n)
    {
        try
        {
            String s = "g" + n;
            xml.Load(Server.MapPath("App_Data/genre.xml"));
            return "genre : " + xml.DocumentElement.GetElementsByTagName(s)[0].InnerText;
        }
        catch (System.Threading.ThreadAbortException es) { }
        catch (Exception es) { err_redirect(es.Message + " form get genre"); }
        return "";
    }
    protected void load()
    {
        try
        {
            sql.cpn();
            currinfo.Clear();
            string scrs;
            sql.com.CommandText = "select mname,screen,duration,mdir,mcat,lang,ismd,tr_id from mdetail where mid=" + u.imovieid;
            sql.dr = sql.com.ExecuteReader();
            if (sql.dr.HasRows)
            {
                while (sql.dr.Read())
                {
                    currinfo.Add(sql.dr.GetString(0));
                    currinfo.Add(sql.dr.GetInt32(1));
                    currinfo.Add(sql.dr.GetString(2));
                    currinfo.Add(sql.dr.GetString(3));
                    currinfo.Add(sql.dr.GetInt32(4));
                    currinfo.Add(sql.dr.GetString(5));
                    currinfo.Add(sql.dr.GetInt32(6));
                    currinfo.Add(sql.dr.GetString(7));
                }
                sql.dr.Close();

                mname.InnerText = (string)currinfo[0];

                sname.InnerHtml = u.iscreen + clogo + "<span>rainbow entertainments</span>";
                dur.InnerText = "duration : " + currinfo[2];
                dir.InnerText = "by " + currinfo[3];
                if ((int)currinfo[6] == 1)
                    lang.InnerHtml = "in " + currinfo[5] + " 3D";
                else
                    lang.InnerHtml = "in " + currinfo[5];
                cat.InnerText = getGenre((int)currinfo[4]);
                trailerID = (string)currinfo[7];
                hbanner.InnerHtml = "<img id='banner' src='Images/movie/" + u.imovieid + "-banner.jpg' width='400' height='100' alt='" + currinfo[0] + "'/>";
                left_image.InnerHtml = "<img id='left_banner' src='Images/movie/" + u.imovieid + "-left.jpg' width='175' height='180' alt='" + currinfo[0] + "'/>";
                n_f_t.InnerText = "" + u.iseat;
                c_f_t.InnerText = "" + u.iseat;
                p_f_t.InnerHtml = "<img src='Images/ricon.png' width='17' height='26' alt='Rs' /> " + (140 * u.iseat);
                tdate.InnerHtml = "&nbsp;&nbsp;&nbsp;" + u.idate;
                tday.InnerHtml = "&nbsp;&nbsp;&nbsp;" + u.iday;
                sshow.InnerHtml = "&nbsp;&nbsp;&nbsp;" + u.ishow;
                ttime.InnerHtml = "&nbsp;&nbsp;&nbsp;" + u.itime;
                currinfo.Clear();
            }
            else
            {
                sname.InnerHtml = "Default";
                sql.rcls();
            }


            sql.cls();
        }
        catch (System.Threading.ThreadAbortException es) { }
        catch (SqlException qs) { err_redirect(qs.Message + " form load page"); }
        catch (Exception es) { err_redirect(es.Message + " form load page"); }
    }

    public object[] getUserInfo()
    {
        return Session["user"] as object[];
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        try
        {
            sql.cpn();
            sql.com.CommandText = "select upass,uid from udetails where umail='" + signmail.Text + "'";
            sql.dr = sql.com.ExecuteReader();
            if (sql.dr.HasRows)
            {
                while (sql.dr.Read())
                {

                    if (signpass.Text == sql.dr.GetString(0))
                    {
                        Session["signin"] = true;
                        Session["userid"] = sql.dr.GetInt32(1);
                        Response.Redirect(Page.Request.Url.ToString(), true);
                    }
                    else
                    {
                        errorcase.Visible = true;
                        errorreport.InnerText = "invalid email id or password";
                        Session["signin"] = false;
                        Session["userid"] = null;
                    }

                }
                sql.rcls();

            }
            else
            {
                errorcase.Visible = true;
                errorreport.InnerText = "invalid email id";
                Session["signin"] = false;
                Session["userid"] = null;
                sql.rcls();
            }
            sql.cls();
        }
        catch (System.Threading.ThreadAbortException es) { }
        catch (SqlException qs) { err_redirect(qs.Message + " form signing process"); }
        catch (Exception es) { err_redirect(es.Message + " form signing process"); }
    }
    protected void session_load()
    {
        try
        {

            if (((bool)Session["signin"]) == true && Session["userid"] != null && Session["user"] != null && ((bool)Session["booking"]) == true)
            {
                a += new f_load(init_user);
                a += new f_load(u.load_user);
                a += new f_load(load);
                a += new f_load(setUserInfo);

                userSessionSet.Visible = true;
                userSignInUp.Visible = false;
                a();
            }
            else
            {
                userSignInUp.Visible = true;
                userSessionSet.Visible = false;
                Session["signin"] = false;
                Session["userid"] = null;
            }

        }
        catch (System.Threading.ThreadAbortException es) { }
        catch (Exception es) { err_redirect(es.Message + " form session_load"); }
    }
    protected void setUserInfo()
    {
        try
        {
            sql.cpn();
            sql.com.CommandText = "select fname,umail from udetails where uid=" + Session["userid"];
            sql.dr = sql.com.ExecuteReader();
            if (sql.dr.HasRows)
            {
                while (sql.dr.Read())
                {
                    cu.fname = sql.dr.GetString(0);
                    cu.umail = sql.dr.GetString(1);
                }
                sql.rcls();
                userfname.InnerText = cu.fname;
                usermail.InnerText = cu.umail;
            }
            else
            {
                sql.rcls();

            }
            sql.cls();
        }
        catch (System.Threading.ThreadAbortException es) { }
        catch (Exception es)
        {

            err_redirect(es.Message + " form setUserInfo");
        }
    }
    private void err_redirect(string msg)
    {
        Session["booking"] = false;
        Response.Redirect("error/?emsg=" + msg);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
            Response.Cache.SetNoStore();
            if ((Request.QueryString["signin"] != "" && Request.QueryString["signin"] != null) || (Request.QueryString["feedback"] != "" && Request.QueryString["feedback"] != null) || (Request.QueryString["booking"] != "" && Request.QueryString["booking"] != null))
            {
                if (Request.QueryString.GetKey(0) == "signin")
                {
                    if ((bool)Session["signin"] == true)
                    {
                        Response.Redirect("index.aspx");
                    }
                    else
                    {
                        usigninfo.InnerText = "already a user? sign in!";
                        userSignInUp.Visible = true;
                        userSessionSet.Visible = false;
                        Session["signin"] = false;
                    }

                }
                else if (Request.QueryString.GetKey(0) == "feedback")
                {
                    if ((bool)Session["signin"] == true)
                    {
                        Response.Redirect("pageview.aspx?contact=1");
                    }
                    else
                    {
                        usigninfo.InnerText = "already a user? sign in!";
                        userSignInUp.Visible = true;
                        userSessionSet.Visible = false;
                        Session["signin"] = false;
                    }

                }
                else if (Request.QueryString.GetKey(0) == "booking")
                {
                    if ((bool)Session["booking"] == true)
                    {
                        if (!IsPostBack)
                        {
                            session_load();
                            usigninfo.InnerText = "you need to sign in";
                        }
                    }

                    else
                        Response.Redirect("booking.aspx");
                }
                else Response.Redirect("booking.aspx");
            }
            else
                Response.Redirect("index.aspx");
        }
        catch (System.Threading.ThreadAbortException es) { }
        catch (Exception es) { err_redirect(es.Message + " form page_load()"); }
    }
    public void init_user()
    {
        try
        {
            u._user = getUserInfo();
        }
        catch (System.Threading.ThreadAbortException es) { }
        catch (Exception es) { err_redirect(es.Message + " form init_user()"); }
    }
    protected void info()
    {
        try
        {
            char[] rend = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i' };
            string rsel = "";
            string rday = u.tempday;
            string rshow = u.ishowid;
            string curshw = u.irowid;
            DataSet ds = new DataSet();


            sql.cpn();
            for (int nq = 0; nq < rend.Length; nq++)
            {
                rsel = "row_" + rend[nq];
                sql.adr = new SqlDataAdapter("select * from " + rsel + " where rowid='" + curshw + "'", sql.con);
                rsel = "row" + rend[nq];
                sql.adr.Fill(ds, rsel);
                rsel = "";
            }
            sql.cls();
            for (int nq = 0; nq < rend.Length; nq++)
            {
                rsel = "row" + rend[nq];
                foreach (DataRow dr in ds.Tables[rsel].Rows)
                {
                    Response.Write("<tr><td><div class='row' id='row-" + rend[nq] + "'>");
                    Response.Write("<div class='rinfo'>" + seat.rname[nq] + "</div>");
                    for (i = 1; i < 22; i++)
                    {
                        if ((int)dr[i] == 1)
                            Response.Write("<div class='booked'>" + seat.rname[nq] + (i - 1) + "</div>");
                        else
                            Response.Write("<div id='" + curshw + "-row_" + rend[nq] + "-s" + (i) + "' class='avail'>" + seat.rname[nq] + (i) + "</div>");

                    }
                    Response.Write("</div></td></tr>");
                }
                rsel = "";
            }


        }
        catch (System.Threading.ThreadAbortException es) { }
        catch (SqlException qe) { err_redirect(qe.Message + " form init_row()"); }
        catch (Exception es) { err_redirect(es.Message + " form init_row()"); }
    }

}