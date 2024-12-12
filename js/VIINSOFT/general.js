function obtenerQS(parametros) {
    var urlPag = window.location.search.substring(1);
    var urlVars = urlPag.split('&');
    for (var i = 0; i < urlVars.length; i++) {
        var nombreParam = urlVars[i].split('=');
        if (nombreParam[0] == parametros) {
            return nombreParam[1];
        }
    }
}

  //var _QueryString = (function () {
            //    var _get = {};
            //    var re = /[?&]([^=&]+)(=?)([^&]*)/g;
            //    while (m = re.exec(location.search))
            //        _get[decodeURIComponent(m[1])] = (m[2] == '=' ? decodeURIComponent(m[3]) : true);
            //    return _get;
            //})();

//_QueryString.TipoOrden;

function tieneQS(strName) {
    var result = false;
    var sQ = window.location.search.substring(1).split('&');
    if (sQ.length >= 1) {
        if (sQ.find(element => element.includes(strName)) != undefined) {
            result = true;
        }
    }
    return result; 
}

function showMsg(strMsg, tipo) {
    if (tipo == "Error") {
        $("#display").show();
        $("#display").removeClass().addClass('col-sm-12  alert alert-danger');
        //$('#display').html("<button type=\"button\" class=\"close\" data-dismiss=\"alert\"> <i class=\"ace-icon fa fa-times\"></i> </button><p>"+strMsg+"<p>");
        $('#display').html("<p>" + strMsg + "<p>");
    }
    else {
        $("#display").show();
        $("#display").removeClass().addClass('col-sm-12 alert alert-block alert-success');
        //$('#display').html("<button type=\"button\" class=\"close\" data-dismiss=\"alert\"> <i class=\"ace-icon fa fa-times\"></i> </button><p>"+strMsg+"<p>");
        $('#display').html("<p>" + strMsg + "<p>");
        $('#display').append("");
    }
}; 

function closeMsg(idDiv) {
    $("#" + idDiv).html("");
    $("#" + idDiv).removeClass();
}


var DateDiff = {

    inDays: function (d1, d2) {
        var t2 = d2.getTime();
        var t1 = d1.getTime();

        return parseInt((t2 - t1) / (24 * 3600 * 1000));
    },

    inWeeks: function (d1, d2) {
        var t2 = d2.getTime();
        var t1 = d1.getTime();

        return parseInt((t2 - t1) / (24 * 3600 * 1000 * 7));
    },

    inMonths: function (d1, d2) {
        var d1Y = d1.getFullYear();
        var d2Y = d2.getFullYear();
        var d1M = d1.getMonth();
        var d2M = d2.getMonth();

        return (d2M + 12 * d2Y) - (d1M + 12 * d1Y);
    },

    inYears: function (d1, d2) {
        return d2.getFullYear() - d1.getFullYear();
    }
}

function fMoneyToFloat(vMonto) {
    varTot = ((vMonto.replace("(", "")).replace(")", "")).replace("$", "");
    return parseFloat(varTot);
}


function muestraMsg(isError, strMsg, showClose, idDiv, bHide = 1) {
    $("#warning" + idDiv).removeClass("d-block");
    $("#warning" + idDiv).append("<div id='" + idDiv + "'></div>");
    $("#warning" + idDiv).show();
    $("#" + idDiv).removeClass("d-block");
    $("#" + idDiv).show();
   

    if (isError == 1) {
        $("#" + idDiv).removeClass().addClass('alert alert-danger alert-dismissable');
    } //col-sm-12  alert alert-danger
    else {
        if (isError == 0) {
            $("#" + idDiv).removeClass().addClass('alert alert-success alert-dismissable');
        }
        else
            $("#" + idDiv).removeClass().addClass('alert alert-warning alert-dismissable');
    }
    //col-sm-12  alert alert-success
    if (showClose == 1)
    //<button type=\"button\" class=\"close\" data-dismiss=\"alert\"> <i class=\"ace-icon fa fa-times\"></i> </button>
    { $("#" + idDiv).html("<button aria-hidden=\"true\" data-dismiss=\"alert\" class=\"close\" type=\"button\">×</button><p>" + strMsg + "</p>"); }
    else { $("#" + idDiv).html("<p>" + strMsg + "</p>"); }
    if (bHide == 1) {
        setTimeout(function () {
            //$("#warning" + idDiv).html("");
            $("#" + idDiv).fadeOut(3000);
            $("#warning" + idDiv).fadeOut(3000);
            //$("#warning" + idDiv).css("display", "block");
            //$("#warning" + idDiv).show();
            $("#warning" + idDiv).removeClass();
            try {
                $("#warning" + idDiv).removeClass("d-block").addClass("d-block");
                //document.getElementById("#warning" + idDiv).style.display = "block";
            } catch (error) { } 
            $("#warning" + idDiv).html("");
            //$("#" + idDiv).css("display", "block");
            //$("#" + idDiv).show();
            $("#" + idDiv).removeClass();
            try {
                //document.getElementById("#" + idDiv).style.display = "block";
                //document.querySelectorAll("#" + idDiv)[0].style.display = "block";
                $("#" + idDiv).removeClass("d-block").addClass("d-block");
            } catch (error) { }  
            $("#" + idDiv).html("");
            //$("#" + idDiv).html(""); 
            //$("#warning" + idDiv).html("");
            //$("#warningMaster").removeAttr("display");
            //$("#warningMaster").removeClass();
        }, 5000);

        
    }

}	

function createCodeViewer(strTxtAreaName, response){
    var elem = document.getElementById(strTxtAreaName);
    elem.value += response;
    const text = response;
    const lines = text.split("\n");
    const numberOfLines = lines.length; // + 45;
    elem.rows = numberOfLines;

    var editor = CodeMirror.fromTextArea(elem, {
        lineNumbers: false,
        matchBrackets: true,
        styleActiveLine: true,
        autoRefresh: true
    });
}

function createCodeViewer2(strTxtAreaName, response) {
    var elem = document.getElementById(strTxtAreaName);
    elem.value += response;
    const text = response;
    const lines = text.split("\n");
    const numberOfLines = lines.length; // + 45;
    elem.rows = numberOfLines;

    var editor = CodeMirror.fromTextArea(elem, {
        lineNumbers: false,
        matchBrackets: true,
        styleActiveLine: true,
        autoRefresh: true
    });
    return editor;
}