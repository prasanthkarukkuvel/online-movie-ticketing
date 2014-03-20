<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pageview.aspx.cs" Inherits="nowshowing" %>

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
            border: #111 thin solid;
        }
        ::-webkit-scrollbar-thumb:hover
        {
            background-color: #f57301;
        }
        
        body
        {
            width: 100%;
            margin: 0;
            padding: 0;
            font: 18px "SegoeUI" , "SegoeUI-SemiBold";
            background: #121212;
            color: #333;
            overflow: hidden;
            -webkit-user-select: none;
        }
        
        a
        {
            color: #000;
            text-decoration: none;
            font: 22px "SegoeUI";
        }
        
        a:active
        {
            color: #000;
        }
        
        a:visited
        {
            color: #000;
        }
        
        a:hover
        {
            color: #000;
            text-decoration: none;
        }
        .about-left-pan a, .about-right-pan a
        {
            color: #aaa;
            text-decoration: none;
            font: 16px "SegoeUI";
        }
        
        .about-left-pan a:active, .about-right-pan a:active
        {
            color: #aaa;
        }
        
        .about-left-pan a:visited, .about-right-pan a:visited
        {
            color: #aaa;
        }
        
        .about-left-pan a:hover, .about-right-pan a:hover
        {
            color: #fff;
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
            margin-left: 20px;
        }
        
        .panel-info span
        {
            color: #FFF;
        }
        
        #back
        {
            background: url(images/back_white.png) left no-repeat;
            display: block;
            width: 48px;
            height: 48px;
            float: left;
            margin-top: 20px;
            opacity: 0.5;
        }
        
        #back:hover
        {
            opacity: 1;
        }
        
        #back:active
        {
            opacity: 0.5;
        }
        
        .left-pan
        {
            float: left;
            margin: 15px 0 0 20px;
            width: 720px;
            height: 520px;
            overflow: scroll;
            overflow-x: hidden;
        }
        .left-pan-shadow
        {
            margin: 15px 0 0 33px;
            width: 665px;
            height: 520px;
            position: absolute;
            border: #1c1c1c thin solid;
            -moz-box-shadow: inset 0 0 18px #000000;
            -webkit-box-shadow: inset 0 0px 18px #000000;
            box-shadow: inset 0 0px 18px #000000;
            display: none;
        }
        
        .right-pan
        {
            float: right;
            margin: 10px 50px 0 20px;
            width: 180px;
        }
        .about-left-pan
        {
            float: left;
            margin: 15px 0 0 20px;
            width: 620px;
            height: 520px;
        }
        .about-right-pan
        {
            float: right;
            margin: 10px 20px 0 0px;
            width: 300px;
            height: 520px;
        }
        .show-view
        {
            width: 680px;
        }
        
        .show-view > div
        {
            width: 320px;
            height: 180px;
            float: left;
            margin: 2px 0 13px 15px;
            background: #0c0c0c; /* Old browsers */ /* IE9 SVG, needs conditional override of 'filter' to 'none' */
            background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzBjMGMwYyIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjU0JSIgc3RvcC1jb2xvcj0iIzM1MDMwMCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9Ijg4JSIgc3RvcC1jb2xvcj0iIzY2MjUwMCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9Ijg4JSIgc3RvcC1jb2xvcj0iIzNkMDEwMCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiMzMzA5MDAiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
            background: -moz-linear-gradient(top, #0c0c0c 0%, #350300 54%, #662500 88%, #3d0100 88%, #330900 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #0c0c0c), color-stop(54%, #350300), color-stop(88%, #662500), color-stop(88%, #3d0100), color-stop(100%, #330900)); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(top, #0c0c0c 0%, #350300 54%, #662500 88%, #3d0100 88%, #330900 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(top, #0c0c0c 0%, #350300 54%, #662500 88%, #3d0100 88%, #330900 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(top, #0c0c0c 0%, #350300 54%, #662500 88%, #3d0100 88%, #330900 100%); /* IE10+ */
            background: linear-gradient(to bottom, #0c0c0c 0%, #350300 54%, #662500 88%, #3d0100 88%, #330900 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#0c0c0c', endColorstr='#330900', GradientType=0 ); /* IE6-8 */
            border: #0a0a0a solid 2px;
            -webkit-box-shadow: 0px 0px 1px 1px #1c1c1c;
            box-shadow: 0px 0px 1px 1px #1c1c1c;
        }
        
        .show-view > div > img
        {
            border: #111 3px solid;
            width: 110px;
            height: 125px;
            float: left;
        }
        
        .show-view > div > div
        {
            width: 194px;
            float: right;
            background: #141414; /* Old browsers */ /* IE9 SVG, needs conditional override of 'filter' to 'none' */
            background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzE0MTQxNCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiMyMzIzMjMiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
            background: -moz-linear-gradient(top, #141414 0%, #232323 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #141414), color-stop(100%, #232323)); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(top, #141414 0%, #232323 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(top, #141414 0%, #232323 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(top, #141414 0%, #232323 100%); /* IE10+ */
            background: linear-gradient(to bottom, #141414 0%, #232323 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#141414', endColorstr='#232323', GradientType=0 ); /* IE6-8 */
            margin: 4px 4px 0 0;
            height: 130px;
            border: #111 thin solid;
            color: #CCC;
        }
        
        .show-view > div > div > p
        {
            font-size: 16px;
            margin: 7px 0 0 5px; /* IE9 SVG, needs conditional override of 'filter' to 'none' */ /* IE9 SVG, needs conditional override of 'filter' to 'none' */
            border-left: #C60 3px solid;
            text-indent: 20px;
        }
        
        .show-view > div > p
        {
            width: 310px;
            background: #232323; /* Old browsers */ /* IE9 SVG, needs conditional override of 'filter' to 'none' */
            background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzIzMjMyMyIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiMxNDE0MTQiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
            background: -moz-linear-gradient(top, #232323 0%, #141414 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #232323), color-stop(100%, #141414)); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(top, #232323 0%, #141414 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(top, #232323 0%, #141414 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(top, #232323 0%, #141414 100%); /* IE10+ */
            background: linear-gradient(to bottom, #232323 0%, #141414 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#232323', endColorstr='#141414', GradientType=0 ); /* IE6-8 */
            height: 39px;
            margin: 135px 0 0 4px;
            border: #111 thin solid;
            color: #fff;
            text-align: center;
            line-height: 37px;
        }
        
        .button
        {
            width: 180px;
            height: 60px;
            display: block;
            border-radius: 10px;
            border: #d66807 1px solid;
            font: 23px "SegoeUI-SemiBold";
            color: #000;
            line-height: 55px;
            text-align: center;
            background: rgb(247,198,158); /* Old browsers */ /* IE9 SVG, needs conditional override of 'filter' to 'none' */
            background: rgb(247,198,158); /* Old browsers */ /* IE9 SVG, needs conditional override of 'filter' to 'none' */
            background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIxJSIgc3RvcC1jb2xvcj0iI2Y3YzY5ZSIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjUwJSIgc3RvcC1jb2xvcj0iI2ZmOTQzZCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjUwJSIgc3RvcC1jb2xvcj0iI2Y3NzcwMCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjU1JSIgc3RvcC1jb2xvcj0iI2ZjODYyNSIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9Ijc4JSIgc3RvcC1jb2xvcj0iI2Y3NzcwMCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9Ijk3JSIgc3RvcC1jb2xvcj0iI2M5NjQwMCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9Ijk5JSIgc3RvcC1jb2xvcj0iI2FhNTIwMCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNkMTNlMjciIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
            background: -moz-linear-gradient(top, rgba(247,198,158,1) 1%, rgba(255,148,61,1) 50%, rgba(247,119,0,1) 50%, rgba(252,134,37,1) 55%, rgba(247,119,0,1) 78%, rgba(201,100,0,1) 97%, rgba(170,82,0,1) 99%, rgba(209,62,39,1) 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(1%, rgba(247,198,158,1)), color-stop(50%, rgba(255,148,61,1)), color-stop(50%, rgba(247,119,0,1)), color-stop(55%, rgba(252,134,37,1)), color-stop(78%, rgba(247,119,0,1)), color-stop(97%, rgba(201,100,0,1)), color-stop(99%, rgba(170,82,0,1)), color-stop(100%, rgba(209,62,39,1))); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(top, rgba(247,198,158,1) 1%, rgba(255,148,61,1) 50%, rgba(247,119,0,1) 50%, rgba(252,134,37,1) 55%, rgba(247,119,0,1) 78%, rgba(201,100,0,1) 97%, rgba(170,82,0,1) 99%, rgba(209,62,39,1) 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(top, rgba(247,198,158,1) 1%, rgba(255,148,61,1) 50%, rgba(247,119,0,1) 50%, rgba(252,134,37,1) 55%, rgba(247,119,0,1) 78%, rgba(201,100,0,1) 97%, rgba(170,82,0,1) 99%, rgba(209,62,39,1) 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(top, rgba(247,198,158,1) 1%, rgba(255,148,61,1) 50%, rgba(247,119,0,1) 50%, rgba(252,134,37,1) 55%, rgba(247,119,0,1) 78%, rgba(201,100,0,1) 97%, rgba(170,82,0,1) 99%, rgba(209,62,39,1) 100%); /* IE10+ */
            background: linear-gradient(to bottom, rgba(247,198,158,1) 1%, rgba(255,148,61,1) 50%, rgba(247,119,0,1) 50%, rgba(252,134,37,1) 55%, rgba(247,119,0,1) 78%, rgba(201,100,0,1) 97%, rgba(170,82,0,1) 99%, rgba(209,62,39,1) 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f7c69e', endColorstr='#d13e27', GradientType=0 ); /* IE6-8 */
        }
        
        .button:hover
        {
            color: #000;
            background: rgb(255,179,122); /* Old browsers */ /* IE9 SVG, needs conditional override of 'filter' to 'none' */
            background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2ZmYjM3YSIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjAlIiBzdG9wLWNvbG9yPSIjZjc3NzAwIiBzdG9wLW9wYWNpdHk9IjEiLz4KICAgIDxzdG9wIG9mZnNldD0iNDIlIiBzdG9wLWNvbG9yPSIjZjlhNjYxIiBzdG9wLW9wYWNpdHk9IjEiLz4KICAgIDxzdG9wIG9mZnNldD0iOTklIiBzdG9wLWNvbG9yPSIjZmM4NjI1IiBzdG9wLW9wYWNpdHk9IjEiLz4KICAgIDxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iI2QxM2UyNyIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgPC9saW5lYXJHcmFkaWVudD4KICA8cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIiBmaWxsPSJ1cmwoI2dyYWQtdWNnZy1nZW5lcmF0ZWQpIiAvPgo8L3N2Zz4=);
            background: -moz-linear-gradient(top, rgba(255,179,122,1) 0%, rgba(247,119,0,1) 0%, rgba(249,166,97,1) 42%, rgba(252,134,37,1) 99%, rgba(209,62,39,1) 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(255,179,122,1)), color-stop(0%, rgba(247,119,0,1)), color-stop(42%, rgba(249,166,97,1)), color-stop(99%, rgba(252,134,37,1)), color-stop(100%, rgba(209,62,39,1))); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(top, rgba(255,179,122,1) 0%, rgba(247,119,0,1) 0%, rgba(249,166,97,1) 42%, rgba(252,134,37,1) 99%, rgba(209,62,39,1) 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(top, rgba(255,179,122,1) 0%, rgba(247,119,0,1) 0%, rgba(249,166,97,1) 42%, rgba(252,134,37,1) 99%, rgba(209,62,39,1) 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(top, rgba(255,179,122,1) 0%, rgba(247,119,0,1) 0%, rgba(249,166,97,1) 42%, rgba(252,134,37,1) 99%, rgba(209,62,39,1) 100%); /* IE10+ */
            background: linear-gradient(to bottom, rgba(255,179,122,1) 0%, rgba(247,119,0,1) 0%, rgba(249,166,97,1) 42%, rgba(252,134,37,1) 99%, rgba(209,62,39,1) 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffb37a', endColorstr='#d13e27', GradientType=0 ); /* IE6-8 */
        }
        
        .button:active
        {
            background: rgb(255,179,122); /* Old browsers */ /* IE9 SVG, needs conditional override of 'filter' to 'none' */
            background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2ZmYjM3YSIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjUlIiBzdG9wLWNvbG9yPSIjZmY3OTIxIiBzdG9wLW9wYWNpdHk9IjEiLz4KICAgIDxzdG9wIG9mZnNldD0iODklIiBzdG9wLWNvbG9yPSIjZmZhMzZiIiBzdG9wLW9wYWNpdHk9IjEiLz4KICAgIDxzdG9wIG9mZnNldD0iOTklIiBzdG9wLWNvbG9yPSIjZmY5MDQyIiBzdG9wLW9wYWNpdHk9IjEiLz4KICAgIDxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iI2Y5YTY2MSIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgPC9saW5lYXJHcmFkaWVudD4KICA8cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIiBmaWxsPSJ1cmwoI2dyYWQtdWNnZy1nZW5lcmF0ZWQpIiAvPgo8L3N2Zz4=);
            background: -moz-linear-gradient(top, rgba(255,179,122,1) 0%, rgba(255,121,33,1) 5%, rgba(255,163,107,1) 89%, rgba(255,144,66,1) 99%, rgba(249,166,97,1) 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(255,179,122,1)), color-stop(5%, rgba(255,121,33,1)), color-stop(89%, rgba(255,163,107,1)), color-stop(99%, rgba(255,144,66,1)), color-stop(100%, rgba(249,166,97,1))); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(top, rgba(255,179,122,1) 0%, rgba(255,121,33,1) 5%, rgba(255,163,107,1) 89%, rgba(255,144,66,1) 99%, rgba(249,166,97,1) 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(top, rgba(255,179,122,1) 0%, rgba(255,121,33,1) 5%, rgba(255,163,107,1) 89%, rgba(255,144,66,1) 99%, rgba(249,166,97,1) 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(top, rgba(255,179,122,1) 0%, rgba(255,121,33,1) 5%, rgba(255,163,107,1) 89%, rgba(255,144,66,1) 99%, rgba(249,166,97,1) 100%); /* IE10+ */
            background: linear-gradient(to bottom, rgba(255,179,122,1) 0%, rgba(255,121,33,1) 5%, rgba(255,163,107,1) 89%, rgba(255,144,66,1) 99%, rgba(249,166,97,1) 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffb37a', endColorstr='#f9a661', GradientType=0 ); /* IE6-8 */
        }
        
        .info
        {
            color: #666;
            font-size: 15px;
            padding: 10px 6px;
            text-align: justify;
        }
        .ctitle
        {
            color: #81b602;
            font-size: 30px;
            margin: 10px 0 0 5px;
        }
        textarea
        {
            background: #222;
            font: 16px "SegoeUI";
            color: #ccc;
            width: 210px;
            height: 110px;
            border: #666 thin solid;
            resize: none;
            overflow: auto;
            margin: 10px 0px;
            padding: 10px;
        }
        #Button1
        {
            margin: 10px 0 0 160px;
            width: 70px;
            height: 25px;
            border: #ccc 1px solid;
            background: #034e6d;
            color: #ccc;
            font: 15px "SegoeUI";
            cursor: pointer;
        }
        #Button1:hover
        {
            background: #018ac3;
            color: #fff;
        }
        #err
        {
            color: #f00;
            font-size: 16px;
            display: none;
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
                    <a href="index.aspx" id="back"></a>
                    <div class="panel-info" id="title" runat="server">
                    </div>
                    <div style="float: right; color: #CCC; font-size: 23px; margin: 30px 50px 0 0">
                        Rainbow Entertainments Inc.</div>
                </td>
            </tr>
            <tr>
                <asp:Panel ID="Panel1" runat="server" Visible="false">
                    <td align="left">
                        <div class="left-pan-shadow">
                        </div>
                        <div class="left-pan">
                            <div class="show-view">
                                <% show_details(); %>
                            </div>
                        </div>
                        <div class="right-pan">
                            <div>
                                <a href="booking.aspx" class="button">book tickets</a></div>
                            <div class="info" style="color: #fff">
                                Get your tickets in 5 easy steps!
                            </div>
                            <div class="info">
                                Rainbow Entertainments has pioneered many efforts to ensure that you have fast and
                                easy access to movie tickets. It gives you the convenience of booking movie tickets
                                online as well as information on ticket availability.</div>
                            <div class="info">
                                You can print your tickets at home or collect them from our ticket counters during
                                operating hours.</div>
                            <div style="width: 170px; font-size: 14px; margin: 30px 0 0 10px; padding-top: 10px;
                                border-top: #333 solid thin;">
                                &copy; rainbow entertainments</div>
                        </div>
                    </td>
                </asp:Panel>
                <asp:Panel ID="Panel2" runat="server" Visible="false">
                    <td>
                        <div>
                            <div class="about-left-pan">
                                <div style="width: 260px; margin-left: 10px; float: left">
                                    <p class="ctitle">
                                        welcome</p>
                                    <div class="info">
                                        Rainbow Entertainments is Chennai’s hottest entertainment destination for people
                                        from all walks of life, across a wide age group and user profile.
                                    </div>
                                    <p class="ctitle">
                                        design</p>
                                    <div class="info">
                                        The space design has been used aesthetically so that each area is special. The lobbies
                                        and washrooms are resplendent with Botticino marble, granite, Italian tiles and
                                        wooden floors coming together to pattern the floor. Back lit Italina onyx stone
                                        is used extensively in lobby columns and architraves and a fusion of tiles make
                                        the floors in the seating area of the cinema; with wood finishing on the aisles,
                                        lounges and steps.
                                    </div>
                                </div>
                                <div style="width: 300px; float: right;">
                                    <p class="ctitle">
                                        screens</p>
                                    <div class="info">
                                        There are currently five multiplex screens within the Complex
                                        <ul style="font-size: 18px; margin-bottom: 0; padding-bottom: 0; color: #aaa; list-style: circle">
                                            <li>infuse</li>
                                            <li>delight</li>
                                            <li>esteem</li>
                                            <li>fumes</li>
                                            <li>dolby</li>
                                        </ul>
                                    </div>
                                    <p class="ctitle">
                                        technology</p>
                                    <div class="info">
                                        The cinemas are equipped with state of the art entertainment technology; including
                                        digital projectors with 3D technology, 2.4 gain Silver Screens and digital audio
                                        delivering stunning cinematic experience.
                                    </div>
                                </div>
                            </div>
                            <div class="about-right-pan">
                                <img src="Images/logotns.png" style="margin-left: 60px" alt="rainbow entertainments"
                                    width="250" />
                                <div style="margin-left: 30px">
                                    <div class="info">
                                        A culmination of style, innovation and passion, Rainbow Entertainments is all the
                                        city has yearned for, redefining the cinema experience and presenting entertainment
                                        in a setting like never before. The company has an ethos of quality and service
                                        and all of the businesses that it operates ensure world class quality and experience.
                                        It's a major draw to students, residents and professionals of all age groups throughout
                                        the week days.
                                    </div>
                                    <div class="info">
                                        The multiplex has adequate parking in its main parking lot and an additional parking
                                        at the Parking Annexe besides a large capacity of two wheelers parking.</div>
                                    <div style="width: 250px; font-size: 16px; margin: 30px 0 0 10px; padding-top: 10px;
                                        border-top: #333 solid thin;">
                                        &nbsp; &nbsp;&copy; rainbow entertainments</div>
                                </div>
                            </div>
                        </div>
                    </td>
                </asp:Panel>
                <asp:Panel ID="Panel3" runat="server" Visible="false">
                    <td>
                        <div>
                            <div class="about-left-pan">
                                <div style="width: 500px; margin-left: 10px; float: left">
                                    <p class="ctitle">
                                        contact</p>
                                    <div class="info">
                                        Movie Related :<a href="mailto:movie.rainbow@gmail.com"> movie.rainbow@gmail.com</a>
                                        <br />
                                        Customer Care :<a href="mailto:help@rainbowcinemas.in"> help@rainbowcinemas.in</a>
                                        <br />
                                        For Movie Information, call: 044-4224 4224
                                    </div>
                                    <p class="ctitle">
                                        location</p>
                                    <div class="info">
                                        Rainbow Complex<br />
                                        58, East General Road<br />
                                        Royapettah<br />
                                        Chennai – 600014.
                                    </div>
                                    <p class="ctitle">
                                        corporate office</p>
                                    <div class="info">
                                        Rainbow Entertainments<br />
                                        Rainbow Complex, 5th Floor
                                        <br />
                                        58, East General Road<br />
                                        Royapettah<br />
                                        Chennai – 600014.<br />
                                        Phone: 044-4392 0200
                                    </div>
                                </div>
                            </div>
                            <div class="about-right-pan">
                                <span style="color: #f39003; font-size: 30px;">feedback</span>
                                <div>
                                    <div class="info">
                                        please share your feedback, ideas and recommendation with us
                                    </div>
                                    <asp:Panel ID="Panel4" runat="server" class="info" Style="color: #06b7cf;">
                                        you need to sign in to provide feedback <a href="selection.aspx?feedback=1">sign in
                                        </a>here
                                    </asp:Panel>
                                    <asp:Panel ID="Panel5" runat="server" class="info" Style="color: #06b7cf; font-size: 25px;">
                                        hello! <span id="uname" runat="server" style="color: #ccc"></span>
                                        <div style="font-size: 16px; text-align: left; margin: 10px 0 0 5px;">
                                            <span style="color: #ccc;">your feedback</span>
                                            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox><asp:Button
                                                ID="Button1" runat="server" Text="submit" /></div>
                                        <div style="margin: 10px 0 0 10px">
                                            <span id="err">please specify your feedback</span></div>
                                    </asp:Panel>
                                    <asp:Panel ID="Panel6" runat="server" class="info" Style="color: #06b7cf;" Visible="false">
                                        thank you for your feedback.
                                    </asp:Panel>
                                    <div style="width: 300px; font-size: 16px; margin: 30px 0 0 10px; padding-top: 10px;
                                        border-top: #333 solid thin;">
                                        &nbsp; &nbsp;<a href="manage/">manage</a> &nbsp; &nbsp; | &nbsp; &nbsp;&copy; rainbow
                                        entertainments</div>
                                </div>
                            </div>
                        </div>
                    </td>
                </asp:Panel>
            </tr>
        </table>
    </div>
    </form>
    <script src="Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(".left-pan").scroll(function () {

            if ($(".left-pan").scrollTop() < 1 || $(".left-pan").scrollTop() > 75) {
                $(".left-pan-shadow:visible").fadeOut(300);
            }
            else {
                $(".left-pan-shadow:hidden").fadeIn(300);
            }

        });
        $("#Button1").click(function () { var a = document.getElementById("TextBox1").value; if (a.length < 1) { $("#err").fadeIn(300); return false } });
        $("#TextBox1").focus(function () { $("#err").fadeOut(200); });
    </script>
</body>
</html>
