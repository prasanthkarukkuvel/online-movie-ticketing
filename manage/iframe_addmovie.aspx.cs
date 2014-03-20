using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manage_iframe_addmovie : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Request.QueryString["msg"] != "" && Request.QueryString["msg"] != null) || (Request.QueryString["s"] != "" && Request.QueryString["s"] != null))
        {
            if (Request.QueryString["s"] == "0")
                addmovresp.InnerHtml = "<div id='uppanel'>" + Request.QueryString["msg"] + "</div>";
            else
                addmovresp.InnerHtml = "<div id='errpanel'>" + Request.QueryString["msg"] + "</div>";

        }
        else
        {

            addmovresp.Visible = false;
        }
    }
}