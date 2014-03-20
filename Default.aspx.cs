using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
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
        else
        {
            Response.Redirect("index.aspx");
        }
    }
}