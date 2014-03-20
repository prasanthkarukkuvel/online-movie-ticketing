using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manage_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        Response.Cache.SetNoStore();
        if ((bool)Session["booking"] == true)
        {
            Response.Redirect("../selection.aspx?booking=1");
        }
        else if ((bool)Session["admin"] == true)
        {
            Response.Redirect("page_admin.aspx");
        }
        else if ((bool)Session["emp"] == true)
        {
            Response.Redirect("page_emp.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 0)
        {
            if (TextBox1.Text == "admin123")
            {
                Session["admin"] = true;
                Response.Redirect("page_admin.aspx");
            }
            else { Panel1.Visible = true; }
           
        }
        else {
            if (TextBox1.Text == "emp123")
            {
                Session["emp"] = true;
                Response.Redirect("page_emp.aspx");
            }
            else { Panel1.Visible = true; }

        }
    }
}