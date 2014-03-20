using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Rainbow;

public partial class manage_addmovie : System.Web.UI.Page
{
    MySqlConnection sql = new MySqlConnection();
    Movie mov = new Movie();
    object movid = 0;
    string fname = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            mov.movname = Request.Form["addmovname"];
            mov.movcat = Convert.ToInt32(Request.Form["addmovcat"]);
            mov.movdir = Request.Form["addmovdir"];
            mov.movdate = Request.Form["addmovdat"];
            mov.movlang = Request.Form["addmovlang"];
            mov.movdura = Request.Form["addmovhr"] + ":" + Request.Form["addmovmin"] + ":" + Request.Form["addmovsec"];
            mov.movtype = Convert.ToInt32(Request.Form["ismd"]);
            mov.movtrid = Request.Form["addmovtrid"];
            mov.movpic1 = Request.Files["addmovpic1"];
            mov.movpic2 = Request.Files["addmovpic2"];

            sql.cpn();
            sql.com.CommandText = "insert into mdetail (mname,mcat,mdir,mdate,duration,lang,ismd,tr_id,screen) values ('" + mov.movname + "'," + mov.movcat + ",'" + mov.movdir + "','" + mov.movdate + "','" + mov.movdura + "','" + mov.movlang + "'," + mov.movtype + ",'" + mov.movtrid + "',0)";
            int xe = sql.com.ExecuteNonQuery();
            sql.com.CommandText = "SELECT IDENT_CURRENT('mdetail')";
            sql.dr = sql.com.ExecuteReader();
            while (sql.dr.Read())
                movid = sql.dr.GetValue(0);
            sql.rcls();
            sql.cls();
            if (xe == 1)
            {
                if ((mov.movpic1 != null && mov.movpic1.ContentLength > 0) && (mov.movpic2 != null && mov.movpic2.ContentLength > 0))
                {
                    fname = movid + "-left.jpg";
                    mov.movpic1.SaveAs(Server.MapPath(System.IO.Path.Combine("~/Images/movie/", fname)));
                    fname = movid + "-banner.jpg";
                    mov.movpic2.SaveAs(Server.MapPath(System.IO.Path.Combine("~/Images/movie/", fname)));


                    Response.Redirect("iframe_addmovie.aspx?msg=Movie successfully added&s=0");
                }
                else
                {
                    sql.cpn();
                    sql.com.CommandText = "delete from mdetails where mid=" + movid;
                    xe = sql.com.ExecuteNonQuery();
                    sql.cls();
                    if (xe == 1)
                        Response.Redirect("iframe_addmovie.aspx?msg=Error occured while uploading pictures&s=1");
                    else
                        Response.Redirect("iframe_addmovie.aspx?msg=Error occured while uploading pictures and deleting related records.Manual deletion required&s=1");

                }
            }
            else

                Response.Redirect("iframe_addmovie.aspx?msg=Error occured while adding movie&s=1");



        }
        catch (System.Data.SqlClient.SqlException se)
        {

            Response.Redirect("iframe_addmovie.aspx?msg=" + se.Message + "&s=1");
        }
        catch (System.Threading.ThreadAbortException se)
        {
            // Do nothing. ASP.NET is redirecting.
            // Always comment this so other developers know why the exception 
            // is being swallowed.
        }
        catch (Exception se)
        {
            Response.Redirect("iframe_addmovie.aspx?msg=" + se.Message + "&s=1");
        }
        
        finally
        {
           
        }

    }
}