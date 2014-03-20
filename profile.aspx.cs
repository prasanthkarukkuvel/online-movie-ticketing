using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Rainbow;

public partial class profile : System.Web.UI.Page
{
    MySqlConnection sql = new MySqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        Response.Cache.SetNoStore();
        if ((bool)Session["booking"] == true)
        {
            Response.Redirect("selection.aspx?booking=1");
        }
        else if (((bool)Session["signin"] == true) && (Session["userid"] != null))
        {
            update_info();

        }
        else { Response.Redirect("index.aspx"); }

    }
    protected void update_info()
    {
        sql.cpn();
        sql.com.CommandText = "select fname,lname,umail,umob,uaddr,ucity,upin,ustate from udetails where uid=" + Session["userid"];
        sql.dr = sql.com.ExecuteReader();
        while (sql.dr.Read())
        {

            curfname.InnerText = sql.dr.GetString(0);
            curlname.InnerText = sql.dr.GetString(1);
            fname.Text = sql.dr.GetString(0);
            lname.Text = sql.dr.GetString(1);
            curemail.InnerText = sql.dr.GetString(2);
            curmobile.InnerText = sql.dr.GetString(3);
            addr.Text = sql.dr.GetValue(4).ToString();
            city.Text = sql.dr.GetValue(5).ToString();
            pin.Text = sql.dr.GetValue(6).ToString();
            state.Text = sql.dr.GetValue(7).ToString();

        }
        sql.rcls();
        sql.cls();

    }
    protected void subform_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsPostBack)
            {
                int curiduser = (int)Session["userid"];
                if (Request.Form["fname"] != "" && Request.Form["lname"] != "")
                {
                    sql.cpn();
                    sql.com.CommandText = "update udetails set fname='" + Request.Form["fname"].ToLower() + "',lname='" + Request.Form["lname"].ToLower() +"',uaddr='" + Request.Form["addr"] + "',ucity='" + Request.Form["city"] + "',upin='" + Request.Form["pin"] + "',ustate='" + Request.Form["state"] + "' where uid=" + curiduser;
                    sql.com.ExecuteNonQuery();
                    sql.cls();
                    update_info();
                    uptext.Text = "your changes are saved";
                    errpanel.Visible = false;
                    uppanel.Visible = true;
                }
                else
                {
                    errtext.Text = "your changes are not saved due to invalid informations";
                    errpanel.Visible = true;
                    uppanel.Visible = false;
                }
            }
        }
        catch (System.Data.SqlClient.SqlException xe)
        {
            errtext.Text = xe.Message;
            errpanel.Visible = true;
            uppanel.Visible = false;
        }
        catch (Exception xe)
        {
            errtext.Text = xe.Message;
            errpanel.Visible = true;
            uppanel.Visible = false;
        }
    }
   
}