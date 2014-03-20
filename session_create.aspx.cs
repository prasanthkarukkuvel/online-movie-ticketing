using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using Rainbow;

public partial class session_create : System.Web.UI.Page
{
    CryptoSystem cry = new CryptoSystem();
    string text = "";

    object[] info = new object[10];
    object[] icurrent = { "Prasanth", 1019, 4, 2, 5, 2, 2012, 1 };
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        Response.Cache.SetNoStore();

        if (Request.QueryString["sessionSequenceID"] != "" && Request.QueryString["sessionSequenceID"] != null)
        {
            text = Server.UrlDecode(Request.QueryString["sessionSequenceID"]);
            text = text.Replace(" ", "+");
            text = cry.dncString(text);


            for (int i = 0; i < 9; i++)
            {
                info[i] = text.Substring(0, text.IndexOf("/"));
                text = text.Substring(text.IndexOf("/") + 1);
                //Response.Write(info[i] + "<br/>");
            }
            Session["user"] = info;
            Session["booking"] = true;
            Response.Redirect("selection.aspx?booking=1");
        }
        else { }
    }
}