<%@ Application Language="C#" %>

<script runat="server">
    
    void Application_Start(object sender, EventArgs e) 
    {

    }
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        Session.Timeout = 45;
       
        Session["userid"] = null;
        Session["signin"] = false;
        Session["booking"] = false;
        Session["admin"] = false;
        Session["emp"] = false;
    }
    void Session_End(object sender, EventArgs e) 
    {
        Session.Abandon();
    }
       
</script>
