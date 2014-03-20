<%@ Page Language="C#" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Images/fonts/fonts.css" rel="stylesheet" type="text/css" />
    <style>
        body
        {
            margin: 0;
            padding: 0;
            overflow: hidden;
            background: #111;
            font: 20px "SegoeUI";
            color: #ccc;
            -webkit-user-select: none;
            -moz-user-select: none;
        }
        
        #back
        {
            background: #000;
            position: absolute;
            width: 100%;
            height: 100%;
            z-index: 500;
            opacity: 0.85;
            filter: alpha(opacity=75);
            margin: 0;
            padding: 0;
            display: none;
        }
        
        #secback
        {
            background: #000;
            position: absolute;
            width: 100%;
            height: 100%;
            z-index: 700;
            opacity: 0.85;
            filter: alpha(opacity=75);
            margin: 0;
            padding: 0;
            display: none;
        }
        
        tr, td
        {
            margin: 0;
            padding: 0;
        }
        
        .logo-top
        {
            width: 1000px;
            position: absolute;
        }
        
        a
        {
            color: #ccc;
            text-decoration: none;
            -webkit-transition: all 0.2s ease-in-out;
            -moz-transition: all 0.2s ease-in-out;
            -ms-transition: all 0.2s ease-in-out;
            -o-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
        }
        
        a:hover
        {
            color: #ccc;
            text-decoration: none;
        }
        
        a:visited
        {
            color: #ccc;
            text-decoration: none;
        }
        
        #logo
        {
            background: url(images/logotns.png) no-repeat;
            width: 350px;
            height: 111px;
            float: right;
            margin-top: 10px;
        }
        
        #title
        {
            float: left;
            text-align: left;
            font: 60px "SegoeUI-Light";
            padding-top: 5px;
           color:#f57301;
        }
        
        #uname
        {
            font: 35px "SegoeUI";
            color: #fff;
        }
        
        #uname span:first-child
        {
            color: #e82757;
        }
        
        .links
        {
            float:float;
            font: 25px "SegoeUI";
           padding-left:600px;
            padding-top: 40px;
        }
        
        .links-hold
        {
            position: absolute;
        }
        
        .links a
        {
            color: #FF8B17;
            padding-left: 10px;
            padding-right: 10px;
            -webkit-transition: all 0.2s ease-in-out;
            -moz-transition: all 0.2s ease-in-out;
            -ms-transition: all 0.2s ease-in-out;
            -o-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
        }
        
        .links a:hover
        {
            color: #fff;
        }
        
        input[type=text], input[type=password]
        {
            width: 200px;
            height: 30px;
            margin-right: 10px;
            border: #555 thin solid;
            font: 17px "SegoeUI";
            color: #ccc;
            background: #222;
            padding-left: 20px;
        }
        
        input[type=submit]
        {
            width: 140px;
            height: 35px;
            margin-top: 20px;
            margin-right: 10px;
            font: 17px "SegoeUI";
            background: #111;
            color: #fff;
            border: #999 thin solid;
            cursor: pointer;
            -webkit-transition: all 0.2s ease-in-out;
            -moz-transition: all 0.2s ease-in-out;
            -ms-transition: all 0.2s ease-in-out;
            -o-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
        }
        
        input[type=submit]:hover
        {
            background: #09F;
            border: #333 thin solid;
        }
        
        input[type=submit]:active
        {
            -webkit-transition: none;
            -moz-transition: none;
            -ms-transition: none;
            -o-transition: none;
            transition: none;
            background: #111;
            border: #333 thin solid;
        }
        
        .catg
        {
            font: 22px "SegoeUI";
            color: #ccc;
            margin: 15px 0 0 30px;
        }
        
        .catg div
        {
            float: left;
            width: 220px;
        }
        
        .catg span:nth-child(2)
        {
            color: #81ba09;
        }
        
        textarea
        {
            width: 300px;
            height: 60px;
            resize: none;
            font: 15px "SegoeUI";
            color: #ccc;
            background: #222;
            padding-left: 20px;
            padding-top: 10px;
            border: #555 thin solid;
        }
        
        #pchange
        {
            float: left;
            width: 38px;
            height: 38px;
            background: url(Images/edit.png) center no-repeat;
            cursor: pointer;
            -webkit-transition: all 0.2s ease-in-out;
            -moz-transition: all 0.2s ease-in-out;
            -ms-transition: all 0.2s ease-in-out;
            -o-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
            opacity: 0.5;
        }
        
        #sgen
        {
            width: 100px;
            height: 28px;
            font: 15px "SegoeUI";
        }
        
        #pchange:hover
        {
            opacity: 1;
        }
        
        #pchange:active
        {
            opacity: 0.2;
            -webkit-transition: none;
            -moz-transition: none;
            -ms-transition: none;
            -o-transition: none;
            transition: none;
        }
        
        #ferror, #serror
        {
            background: #800;
            color: #fff;
            font-size: 19px;
            padding: 5px 20px 7px 20px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            display: none;
        }
        
        #bscreen
        {
            position: absolute;
            width: 600px;
            padding-bottom: 20px;
            background: #111;
            z-index: 600;
            margin-top: 100px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            color: #ccc;
            font: 23px "SegoeUI";
            display: none;
        }
        
        #bscrcls
        {
            color: #666;
            font: 30px "SegoeUI";
            left: 310px;
            width: 600px;
            cursor: pointer;
            position: relative;
            text-align: right;
        }
        
        #bscrcls:hover
        {
            color: #fff;
        }
        #errpanel, #uppanel, #passerrpanel, #passuppanel
        {
            font-size: 22px;
            height: 32px;
            line-height: 30px;
            text-indent: 32px;
            padding: 15px 20px 7px 25px;
            margin-left: 30px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
        }
        #errpanel, #passerrpanel
        {
            color: #f30505;
            background: url(Images/cross.png) left no-repeat;
        }
        #uppanel, #passuppanel
        {
            color: #90f305;
            background: url(Images/tick.png) left no-repeat;
        }
    </style>
</head>
<body>
    <div>
        <div id="back">
        </div>
        <div id="secback">
        </div>
        <table width="600" border="0" cellspacing="0" cellpadding="0" align="center" style="table-layout: fixed;
            overflow: hidden;">
            <tr>
                <td align="">
                    <div id="bscreen">
                        <div style="margin-top: 10px">
                            <span style="margin-left: 20px; font-size: 30px; color: #FF8B17;">change password</span><span
                                id="bscrcls">x</span></div>
                        <form id="chpassword" action="changepassword.aspx" method="post" autocomplete="off">
                        <table width="490" border="0" cellspacing="0" cellpadding="0" align="center" style="table-layout: fixed;
                            overflow: hidden; margin-left: 40px; margin-top: 20px;">
                            <tr>
                                <td align="">
                                    <div class="catg">
                                        <div>
                                            current password</div>
                                        <span>
                                            <input type="password" id="oldpass" name="oldpass" maxlength="30" />
                                        </span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td align="">
                                    <div class="catg">
                                        <div>
                                            new password</div>
                                        <span>
                                            <input type="password" id="newpass" name="newpass" maxlength="30" />
                                        </span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td align="">
                                    <div class="catg">
                                        <div>
                                            confirm password</div>
                                        <span>
                                            <input type="password" id="cnfpass" name="cnfpass" maxlength="30" />
                                        </span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td align="">
                                    <div class="catg">
                                        <div style="margin-top: 25px">
                                        </div>
                                        <span>
                                            <input id="passsub" type="submit" value="save password" />
                                        </span>
                                        <p id="serror" style="text-align: center">
                                            enter your new password</p>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div id="infopan">
                                    </div>
                                </td>
                            </tr>
                        </table>
                        </form>
                    </div>
                </td>
            </tr>
        </table>
        <form id="form1" runat="server" autocomplete="off">
        <table width="1000" border="0" cellspacing="0" cellpadding="0" align="center" style="table-layout: fixed;
            overflow: hidden;">
            <tr>
                <td align="center">
                   <%-- <div class="logo-top">
                        <div id="logo">
                        </div>
                    </div>--%>
                    <div id="title">
                        my <span style="color:#fff">profile</span></div>
                    <div class="links">
                        <div class="links-hold">
                            <a href="index.aspx">home</a>|<a href="booking.aspx">movies</a>|<a href="logout.aspx?all=1">logout</a></div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="uname">
                        <span id="curfname" runat="server"></span>&nbsp;<span id="curlname" runat="server"></span></div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="catg">
                        <div>
                            first & last name</div>
                        <span>
                            <asp:TextBox ID="fname" runat="server" maxlength="30"></asp:TextBox>
                            <asp:TextBox ID="lname" runat="server" maxlength="30"></asp:TextBox>
                        </span>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="catg">
                        <div>
                            your email ID</div>
                        <span id="curemail" runat="server"></span>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="catg">
                        <div>
                            your mobile no.</div>
                        <span id="curmobile" runat="server"></span>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="catg">
                        <div>
                            change password</div>
                        <div id="pchange">
                        
                        </div><span style="padding:5px 0 0 10px;font-size:18px;color:#666">current password required</span>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="catg">
                        <div>
                            address</div>
                        <span>
                            <asp:TextBox ID="addr" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
                        </span>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="catg">
                        <div>
                            city & pincode</div>
                        <span>
                            <asp:TextBox ID="city" runat="server" maxlength="30"></asp:TextBox>
                            <asp:TextBox ID="pin" runat="server"  maxlength="6"></asp:TextBox>
                        </span>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="catg">
                        <div>
                            state</div>
                        <span>
                            <asp:TextBox ID="state" runat="server" maxlength="30"></asp:TextBox>
                        </span>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="catg">
                        <div>
                            &nbsp;</div>
                        <span>
                            <asp:Button ID="subform" runat="server" Text="save changes" OnClick="subform_Click" />
                        </span><span id="ferror">error in form</span>
                    </div>
                    <asp:Panel ID="errpanel" runat="server" Visible="false">
                        <asp:Label ID="errtext" runat="server" Text=""></asp:Label>
                    </asp:Panel>
                    <asp:Panel ID="uppanel" runat="server" Visible="false">
                        <asp:Label ID="uptext" runat="server" Text=""></asp:Label>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        </form>
        <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
        <script src="Scripts/jquery-ui-1.8.20.custom.min.js" type="text/javascript"></script>
        <script type="text/javascript">
 function valid() {
    var a = document.getElementById("fname");
    var b = document.getElementById("lname");
    var c = document.getElementById("addr");
    var p = document.getElementById("city");
    var f = document.getElementById("pin");
    var s = document.getElementById("state");
    a.onchange = a.onkeyup = function () {
        var aValue = a.value;
        a.value = aValue.replace(/[^A-Z a-z]/g, "")
    };
    b.onchange = b.onkeyup = function () {
        var eValue = b.value;
        b.value = eValue.replace(/[^A-Z a-z]/g, "")
    };
    p.onchange = p.onkeyup = function () {
        var pValue = p.value;
        p.value = pValue.replace(/[^A-Z a-z]/g, "")
    };
    s.onchange = s.onkeyup = function () {
        var sValue = s.value;
        s.value = sValue.replace(/[^A-Z a-z]/g, "")
    };
    f.onchange = f.onkeyup = function () {
        var bValue = f.value;
        f.value = bValue.replace(/[^0-9]/g, "")
    };
    c.onchange = c.onkeyup = function () {
        var cValue = c.value;
        c.value = cValue.replace(/[^A-Za-z0-9 ,//-]/g, "")
    }
}
$(":input").focus(function () {
    $("#ferror").fadeOut(250);
    $("#serror").fadeOut(250);
});
$(":input").keyup(function () {
    valid();
});
$("#bscrcls").click(function () {
    $("#bscreen").fadeOut(200);
    $("#back").fadeOut(250);
    document.getElementById("oldpass").value = "";
    document.getElementById("newpass").value = "";
    document.getElementById("cnfpass").value = "";
    $("#infopan").empty();
    $("#serror").fadeOut(100);
});
$("#pchange").click(function () {
    $("#bscreen").fadeIn(200);
    $("#back").fadeIn(250);
});
$("#subform").click(function () {
    var a = document.getElementById("fname").value;
    var b = document.getElementById("lname").value;
    var c = document.getElementById("addr").value;
    var p = document.getElementById("city").value;
    var f = document.getElementById("pin").value;
    var s = document.getElementById("state").value;
    if (a.length <= 3 && a == "") {
        $("#ferror").text("invalid firstname");
        $("#ferror").fadeIn(500);
        return false;
    }
    else if (b == "") {
        $("#ferror").text("invalid lastname");
        $("#ferror").fadeIn(500);
        return false;
    }

    else if (c != "" && c.length < 10) {
        $("#ferror").text("invalid address");
        $("#ferror").fadeIn(500);
        return false;
    }
    else if (p != "" && p.length < 4) {
        $("#ferror").text("invalid city name");
        $("#ferror").fadeIn(500);
        return false;
    }
    else if (f != "" && f.length < 6) {
        
            $("#ferror").text("invalid pincode");
            $("#ferror").fadeIn(500);
            return false;
       
    }
    else if (s != "" && s.length < 4) {
        $("#ferror").text("invalid state name");
        $("#ferror").fadeIn(500);
        return false;
    }
});
$("#passsub").click(function () {
    var a = document.getElementById("oldpass").value;
    var b = document.getElementById("newpass").value;
    var c = document.getElementById("cnfpass").value;
    if (a.length < 6) {
        $("#serror").text("specify your current password correctly");
        $("#serror").fadeIn(500);
        return false;
    }
    else if (b.length < 6) {
        $("#serror").text("new password must have aleast 6 characters");
        $("#serror").fadeIn(500);
        return false;
    }
    else if (c.length < 6) {
        $("#serror").text("confirm password doesn't match");
        $("#serror").fadeIn(500);
        return false;
    }
    else if (b != c) {
        $("#serror").text("confirm password doesn't match");
        $("#serror").fadeIn(500);
        return false;
    }
});
$(function () {
    $('#chpassword').submit(function () {
        $("#secback").fadeIn(100);
        $.ajax({
            url: this.action,
            type: this.method,
            data: $(this).serialize(),
            success: function (result) {
                document.getElementById("oldpass").value = "";
                document.getElementById("newpass").value = "";
                document.getElementById("cnfpass").value = "";
                $('#infopan').html(result);
                $('#infospan').fadeIn(100);
                $("#secback").delay(100).fadeOut(100);
            }
        });
        return false
    });
});
        </script>
</body>
</html>
