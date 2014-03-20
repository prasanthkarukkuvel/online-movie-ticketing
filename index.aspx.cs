using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Rainbow;

public partial class index : System.Web.UI.Page
{
    public MySqlConnection sql = new MySqlConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        Response.Cache.SetNoStore();
        if ((bool)Session["booking"] == true)
        {
            Response.Redirect("selection.aspx?booking=1");
        }
        else if ((bool)Session["admin"] == true)
        {
            Response.Redirect("manage/page_admin.aspx");
        }
        else if (((bool)Session["signin"] == true) && (Session["userid"] != null))
        {
            sql.cpn();
            sql.com.CommandText = "select fname from udetails where uid=" + Session["userid"];
            sql.dr = sql.com.ExecuteReader();
            while (sql.dr.Read())
            {
                uname.InnerText = " " + sql.dr.GetString(0);
            }
            sql.rcls();
            sql.cls();

            Panel1.Visible = true;
            Panel2.Visible = false;
        }
        else
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
        }
    }


}