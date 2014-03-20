var t = 0;
        function showDiv() {
            if ($("#panleft p:hidden").length) {
                $("#panleft p:hidden:first").show("fold", {}, 400);
                setTimeout(showDiv, 300)
            }
        }
        function showRow() {
            if ($("#tap table tr:hidden").length) {
                $("#tap table tr:hidden:first").show("drop", {
                    direction: "down"
                }, 100);
                setTimeout(showRow, 50)
            }
        }
        function ch() {
            $(".avail").siblings().each(function () {
                if ($(this).hasClass("selected")) $(this).siblings(":first").css("background-color", "#00a6ec")
            })
        }
        function getSelected() {
            var a = 1;
            $(".selected").each(function () {
                a++
            });
            return a
        }
        function addSelected() {
            var a = 0;
            var b = 0;
            var c = "";
            var d = "";
            $(".selected").each(function () {
                a++
            });
            if (getOnOfTickets() - a == 0) {
                $(".selected").each(function () {
                    c = "dval" + b;
                    document.getElementById(c).value = $(this).attr("id");
                    b++;
                    if (b < getOnOfTickets()) d += $(this).text() + ", ";
                    else d += $(this).text() + ""
                });
                $("#psel").text(d);
                d = ""
            }
        }
        function restorescreen() {
            $("#back").fadeOut(500);
            $("#notr").fadeIn(500);
            $("#scplay").remove();
            $("#screen").removeAttr("style");
            $("#play").siblings(":nth-child(2)").fadeOut(200)
        }
        $(window).load(function () {

            $("#open").fadeIn(1000);
            $("#terror").hide('blind', {
                duration: 1,
                easing: 'easeInOutBack'
            });
        });
        
        $(".row div").hover(function () {
            ch()
        });
        $(".avail").click(function () {
            if ($(this).hasClass("avail")) {
                if (getSelected() <= getOnOfTickets()) {
                    if (getSelected() == getOnOfTickets()) {
                        $("#selectinfo").fadeOut(300);
                        $("#stoselect").hide('blind', {
                            duration: 700,
                            easing: 'easeOutBounce'
                        });
                        $("#proceed").delay(300).fadeIn(500)

                    } else {
                        $("#proceed").fadeOut(300);
                        $("#selectinfo").delay(300).fadeIn(1000);
                        if (getSelected() == getOnOfTickets())
                            $("#stoselect").show('blind', {
                                duration: 500,
                                easing: 'easeInExpo'
                            });
                    }
                    $(this).removeClass().addClass("selected");
                    $("#c_f_t").text(getOnOfTickets() - (getSelected() - 1));
                    addSelected()
                } else { serror("you have already selected your tickets"); }
            } else {
                $(this).removeClass().addClass("avail");
                $("#proceed").fadeOut(300);
                $("#selectinfo").delay(300).fadeIn(500);
                if (getSelected() == getOnOfTickets())
                    $("#stoselect").show('blind', {
                        duration: 500,
                        easing: 'easeInExpo'
                    });
                $("#c_f_t").text(getOnOfTickets() - (getSelected() - 1))
            }
            ch()
        });
        $(".avail").hover(function () {
            $(this).siblings(":first").css("background-color", " #e8800f")
        }, function () {
            $(this).siblings(":first").css("background-color", "#333");
            ch()
        });
        $("#banner").error(function () {
            $(this).hide();
            $(this).parent().css("line-height", "5");
            var a = document.getElementById("mname").innerHTML;
            $(this).parent().text(a)
        });
        $("#play").click(function () {
            $("#screen").animate({

                height: "350",
                bottom: "325",
                easing: 'easeInOutBounce'
            }, 500, function () {
                $("#notr").fadeOut(200);
                $("#back").fadeIn(700);
                $('#player').append('<div id="scplay"><div id="splayerclose" onclick="restorescreen()"><img src="Images/cancel.png" width="30" height="30" /></div><div id="splayer"></div></div>');
                showScreen();
                $("#splayerclose").delay(500).fadeIn(500)
            })
        });
        $("#play").hover(function () {
            $(this).siblings(":nth-child(2)").fadeIn(500)
        }, function () {
            $(this).siblings(":nth-child(2)").fadeOut(200)
        })
        $("#iproceed").click(function () {
            $("#hselect").submit();
        });
        function serror(s) {
            $("#ecode").text(s);
            if ($("#terror").is(":visible"))
            { } else {
                $("#terror").show('blind', {
                    duration: 300,
                    easing: 'easeInOutBack'
                });
                t = setTimeout(errorhide, 5000);
            }
        }
        $("body").click(function (event) {
            if ($(document.getElementById(event.target.id)).hasClass("avail"))
            { } else {
                clearTimeout(t);
                if ($("#terror").is(":visible"))
                    errorhide();
            }
        });
        function errorhide() {
     
            clearTimeout(t);
            if ($("#terror").is(":visible"))
                $("#terror").hide('blind', {
                    duration: 300,
                    easing: 'easeInOutBack'
                });
        }