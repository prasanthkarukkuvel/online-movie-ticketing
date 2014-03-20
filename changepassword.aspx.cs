using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Rainbow;

public partial class changepassword : System.Web.UI.Page
{
    MySqlConnection sql = new MySqlConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (((bool)Session["signin"]) == true && Session["userid"] != null)
            {

                int curiduser = (int)Session["userid"];
                string curpass = "";
                if (Request.Form["oldpass"] != "" && Request.Form["newpass"] != "" && Request.Form["cnfpass"] != "")
                {
                    sql.cpn();
                    sql.com.CommandText = "select upass from udetails where uid=" + curiduser;
                    sql.dr = sql.com.ExecuteReader();
                    while (sql.dr.Read())
                    {
                        curpass = sql.dr.GetString(0);
                    }
                    sql.rcls();
                    sql.cls();
                    if (curpass == Request.Form["oldpass"])
                    {
                        if (Request.Form["newpass"] == Request.Form["cnfpass"])
                        {
                            sql.cpn();
                            sql.com.CommandText = "update udetails set upass='" + Request.Form["newpass"] + "' where uid=" + curiduser;
                            sql.com.ExecuteNonQuery();
                            sql.cls();
                            Response.Write("<div id='passuppanel'>your password changed sucessfully</div>");
                        }
                        else
                        {
                            Response.Write("<div id='passerrpanel'>new and confirm passwords should match</div>");
                        }
                    }
                    else
                    {
                        Response.Write("<div id='passerrpanel'>incorrect password! try again</div>");
                    }
                }
                else
                {
                    Response.Write("<div id='passerrpanel'>your password has not changed due to invalid informations</div>");
                }
            }
            else
                Response.Redirect("index.aspx");
        }

        catch (System.Data.SqlClient.SqlException xe)
        {
            Response.Write("<div id='passerrpanel'>" + xe.Message + "</div>");
        }
        catch (Exception xe)
        {
            Response.Write("<div id='passerrpanel'>" + xe.Message + "</div>");
        }

    }
}