<%@ Page Language="C#" AutoEventWireup="true" CodeFile="iframe_addmovie.aspx.cs"
    Inherits="manage_iframe_addmovie" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Images/fonts/fonts.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body
        {
            width: 950px;
            height: 430px;
            margin: 0;
            padding: 0;
            font: 18px "SegoeUI" , "SegoeUI-SemiBold";
            background: #FFFFFF;
            color: #333;
            overflow: hidden;
            margin-top: 5px;
            -webkit-user-select: none;
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
        
        
        
        
        
        
        .control-items, .mduration
        {
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
            text-align: left;
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
    </style>
</head>
<body>
    <div>
        <table width="1000" border="0" cellspacing="0" cellpadding="0" align="center" style="table-layout: fixed;
            overflow: hidden;">
            <tr>
                <td align="center">
                    <form method="post" action="addmovie.aspx" enctype="multipart/form-data" id="addmovform" autocomplete="off">
                    <div style="float: left">
                        <div class="control-items">
                            <div>
                                movie name</div>
                            <span>
                                <input type="text" name="addmovname" id="idaddmovname" />
                            </span>
                        </div>
                        <div class="control-items">
                            <div>
                                category</div>
                            <span>
                                <select name="addmovcat" id="idaddmovcat">
                                    <option>-select-</option>
                                    <option value='1'>Action</option>
                                    <option value='2'>Adventure</option>
                                    <option value='3'>Animation</option>
                                    <option value='4'>Biography</option>
                                    <option value='5'>Comedy</option>
                                    <option value='6'>Crime</option>
                                    <option value='7'>Documentary</option>
                                    <option value='8'>Drama</option>
                                    <option value='9'>Family</option>
                                    <option value='10'>Fantasy</option>
                                    <option value='11'>History</option>
                                    <option value='12'>Horror</option>
                                    <option value='13'>Music</option>
                                    <option value='14'>Musical</option>
                                    <option value='15'>Mystery</option>
                                    <option value='16'>Romance</option>
                                    <option value='17'>Sci-Fi</option>
                                    <option value='18'>Short</option>
                                    <option value='19'>Sport</option>
                                    <option value='20'>Thriller</option>
                                    <option value='21'>War</option>
                                    <option value='22'>Western</option>
                                </select>
                            </span>
                        </div>
                        <div class="control-items">
                            <div>
                                director</div>
                            <span>
                                <input type="text" name="addmovdir" id="idaddmovdir" />
                            </span>
                        </div>
                        <div class="control-items">
                            <div>
                                release date</div>
                            <span>
                                <input type="text" name="addmovdat" id="idaddmovdat" />
                            </span>
                        </div>
                        <div class="mduration">
                            <div>
                                duration</div>
                            <span>HH
                                <input type="text" name="addmovhr" id="idaddmovhr" />
                            </span><span>MM
                                <input type="text" name="addmovmin" id="idaddmovmin" />
                            </span><span>SS
                                <input type="text" name="addmovsec" id="idaddmovsec" />
                            </span>
                        </div>
                        <div class="control-items">
                            <div>
                                language</div>
                            <span>
                                <input type="text" name="addmovlang" id="idaddmovlang" />
                            </span>
                        </div>
                        <div class="control-items">
                            <div>
                                movie type</div>
                            <span>
                                <input name="ismd" type="radio" value="0" id="idaddmov2d" checked="checked" />
                                <label for="r1">
                                    2D</label>
                                <input name="ismd" type="radio" value="1" id="idaddmov3d" />
                                <label for="r2">
                                    3D</label>
                            </span>
                        </div>
                        <div class="control-items">
                            <div>
                                trailer ID</div>
                            <span>
                                <input type="text" name="addmovtrid" id="idaddmovtrid" />
                            </span>
                        </div>
                        <span style="font-size: 16px; margin-left: 80px;">eg : http://www.youtube.com/watch?v=<span
                            style="color: #C60">hzixp8s4pygd</span></span>
                    </div>
                    <div style="float: right">
                        <div class="control-items-1">
                            <div>
                                title picture 1</div>
                            <span>
                                <input type="file" name="addmovpic1" id="idaddmovpic1" />
                            </span>
                            <p>
                                size 175 x 180 JPG</p>
                        </div>
                        <div class="control-items-1">
                            <div>
                                title picture 2</div>
                            <span>
                                <input type="file" name="addmovpic2" id="idaddmovpic2" />
                            </span>
                            <p>
                                size 400 x 100 JPG</p>
                        </div>
                        <div class="control-items-1">
                            <input type="submit" value="Submit" id="addmovie_sub" />
                            <input type="reset" value="Reset" />
                        </div>
                        <div class="err-info" id="idaddmoverr">
                            specify correct password</div>
                        <div id="addmovresp" runat="server">
                        </div>
                    </div>
                    </form>
                </td>
            </tr>
        </table>
    </div>
    <script src="../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui-1.8.20.custom.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var a = "";
        $("#addmovie_sub").click(function () {
            if (document.getElementById("idaddmovname").value != "")
                if (document.getElementById("idaddmovcat").value != "-select-")
                    if (document.getElementById("idaddmovdir").value != "")
                        if (document.getElementById("idaddmovdat").value != "")
                            if (document.getElementById("idaddmovhr").value != "" && document.getElementById("idaddmovmin").value != "" && document.getElementById("idaddmovsec").value != "" && document.getElementById("idaddmovhr").value.length == 2 && document.getElementById("idaddmovmin").value.length == 2 && document.getElementById("idaddmovsec").value.length == 2)
                                if (document.getElementById("idaddmovlang").value != "")
                                    if (document.getElementById("idaddmovtrid").value != "")
                                        if (document.getElementById("idaddmovpic1").value != "") {
                                            a = document.getElementById("idaddmovpic1").value;
                                            a = a.split('.').pop().toLowerCase();
                                            if (a == "jpg") {
                                                if (document.getElementById("idaddmovpic2").value != "") {
                                                    a = document.getElementById("idaddmovpic2").value;
                                                    a = a.split('.').pop().toLowerCase();
                                                    if (a == "jpg") { return true; } else {
                                                        $("#idaddmoverr").text("picture 2 : upload only JPG images").fadeIn(300); 
                                                    }
                                                }
                                                else $("#idaddmoverr").text("select picture 2").fadeIn(300);
                                            } 
                                            else {
                                                $("#idaddmoverr").text("picture 1 : upload only JPG images").fadeIn(300); 
                                            }

                                        }
                                        else $("#idaddmoverr").text("select picture 1").fadeIn(300);
                                    else $("#idaddmoverr").text("specify movie trailer ID").fadeIn(300);
                                else $("#idaddmoverr").text("specify movie language").fadeIn(300);
                            else $("#idaddmoverr").text("specify hr,min and sec as HH:MM:SS").fadeIn(300);
                        else $("#idaddmoverr").text("specify release date").fadeIn(300);
                    else $("#idaddmoverr").text("specify director name").fadeIn(300);
                else $("#idaddmoverr").text("select movie category").fadeIn(300);
            else $("#idaddmoverr").text("specify movie name").fadeIn(300);
            return false;
        });
        function valid() {
            var a = document.getElementById("idaddmovname");
            var b = document.getElementById("idaddmovdir");

            var c = document.getElementById("idaddmovhr");
            var d = document.getElementById("idaddmovmin");
            var e = document.getElementById("idaddmovsec");
            var f = document.getElementById("idaddmovlang");

            a.onchange = a.onkeyup = function () {
                aValue = a.value;
                a.value = aValue.replace(/[^A-Z a-z 0-9]/g, "")
            };
            b.onchange = b.onkeyup = function () {
                bValue = b.value;
                b.value = bValue.replace(/[^A-Z a-z]/g, "")
            };
            c.onchange = c.onkeyup = function () {
                cValue = c.value;
                c.value = cValue.replace(/[^0-9]{0,2}/g, "")
            };
            d.onchange = d.onkeyup = function () {
                dValue = d.value;
                d.value = dValue.replace(/[^0-9]{0,2}/g, "")
            };
            e.onchange = e.onkeyup = function () {
                eValue = e.value;
                e.value = eValue.replace(/[^0-9]{0,2}/g, "")
            };
            f.onchange = f.onkeyup = function () {
                fValue = f.value;
                f.value = fValue.replace(/[^A-Z a-z]/g, "")
            };

        }
        $(":input").focus(function () { $("#idaddmoverr").fadeOut(100); });
        $(":input").keyup(function () {
            valid();
        });
    </script>
</body>
</html>
