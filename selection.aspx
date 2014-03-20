<%@ Page Language="C#" AutoEventWireup="true" CodeFile="selection.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ranibow Entertainments</title>
    <link href="images/select.css" rel="stylesheet" type="text/css" />
    <link href="Images/usersign.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div id="back">
    <img src="Images/flyingdots.gif"  width="1000" height="5" alt=""/>
    
    </div>
    <div id="fback" >
        
    </div>
    <div>
        <asp:Panel ID="userSignInUp" runat="server" Visible="false">
            <div class="usersign">
                <table align="center" border="0" width="500">
                    <tr>
                        <td>
                            <div>
                                <span id="signin" class="active">sign in</span> <span id="signup" class="passive">sign
                                    up</span>
                            </div>
                            <div class="page">
                                <div id="bsign-in">
                                    <div class="toperror">
                                        <span id="toperrinfo"></span>
                                    </div>
                                    <div class="fogpass" id="fgcontent">
                                        <div id="fgshow">
                                            need new password</div>
                                        <div id="fgcons">
                                            <div class="fbtopinfo">
                                                enter your registered email id<span style="float: right" id="fgclose"><img src="Images/cancel.png"
                                                    width="30px" height="30px" /></span>
                                            </div>
                                            <form id="fgpassword" action="utilities.aspx" method="post">
                                            <table border="0" width="400" align="center">
                                                <tr>
                                                    <td>
                                                        <span class="sign-left" style="width: 100px; font-size: 25px;">email</span>
                                                    </td>
                                                    <td>
                                                        <span class="sign-right">
                                                            <input name="fgmail" id="fpemail" type="text" maxlength="50" style="width: 300px" />
                                                        </span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td align="center">
                                                        <input name="" class="button" id="fgsubmit" type="submit" value="proceed" style="margin-left: 60px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2">
                                                    </td>
                                                </tr>
                                            </table>
                                            </form>
                                            <div id="f-r-resp">
                                            </div>
                                        </div>
                                    </div>
                                    <p class="insign-info" id="usigninfo" runat="server">
                                        you need to sign in</p>
                                    <div class="bsign-content">
                                        <form runat="server" id="form1" onsubmit="return true" method="post" autocomplete="off">
                                        <div>
                                            <p>
                                                <span class="insign-left">email</span><span class="sign-right">
                                                    <asp:TextBox name="inemail" ID="signmail" runat="server" MaxLength="50"></asp:TextBox>
                                                </span>
                                            </p>
                                            <p>
                                                <span class="insign-left">password</span><span class="sign-right">
                                                    <asp:TextBox name="inpassword" ID="signpass" runat="server" MaxLength="50" TextMode="Password"></asp:TextBox>
                                                </span>
                                            </p>
                                        </div>
                                        <div style="position: absolute; z-index: 10">
                                            <img src="Images/idcard.png" width="100" height="100" style="position: relative;
                                                bottom: 5px; left: 350px;" />
                                        </div>
                                        <div>
                                            <p id="para" runat="server">
                                            </p>
                                            <asp:Button ID="insubmit" class="button" runat="server" Text="sign in" name="submit"
                                                OnCommand="submit_Click" />
                                            <input name="" class="button" id="inreset" type="reset" value="reset" />
                                        </div>
                                        </form>
                                    </div>
                                    <asp:Panel ID="errorcase" runat="server" Visible="false">
                                        <div style="position: absolute; z-index: 10;">
                                            <img src="Images/idwrong.png" width="65" height="65" style="position: relative; bottom: 9px;" />
                                        </div>
                                        <div class="inerror-info">
                                            <span id="errorreport" runat="server"></span>
                                        </div>
                                    </asp:Panel>
                                </div>
                                <div id="bsign-up">
                                    <div id="bsign-up-form">
                                        <div class="toperror">
                                            <span id="uptoperrinfo"></span>
                                        </div>
                                        <p class="upsign-info">
                                            create new account</p>
                                        <div class="signup-content">
                                            <div style="position: absolute; z-index: -1">
                                                <img src="Images/idnew.png" width="95" height="95" style="position: relative; bottom: 100px;
                                                    left: 370px;" />
                                            </div>
                                            <form method="post" id="signupform" action="adduser.aspx">
                                            <div id="signform">
                                                <div>
                                                    <p>
                                                        <span class="sign-left">firstname</span><span class="sign-right">
                                                            <input name="firstname" id="fname" type="text" maxlength="25" />
                                                        </span>
                                                    </p>
                                                    <p>
                                                        <span class="sign-left">lastname</span><span class="sign-right">
                                                            <input name="lastname" id="lname" type="text" maxlength="25" />
                                                        </span>
                                                    </p>
                                                    <p>
                                                        <span class="sign-left">email</span><span class="sign-right">
                                                            <input name="upemail" id="upmail" type="text" maxlength="50" />
                                                        </span>
                                                    </p>
                                                    <p>
                                                        <span class="sign-left">mobile</span><span class="sign-right">
                                                            <input name="mobile" id="mnum" type="text" maxlength="10" />
                                                        </span>
                                                    </p>
                                                </div>
                                                <div style="margin-left: 30px;">
                                                    <input name="" id="upsubmit" class="button" type="submit" value="sign up" />
                                                    <input name="" id="upreset" class="button" type="reset" value="reset" />
                                                </div>
                                            </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div id="load-r-content">
                                        <div id="r-load">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        <asp:Panel ID="userSessionSet" runat="server" Visible="false">
            <div id="open">
                <div id="header">
                </div>
                <table border="0" cellpadding="0" cellspacing="0" align="center" width="1000" style="table-layout: fixed;
                    overflow: hidden;">
                    <tr>
                        <td>
                            <div>
                                <div>
                                    <table align="center" border="0" width="1000" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <div id="sname" runat="server">
                                                </div>
                                            </td>
                                            <td align="left">
                                                <div id="sinfo" runat="server">
                                                    <div id="hbanner" runat="server">
                                                    </div>
                                                    <div id="playinfo" runat="server">
                                                        <div id="t_users" >
                                                            <p>
                                                                <a href="logout.aspx?index=1">home</a><a href="logout.aspx?profile=1">profile</a><a
                                                                    href="logout.aspx?all=1" target="_self">logout</a><a href="#">about</a><a href="#">contact</a></p>
                                                        </div>
                                                        <div>
                                                            <p id="imdb_src" style="display:none;">
                                                                <a>
                                                                    <img src="Images/imdb.png" />
                                                                </a>
                                                            </p>
                                                        </div>
                                                        <div>
                                                            <div class="t_user">
                                                                <div class="t_user_icon">
                                                                    <img src="Images/user_logo.png" /></div>
                                                                <p id="userfname" runat="server">
                                                                    sss
                                                                </p>
                                                                <p id="usermail" runat="server">
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <div>
                                    </div>
                                </div>
                                <div id="panleft">
                                    <div id="terror">
                                        <span id="ecode"></span>
                                        
                                    </div>
                                    <p>
                                        about the movie</p>
                                    <p id="left_image" runat="server">
                                        </p>
                                    <p id="mname" runat="server">
                                    </p>
                                    <p id="dir" runat="server">
                                    </p>
                                    <p id="lang" runat="server">
                                        Date and Time
                                    </p>
                                    <p id="dur" runat="server">
                                    </p>
                                    <p id="cat" runat="server">
                                    </p>
                                    <div id="r_logo" runat="server">
                                        <div>
                                            <div id="r1_logo">
                                                <div id="r2_logo">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div id="tap" runat="server">
                                        <table align="left" border="0" cellpadding="0" cellspacing="0" style="margin-left: 7px;">
                                            <tr>
                                                <td>
                                                    <div id="pantop">
                                                        <div>
                                                            <p>
                                                                Date&nbsp;&nbsp;&nbsp;:<span id="tdate" runat="server"></span></p>
                                                            <p>
                                                                Time&nbsp;&nbsp;&nbsp;:<span id="ttime" runat="server"></span></p>
                                                            <p>
                                                                Day&nbsp;&nbsp;&nbsp;&nbsp;:<span id="tday" runat="server" style="text-transform:capitalize"></span></p>
                                                        </div>
                                                        <div>
                                                            <p>
                                                                Show&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span id="sshow" runat="server" style="text-transform:capitalize"></span></p>
                                                            <p>
                                                                Location&nbsp;&nbsp;:<span id="Span2" runat="server">&nbsp;&nbsp;&nbsp;Rainbow Entertainments,
                                                                    Chennai</span></p>
                                                            <p>
                                                                Price&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<span id="Span4" runat="server">&nbsp;&nbsp;&nbsp;Rs
                                                                    120/- per ticket</span></p>
                                                        </div>
                                                        <div>
                                                            <a href="logout.aspx?book=1">
                                                                <div id="tclose">
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <%           
                                                info();
                                            %>
                                            <tr>
                                                <td>
                                                    <div id="exts">
                                                        <img src="Images/video.png" />
                                                    </div>
                                                    <div id="screen">
                                                        <div id="notr">
                                                            <div id="controls">
                                                                <div class="cplay">
                                                                    <div id="play">
                                                                    </div>
                                                                    <div class="tool">
                                                                        <nobr>
                                                                play trailer</nobr>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            Screen
                                                        </div>
                                                        <div id="player">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div id="panbottom">
                                                        <div id="selectinfo">
                                                            <img src="Images/loader.gif" /><span>please select your seats to proceed !</span>
                                                        </div>
                                                        <div id="proceed">
                                                            <div id="srinfo">
                                                                selected seats<p id="psel">
                                                                </p>
                                                                <p>
                                                                    total cost : price for
                                                                    <% Response.Write(u.iseat); %>
                                                                    seats + charges *</p>
                                                            </div>
                                                            <asp:Panel ID="pan" runat="server">
                                                                <div id="iproceed">
                                                                    <div>
                                                                        <span>Proceed</span>
                                                                        <img src="Images/next.png" width="35" height="35" />
                                                                    </div>
                                                                    <div>
                                                                    </div>
                                                                </div>
                                                            </asp:Panel>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div id="panright" runat="server">
                                    <div class="rightc">
                                        <div>
                                            <p>
                                                seats choosed</p>
                                            <div id="n_f_t" runat="server">
                                                0</div>
                                        </div>
                                        <div id="stoselect">
                                            <p>
                                                seats to select</p>
                                            <div id="c_f_t" runat="server">
                                                0</div>
                                        </div>
                                        <div>
                                            <p>
                                                your price</p>
                                            <div id="p_f_t" runat="server">
                                                0
                                            </div>
                                        </div>
                                        <div>
                                            <p>
                                                legend</p>
                                            <div>
                                                <div class="roe">
                                                    <div style="background: #eaeaea;" class="savail">
                                                    </div>
                                                    available
                                                </div>
                                                <div class="roe">
                                                    <div style="background: #A3CC29;" class="savail">
                                                    </div>
                                                    selected
                                                </div>
                                                <div class="roe">
                                                    <div style="background: #cf0404;" class="savail">
                                                    </div>
                                                    unavailable
                                                </div>
                                                <div class="roe">
                                                    <div style="background: #0797ef;" class="savail">
                                                    </div>
                                                    selected row
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <span></span>
                                            <form name="sform" id="hselect" action="process.aspx" method="post">
                                            <%
                                                string n = "nval";
                                                string d = "dval";
                                                for (int i = 0; i < u.iseat; i++)
                                                    Response.Write("<input type='hidden' id='" + d + i + "' name='" + n + i + "' value='0'>");
                                                     
                                            %>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        <div id="footer">
            &copy;rainbow entertainments
        </div>
    </div>
    <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui-1.8.20.custom.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.easing.compatibility.js" type="text/javascript"></script>
    <%  
        string f1 = "function showScreen(){lp('splayer', '" + trailerID + "');}";
        string f2 = "function getOnOfTickets(){return " + u.iseat + ";}";
        Response.Write("<script>" + f1 + f2 + "</script>"); 
    %>
    <script src="Scripts/usersign.js" type="text/javascript"></script>
    <script src="Scripts/select.js" type="text/javascript"></script>
    <script type="text/javascript">
        var tag = document.createElement('script');
        tag.src = "http://www.youtube.com/player_api";
        var firstScriptTag = document.getElementsByTagName('script')[0];
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
        var player;
        function lp(did,pid)
        {
        	
                	player = new YT.Player(did, {
                    height: '345',
                    width: '555',
                    videoId: pid,
                    playerVars: {
                    'autoplay': 0,
			        'autohide':1,
                   },
       
            });
       }
    </script>
</body>
</html>
