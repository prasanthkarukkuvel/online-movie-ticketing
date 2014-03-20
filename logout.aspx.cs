using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class logout : System.Web.UI.Page
{
    string s = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        s = Request.QueryString.GetKey(0);


        if (s == "all")
        {
            Session["signin"] = false;
            Session["userid"] = null;
            Session["booking"] = false;
            Session["user"] = null;
           
            Response.Redirect("index.aspx");
        }
        else if (s == "book")
        {
            Session["booking"] = false;
            Session["user"] = null;
            Response.Redirect("booking.aspx");
        }
        else if (s == "index")
        {
            Session["booking"] = false;
            Session["user"] = null;
            Response.Redirect("index.aspx");
        }
        else if (s == "profile")
        {
            Session["booking"] = false;
            Session["user"] = null;
            Response.Redirect("profile.aspx");
        }
        else if (s == "admin")
        {
            Session["admin"] = false;
           
            Response.Redirect("manage/");
        }
        else if (s == "emp")
        {
            Session["emp"] = false;

            Response.Redirect("manage/");
        }
    }
}