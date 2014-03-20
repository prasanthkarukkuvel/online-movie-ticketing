using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class error_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        Response.Cache.SetNoStore();

        if (Request.QueryString["rmsg"] != "" && Request.QueryString["emsg"] != null)
            msr.InnerHtml = "<span style='color:#f00;'>Message : </span><span>" + Request.QueryString[0] + "</span>";
        else
            Response.Redirect("../");
    }
}