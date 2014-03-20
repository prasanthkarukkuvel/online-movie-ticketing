<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="error_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            width: 100%;
            background: #050304;
            overflow: hidden;
            margin: 0;
            padding: 0;
            font-family: "Segoe UI";
            font-size: 25px;
        }
        a
        {
           
            color: #aaa;
            padding:5px 25px;
            border:#ccc thin solid;
            text-decoration: none;
        }
        
        a:active
        {
            color: #aaa;
        }
        a:visited
        {
            color: #aaa;
        }
        a:hover
        {
            color: #26b8f5;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center">
            <tr>
                <td align="center">
               
                    <div id="Div1" runat="server" style="font-size:30px;color: #fff; margin-top: 160px;">
                        Oops! Looks like we have encountered an error.</div>
                    <div id="msr" runat="server" style="color: #fff; margin-top: 10px;">
                        hello</div>
                        <div style="margin-top:100px;"> <a  href="../">Back to Home</a></div>
                        
                    <%-- <img src="images/404.jpg" />--%>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
