<%@ Page Language="C#" AutoEventWireup="true" CodeFile="page_emp.aspx.cs" Inherits="manage_page_emp" %>

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
            background: #fff;
            color: #333;
            overflow: hidden;
            -webkit-user-select: none;
        }
        
        a
        {
            color: #666;
            text-decoration: none;
            font: 22px "SegoeUI";
        }
        
        a:active
        {
            color: #333;
        }
        
        a:visited
        {
            color: #666;
        }
        
        a:hover
        {
            color: #069;
            text-decoration: none;
        }
        
        p
        {
            margin: 0;
            padding: 0;
        }
        
        .panel-info
        {
            font: 57px "SegoeUI-Light";
            color: #f57301;
            float: left;
        }
        
        .tag
        {
            margin: 20px 0 0 100px;
            font-size: 25px;
        }
        
        .tag > span:first-child
        {
            color: #666;
            width: 150px;
            display: block;
            float: left;
        }
        
        .tag > span:last-child
        {
            color: #CCC;
        }
        
        input[type=text]
        {
            font: 24px "SegoeUI" , "SegoeUI-SemiBold";
            border: #333 2px solid;
            color: #fff;
            width: 400px;
            color: #333;
            padding: 5px 15px;
        }
        
        input[type=submit]
        {
            font: 20px "SegoeUI" , "SegoeUI-SemiBold";
            border: #111 2px solid;
            color: #fff;
            width: 100px;
            background: #444;
            margin-left: 20px;
            height: 42px;
            cursor: pointer;
        }
        
        #cls
        {
            font-size: 30px;
            font-family: "SegoeUI-SemiBold";
            float: right;
            margin-right: 40px;
            color: #999;
            cursor: pointer;
        }
        
        #cls:hover
        {
            color: #333;
        }
        
        input[type=submit]:hover
        {
            background: #006699;
        }
        
        input[type=submit]:active
        {
            background: #333;
        }
    </style>
    <style media="screen" type="text/css">
        .noPrint
        {
            display: block;
        }
        
        .yesPrint
        {
            display: block !important;
        }
    </style>
    <style media="print" type="text/css">
        @page
        {
            size: landscape;
            margin: 2cm;
        }
        
        .noPrint
        {
            display: none;
        }
        
        .yesPrint
        {
            display: block !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="1000" border="0" cellspacing="0" cellpadding="0" align="center" style="table-layout: fixed;
            overflow: hidden; margin-top: 10px;">
            <tr class="noPrint">
                <td align="left" width="960">
                    <div class="panel-info">
                        Booking<span style="color: #666"> Counter</span></div>
                    <div style="float: right; margin-top: 30px">
                        <a href="../logout.aspx?emp=1">logout</a></div>
                </td>
            </tr>
            <tr class="noPrint">
                <td align="left">
                    <div class="tag">
                        <span>Booking ID</span><span>
                            <asp:TextBox ID="TextBox1" runat="server" MaxLength="20"></asp:TextBox>
                        </span><span>
                            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
                        </span>
                    </div>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Panel ID="Panel1" runat="server" Visible="false">
                        <div>
                            <div id="ticket">
                                <div class="noPrint" style="font: 25px 'SegoeUI'; padding: 10px 0 10px 40px; margin: 20px 0 20px 10px;">
                                    <span style="width: 70px; display: block; float: left;">user :</span><span id="uname"
                                        runat="server" style="color: #069"></span>
                                    <div id="cls">
                                        x</div>
                                </div>
                                <div align="center" class="yesPrint">
                                    <table width="920" border="0" cellspacing="0" cellpadding="4" align="center">
                                        <tr bgcolor="#333333" style="color: #fff; height: 50px;">
                                            <td align="left" colspan="3" style="font-size: 25px; padding-left: 20px;">
                                                rainbow entertainments
                                            </td>
                                            <td width="89" style="font-size: 22px; padding-left: 20px;">
                                                <div align="right">
                                                    Screen</div>
                                            </td>
                                            <td colspan="2" style="font-size: 30px; padding-left: 20px;">
                                                <div align="center" id="screen" runat="server">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr style="height: 55px;">
                                            <td colspan="2" style="font-size: 20px; font-family: 'SegoeUI-SemiBold'">
                                                <div align="center" id="show" runat="server">
                                                </div>
                                            </td>
                                            <td width="259" style="font-size: 20px; font-family: 'SegoeUI-SemiBold'">
                                                <div align="center" id="date" runat="server">
                                                </div>
                                            </td>
                                            <td>
                                                <div align="right" style="font-size: 20px; font-family: 'SegoeUI'">
                                                    Booking ID</div>
                                            </td>
                                            <td colspan="2" style="font-size: 20px; font-family: 'SegoeUI-SemiBold'">
                                                <div align="center" id="bookid" runat="server">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr style="height: 50px;">
                                            <td width="100" style="font-size: 20px; font-family: 'SegoeUI'">
                                                <div align="center">
                                                    Movie</div>
                                            </td>
                                            <td align="left" colspan="4" style="font-size: 20px; font-family: 'SegoeUI-SemiBold'"
                                                id="mname" runat="server">
                                            </td>
                                            <td width="101" style="font-size: 20px; font-family: 'SegoeUI-SemiBold'">
                                                <div align="center">
                                                    Chennai</div>
                                            </td>
                                        </tr>
                                        <tr style="height: 50px;">
                                            <td style="font-size: 20px; font-family: 'SegoeUI'">
                                                <div align="center">
                                                    Seats</div>
                                            </td>
                                            <td colspan="3" style="font-size: 20px; font-family: 'SegoeUI-SemiBold'" id="seat"
                                                runat="server" align="left">
                                            </td>
                                            <td width="125">
                                                <div align="right">
                                                    No. of Seats</div>
                                            </td>
                                            <td>
                                                <div align="center" style="font-size: 20px; font-family: 'SegoeUI-SemiBold'" id="nseat"
                                                    runat="server">
                                                    10</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" style="height: 35px; font-family: 'IDAutomationHC39M'; font-size: 20px;
                                                padding-left: 20px;" id="bcode" runat="server" align="left">
                                                XXXXXXXX1001
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td style="font-size: 20px; font-family: 'SegoeUI'">
                                                Total Amount
                                            </td>
                                            <td style="font-size: 20px; font-family: 'SegoeUI-SemiBold'" id="price" runat="server"
                                                align="right">
                                            </td>
                                        </tr>
                                        <tr bgcolor="#FFA042" style="height: 30px; color: #FFF">
                                            <td colspan="2">
                                                <div align="center">
                                                    www.rainbowcinemas.in</div>
                                            </td>
                                            <td>
                                                <div align="center">
                                                    Rainbow Entertainments Inc.</div>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td align="center">
                                                Online Booking
                                            </td>
                                            <td>
                                                <div align="center" id="ibook" runat="server">
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="noPrint" style="float: right; margin: 10px 40px 0 0">
                                        <input name="" type="submit" value="Print" onclick="window.print() " />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    </form>
    <script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $("#cls").click(function () { $("#ticket").fadeOut(400); });
        $("#TextBox1").bind('keyup', function (e) {
              $(this).val(($(this).val().toUpperCase()));
        });
        </script>
</body>
</html>
