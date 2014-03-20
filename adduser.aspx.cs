using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Rainbow;


public partial class adduser : System.Web.UI.Page
{
    User u = new User();
    MySqlConnection sql = new MySqlConnection();
    GPassword g = new GPassword();
    MService m = new MService();
    SMSClient sms = new SMSClient();
    string resp = "";
    string body = "";
    string sresp = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            sql.cpn();
            u.fname = Request.Form["firstname"].ToLower();
            u.lname = Request.Form["lastname"].ToLower();
            u.umail = Request.Form["upemail"];
            u.umobile = Request.Form["mobile"];
            u.upass = g.rs(10);
            sql.com.CommandText = "select uid from udetails where umail='" + u.umail +"'";

            sql.dr = sql.com.ExecuteReader();
            if (sql.dr.HasRows)
            { 
                sql.dr.Close();
                resp = @"<div id='r-failure'><div>Oops! your registration failed !</div>
                                  <div>specified email address already exists</div>
                                  <div>" + Request.Form["upemail"] + "</div><div>note : if you are a registered user please sign in with the your credentials</div></div>";
                Response.Write(resp);
            }
            else
            {
                sql.rcls();
                sql.com.CommandText = "select uid from udetails where umob='" + u.umobile + "'";
                sql.dr = sql.com.ExecuteReader();
                if (sql.dr.HasRows)
                {
                    sql.rcls();
                    resp = @"<div id='r-failure'><div>Oops! your registration failed !</div>
                                  <div>specified mobile number already exists</div>
                                  <div>" + Request.Form["mobile"] + "</div><div>note : if you are a registered user please sign in with the your credentials</div></div>";
                    Response.Write(resp);
                }
                else
                {
                    sql.rcls();
                    sql.com.CommandText = "insert into udetails values('" + u.umail + "','" + u.fname + "','" + u.lname + "','" + u.upass + "','" + u.umobile + "','','','','')";
                    sql.com.ExecuteNonQuery();
                    resp=@"<div id='r-success'><div>your registration successful !</div>
                                  <div>new password has been sent to your email address</div>
                                  <div>" + Request.Form["upemail"] + "</div><div>note : you can change your password on your profile</div></div>";
                    body = @"<html><body>
                                <font face='Lucida Grande'>
                                <p style='font-size:30px;color:#c86004;'><b>Rainbow Entertainments</b><p>
                                <p style='font-size:23px;color:#333'><b>hello ! <span style='color:#03a8ec;'>" + u.fname + " " + u.lname + @"</span> ,</b><p>
                                <p style='font-size:20px;color:#333'> email id  : <b><span style='color:#000'>" + u.umail + @"</span></b></p>
                                <p style='font-size:20px;color:#333'> mobile no : <b><span style='color:#000'>" + u.umobile + @"</span></b></p>
                                <p style='font-size:20px;color:#333'> your new password is <b><span style='color:#000'>" + u.upass + @"</span></b> for the account : <b>" + u.umail + @"</b></p>
                                <p style='font-size:20px;color:#333'>note : you can change your password on your profile.</p>
                                <p style='font-size:17px;color:#777'><b> -- thank you, rainbow enteratinments</b></p>
                                </font>     
                                </body></html>";
                    sresp = "Hello ! " + u.fname + ", Your emailID:" + u.umail + " and your Password is " + u.upass+". Thank you for choosing Rainbow Entertainsments.";
                    sms.send(sresp,u.umobile);
                    if (m.SendMail(body, u.umail))
                        Response.Write("<div class='f-r-f'>mail sending failed, please try again</div>");
                    else
                        Response.Write(resp);
                }

            }

            sql.cls();
        }
        catch (System.Data.SqlClient.SqlException ex)
        {
            int code = ex.ErrorCode;
            resp = @"<div id='r-failure'><div>unable to process your request</div>
                     <div>an error occured while processing your request, please try again</div>
                     <div> error code : " + code + "</div><div>error message : " + ex.Message + "</div></div>";
            Response.Write(resp);
           
          
        }
        catch (Exception ex)
        {
            string code = ex.InnerException + "";
            resp = @"<div id='r-failure'><div>unable to process your request</div>
                     <div>an error occured while processing your request, please try again</div>
                     <div> error : " + code + "</div><div>error message : " + ex.Message + "</div></div>";
            Response.Write(resp);


        }

    }
}