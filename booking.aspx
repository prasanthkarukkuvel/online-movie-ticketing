<%@ Page Language="C#" AutoEventWireup="true" CodeFile="booking.aspx.cs" Inherits="booking" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Images/fonts/fonts.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        ::-webkit-scrollbar
        {
            width: 10px;
        }
        ::-moz-scrollbar
        {
            width: 10px;
        }
        ::-webkit-scrollbar-thumb
        {
            -webkit-border-radius: 5px;
            background-color: #333;
            border: #444 thin solid;
        }
        ::-webkit-scrollbar-thumb:hover
        {
            background-color: #09C;
        }
        
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
            text-align:center;
            display: none;
        }
        #back img{margin-top:15px;}
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
        
        .top-index
        {
            width: 1000px;
        }
        
        #movie
        {
            margin-left: 30px;
        }
        
        #movie div
        {
            float: left;
        }
        
        #seat, #date, #mov, #show
        {
            width: 250px;
            height: 80px;
            font-family: "SegoeUI";
            font-size: 23px;
            position: absolute;
        }
        
        .passive
        {
            background: url(Images/generic.png) top no-repeat;
            color: #999;
        }
        
        .current
        {
            background: url(Images/generic.png) center -80px no-repeat;
            color: #fff;
        }
        
        .select
        {
            background: url(Images/generic.png) bottom no-repeat;
            color: #ccc;
        }
        
        .selected
        {
            cursor: pointer;
            color: #fff;
            background: url(Images/generic.png) 0 no-repeat;
        }
        
        .selected:hover
        {
            background: url(Images/generic.png) center -240px no-repeat;
        }
        
        .selected:active
        {
            background: url(Images/generic.png) top no-repeat;
        }
        
        #seat div, #date div, #mov div, #show div
        {
            padding: 20px 0 0 45px;
        }
        
        #mov
        {
            margin-left: 0px;
        }
        
        #date
        {
            margin-left: 230px;
        }
        
        #seat
        {
            margin-left: 460px;
        }
        
        #show
        {
            margin-left: 690px;
        }
        
        .lcon
        {
            width: 1000px;
            text-align: center;
            margin-top: 86px;
        }
        
        .layout
        {
            width: 990px;
            height: 500px;
            border: #151515 2px solid;
        }
        
        .layout-content
        {
            width: 984px;
            height: 494px;
            margin-top: 2px;
            margin-left: 2px;
            -webkit-box-shadow: 0px 0px 2px 1px #000;
            box-shadow: 0px 0px 2px 1px #000;
            border: #151515 thin solid;
            font-size: 14px;
            color: #999;
        }
        
        #movie-layout
        {
            background: #111;
            padding: 5px;
            position: relative;
            height: 483px;
        }
        
        #movie-layout-content
        {
            background: #141414;
            border: #222 solid thin;
            -webkit-box-shadow: 0px 0px 1px 1px #000;
            box-shadow: 0px 0px 1px 1px #000;
            height: 482px;
           overflow:auto;
            overflow-x: hidden;
        }
        
        #movie-view
        {
            margin-left: 65px;
        }
        
        #movie-view .mov-select, #movie-view .mov-selected
        {
            background: #141414;
            border: #222 solid thin;
            -webkit-box-shadow: 0px 0px 1px 1px #000;
            box-shadow: 0px 0px 1px 1px #000;
            width: 151px;
            height: 200px;
            margin: 10px 0 0 10px;
            float: left;
        }
        
        #movie-view .mov-select
        {
            cursor: pointer;
        }
        
        #movie-view .mov-select p, #movie-view .mov-selected p
        {
            width: 151px;
            height: 25px;
            border: #222 thin solid;
            color: #fff;
            position: relative;
            top: 3px;
            font-size: 15px;
            line-height: 25px;
            overflow: hidden;
            display: table-cell;
            -webkit-transition: all 0.2s ease-in-out;
            -moz-transition: all 0.2s ease-in-out;
            -ms-transition: all 0.2s ease-in-out;
            -o-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
        }
        
        #movie-view .mov-select p
        {
            background: #333333;
            background: url(data:image/svg+xml;
base64, PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzMzMzMzMyIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9Ijk4JSIgc3RvcC1jb2xvcj0iIzAwMDAwMCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiMyYjJiMmIiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
            background: -moz-linear-gradient(top, #333333 0%, #000000 98%, #2b2b2b 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #333333), color-stop(98%, #000000), color-stop(100%, #2b2b2b));
            background: -webkit-linear-gradient(top, #333333 0%, #000000 98%, #2b2b2b 100%);
            background: -o-linear-gradient(top, #333333 0%, #000000 98%, #2b2b2b 100%);
            background: -ms-linear-gradient(top, #333333 0%, #000000 98%, #2b2b2b 100%);
            background: linear-gradient(to bottom, #333333 0%, #000000 98%, #2b2b2b 100%);
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#333333', endColorstr='#2b2b2b', GradientType=0 );
        }
        
        .left-pan
        {
            float: left;
            width: 50px;
            text-align: center;
            background: #141414;
            border: #0a0a0a solid 2px;
            -webkit-box-shadow: 0px 0px 1px 1px #000;
            box-shadow: 0px 0px 1px 1px #222;
            margin: 10px 0 0 10px;
            border-radius: 10px;
        }
        
        #prev
        {
            background: url(Images/back.png) center no-repeat;
            width: 38px;
            height: 38px;
            opacity: 0.50;
            filter: alpha(opacity=50);
            -webkit-transition: all 0.2s ease-in-out;
            -moz-transition: all 0.2s ease-in-out;
            -ms-transition: all 0.2s ease-in-out;
            -o-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
            cursor: pointer;
            margin: 6px 0 6px 6px;
            display: none;
        }
        
        #prev:hover
        {
            opacity: 1;
            filter: alpha(opacity=100);
        }
        #home
        {
            background: url(Images/home.png) center no-repeat;
            width: 38px;
            height: 38px;
            opacity: 0.50;
            filter: alpha(opacity=50);
            display: block;
            -webkit-transition: all 0.2s ease-in-out;
            -moz-transition: all 0.2s ease-in-out;
            -ms-transition: all 0.2s ease-in-out;
            -o-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
            cursor: pointer;
            margin: 8px 0 6px 6px;
        }
        
        #home:hover
        {
            opacity: 1;
            filter: alpha(opacity=100);
        }
        
        #movie-view .mov-select:hover p
        {
            background: #8fc400;
            background: url(data:image/svg+xml;
base64, PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzhmYzQwMCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiM2NTkxMDAiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
            background: -moz-linear-gradient(top, #8fc400 0%, #659100 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #8fc400), color-stop(100%, #659100));
            background: -webkit-linear-gradient(top, #8fc400 0%, #659100 100%);
            background: -o-linear-gradient(top, #8fc400 0%, #659100 100%);
            background: -ms-linear-gradient(top, #8fc400 0%, #659100 100%);
            background: linear-gradient(to bottom, #8fc400 0%, #659100 100%);
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#8fc400', endColorstr='#659100', GradientType=0 );
        }
        
        #date-view
        {
            float: left;
            width: 700px;
            height: 200px;
            background: #141414;
            border: #0a0a0a solid 2px;
            -webkit-box-shadow: 0px 0px 1px 1px #000;
            box-shadow: 0px 0px 1px 1px #222;
            margin: 9px 0 0 10px;
            display: none;
        }
        
        .date-title
        {
            background: #2d2d2d;
            background: url(data:image/svg+xml;
base64, PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzJkMmQyZCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjQ2JSIgc3RvcC1jb2xvcj0iIzFjMWMxYyIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiMwMDAwMDAiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
            background: -moz-linear-gradient(top, #2d2d2d 0%, #1c1c1c 46%, #000000 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #2d2d2d), color-stop(46%, #1c1c1c), color-stop(100%, #000000));
            background: -webkit-linear-gradient(top, #2d2d2d 0%, #1c1c1c 46%, #000000 100%);
            background: -o-linear-gradient(top, #2d2d2d 0%, #1c1c1c 46%, #000000 100%);
            background: -ms-linear-gradient(top, #2d2d2d 0%, #1c1c1c 46%, #000000 100%);
            background: linear-gradient(to bottom, #2d2d2d 0%, #1c1c1c 46%, #000000 100%);
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#2d2d2d', endColorstr='#000000', GradientType=0 );
            font-size: 18px;
            padding: 0px 0 5px 20px;
            color: #fff;
            text-align: left;
        }
        
        #date-view .date-content
        {
            width: 680px;
            margin-left: 7px;
        }
        
        .date-avail, .date-unavail, .date-sel-cur
        {
            margin: 7px 0 0 7px;
            width: 160px;
            height: 72px;
            float: left;
            font-size: 22px;
            border: #222 thin solid;
            text-align: center;
        }
        
        .date-avail, .date-sel-cur
        {
            color: #fff;
            cursor: pointer;
        }
        
        .date-avail, .summary-info .content
        {
            background: #02acef;
            background: url(data:image/svg+xml;
base64, PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzAyYWNlZiIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiMwMDkwYmMiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
            background: -moz-linear-gradient(top, #02acef 0%, #0090bc 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #02acef), color-stop(100%, #0090bc));
            background: -webkit-linear-gradient(top, #02acef 0%, #0090bc 100%);
            background: -o-linear-gradient(top, #02acef 0%, #0090bc 100%);
            background: -ms-linear-gradient(top, #02acef 0%, #0090bc 100%);
            background: linear-gradient(to bottom, #02acef 0%, #0090bc 100%);
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#02acef', endColorstr='#0090bc', GradientType=0 );
        }
        
        .date-sel-cur
        {
            background: #ff8138;
            background: url(data:image/svg+xml;
base64, PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIxJSIgc3RvcC1jb2xvcj0iI2ZmODEzOCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNhODUxMDAiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
            background: -moz-linear-gradient(top, #ff8138 1%, #a85100 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(1%, #ff8138), color-stop(100%, #a85100));
            background: -webkit-linear-gradient(top, #ff8138 1%, #a85100 100%);
            background: -o-linear-gradient(top, #ff8138 1%, #a85100 100%);
            background: -ms-linear-gradient(top, #ff8138 1%, #a85100 100%);
            background: linear-gradient(to bottom, #ff8138 1%, #a85100 100%);
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ff8138', endColorstr='#a85100', GradientType=0 );
        }
        
        .date-avail p, .date-unavail p, .date-sel-cur p
        {
            text-align: center;
            margin-left: 7px;
            padding-bottom: 2px;
            width: 146px;
            position: relative;
            bottom: 16px;
            background: #222;
        }
        
        #date-selected, #seat-view, #show-summary, #show-view, .show-content
        {
            width: 700px;
            background: #141414;
            border: #0a0a0a solid 2px;
            -webkit-box-shadow: 0px 0px 1px 1px #222;
            box-shadow: 0px 0px 1px 1px #222;
            text-align: left;
        }
        
        #date-selected, #seat-view, #show-summary
        {
            margin: 10px 0 0 240px;
        }
        
        #date-selected #selected-movie, #date-selected #selected-date
        {
            display: inline-block;
            background: #02acef;
            background: url(data:image/svg+xml;
base64, PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzAyYWNlZiIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiMwMDkwYmMiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
            background: -moz-linear-gradient(top, #02acef 0%, #0090bc 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #02acef), color-stop(100%, #0090bc));
            background: -webkit-linear-gradient(top, #02acef 0%, #0090bc 100%);
            background: -o-linear-gradient(top, #02acef 0%, #0090bc 100%);
            background: -ms-linear-gradient(top, #02acef 0%, #0090bc 100%);
            background: linear-gradient(to bottom, #02acef 0%, #0090bc 100%);
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#02acef', endColorstr='#0090bc', GradientType=0 );
            padding: 5px 15px 5px 15px;
            margin: 10px 0px 10px 10px;
            font-size: 17px;
            color: #fff;
            border: #000 thin solid;
        }
        
        #select-info-seat
        {
            display: none;
        }
        
        .seat-content
        {
            margin-left: 15px;
        }
        
        .seat-content .select-seat, .seat-content .selected-seat
        {
            width: 45px;
            height: 45px;
            display: inline-block;
            text-align: center;
            font-size: 25px;
            margin: 10px 0 12px 15px;
            border: #222 thin solid;
            line-height: 40px;
            -webkit-box-shadow: 0px 0px 3px 1px #222;
            box-shadow: 0px 0px 3px 1px #000;
            color: #fff;
            -webkit-transition: all 0.2s ease-in-out;
            -moz-transition: all 0.2s ease-in-out;
            -ms-transition: all 0.2s ease-in-out;
            -o-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
            cursor: pointer;
        }
        
        .seat-content .select-seat
        {
            background: #333333;
            background: url(data:image/svg+xml;
base64, PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzMzMzMzMyIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9Ijk4JSIgc3RvcC1jb2xvcj0iIzAwMDAwMCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiMyYjJiMmIiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
            background: -moz-linear-gradient(top, #333333 0%, #000000 98%, #2b2b2b 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #333333), color-stop(98%, #000000), color-stop(100%, #2b2b2b));
            background: -webkit-linear-gradient(top, #333333 0%, #000000 98%, #2b2b2b 100%);
            background: -o-linear-gradient(top, #333333 0%, #000000 98%, #2b2b2b 100%);
            background: -ms-linear-gradient(top, #333333 0%, #000000 98%, #2b2b2b 100%);
            background: linear-gradient(to bottom, #333333 0%, #000000 98%, #2b2b2b 100%);
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#333333', endColorstr='#2b2b2b', GradientType=0 );
        }
        
        .seat-content .select-seat:hover, .seat-content .selected-seat, #selection-submit
        {
            background: #ff8138;
            background: url(data:image/svg+xml;
base64, PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIxJSIgc3RvcC1jb2xvcj0iI2ZmODEzOCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNhODUxMDAiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
            background: -moz-linear-gradient(top, #ff8138 1%, #a85100 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(1%, #ff8138), color-stop(100%, #a85100));
            background: -webkit-linear-gradient(top, #ff8138 1%, #a85100 100%);
            background: -o-linear-gradient(top, #ff8138 1%, #a85100 100%);
            background: -ms-linear-gradient(top, #ff8138 1%, #a85100 100%);
            background: linear-gradient(to bottom, #ff8138 1%, #a85100 100%);
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ff8138', endColorstr='#a85100', GradientType=0 );
        }
        
        #show-summary
        {
            height: 198px;
            display: none;
        }
        
        .summary-info
        {
            height: 50px;
            width: 660px;
            margin: 20px 0 0 20px;
        }
        
        .summary-info
        {
            -webkit-box-shadow: 0px 0px 3px 1px #000;
            box-shadow: 0px 0px 3px 1px #000;
            border-top: #222 1px solid;
            border-bottom: #111 2px solid;
            background: #383838;
            background: url(data:image/svg+xml;
base64, PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzM4MzgzOCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjIlIiBzdG9wLWNvbG9yPSIjMTQxNDE0IiBzdG9wLW9wYWNpdHk9IjEiLz4KICAgIDxzdG9wIG9mZnNldD0iMiUiIHN0b3AtY29sb3I9IiMxYzFjMWMiIHN0b3Atb3BhY2l0eT0iMSIvPgogICAgPHN0b3Agb2Zmc2V0PSIxMDAlIiBzdG9wLWNvbG9yPSIjMGYwZjBmIiBzdG9wLW9wYWNpdHk9IjEiLz4KICA8L2xpbmVhckdyYWRpZW50PgogIDxyZWN0IHg9IjAiIHk9IjAiIHdpZHRoPSIxIiBoZWlnaHQ9IjEiIGZpbGw9InVybCgjZ3JhZC11Y2dnLWdlbmVyYXRlZCkiIC8+Cjwvc3ZnPg==);
            background: -moz-linear-gradient(top, #383838 0%, #141414 2%, #1c1c1c 2%, #0f0f0f 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #383838), color-stop(2%, #141414), color-stop(2%, #1c1c1c), color-stop(100%, #0f0f0f));
            background: -webkit-linear-gradient(top, #383838 0%, #141414 2%, #1c1c1c 2%, #0f0f0f 100%);
            background: -o-linear-gradient(top, #383838 0%, #141414 2%, #1c1c1c 2%, #0f0f0f 100%);
            background: -ms-linear-gradient(top, #383838 0%, #141414 2%, #1c1c1c 2%, #0f0f0f 100%);
            background: linear-gradient(to bottom, #383838 0%, #141414 2%, #1c1c1c 2%, #0f0f0f 100%);
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#383838', endColorstr='#0f0f0f', GradientType=0 );
            float: left;
        }
        
        .summary-info .title, .summary-info .content
        {
            float: left;
            position: relative;
        }
        
        .summary-info .title
        {
            width: 60px;
            font-size: 18px;
            margin: 0px 0 0 15px;
            height: 50px;
            top: 10px;
            color: #fff;
        }
        
        .summary-info .content
        {
            padding: 5px 15px 5px 15px;
            font-size: 17px;
            color: #fff;
            border: #000 thin solid;
            top: 7px;
        }
        
        #selection-submit
        {
            font-size: 22px;
            color: #fff;
            width: 160px;
            height: 52px;
            border-radius: 5px;
            text-indent: 30px;
            line-height: 50px;
            cursor: pointer;
            float: left;
            -webkit-transition: all 0.2s ease-in-out;
            -moz-transition: all 0.2s ease-in-out;
            -ms-transition: all 0.2s ease-in-out;
            -o-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
        }
        
        #selection-submit div
        {
            background: url(Images/next_submit.png);
            width: 30px;
            height: 30px;
            float: left;
            position: relative;
            top: 10px;
            left: 15px;
        }
        
        #show-view
        {
            margin: 15px 0 0 25px;
            position: absolute;
            z-index: 500;
            width: 950px;
            display: none;
        }
        .show-content-view
        {
            width: 950px;
            height: 500px;
           overflow:auto;
            overflow-x: hidden;
        }
        .show-content
        {
            width: 900px;
            height: 50px;
            margin-right: 1px;
            text-align: center;
            margin: 5px 0 0 5px;
        }
        .show-screen
        {
            background: url(manage/images/screen-detail.png) left no-repeat;
            float: left;
            width: 130px;
            font-size: 25px;
            margin: 7px 0 0 15px;
            text-indent: 30px;
        }
        .show-content-avail, .show-content-unavail
        {
            color: #fff;
            float: left;
            font-size: 15px;
            width: 740px;
            height: 40px;
            margin: 2px 0 0 5px;
            text-align: center;
        }
        .show-content-avail div, .show-content-unavail div
        {
            float: left;
        }
        
        .show-content-avail > div:first-child, .show-content-unavail > div:first-child
        {
            width: 130px;
            font-size: 18px;
            height: 30px;
            color: #fff;
            margin: 5px 0 0 0px;
            text-transform: capitalize;
            -webkit-box-shadow: 0px 0px 1px 1px #000;
            box-shadow: 0px 0px 1px 1px #000;
            border: #111 2px solid;
        }
        .show-content-avail > div
        {
            text-align: center;
            width: 90px;
            font-size: 16px;
            height: 30px;
            color: #fff;
            margin: 9px 0 0 7px;
            line-height: 28px;
        }
        .show-content-unavail > div:nth-child(2)
        {
            width: 500px;
        }
        .show-content-avail > div:nth-child(4)
        {
            width: 300px;
            font-size: 14px;
        }
        .show-content-unavail > div:nth-child(2)
        {
            padding: 5px;
            text-align: left;
            margin: 2px 0 0 50px;
            color: #e5250c;
            font-size: 23px;
        }
        .show-content-avail > a div
        {
            width: 85px;
            font-size: 16px;
            height: 28px;
            color: #fff;
            line-height: 27px;
            -webkit-box-shadow: 0px 0px 1px 1px #111;
            box-shadow: 0px 0px 1px 1px #111;
            border: #000 2px solid;
            margin: 7px 0 0 10px;
            border-radius: 5px;
            -moz-border-radius: 5px;
        }
        
        .date-avail, .summary-info .content, .show-content-avail > a div
        {
            background: #00aded;
            background: url(data:image/svg+xml;
base64, PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIyJSIgc3RvcC1jb2xvcj0iIzAwYWRlZCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiMwMDZlYTUiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
            background: -moz-linear-gradient(top, #00aded 2%, #006ea5 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(2%, #00aded), color-stop(100%, #006ea5));
            background: -webkit-linear-gradient(top, #00aded 2%, #006ea5 100%);
            background: -o-linear-gradient(top, #00aded 2%, #006ea5 100%);
            background: -ms-linear-gradient(top, #00aded 2%, #006ea5 100%);
            background: linear-gradient(to bottom, #00aded 2%, #006ea5 100%);
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00aded', endColorstr='#006ea5', GradientType=0 );
        }
        .show-content-avail > a div:hover
        {
            background: #87e0fd; /* Old browsers */ /* IE9 SVG, needs conditional override of 'filter' to 'none' */
            background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzg3ZTBmZCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjElIiBzdG9wLWNvbG9yPSIjNTNjYmYxIiBzdG9wLW9wYWNpdHk9IjEiLz4KICAgIDxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iIzA1YWJlMCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgPC9saW5lYXJHcmFkaWVudD4KICA8cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIiBmaWxsPSJ1cmwoI2dyYWQtdWNnZy1nZW5lcmF0ZWQpIiAvPgo8L3N2Zz4=);
            background: -moz-linear-gradient(top,  #87e0fd 0%, #53cbf1 1%, #05abe0 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#87e0fd), color-stop(1%,#53cbf1), color-stop(100%,#05abe0)); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(top,  #87e0fd 0%,#53cbf1 1%,#05abe0 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(top,  #87e0fd 0%,#53cbf1 1%,#05abe0 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(top,  #87e0fd 0%,#53cbf1 1%,#05abe0 100%); /* IE10+ */
            background: linear-gradient(to bottom,  #87e0fd 0%,#53cbf1 1%,#05abe0 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#87e0fd', endColorstr='#05abe0',GradientType=0 ); /* IE6-8 */
        }
        .show-content-avail > a div:active
        {
            background: #025c8d;
        }
        #movie-view .mov-selected p, #selection-submit:hover, .show-content-avail > div:first-child
        {
            background: #8fc400;
            background: url(data:image/svg+xml;
base64, PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHR wOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0i MTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9 uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncm FkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSI wJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI zhmYzQwMCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjAlIiB zdG9wLWNvbG9yPSIjNmNiZjAwIiBzdG9wLW9wYWNpdHk9IjEiLz4KICAgIDxzd G9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iIzQzNmIwMCIgc3RvcC1vcGFja XR5PSIxIi8+CiAgPC9saW5lYXJHcmFkaWVudD4KICA8cmVjdCB4PSIwIiB5PSIwIi B3aWR0aD0iMSIgaGVpZ2h0PSIxIiBmaWxsPSJ1cmwoI2dyYWQtdWNnZy1nZ W5lcmF0ZWQpIiAvPgo8L3N2Zz4=);
            background: -moz-linear-gradient(top, #8fc400 0%, #6cbf00 0%, #436b00 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #8fc400), color-stop(0%, #6cbf00), color-stop(100%, #436b00));
            background: -webkit-linear-gradient(top, #8fc400 0%, #6cbf00 0%, #436b00 100%);
            background: -o-linear-gradient(top, #8fc400 0%, #6cbf00 0%, #436b00 100%);
            background: -ms-linear-gradient(top, #8fc400 0%, #6cbf00 0%, #436b00 100%);
            background: linear-gradient(to bottom, #8fc400 0%, #6cbf00 0%, #436b00 100%);
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#8fc400', endColorstr='#436b00', GradientType=0 );
        }
        .show-content-unavail > div:first-child
        {
            background: #f91d00; /* Old browsers */ /* IE9 SVG, needs conditional override of 'filter' to 'none' */
            background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIxJSIgc3RvcC1jb2xvcj0iI2Y5MWQwMCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiM5MzAwMDAiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
            background: -moz-linear-gradient(top,  #f91d00 1%, #930000 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(1%,#f91d00), color-stop(100%,#930000)); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(top,  #f91d00 1%,#930000 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(top,  #f91d00 1%,#930000 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(top,  #f91d00 1%,#930000 100%); /* IE10+ */
            background: linear-gradient(to bottom,  #f91d00 1%,#930000 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f91d00', endColorstr='#930000',GradientType=0 ); /* IE6-8 */
        }
        #selected-date-avail
        {
            color: #58d2f8;
            margin-left: 10px;
        }
        #show-view-close
        {
            text-transform: uppercase;
            font-size: 20px;
            right: 10px;
            position: relative;
            bottom: 2px;
            color: #777;
            text-shadow: 1px 1px 4px #171616;
            filter: dropshadow(color=#171616, offx=1, offy=1);
            cursor: pointer;
            float: right;
        }
        #show-view-close:hover
        {
            color: #fff;
        }
        #popen
        {
            display: none;
        }
        .show-content-view > p:first-child{ padding:10px 30px; color:#ec3a22;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="popen">
        <div id="back">
         <img src="Images/flyingdots.gif"  width="1000" height="5" alt=""/>
        </div>
        <div id="secback">
        </div>
        <table width="1000" border="0" cellspacing="0" cellpadding="0" align="center" style="table-layout: fixed;
            overflow: hidden; margin-top: 10px;">
            <tr>
                <td align="center">
                    <div id="movie">
                        <div class="current" id="mov">
                            <div>
                                Select your movie
                            </div>
                        </div>
                        <div class="passive" id="date">
                            <div>
                                Select your date
                            </div>
                        </div>
                        <div class="passive" id="seat">
                            <div>
                                Select your seats
                            </div>
                        </div>
                        <div class="passive" id="show">
                            <div>
                                Select your show
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="show-view">
                        <div class="date-title">
                            available shows on <span id="selected-date-avail"></span>
                            <div id="show-view-close">
                                X</div>
                        </div>
                        <div class="show-content-view" id="show-content-view-text">
                            <div class="show-content">
                                <p class="show-screen">
                                    infuse</p>
                                <div class="show-content-avail">
                                    <div>
                                        Wednesday</div>
                                    <div>
                                        02:00:00 AM</div>
                                    <div>
                                        00 Seats</div>
                                    <div>
                                        Rs. 120 * 00 tickets + 000 charges = Rs. 0000</div>
                                    <a href="#">
                                        <div>
                                            book now</div>
                                    </a>
                                </div>
                            </div>
                            <div class="show-content">
                                <p class="show-screen">
                                    infuse</p>
                                <div class="show-content-unavail">
                                    <div>
                                        Matinee Show</div>
                                    <div>
                                        Selected no. of tickets not available</div>
                                </div>
                            </div>
                        </div>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <div class="lcon">
                        <div class="layout">
                            <div class="layout-content">
                                <div id="movie-layout">
                                    <div id="movie-layout-content">
                                        <div class="left-pan">
                                            <div id="prev">
                                            </div>
                                            <a id="home" href="index.aspx"></a>
                                        </div>
                                        <div id="movie-view">
                                            <% getMovieDetails(); %>
                                        </div>
                                        <div id="date-view">
                                            <div class="date-title">
                                                available dates
                                            </div>
                                            <div class="date-content">
                                                <%getDateDetails();%>
                                            </div>
                                        </div>
                                        <div id="select-info-seat">
                                            <div id="date-selected">
                                                <div class="date-title">
                                                    selected date and movie
                                                </div>
                                                <div id="selected-date">
                                                </div>
                                                <div id="selected-movie">
                                                </div>
                                            </div>
                                            <div id="seat-view">
                                                <div class="date-title">
                                                    select number of tickets <span style="color: #666;">( max 10 ) </span>
                                                </div>
                                                <div class="seat-content">
                                                    <div class="select-seat">
                                                        1
                                                    </div>
                                                    <div class="select-seat">
                                                        2
                                                    </div>
                                                    <div class="select-seat">
                                                        3
                                                    </div>
                                                    <div class="select-seat">
                                                        4
                                                    </div>
                                                    <div class="select-seat">
                                                        5
                                                    </div>
                                                    <div class="select-seat">
                                                        6
                                                    </div>
                                                    <div class="select-seat">
                                                        7
                                                    </div>
                                                    <div class="select-seat">
                                                        8
                                                    </div>
                                                    <div class="select-seat">
                                                        9
                                                    </div>
                                                    <div class="select-seat">
                                                        10
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="show-summary">
                                            <div class="summary-content">
                                                <div class="date-title">
                                                    your selection <span style="color: #666;">&nbsp; movie, date and seats </span>
                                                </div>
                                                <div class="summary-info">
                                                    <div class="title">
                                                        Movie
                                                    </div>
                                                    <div id="summary-movie" class="content">
                                                    </div>
                                                </div>
                                                <div class="summary-info" style="width: 310px">
                                                    <div class="title">
                                                        Date
                                                    </div>
                                                    <div id="summary-date" class="content">
                                                    </div>
                                                </div>
                                                <div class="summary-info" style="width: 150px">
                                                    <div class="title">
                                                        Seats
                                                    </div>
                                                    <div id="summary-seat" class="content">
                                                    </div>
                                                </div>
                                                <div class="summary-info" id="submit-selection" style="width: 160px">
                                                    <div id="selection-submit">
                                                        Proceed
                                                        <div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    </form>
    <form method="post" action="process_select.aspx" id="submit_form_select">
    <input id="s_select_form_movie" name="select_form_movie" value="id" type="hidden" />
    <input id="s_select_form_date" name="select_form_date" value="id" type="hidden" />
    <input id="s_select_form_seat" name="select_form_seat" value="id" type="hidden" />
    </form>
    <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui-1.8.20.custom.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.easing.compatibility.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(window).load(function () {
            $("#popen").fadeIn(500);
        });
        $(function () {
            $('#submit_form_select').submit(function () {
                $("#back").fadeIn(500);
                $.ajax({
                    url: this.action,
                    type: this.method,
                    data: $(this).serialize(),
                    success: function (result) {
                        $('#show-content-view-text').html(result);
                        $("#show-view").delay(300).fadeIn(300);
                    }
                });
                return false;
            });
        });
        $("#show-view-close").click(function () {
            $("#back").fadeOut(200);
            $("#show-view").fadeOut(300);
            $("#submit-selection").fadeIn(200);
        });
        $("#selection-submit").click(function () {
            $("#submit-selection").fadeOut(200);
            $("#submit_form_select").submit();
        });
        $("#prev").click(function () {
            var a = $(".current").prev().attr("id");
            var b = $(".current").attr("id");
            if (b != "mov") {
                if (b == "date") {
                    $("#date-view").fadeOut(400);
                    $("#movie-view div").delay(500).each(function (a, b) {
                        $(this).removeClass().addClass("mov-select");
                        $(this).show("slide", { direction: "left", easing: 'easeOutExpo' }, 800);
                    });
                    $("#prev").fadeOut(400)
                } else if (b == "seat") {
                    $("#select-info-seat").fadeOut(400);
                    $("#date-view").delay(500).fadeIn(400)
                } else if (b == "show") {
                    $("#show-summary").fadeOut(400);
                    $("#select-info-seat").delay(500).fadeIn(400);
                    $("#show-view").fadeOut(400);
                }
                $(".current").removeClass().addClass("passive");
                $("#" + a).removeClass().addClass("current");
                $("#" + a).prev().removeClass().addClass("selected")
            }
        });
        $("div").click(function () {
            var a;
            if ($(this).hasClass("selected")) {
                a = $(this).next().attr("id");
                b = $(this).prev().attr("id");
                c = $(this).next().attr("class");
                d = $(this).attr("id");
                if (c == "current") {
                    if (d == "mov") {
                        $("#date-view").fadeOut(400);
                        $("#movie-view div").delay(500).each(function (a, b) {
                            $(this).removeClass().addClass("mov-select");
                            $(this).show("slide", { direction: "left", easing: 'easeOutExpo' }, 800);
                        });
                        $("#prev").fadeOut(400)
                    } else if (d == "date") {
                        $("#select-info-seat").fadeOut(400);
                        $("#date-view").delay(500).fadeIn(400)
                    } else if (d == "seat") {
                        $("#show-summary").fadeOut(400);
                        $("#show-view").fadeOut(400);
                        $("#select-info-seat").delay(500).fadeIn(400)
                    }
                    $("#" + a).removeClass().addClass("passive");
                    $(this).removeClass().addClass("current");
                    $("#" + b).removeClass().addClass("selected")
                }
            } else if ($(this).hasClass("date-avail") || $(this).hasClass("date-sel-cur")) {
                var a = $(".current").attr("id");
                $(".date-sel-cur").removeClass().addClass("date-avail");
                $(this).removeClass().addClass("date-sel-cur");
                var e = document.getElementById($(this).attr("id"));
                if (a != "show") {
                    if (a == "date") {
                        $("#date-view").fadeOut(400);
                        $("#selected-movie").text($(".mov-selected img").attr("name"));
                        $("#selected-date").text(e.dataset.name);
                        $("#selected-date-avail").text(e.dataset.name);
                        $("#select-info-seat").delay(500).fadeIn(400)
                    }
                    $(".current").next().removeClass().addClass("current");
                    $("#" + a).removeClass().addClass("selected");
                    $("#" + a).prev().removeClass().addClass("select");
                    $("#s_select_form_date").val($(this).attr("id"));
                }
            } else if ($(this).hasClass("mov-select")) {
                var a = $(".current").attr("id");
                $(this).removeClass().addClass("mov-selected");
                if (a != "show") {
                    $(".current").next().removeClass().addClass("current");
                    $("#" + a).removeClass().addClass("selected");
                    $("#" + a).prev().removeClass().addClass("select");
                    $("#s_select_form_movie").val($(this).attr("id"));
                }
                $(this).siblings("div").fadeOut(400);
                $("#prev").fadeIn(400);
                $("#date-view").delay(500).show("slide", { direction: "left", easing: 'easeOutExpo' }, 800);

            } else if ($(this).hasClass("select-seat") || $(this).hasClass("selected-seat")) {
                $(this).siblings().removeClass().addClass("select-seat");
                $(this).removeClass().addClass("selected-seat");
                var e = document.getElementById($(".date-sel-cur").attr("id"));
                var a = $(".current").attr("id");
                if (a != "show") {
                    $(".current").next().removeClass().addClass("current");
                    $("#" + a).removeClass().addClass("selected");
                    $("#" + a).prev().removeClass().addClass("select")
                }
                $("#s_select_form_seat").val($(this).text());
                $("#summary-movie").text($(".mov-selected img").attr("name"));
                $("#summary-date").text(e.dataset.name);
                $("#summary-seat").text($(".selected-seat").text());
                $("#submit-selection").fadeIn(200);
                $("#select-info-seat").fadeOut(400);
                $("#show-summary").delay(500).fadeIn(400);
            }
        })
    </script>
</body>
</html>
