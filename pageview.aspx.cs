using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Rainbow;

public partial class nowshowing : System.Web.UI.Page
{
    MySqlConnection sql = new MySqlConnection();
    XmlDocument xml = new XmlDocument();
    string rdx = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Count != 0)
        {
            if (Request.QueryString.GetKey(0) == "nowshowing")
            {
                title.InnerHtml = "now<span> showing</span>";
                Panel1.Visible = true;
                Panel2.Visible = false;
                Panel3.Visible = false;
            }
            else if (Request.QueryString.GetKey(0) == "comingsoon")
            {
                title.InnerHtml = "coming<span> soon</span>";
                Panel1.Visible = true;
                Panel2.Visible = false;
                Panel3.Visible = false;
            }
            else if (Request.QueryString.GetKey(0) == "about")
            {
                title.InnerHtml = "our<span> profile</span>";
                Panel1.Visible = false;
                Panel3.Visible = false;
                Panel2.Visible = true;
            }
            else if (Request.QueryString.GetKey(0) == "contact")
            {
                title.InnerHtml = "contact<span> details</span>";
                Panel1.Visible = false;
                Panel2.Visible = false;
                Panel3.Visible = true;
                if ((bool)Session["signin"] == true && Session["userid"] != null)
                {
                    try
                    {
                        sql.cpn();
                        sql.com.CommandText = "select fname from udetails where uid=" + Session["userid"];
                        sql.dr = sql.com.ExecuteReader();
                        while (sql.dr.Read())
                        {
                            uname.InnerText = sql.dr.GetString(0);
                        }
                        sql.rcls();
                        sql.cls();
                    }
                    catch
                    {
                        sql.rcls();
                        sql.cls();
                        Panel4.Visible = false;
                        Panel5.Visible = false;
                    }
                    Button1.Click += new EventHandler(Button1_Click);
                    Panel4.Visible = false;
                    Panel5.Visible = true;
                }
                else
                {
                    Panel4.Visible = true;
                    Panel5.Visible = false;
                }


            }
        }
        else
        {
            Response.Redirect("index.aspx");
        }

    }

    void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            sql.cpn();
            sql.com.CommandText = "insert into feedback values (" + Session["userid"] + ",'" + TextBox1.Text + "','" + DateTime.Now + "')";
            int resp = sql.com.ExecuteNonQuery();
            Panel5.Visible = false;
            Panel4.Visible = false;
            Panel6.Visible = true;
        }
        catch
        {
            Panel5.Visible = false;
            Panel4.Visible = false;
            Panel6.Visible = true;
        }
    }
    protected string getGenre(int n)
    {
        string s = "g" + n;
        xml.Load(Server.MapPath("App_Data/genre.xml"));
        return xml.DocumentElement.GetElementsByTagName(s)[0].InnerText;
    }
    public void show_details()
    {
        if (Request.QueryString.Count != 0)
        {
            if (Request.QueryString.GetKey(0) == "nowshowing")
            {

                _show_details(1);
            }
            else if (Request.QueryString.GetKey(0) == "comingsoon")
            {
                _show_details(0);
            }


        }
        else
        {
            Response.Redirect("index.aspx");
        }




    }
    private void _show_details(int code)
    {
        try
        {
            sql.cpn();
            sql.com.CommandText = "select mid,mname,mcat,mdir,ismd,duration,lang from mdetail where screen=" + code;
            sql.dr = sql.com.ExecuteReader();
            if (sql.dr.HasRows)
            {
                while (sql.dr.Read())
                {
                    if (sql.dr.GetInt32(4) == 1)
                        rdx = sql.dr.GetString(6) + " 3D";
                    else
                        rdx = sql.dr.GetString(6) + "";

                    Response.Write("<div><img src='Images/movie/" + sql.dr.GetInt32(0) + "-left.jpg' alt=" + sql.dr.GetString(1) + "/><div><p>" + sql.dr.GetString(3) + "</p><p>" + rdx + "</p><p>" + sql.dr.GetString(5) + "</p><p>" + getGenre(sql.dr.GetInt32(2)) + "</p></div><p>" + sql.dr.GetString(1) + "</p></div>");
                }
            }
            else
                Response.Write("<p style='font-size:25px;color:#fff;margin:30px 50px'>no shows found on current category</p>");
        }
        catch { Response.Write("<p style='font-size:25px;color:#fff;margin:30px 50px'>unexcepted error occured, please try again</p>"); }
    }
}