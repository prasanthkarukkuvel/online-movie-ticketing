<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Images/fonts/fonts.css" rel="stylesheet" type="text/css" />
    <style>
        body
        {
            background: #000000;
            margin: 0;
            padding: 0;
            overflow: hidden;
            font-family: "SegoeUI";
        }
        a
        {
            color: #aaa;
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
        #mast-head
        {
            background: url(Images/screens/1.jpg) no-repeat;
            height: 500px;
            width: 1000px;
            position: absolute;
            z-index: -1;
        }
        
        #logo
        {
            position: absolute;
            background: url(images/logotns.png);
            width: 350px;
            height: 111px;
            z-index: 100;
            margin-top: 5px;
        }
        
        .link
        {
            position: absolute;
            z-index: 1;
        }
        
        .link .bylink
        {
            position: absolute;
            z-index: 100;
            height: 150px;
            width: 1000px;
        }
        
        .link .bylink .link-content
        {
            position: fixed;
            bottom: 15px;
            height: 120px;
            width: 1000px;
        }
        
        .link .bylink .link-content a
        {
            float: left;
            width: 192px;
            height: 80px;
            margin-left: 8px;
            font: 26px "SegoeUI";
            color: #fff;
            line-height: 75px;
            text-align: center;
            background: #121212 url(images/picover.png);
            -webkit-transition: all 0.3s ease-in-out;
            -moz-transition: all 0.3s ease-in-out;
            -ms-transition: all 0.3s ease-in-out;
            -o-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
            cursor: pointer;
        }
        
        .link-content a:first-child:hover
        {
            background: #f57300;
        }
        
        .link-content a:nth-child(2):hover
        {
            background: #07a4ef;
        }
        
        .link-content a:nth-child(4):hover
        {
            background: #8dad00;
        }
        
        .link-content a:nth-child(3):hover
        {
            background: #d50f42;
        }
        
        .link-content a:nth-child(5):hover
        {
            background: #60F;
        }
        
        .tanim
        {
            width: 1000px;
            overflow: hidden;
            position: absolute;
            font: 130px "SegoeUI-Light";
            color: #fff;
            margin-top: 165px;
            opacity: 0;
            margin-left: 700px;
        }
        .user-content
        {
            position: absolute;
            width: 1000px;
            z-index: 200;
            font: 25px "SegoeUI";
            margin-right: 80px;
            color: #fff;
        }
        .user-space
        {
            background: #111;
            padding: 3px 20px 10px 25px;
            -webkit-border-bottom-right-radius: 10px;
            -webkit-border-bottom-left-radius: 10px;
            -moz-border-radius-bottomright: 10px;
            -moz-border-radius-bottomleft: 10px;
            border-bottom-right-radius: 10px;
            border-bottom-left-radius: 10px;
            float: right;
        }
        .user-hold
        {
            color: #a9cf03;
        }
        #u-name
        {
            margin-left: 5px;
        }
        .holder
        {
            font-size: 20px;
            padding-left: 20px;
        }
        .holder a
        {
            padding-left: 10px;
            padding-right: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="1000" border="0" cellspacing="0" cellpadding="0" align="center" style="table-layout: fixed;
            overflow: hidden;">
            <tr>
                <td align="center">
                    <div id="logo">
                    </div>
                    <asp:Panel ID="Panel1" runat="server">
                        <div class="user-content">
                            <div class="user-space">
                                <span class="user-hold">welcome!</span><span id="uname" runat="server"></span>
                                <span class="holder"><a href="profile.aspx">profile</a>|<a href="logout.aspx?all=1">logout</a></span>
                            </div>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" Visible="false">
                        <div class="user-content">
                            <div class="user-space">
                                <a href="selection.aspx?signin=1">sign in</a>
                            </div>
                        </div>
                    </asp:Panel>
                    <div class="tanim">
                        luxury</div>
                    <div id="mast-head">
                    </div>
                    <div class="link">
                        <div class="bylink">
                            <div class="link-content">
                                <a href="pageview.aspx?nowshowing=1">now showing</a> <a href="pageview.aspx?comingsoon=1">coming soon</a> <a href="booking.aspx?booking=1">
                                    book tickets</a> <a href="pageview.aspx?about=1">about</a> <a href="pageview.aspx?contact=1" >contact</a>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    </form>
    <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui-1.8.20.custom.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.easing.compatibility.js" type="text/javascript"></script>
    <script src="Scripts/ts.js" type="text/javascript"></script>
    <script type="text/javascript">
        var a = new Array("Images/screens/1.jpg", "Images/screens/2.jpg", "Images/screens/3.jpg", "Images/screens/4.jpg", "Images/screens/5.jpg", "Images/screens/6.jpg");
        var b = new Array("luxury", "quietude", "relaxation", "serenity", "coolness", "quality");
        var i = 1;
        var j = 1;
        function show() {
            $("#mast-head").transition({ scale: [1.1, 1.1], opacity: 1 }, 6000, 'out', function () {
                $("#mast-head").transition({ opacity: 0.1 }, 500, function () {
                    $("#mast-head").removeAttr("style").css("background-image", "url(" + a[i] + ")");
                    i++;
                    if (i >= a.length)
                        i = 0;
                    show();
                });

            });
        }
        function tanimate() {
            $(".tanim").transition({ x: '-700px', opacity: 0.7 }, 2000, 'snap').transition({ x: '-1300px', opacity: 0, delay: 2400 }, 2100, 'snap', function () {
                $(".tanim").removeAttr("style");
                $(".tanim").text(b[j]);
                j++;
                if (j >= b.length)
                    j = 0;
                tanimate();
            });
        }
        $(document).ready(function () {
            show();
            tanimate();
        });
    </script>
</body>
</html>
