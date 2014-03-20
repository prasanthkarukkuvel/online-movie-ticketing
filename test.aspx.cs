using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Collections;
using Rainbow;
using System.Xml;

public partial class test : System.Web.UI.Page
{

    SMSClient sms = new SMSClient();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        string a = "BookingID:BKA5JZIEM32000,Movie:Ice age 4 Continental Drift,Show:12-Sep,08:45:00AM,Seats:A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,Thank you";
        Response.Write(a.Length);
      
        //sms.send(a, "9176435810");

    }

}