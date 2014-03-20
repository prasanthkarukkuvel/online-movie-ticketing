<%@ Page Language="C#" AutoEventWireup="true" CodeFile="process.aspx.cs" Inherits="process" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Images/fonts/fonts.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body
        {
            width: 100%;
            margin: 0;
            padding: 0;
            font: 18px "SegoeUI" , "SegoeUI-SemiBold";
            background: #111;
            color: #333;
            overflow: hidden;
            -webkit-user-select: none;
        }
        
        p
        {
            margin: 0;
            padding: 0;
        }
        
        .panel-info
        {
            font: 50px "SegoeUI-Light";
            color: #F90;
            float: left;
            margin: 10px 0 0 25px;
        }
        
        #back
        {
            width: 48px;
            height: 48px;
            background: url(images/back_white.png) no-repeat center;
            display: block;
            float: left;
            margin: 20px 0 0 0;
            opacity: 0.5;
        }
        
        #back:hover
        {
            opacity: 1;
        }
        
        .tag
        {
            margin: 15px 0 0 100px;
            font-size: 25px;
        }
        
        .tag > span:first-child
        {
            color: #666;
            width: 300px;
            display: block;
            float: left;
            height: 38px;
            background: url(images/show-control.png) no-repeat left;
            text-indent: 50px;
        }
        
        .tag > span:last-child
        {
            color: #CCC;
            height: 38px;
        }
        
        input
        {
            font: 24px "SegoeUI" , "SegoeUI-SemiBold";
            border: 0;
            color: #fff;
            padding: 0px 20px 10px 20px;
            height: 35px;
            text-indent: 25px;
            color: #09C;
            margin-left: 50px;
            cursor: pointer;
        }
        
        input:first-child
        {
            background: url(images/check_32.png) no-repeat;
        }
        
        input:last-child
        {
            background: url(images/cancel_32.png) no-repeat;
        }
        
        input:hover
        {
            color: #fff;
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
                    <a href="selection.aspx?booking=1" id="back"></a>
                    <div class="panel-info">
                        Confirmation</div>
                </td>
            </tr>
             <asp:Panel ID="Panel1" runat="server"  Visible="false">
            <tr>
                <td align="left">
                   
                   
                    <div class="tag">
                        <span>screen</span><span id="nscreen" runat="server">infuse</span></div>
                    <div class="tag">
                        <span>movie</span><span id="nmovie" runat="server">Iceage 4 Continetal Dirft</span></div>
                    <div class="tag">
                        <span>show date</span><span id="ndate" runat="server"> Aug 28th,2012</span></div>
                    <div class="tag">
                        <span>show time</span><span id="ntime" runat="server">09:30:00 PM</span></div>
                    <div class="tag">
                        <span>location</span><span>Rainbow Entertainments, Chennai</span></div>
                    <div class="tag">
                        <span>seats</span><span id="nseat" runat="server">B-7, B-6</span></div>
                    <div class="tag">
                        <span>no tickets</span><span id="nticket" runat="server">2 tickets</span></div>
                    <div class="tag">
                        <span>amount payable</span><span id="nprice" runat="server">Rs 295/- </span>
                    </div>
                     
                </td>
            </tr>
            <tr>
                <td align="left">
                    <div style="margin-left: 150px; margin-top: 50px;" id="bpanel">
                        <asp:Button ID="Button1" runat="server" Text="book tickets" 
                            onclick="Button1_Click" />
                        <asp:Button ID="Button2"
                            runat="server" Text="cancel booking" onclick="Button2_Click" />
                    </div>
                </td>
            </tr>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server">
            
            <tr>
                <td align="center" style="color:#fff" id="tresp" runat="server">
                <p style="font-size:30px;color:#a1d105;margin-top:35px">hooray!! booking successfull</p>
                <p style="font-size:25px;color:#ef9c02;margin-top:10px;">Booking ID : XXXXXXX1001</p>
                <p style="width:450px;padding:10px 30px 0 30px;">your booking information are sent to your registered email address</p>
                <p style="font-size:25px;color:#0ab6dc;margin-top:10px;">prashanth702@gmail.com</p>
                 <p style="width:450px;padding:10px 30px 0 30px;">thank you for choosing Rainbow Entertainments.</p>
                </td>
            </tr>
            </asp:Panel>
        </table>
    </div>
    </form>
    <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $("#Button1").click(function () { $("#bpanel").fadeOut(10); });
    </script>
</body>
</html>
