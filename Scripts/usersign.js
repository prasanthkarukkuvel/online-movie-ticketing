$(document).ready(function (e) {
    $(".active").fadeIn(300);
    $(".passive").fadeIn(300);
});
$("#signup").click(function () {
$("#fback").fadeIn(100);
    $("#fgshow").hide();
    if ($("#signup").hasClass('passive')) {
        sign_in_hide();
        $("#bsign-up").delay(500).show('drop', {
            'duration': 700,
            'easing': 'easeInCirc',
            'direction': 'left'
        });
        $("#bsign-in").hide('drop', {
            'duration': 500,
            'easing': 'easeInCirc',
            'direction': 'right'
        });
        $('#upreset').trigger('click');
    }
});
$("#signin").click(function () {
$("#fback").fadeIn(100);
    if ($("#signin").hasClass('passive')) {
        sign_up_hide();
        $("#bsign-in").delay(500).show('drop', {
            'duration': 700,
            'easing': 'easeInCirc',
            'direction': 'left'
        });
        $("#bsign-up").hide('drop', {
            'duration': 500,
            'easing': 'easeInCirc',
            'direction': 'right'
        });
        $("#bsign-up-form").delay(700).fadeIn(100);
        $("#load-r-content").fadeOut(50);
        $('#inreset').trigger('click');
    }
});
function sign_in_hide() {
    $("#signin").hide('drop', {
        'duration': 300,
        'easing': 'easeInExpo',
    }, function () {
        setTimeout(sign_up_animate(), 300);
    });
}
function sign_up_animate() {
    $("#signin").removeAttr('style');
    $("#signup").stop().animate({
        'marginLeft': 0,
        'easing': 'easeInElastic',
        'duration': 300,
        'font-size': '55px',
        'color': '#10BBED',
        'margin-top': 0,
    }, function () {
        $("#signin").removeClass().addClass('passive');
        setTimeout(sign_in_show, 300);
    });
}
function sign_in_show() {
    $("#signin").show('fade', {
        'duration': 500,
        'easing': 'easeInExpo',
    }, function () {
        $("#signup").removeClass().addClass('active');
        $("#fback").fadeOut(100);
    });
}
function sign_up_hide() {
    $("#signup").hide('drop', {
        'duration': 300,
        'easing': 'easeInExpo',
    }, function () {
        setTimeout(sign_in_animate(), 300);
    });
}
function sign_in_animate() {
    $("#signup").removeAttr('style');
    $("#signin").stop().animate({
        'marginLeft': 0,
        'easing': 'easeInElastic',
        'duration': 300,
        'font-size': '55px',
        'color': '#10BBED',
        'margin-top': 0,
    }, function () {
        $("#signup").removeClass().addClass('passive');
        setTimeout(sign_up_show, 300);
    });
}
function sign_up_show() {
    $("#fgshow").fadeIn(300);
    $("#signup").show('fade', {
        'duration': 500,
        'easing': 'easeInExpo',
    }, function () {
        $("#signin").removeClass().addClass('active');
        $("#fback").fadeOut(100);
    });
}
function serrinfo(m) {
    $("#toperrinfo").text(m);
    $("#toperrinfo").fadeIn(300);
}
function upserrinfo(m) {
    $("#uptoperrinfo").text(m);
    $("#uptoperrinfo").fadeIn(300);
}
function ise(m) {
    fi = m.indexOf("@");
    fj = m.indexOf(".", fi);
    fk = m.indexOf(",");
    fkk = m.indexOf(" ");
    fjj = m.lastIndexOf(".") + 1;
    flen = m.length;
    if (fi > 2 && fj > fi + 1 && fk == -1 && fkk == -1 && flen - fjj >= 2 && flen - fjj <= 3) return true;
    return false;
}

function valid() {
    var a = document.getElementById("fname");
    var b = document.getElementById("lname");
    var c = document.getElementById("upmail");
    var f = document.getElementById("mnum");
    a.onchange = a.onkeyup = function () {
        aValue = a.value;
        a.value = aValue.replace(/[^A-Z a-z]/g, "")
    };
    b.onchange = b.onkeyup = function () {
        eValue = b.value;
        b.value = eValue.replace(/[^A-Z a-z]/g, "")
    };
    f.onchange = f.onkeyup = function () {
        bValue = f.value;
        f.value = bValue.replace(/[^0-9]/g, "")
    };
    c.onchange = c.onkeyup = function () {
        cValue = c.value;
        c.value = cValue.replace(/[^A-Za-z0-9._@]/g, "")
    }
}
$("#bsign-in input").keypress(function () {
    $("#toperrinfo").fadeOut(500);
});
$("#bsign-up input").keypress(function () {
    $("#uptoperrinfo").fadeOut(500);
});
$("#bsign-up input").keyup(function () {
    valid()
});
$("#insubmit").click(function () {
    var a = document.getElementById("signmail").value;
    var b = document.getElementById("signpass").value;
    if (a == "") {
        serrinfo("specify your email id");
        return false
    }
    else if (!ise(a)) {
        serrinfo("invalid email id");
        return false
    }
    else if (b.length < 6) {
        serrinfo("provide a correct password");
        return false
    }
});
$("#upsubmit").click(function () {
    var a = document.getElementById("fname").value;
    var b = document.getElementById("lname").value;
    var c = document.getElementById("upmail").value;
    var f = document.getElementById("mnum").value;
    if (a == "") {
        upserrinfo("specify your first name");
        return false
    }
    else if (a.length < 3) {
        upserrinfo("specify a valid name");
        return false
    }
    else if (b == "") {
        upserrinfo("specify your last name");
        return false
    }
    else if (!ise(c)) {
        upserrinfo("invalid email id");
        return false
    }
    else if (f.length!=10) {
        upserrinfo("provide a vaild moblie number");
        return false
    }
});
$('#inreset').click(function () {
    $("#toperrinfo").fadeOut(500);
    $("#signmail").text("");
    $("#signpass").text("");
    $("#signmail").focus()
})
$('#upreset').click(function () {
    $("#uptoperrinfo").fadeOut(500);
    $("#fname").text("");
    $("#lname").text("");
    $("#upemail").text("");
    $("#mnum").text("");
    $("#fname").focus();
})
$("#fgshow").click(function () {
    $("#fgcontent").stop().animate({
        'width': 500,
        'height': 300,
        'background-color': '#111',
        'margin-left': 0,
        'easing': 'easeInElastic',
    }, 300);
    $("#fgshow").hide();
    $("#fgcons").fadeIn(300);
    $("#fback").fadeIn(100);
});
$("#fgclose").click(function () {
    $("#fgcontent").removeAttr("style");
    $("#fgshow").show();
    $("#fgcons").hide();
    $('#f-r-resp').hide();
    $("#fback").fadeOut(100);
    
});
$(function () {
    $('#signupform').submit(function () {
    $("#back").fadeIn(500);
        $.ajax({
            url: this.action,
            type: this.method,
            data: $(this).serialize(),
            success: function (result) {
                $("#bsign-up-form").fadeOut(300);
                $('#r-load').html(result);
                $("#load-r-content").delay(300).fadeIn(1000);
                $("#back").delay(300).fadeOut(500);
            }
        });
        return false;
    });
});
$("#fgsubmit").click(function(){
var a=document.getElementById("fpemail").value;
if(!ise(a))
{    serrinfo("invalid email id");
     return false;
    }
else
    return true;
});
$(function () {
    $('#fgpassword').submit(function () {
    $("#back").fadeIn(500);
        $.ajax({
            url: this.action,
            type: this.method,
            data: $(this).serialize(),
            success: function (result) {
               document.getElementById("fpemail").value="";
                $('#f-r-resp').html(result);
                $('#f-r-resp').fadeIn(300);
                $("#back").delay(300).fadeOut(500);
            }
        });
        return false;
    });
});