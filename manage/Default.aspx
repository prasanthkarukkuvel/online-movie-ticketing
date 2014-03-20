<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="manage_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Images/fonts/fonts.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body
        {
            width: 100%;
            margin: 0;
            padding: 0;
            font: 18px "SegoeUI" , "SegoeUI-SemiBold";
            background: #FFFFFF;
            color: #333;
            overflow: hidden;
            -webkit-user-select: none;
        }
        
        p
        {
            margin: 0;
            padding: 0;
        }
        
        #login-box
        {
            width: 500px;
            height: 300px;
            margin-top: 25px;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            background: #e8e8e8; /* Old browsers */ /* IE9 SVG, needs conditional override of 'filter' to 'none' */
            background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2U4ZThlOCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjE4JSIgc3RvcC1jb2xvcj0iI2Y2ZjZmNiIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjgzJSIgc3RvcC1jb2xvcj0iI2Y2ZjZmNiIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNlOGU4ZTgiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
            background: -moz-linear-gradient(top, #e8e8e8 0%, #f6f6f6 18%, #f6f6f6 83%, #e8e8e8 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #e8e8e8), color-stop(18%, #f6f6f6), color-stop(83%, #f6f6f6), color-stop(100%, #e8e8e8)); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(top, #e8e8e8 0%, #f6f6f6 18%, #f6f6f6 83%, #e8e8e8 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(top, #e8e8e8 0%, #f6f6f6 18%, #f6f6f6 83%, #e8e8e8 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(top, #e8e8e8 0%, #f6f6f6 18%, #f6f6f6 83%, #e8e8e8 100%); /* IE10+ */
            background: linear-gradient(to bottom, #e8e8e8 0%, #f6f6f6 18%, #f6f6f6 83%, #e8e8e8 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e8e8e8', endColorstr='#e8e8e8', GradientType=0 ); /* IE6-8 */
            margin-bottom: 5px;
            border: #aaa thin solid;
        }
        
        .logo-rainbow
        {
            background: url(../Images/logo-white.jpg) center;
            width: 300px;
            height: 93px;
            float: left;
        }
        
        .login-title
        {
            text-align: left;
            font-size: 30px;
            position: relative;
            left: 25px;
            top: 10px;
            color: #066c94;
        }
        
        .panel-info
        {
            font: 45px "SegoeUI-Light";
            float: right;
            color: #666;
            margin-right: 70px;
        }
        
        .login-content
        {
            margin-left: 50px;
            text-align: left;
            margin-top: 35px;
            font-size: 20px;
        }
        
        .login-content div
        {
            float: left;
            width: 150px;
            font-size: 23px;
        }
        
        select, input
        {
            font: 18px "SegoeUI";
            outline: 0;
            border: #444 2px solid;
        }
        
        select
        {
            width: 250px;
            height: 35px;
            padding: 3px 5px 3px 10px;
        }
        
        input[type=password]
        {
            width: 243px;
            height: 30px;
            padding-left: 5px;
            font: 18px "SegoeUI";
        }
        
        input[type=submit], input[type=reset]
        {
            width: 100px;
            height: 35px;
            border-width: 2px;
            background: #ccc;
            margin-left: 10px;
            cursor: pointer;
        }
        
        input[type=submit]:hover, input[type=reset]:hover
        {
            background: #0076AE;
            color: #fff;
        }
        
        input[type=submit]:active, input[type=reset]:active
        {
            background: #333;
            color: #fff;
        }
        
        input[type=submit]
        {
            margin-left: 150px;
        }
        
        #err-info, #err-info-cur
        {
            background: #900;
            color: #fff;
            font-size: 22px;
            width: 500px;
            padding: 5px 0;
            margin-top: 10px;
        }
        #err-info
        {
            display: none;
        }
        #footer
        {
            left: 0;
            position: fixed;
            color: #333;
            text-align: center;
            padding: 5px;
            bottom: 0px;
            width: 100%;
            font-size: 16px;
            border-top: solid #666 thin;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="1000" border="0" cellspacing="0" cellpadding="0" align="center" style="table-layout: fixed;
            overflow: hidden; margin-top: 10px;">
            <tr>
                <td align="left">
                    <div class="logo-rainbow">
                    </div>
                    <div class="panel-info">
                        <span style="color: #f57301">admin & employee </span>panel</div>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <div id="login-box">
                        <p class="login-title">
                            login
                        </p>
                        <div class="login-content">
                            <div>
                                login as</div>
                            <span>
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                    <asp:ListItem Text="Administrator" />
                                    <asp:ListItem Text="Employee" />
                                </asp:DropDownList>
                            </span>
                        </div>
                        <div class="login-content">
                            <div>
                                password</div>
                            <span>
                                <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
                            </span>
                        </div>
                        <div class="login-content">
                            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
                            <input name="" type="reset" value="Reset" />
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <div id="err-info">
                        </div>
                    <asp:Panel ID="Panel1" runat="server" Visible="false">
                        <div id="err-info-cur">
                            invalid password, please try again</div>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td align="center">
                </td>
            </tr>
        </table>
    </div>
    </form>
    <div id="footer">
        &copy; rainbow entertainments</div>
    <script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $("#Button1").click(function () {

            var a = document.getElementById("TextBox1").value;
            if (a.length < 6) {
                $("#err-info").text("specify valid password").fadeIn(300);
                return false;
            }
            return true;

        });
        $(":input").focus(function () { $("#err-info").fadeOut(100); });
    </script>
</body>
</html>
