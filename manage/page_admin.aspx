<%@ Page Language="C#" AutoEventWireup="true" CodeFile="page_admin.aspx.cs" Inherits="manage_page_admin" %>

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
        a img
        {
            border: none;
            margin: 0px;
        }
        
        a
        {
            transition: all 0.2s ease-in-out;
        }
        
        a:link
        {
            text-decoration: none;
            color: #333;
        }
        
        a:visited
        {
            text-decoration: none;
            color: #333;
        }
        
        a:active
        {
            text-decoration: none;
            color: #333;
        }
        
        a:hover
        {
            color: #066ea3;
        }
        
        a:hover, a:active
        {
            outline: 0;
        }
        
        p
        {
            margin: 0;
            padding: 0;
        }
        
        select, input
        {
            font: 18px "SegoeUI";
            outline: 0;
            border: #444 2px solid;
        }
        
        select
        {
            width: 255px;
            height: 35px;
            padding: 3px 5px 3px 10px;
        }
        
        input[type=password], input[type=text]
        {
            width: 243px;
            height: 30px;
            padding-left: 5px;
            font: 18px "SegoeUI";
            padding: 2px 0 2px 10px;
        }
        
        .mduration input[type=text]
        {
            width: 28px;
            margin: 0 10px 0 2px;
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
        
        .err-info
        {
            background: #900;
            color: #fff;
            font-size: 22px;
            width: 500px;
            padding: 5px 0;
            margin-top: 10px;
            text-align: center;
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
            background: #fff;
        }
        
        .top-content
        {
            height: 3px;
            width: 1000px;
            background: #ffffff; /* Old browsers */ /* IE9 SVG, needs conditional override of 'filter' to 'none' */
            background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIxMDAlIiB5Mj0iMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIyMCUiIHN0b3AtY29sb3I9IiNmZmZmZmYiIHN0b3Atb3BhY2l0eT0iMSIvPgogICAgPHN0b3Agb2Zmc2V0PSIxMDAlIiBzdG9wLWNvbG9yPSIjZmY3NDAwIiBzdG9wLW9wYWNpdHk9IjEiLz4KICA8L2xpbmVhckdyYWRpZW50PgogIDxyZWN0IHg9IjAiIHk9IjAiIHdpZHRoPSIxIiBoZWlnaHQ9IjEiIGZpbGw9InVybCgjZ3JhZC11Y2dnLWdlbmVyYXRlZCkiIC8+Cjwvc3ZnPg==);
            background: -moz-linear-gradient(left, #ffffff 20%, #ff7400 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, right top, color-stop(20%, #ffffff), color-stop(100%, #ff7400)); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(left, #ffffff 20%, #ff7400 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(left, #ffffff 20%, #ff7400 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(left, #ffffff 20%, #ff7400 100%); /* IE10+ */
            background: linear-gradient(to right, #ffffff 20%, #ff7400 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#ff7400', GradientType=1 ); /* IE6-8 */
            margin-top: 80px;
        }
        
        .panel-rainbow
        {
            float: right;
            font-size: 24px;
            position: relative;
            top: 30px;
            color: #333;
        }
        
        .panel-info
        {
            background: url(images/admin-logo.png) left no-repeat;
            font: 57px "SegoeUI-Light";
            float: left;
            color: #666;
            text-indent: 120px;
        }
        
        .control-links div, .controls-links div, .control-select
        {
            float: right;
            height: 32px;
            text-indent: 35px;
            font-size: 25px;
            line-height: 30px;
            margin: 10px 0 0 25px;
            cursor: pointer;
            -webkit-transition: all 0.2s ease-in-out;
            -moz-transition: all 0.2s ease-in-out;
            -ms-transition: all 0.2s ease-in-out;
            -o-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
        }
        
        .control-links div, .controls-links div
        {
            background: url(images/control-link-1.png) no-repeat left;
        }
        
        .control-select
        {
            background: url(images/control-link-2.png) no-repeat left;
            color: #066ea3;
        }
        .control-select:hover
        {
            background: url(images/control-link-2.png) no-repeat left;
            color: #066ea3;
        }
        .control-links div:hover, .controls-links div:hover
        {
            color: #066ea3;
            background: url(images/control-link-2.png) no-repeat left;
        }
        
        .control-select
        {
            cursor: default !important;
        }
        
        #current-control, #current-controls
        {
            float: left;
            font-size: 40px;
            color: #5B8E0F;
            background: url(images/arrowright.png) right no-repeat;
            padding-right: 40px;
            padding-bottom: 9px;
        }
        
        #current-control
        {
            margin-left: 80px;
        }
        
        #current-controls
        {
            margin-left: 20px;
        }
        
        #smanage, #addmovie, #delmovie, #upshow
        {
            display: none;
        }
        
        #addmovie, #delmovie, #upshow
        {
            margin-top: 20px;
        }
        
        
        #delmovie select, #upshow select
        {
            width: 455px;
            height: 35px;
            padding: 3px 5px 3px 10px;
        }
        
        
        .control-items, .mduration
        {
            height: 50px;
            margin-left: 40px;
            border-right: #ccc thin solid;
            padding-right: 10px;
        }
        
        .control-items-1
        {
            height: 70px;
        }
        
        .control-items-1 p
        {
            margin: 3px 0 0 340px;
            color: #444;
            font-size: 17px;
        }
        
        .control-items label
        {
            font: 20px "SegoeUI-SemiBold";
            padding: 10px 0 0 5px;
        }
        
        .control-items-1
        {
            margin-right: 20px;
        }
        
        .control-items div, .control-items-1 div, .mduration div
        {
            float: left;
            width: 150px;
            font-size: 23px;
        }
        
        .status-pan
        {
            font-size: 40px;
            margin-left: 10px;
            color: #5B8E0F;
        }
        
        #set-control
        {
            width: 1000px;
        }
        
        #back-arrow
        {
            background: url(images/back_black.png);
            width: 48px;
            height: 48px;
            position: absolute;
            margin-top: 5px;
            opacity: 0.5;
            margin-left: 20px;
            -webkit-transition: all 0.2s ease-in-out;
            -moz-transition: all 0.2s ease-in-out;
            -ms-transition: all 0.2s ease-in-out;
            -o-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
            cursor: pointer;
        }
        
        #back-arrow:hover
        {
            opacity: 1;
        }
        
        .show-details
        {
            width: 800px;
            margin-left: 30px;
        }
        
        .show-title
        {
            font-size: 30px;
            color: #666;
        }
        
        .show-content
        {
            margin-left: 10px;
        }
        
        .show-day
        {
            font-size: 30px;
            width: 800px;
            padding: 3px 0 7px 7px;
            border-bottom: #5AD2FA medium solid;
            background: url(images/date-detail.png) left no-repeat;
            text-indent: 40px;
            text-transform: capitalize;
        }
        
        .screen-detail
        {
            font-size: 33px;
            margin: 3px 0 0 20px;
            background: url(images/screen-detail.png) left no-repeat;
            text-indent: 45px;
        }
        
        .day-details
        {
            margin: 0px 0 0 60px;
            width: 800px;
        }
        
        .day-details .m-n
        {
            font-size: 25px;
            color: #7b9100;
            padding-bottom: 7px;
            background: url(images/show-time.png) left no-repeat;
            text-indent: 40px;
        }
        
        .m-n div
        {
            float: left;
            width: 140px;
            text-transform: capitalize;
        }
        
        .m-n span
        {
            font-size: 24px;
            color: #333;
        }
        
        .next-link
        {
            position: relative;
            width: 500px;
            float: right;
            margin-top: 10px;
            right: 95px;
        }
        
        .next-link-group
        {
            position: absolute;
            z-index: 100;
        }
        .next-link-group div
        {
            font-size: 16px;
            background: #333;
            color: #fff;
            border-radius: 5px;
            -moz-border-radius: 5px;
            margin-right: 10px;
            cursor: pointer;
            padding: 2px 10px 5px 10px;
            float: right;
        }
        .next-link-group div:hover
        {
            background: #0099CC;
        }
        
        
        #show-management
        {
            text-align: center;
            width: 1000px;
            height: 450px;
            margin-top: 20px;
            display: none;
        }
        #back
        {
            background: #000;
            position: absolute;
            width: 100%;
            height: 100%;
            z-index: 500;
            opacity: 0.85;
            filter: alpha(opacity=85);
            margin: 0;
            padding: 0;
            top: 0;
            display: none;
        }
        #errpanel, #uppanel
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
        #errpanel
        {
            color: #f30505;
            background: url(../Images/cross.png) left no-repeat;
        }
        #uppanel
        {
            color: #528a02;
            background: url(../Images/tick.png) left no-repeat;
        }
        .admin-update
        {
            background: #333333;
            padding: 10px;
            border-raidus: 10px;
            -moz-border-raidus: 10px;
            -webkit-border-raidus: 10px;
            color: #fff;
        }
        .admin-update #Button1
        {
            margin-left: 0 !important;
            background: #f57301;
            border: #fff 2px solid;
            color: #fff;
            margin-right: 20px;
        }
        .admin-update #Button1:hover
        {
            background: #914401;
        }
        #info-cls
        {
            width: 35px;
            height: 35px;
            float: right;
            opacity: 0.7;
            background: url(images/close.png) center no-repeat;
            cursor: pointer;
            -webkit-transition: all 0.2s ease-in-out;
            -moz-transition: all 0.2s ease-in-out;
            -ms-transition: all 0.2s ease-in-out;
            -o-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
        }
        #info-cls:hover
        {
            opacity: 1;
        }
        #errdelmov, #errupshow
        {
            text-align: center;
        }
        #errupshw, #errdelmov
        {
            margin-left: 100px;
        }
        #errpanel, #uppanel
        {
            font-size: 22px;
            width: 500px;
            height: 32px;
            line-height: 35px;
            text-indent: 32px;
            padding: 0px 0px 7px 25px;
            margin-left: 100px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            text-align: left;
        }
        #errpanel
        {
            color: #f30505;
            background: url(../Images/cross.png) left no-repeat;
        }
        #uppanel
        {
            color: #528a02;
            background: url(../Images/tick.png) left no-repeat;
        }
        #delformsubmit, #upshowsubmit
        {
            position: relative;
            left: 395px;
        }
        #feeds
        {
            position: absolute;
            width: 800px;
            background: #fff;
            z-index: 1000;
            margin-top: 20px;
            border-radius: 10px;
            -moz-border-radius: 10px;
            height: 570px;
            overflow: auto;
            overflow-x: hidden;
            display: none;
        }
        .ftitle
        {
            font: 45px "SegoeUI-Light";
            padding: 10px 0 0 20px;
            color: #0397c6;
        }
        .feed-content
        {
            margin: 20px 0 0 20px;
            border-left: #6bdbf3 5px solid;
            padding-left: 20px;
            width: 700px;
        }
        .feed-content:last-child
        {
        }
        .feed-content > p
        {
            border-bottom: #ea7d05 2px solid;
            padding: 0;
            padding-bottom: 5px;
        }
        .feed-content > p > span:first-child
        {
            font-size: 25px;
        }
        .feed-content > p > span:last-child
        {
            font-size: 20px;
            float: right;
            color: #436602;
        }
        .feed-content > div:nth-child(2)
        {
            margin: 10px 20px;
            font-size: 20px;
        }
        .feed-content > div:nth-child(3)
        {
            height: 20px;
        }
        .feed-content > div:nth-child(3) > span:first-child
        {
            float: right;
            display: block;
            padding: 2px 8px;
            background: #f3ad6e;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
        }
        .feed-content > div:nth-child(3) > span:first-child:hover
        {
            background: #fa963d;
        }
        .feed-content > div:nth-child(3) > span:first-child:active
        {
            background: #9d4c05;
        }
        .feed-content > div:nth-child(3) > span:last-child
        {
            float: right;
            margin-right: 30px;
        }
        #fclose
        {
            font-size: 23px;
            float: right;
            margin: 10px 20px 0 0;
            cursor: pointer;
            color: #999;
        }
        #fclose:hover
        {
            color: #000;
        }
        .subinfo
        {
            font-size: 15px;
            text-align: justify;
            padding: 5px 0px;
            color: #555;
        }
        .ul-re
        {
            margin: 10px 0 0 0;
        }
        #aopen
        {
            display: none;
        }
    </style>
</head>
<body>
    <div id="aopen">
   
    <div id="back">
    </div>
    <table width="800" border="0" cellspacing="0" cellpadding="0" align="center" style="table-layout: fixed;
        overflow: hidden;">
        <tr>
            <td>
                <div id="feeds">
                    <form id="feedform" action="manage.aspx?feedback=1" method="post">
                    </form>
                    <form id="feeddelete" action="manage.aspx?feedback=2" method="post">
                    <input type="hidden" name="feedid" value="1" id="ffeedid" /></form>
                    <div id="fclose">
                        X</div>
                    <div class="ftitle">
                        feedbacks</div>
                    <div style="height: 475px; overflow: auto;" id="fcomman">
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <div id="oopen">
        <table width="1000" border="0" cellspacing="0" cellpadding="0" align="center" style="table-layout: fixed;
            overflow: hidden;">
            <tr>
                <td align="left">
                    <div class="panel-info">
                        <span style="color: #f57301">admin </span>panel</div>
                    <div class="panel-rainbow">
                        Rainbow Entertainments Inc.</div>
                    <div class="top-content">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="Panel1" runat="server">
                        <div class="admin-update">
                            <form id="form1" runat="server">
                            <asp:Button ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" /><span>update
                                seats for the shows on&nbsp;<span style="color: #5ad2fa"><%   Response.Write(DateTime.Now.AddDays(6).DayOfWeek + " - " + DateTime.Now.AddDays(6).Date.ToString("MMMM dd,yyyy")); %></span>
                            </span>
                            <div id="info-cls">
                            </div>
                            </form>
                        </div>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="set-control">
                        <div id="current-controls">
                            Status</div>
                        <div class="controls-links">
                            <div>
                                <a href="../logout.aspx?admin=1">logout</a></div>
                            <div id="feedback">
                                feedbacks</div>
                            <div id="show-manage">
                                manage shows</div>
                        </div>
                    </div>
                    <div id="smanage">
                        <div id="back-arrow">
                        </div>
                        <div id="current-control">
                            Manage</div>
                        <div class="control-links">
                            <div id="idupshow">
                                update shows</div>
                            <div id="iddelmovie">
                                delete movie</div>
                            <div id="idadmovie">
                                add movie</div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div>
                        <div class="next-link" id="view-link">
                            <div class="next-link-group">
                                <div id="next-screen">
                                    next screen</div>
                                <div id="prev-screen">
                                    previous screen</div>
                                <div id="next-date">
                                    next day</div>
                                <div id="prev-date">
                                    previous day</div>
                            </div>
                        </div>
                        <div id="view-status">
                            <% show_summary(); %>
                        </div>
                        <div id="show-management">
                            <img src="images/show-management.jpg" width="622" height="400" alt="show management" />
                        </div>
                        <div id="addmovie">
                            <iframe src="iframe_addmovie.aspx?msg=&s=" id="addframe" width="1000" height="450"
                                frameborder="0" border="0" cellspacing="0" style="border-style: none; position: relative;
                                bottom: 20px;"></iframe>
                        </div>
                        <div id="delmovie">
                            <form id="delmovform" method="post" action="manage.aspx?delmov=1">
                            <div style="float: left">
                                <div class="control-items">
                                    <div>
                                        select movie</div>
                                    <span>
                                        <select name="delmoviecontrol" id="iddelmoviecontrol">
                                            <%getSelectOptions(); %>
                                        </select>
                                    </span>
                                </div>
                                <div class="control-items-1">
                                    <input type="submit" value="Delete" id="delformsubmit" />
                                </div>
                                <div class="err-info" id="errdelmov">
                                </div>
                                <div id="delmovresp">
                                </div>
                            </div>
                            <div style="float: right; width: 300px; margin-right: 30px;">
                                <div style="font-size: 23px; color: #da8307">
                                    Delete a movie</div>
                                <ul class="ul-re">
                                    <li class="subinfo">Select a movie and click "Delete" to delete a permanently.</li>
                                    <li class="subinfo">If any movie not found on list, please refresh the page and try
                                        again.</li></ul>
                                <div style="font-size: 23px; margin: 5px 0 0 0; color: #c62510">
                                    Common errors</div>
                                <ul class="ul-re">
                                    <li class="subinfo">You are not allow to delete a movie which is running currently.</li>
                                    <li class="subinfo">Ensure that the selected movie is not assinged to any other running
                                        shows.</li>
                                    <li class="subinfo">Error may occur while trying to deleting related pictures, due to
                                        protection level.</li>
                                    <li class="subinfo">If any error occured manual deletion is required.</li>
                                </ul>
                            </div>
                            </form>
                        </div>
                        <div id="upshow">
                            <form id="upshowform" method="post" action="manage.aspx?upshow=1">
                            <div style="float: left">
                                <div style="color: #066ea3; font-size: 25px; padding: 0px 0 20px 30px">
                                    Updating Shows on&nbsp;<span style="color: #333"><%   Response.Write(DateTime.Now.AddDays(6).DayOfWeek + " - " + DateTime.Now.AddDays(6).Date.ToString("MMMM dd,yyyy")); %></span>
                                </div>
                                <div class="control-items">
                                    <div>
                                        select movie</div>
                                    <span>
                                        <select name="updatemovie" id="idupdatemovie">
                                            <%getSelectOptions(); %>
                                        </select>
                                    </span>
                                </div>
                                <div class="control-items">
                                    <div>
                                        select screen</div>
                                    <span>
                                        <select name="updatescreen" id="idupdatescreen">
                                            <%getSelectMovies(); %>
                                        </select>
                                    </span>
                                </div>
                                <div class="control-items">
                                    <div>
                                        select show</div>
                                    <span>
                                        <select name="updateshow" id="idupdateshow">
                                            <option value="-1">-select show-</option>
                                            <option value="ALL">All</option>
                                            <option value="MORNING">Morning Show</option>
                                            <option value="NOON">Noon Show</option>
                                            <option value="MATINEE">Matinee Show</option>
                                            <option value="EVENING">Evening Show</option>
                                            <option value="NIGHT">Night Show</option>
                                        </select>
                                    </span>
                                </div>
                                <div class="control-items-1">
                                    <input type="submit" value="Update" id="upshowsubmit" />
                                </div>
                                <div class="err-info" id="errupshw">
                                </div>
                                <div id="errupshow">
                                </div>
                            </div>
                            <div style="float: right; width: 300px; margin-right: 30px;">
                                <div style="font-size: 23px; color: #da8307">
                                    Update a Show</div>
                                <ul class="ul-re">
                                    <li class="subinfo">Updation of shows available on particular days only, because other
                                        shows are opened for booking.</li>
                                    <li class="subinfo">You can update a movie for all shows or particular show.</li>
                                    <li class="subinfo">Updation of seats required for new shows.</li></ul>
                                <div style="font-size: 23px; margin: 5px 0 0 0; color: #c62510">
                                    Common errors</div>
                                <ul class="ul-re">
                                    <li class="subinfo">Error may occur while updating show, due to error in database connectivity.</li>
                                    <li class="subinfo">If any error occured refresh the page and try again.</li>
                                </ul>
                            </div>
                            </form>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
     </div>
    <script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui-1.8.20.custom.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.cycle.all.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(window).load(function () { $("#aopen").fadeIn(700); cregister(); });
        $("#delmovie :input").focus(function () { $("#errdelmov").fadeOut(100); });
        $("#upshow :input").focus(function () { $("#errupshw").fadeOut(100); });
        $("#delformsubmit").click(function () {
            var a = document.getElementById("iddelmoviecontrol").value;
            if (a != "-1") { return true; } else {
                $("#errdelmov").text("select a movie to delete").fadeIn(200);
                return false
            }

        });
        $("#feedback").click(function () { $("#back").fadeIn(400); $('#feedform').submit(); });
        $("#fclose").click(function () { $("#feeds").fadeOut(400); $("#back").fadeOut(500); });
        $("#upshowsubmit").click(function () {
            var a = document.getElementById("idupdatemovie").value;
            var c = document.getElementById("idupdateshow").value;
            var b = document.getElementById("idupdatescreen").value;
            if (a != "-1") {
                if (b != "-1") {
                    if (c != "-1") {
                        return true;
                    } else {
                        $("#errupshw").text("select a show to update").fadeIn(200);
                        return false
                    }

                } else {
                    $("#errupshw").text("select a screen to update").fadeIn(200);
                    return false
                }
            } else {
                $("#errupshw").text("select a movie to add").fadeIn(200);
                return false
            }
        });
        $("#info-cls").click(function () {
            $("#Panel1").hide('blind', {
                duration: 500,
                easing: 'easeInOutBack'
            });
        });
        function cregister() {
            $("#view-status").cycle({
                speed: 'fast',
                fx: 'cover',
                next: '#next-date',
                prev: '#prev-date',
                timeout: 0
            });
            $(".show-content-view").cycle({
                speed: 'fast',
                fx: 'fade',
                next: '#next-screen',
                prev: '#prev-screen',
                timeout: 0
            });
        }
        $("#show-manage").click(function () {
            $("#set-control").fadeOut(400);
            $("#view-status").fadeOut(400);
            $("#view-link").fadeOut(400);
            $("#smanage").delay(500).fadeIn(400);
            $("#show-management").delay(500).fadeIn(400);
        });
        $("#back-arrow").click(function () {

            location.reload();
        });

        $(".control-links div").click(function () {
            var a = $(this).attr("id");
            $("#delmovresp").empty();
            $("#errupshow").empty();
            $("select").prop('selectedIndex', 0);

            $("#current-control").text($(this).text());
            $(this).siblings().removeClass();
            $(this).removeClass().addClass("control-select");

            if (a == "idadmovie") {
                var iframe = document.getElementById("addframe");
                iframe.src = iframe.src;
                $("#show-management").fadeOut(400);
                $("#upshow").fadeOut(400);
                $("#addmovie").delay(500).fadeIn(400);
                $("#delmovie").fadeOut(400);

            }
            else if (a == "iddelmovie") {
                $("#show-management").fadeOut(400);
                $("#delmovie").delay(500).fadeIn(400);
                $("#upshow").fadeOut(400);
                $("#addmovie").fadeOut(400);
            }
            else if (a == "idupshow") {
                $("#show-management").fadeOut(400);
                $("#delmovie").fadeOut(400);
                $("#addmovie").fadeOut(400);
                $("#upshow").delay(500).fadeIn(400);
            }
        });
        $(function () {
            $('#upshowform').submit(function () {
                $("#back").fadeIn(500);
                $.ajax({
                    url: this.action,
                    type: this.method,
                    data: $(this).serialize(),
                    success: function (result) {
                        $('#errupshow').html(result).fadeIn(400);
                        $("#back").delay(300).fadeOut(500);
                    }
                });
                return false;
            });
        });

        $(function () {
            $('#delmovform').submit(function () {
                $("#back").fadeIn(500);
                $.ajax({
                    url: this.action,
                    type: this.method,
                    data: $(this).serialize(),
                    success: function (result) {
                        $('#delmovresp').html(result).fadeIn(400);
                        $("#back").delay(300).fadeOut(500);
                    }
                });
                return false;
            });
        });
        function regsiter() {
            $("span").click(function () {

                if ($(this).hasClass("feedclass")) {
                    $("#ffeedid").attr("value", $(this).attr("id"));
                    $('#feeddelete').submit();
                }
            });
        }

        $(function () {
            $('#feeddelete').submit(function () {
                $("#fcomman").html();
                $.ajax({
                    url: this.action,
                    type: this.method,
                    data: $(this).serialize(),
                    success: function (result) {
                        $("#fcomman").html(result);

                        regsiter();

                    }
                });
                return false;
            });
        });
        $(function () {
            $('#feedform').submit(function () {
                $("#back").fadeIn(500);
                $.ajax({
                    url: this.action,
                    type: this.method,
                    data: $(this).serialize(),
                    success: function (result) {
                        $("#fcomman").html(result);
                        $("#feeds").fadeIn(300);
                        regsiter();

                    }
                });
                return false;
            });
        });
    </script>
</body>
</html>
