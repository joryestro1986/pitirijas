////Checar variables desde un Request
//var _QueryString = (function () {
//    var _get = {};
//    var re = /[?&]([^=&]+)(=?)([^&]*)/g;
//    while (m = re.exec(location.search))
//        _get[decodeURIComponent(m[1])] = (m[2] == '=' ? decodeURIComponent(m[3]) : true);
//    return _get;
//})();

////Este valor indica que no fue encontrado el usuario en la base de datos
//var BadUser = _QueryString.BadUser;
//if (BadUser != null) {

//    $(document).ready(function () {

//        $("#ErrorMessage").attr('style', 'display:block');
//        $("#textMessage").html("Usuario o contraseña invalida");
//        $("#ErrorMessage").fadeOut(3000, function () { $("#ErrorMessage").attr('style', 'display: none;'); });

//    });

//}




function Redirect(RedirectPage) {

    //document.body.requestFullscreen();
    //setTimeout(function () { window.location = RedirectPage; }, 5000);

    $('#Sistemaframe').attr('src', RedirectPage);
    $('#Sistemaframe').addClass("bigFrame");
    $('#Sistemaframe').fadeIn();


    if ((document.fullScreenElement && document.fullScreenElement !== null) || (!document.mozFullScreen && !document.webkitIsFullScreen)) {
        if (document.documentElement.requestFullScreen) {
            document.documentElement.requestFullScreen();
        } else if (document.documentElement.mozRequestFullScreen) {
            document.documentElement.mozRequestFullScreen();
        } else if (document.documentElement.webkitRequestFullScreen) {
            document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
        }
    } else {
        if (document.cancelFullScreen) {
            document.cancelFullScreen();
        } else if (document.mozCancelFullScreen) {
            document.mozCancelFullScreen();
        } else if (document.webkitCancelFullScreen) {
            document.webkitCancelFullScreen();
        }
    }

}

function RedirectInside(RedirectPage) {
    window.location = RedirectPage; 
}

function GoBack() {
    window.parent.location.href = "Index.html"; 
}

function ValidateFields() {

    if ($("#user").val() == "" || $("#pass").val() == "") {

        $("#ErrorMessage").attr('style', 'display:block');
        $("#textMessage").html("Favor de completar campos vacios");
        $("#ErrorMessage").fadeOut(3000, function () { $("#ErrorMessage").attr('style', 'display: none;'); });


        return false;
    }
}


