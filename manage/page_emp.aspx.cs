using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Rainbow;

public partial class manage_page_emp : System.Web.UI.Page
{
    MySqlConnection sql = new MySqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        Response.Cache.SetNoStore();

        if ((bool)Session["booking"] == true)
        {
            Response.Redirect("../selection.aspx?booking=1");
        }
        else if ((bool)Session["admin"] == true)
        {
            Response.Redirect("page_admin.aspx");
        }
        else if ((bool)Session["emp"] == false)
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        sql.cpn();
        sql.com.CommandText = "select * from booking where bookingid='" + TextBox1.Text + "'";
        sql.dr = sql.com.ExecuteReader();
        if (sql.dr.HasRows)
        {
            while (sql.dr.Read())
            {
                ibook.InnerText = sql.dr.GetInt32(0) + "BCN";
                bookid.InnerText = sql.dr.GetString(1);
                bcode.InnerText = sql.dr.GetString(1);
                screen.InnerText = sql.dr.GetString(2);
                mname.InnerText = sql.dr.GetString(3);
                date.InnerText = sql.dr.GetString(4);
                show.InnerText = sql.dr.GetString(5);
                seat.InnerText = sql.dr.GetString(6);
                nseat.InnerText = sql.dr.GetString(7);
                price.InnerText = sql.dr.GetString(8);
                uname.InnerText = sql.dr.GetString(9);
            }
            sql.rcls();
            TextBox1.BorderColor = System.Drawing.Color.FromName("#333333"); 
            Panel1.Visible = true;
            TextBox1.Text = "";
        }
        else
        {
            Panel1.Visible = false;
           
            TextBox1.BorderColor = System.Drawing.Color.FromName("RED");

        }
        sql.cls();

    }
}