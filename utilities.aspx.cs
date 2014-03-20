using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Rainbow;

public partial class utilities : System.Web.UI.Page
{
    MySqlConnection sql = new MySqlConnection();
    User u = new User();
    GPassword g = new GPassword();
    MService m = new MService();
    SMSClient sms = new SMSClient();

    string body = "",sresp="";
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            sql.cpn();
           
            
           
            u.umail = Request.Form["fgmail"];
            u.upass = g.rs(10);
            sql.com.CommandText = "select fname,lname,umob from udetails where umail='" + u.umail + "'";
            sql.dr = sql.com.ExecuteReader();
            if (sql.dr.HasRows)
            {
                while (sql.dr.Read())
                {
                    u.fname = sql.dr.GetString(0);
                    u.lname = sql.dr.GetString(1);
                    u.umobile = sql.dr.GetString(2);
                }
                sql.dr.Close();
                sql.com.CommandText = "update udetails set upass='" + u.upass + "' where umail='" + u.umail + "'";
                sql.com.ExecuteNonQuery();
                body = @"<html><body>
                                <font face='Lucida Grande'>
                                <p style='font-size:30px;color:#c86004;'><b>Rainbow Entertainments</b><p>
                                <p style='font-size:23px;color:#333'><b>hello ! <span style='color:#03a8ec;'>" + u.fname + " " + u.lname + @"</span> ,</b><p>
                                <p style='font-size:20px;color:#333'> your new password is <b><span style='color:#000'>" + u.upass + @"</span></b> for the account : <b>" + u.umail + @"</b></p>
                                <p style='font-size:20px;color:#333'>note : you can change your password on your profile.</p>
                                <p style='font-size:17px;color:#777'><b> -- thank you, rainbow enteratinments</b></p>
                                </font>     
                                </body></html>";
                sresp = "Hello ! " + u.fname + ", your new Password is " + u.upass + " . Thank you for choosing Rainbow Entertainsments.";
                sms.send(sresp, u.umobile);
                if (m.SendMail(body, u.umail))
                    Response.Write("<div class='f-r-f'>Oops! mail sending failed, please try again</div>");
                else
                    Response.Write("<div class='f-r-s'>new password has been sent to your email address</div>");
            }
            else
            {
                sql.rcls();
                Response.Write("<div class='f-r-f'>Oops! the specified email adderss not found</div>");
            }

            sql.cls();
        }
        catch (System.Data.SqlClient.SqlException se)
        {
            Response.Write("<div class='f-r-f'>Sorry! unable to process request. error : " + se.Message + "</div>");
        }
        catch (Exception ex)
        {
            Response.Write("<div class='f-r-f'>Oops! error occured : " + ex.Message + "</div>");
        }
    }
}