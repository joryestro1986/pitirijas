

$(document).ready(function () {
  
    inicializaCombos();
    ObtenerCombos();
     
});

function inicializaCombos() {
    $("#Anio1_input").select2({ //AÑO
        theme: 'bootstrap4', dropdownParent: $('body')
    });

    $("#Entidad1_input").select2({ //MES
        theme: 'bootstrap4', dropdownParent: $('body')
    });

    $("#CPenitenciario1_input").select2({ //PROGRAMA
        theme: 'bootstrap4', dropdownParent: $('body')
    });
}

function ObtenerCombos() {

    //Se traera los años del combo 1
    $.ajax({
        type: "POST",
        url: "ASHXFiles/DB.ashx?o=ComboAnios",
        contentType: "application/json",
        dataType: "json",
        async: false,
        success: function (response) {


            if (response.Data1.length > 0) {
                var Jsd = response.Data1;

                var o = new Option(Jsd[0].Prox, Jsd[0].Prox);
                $(o).html(Jsd[0].Prox);
                var p = new Option(Jsd[0].Actual, Jsd[0].Actual);
                $(p).html(Jsd[0].Actual);
                var q = new Option(Jsd[0].Ant, Jsd[0].Ant);
                $(q).html(Jsd[0].Ant);

                $('#Anio1_input').append(o);
                $('#Anio1_input').append(p);
                $('#Anio1_input').append(q);

                $('#Anio1_input').val(Jsd[0].Actual);

            }

        }
    });

    //Se traera los años del combo 2
    $.ajax({
        type: "POST",
        url: "ASHXFiles/DB.ashx?o=ComboAnios",
        contentType: "application/json",
        dataType: "json",
        async: false,
        success: function (response) {


            if (response.Data1.length > 0) {
                var Jsd = response.Data1;

                var o = new Option(Jsd[0].Prox, Jsd[0].Prox);
                $(o).html(Jsd[0].Prox);
                var p = new Option(Jsd[0].Actual, Jsd[0].Actual);
                $(p).html(Jsd[0].Actual);
                var q = new Option(Jsd[0].Ant, Jsd[0].Ant);
                $(q).html(Jsd[0].Ant);

                $('#Anio2_input').append(o);
                $('#Anio2_input').append(p);
                $('#Anio2_input').append(q);

                $('#Anio2_input').val(Jsd[0].Actual);

            }

        }
    });

    //Se traeran todos los Meses para el combo 1
    $.ajax({
        type: "POST",
        url: "ASHXFiles/DB.ashx?o=ComboMeses",
        contentType: "application/json",
        dataType: "json",
        async: false,
        success: function (response) {


            if (response.Data1.length > 0) {
                var Jsd = response.Data1;

                $.each(Jsd, function (index) {

                    var o = new Option(Jsd[index].Mes, Jsd[index].Indice);
                    $(o).html(Jsd[index].Mes);
                    $('#Entidad1_input').append(o);

                });



            }

        }
    });

    //Se traeran todos los Meses para el combo 2
    $.ajax({
        type: "POST",
        url: "ASHXFiles/DB.ashx?o=ComboMeses",
        contentType: "application/json",
        dataType: "json",
        async: false,
        success: function (response) {


            if (response.Data1.length > 0) {
                var Jsd = response.Data1;

                $.each(Jsd, function (index) {

                    var o = new Option(Jsd[index].Mes, Jsd[index].Indice);
                    $(o).html(Jsd[index].Mes);
                    $('#Entidad2_input').append(o);

                });



            }

        }
    });

    //Se traeran todos los programas para el combo 1
    $.ajax({
        type: "POST",
        url: "ASHXFiles/DB.ashx?o=ComboProgramas",
        contentType: "application/json",
        dataType: "json",
        async: false,
        success: function (response) {


            if (response.Data1.length > 0) {
                var Jsd = response.Data1;

                $.each(Jsd, function (index) {

                    var o = new Option(Jsd[index].Programa, Jsd[index].Indice);
                    $(o).html(Jsd[index].Mes);
                    $('#CPenitenciario1_input').append(o);

                });



            }

        }
    });

    //Se traeran todos los programas para el combo 2
    $.ajax({
        type: "POST",
        url: "ASHXFiles/DB.ashx?o=ComboProgramas",
        contentType: "application/json",
        dataType: "json",
        async: false,
        success: function (response) {


            if (response.Data1.length > 0) {
                var Jsd = response.Data1;

                $.each(Jsd, function (index) {

                    var o = new Option(Jsd[index].Programa, Jsd[index].Indice);
                    $(o).html(Jsd[index].Mes);
                    $('#CPenitenciario2_input').append(o);

                });



            }

        }
    });

    //Sexo para el combo1
    $.ajax({
        type: "POST",
        url: "ASHXFiles/DB.ashx?o=Sexo",
        contentType: "application/json",
        dataType: "json",
        async: false,
        success: function (response) {


            if (response.Data1.length > 0) {
                var Jsd = response.Data1;

                $.each(Jsd, function (index) {

                    var o = new Option(Jsd[index].Sexo, Jsd[index].Indice);
                    $(o).html(Jsd[index].Mes);
                    $('#Sexo1_input').append(o);

                });



            }

        }
    });

    //Sexo para el combo1
    $.ajax({
        type: "POST",
        url: "ASHXFiles/DB.ashx?o=Sexo",
        contentType: "application/json",
        dataType: "json",
        async: false,
        success: function (response) {


            if (response.Data1.length > 0) {
                var Jsd = response.Data1;

                $.each(Jsd, function (index) {

                    var o = new Option(Jsd[index].Sexo, Jsd[index].Indice);
                    $(o).html(Jsd[index].Mes);
                    $('#Sexo2_input').append(o);

                });



            }

        }
    });

}
  
function ActivaColor(elmnt) {

    if ($(elmnt)[0].id == "1") {
        var activo = $(elmnt).data('active');
        if (activo == "0") {

            $("#refVal").html("1");

            $(elmnt).addClass('active');
            $(elmnt).data('active', "1");

            $("#2").removeClass('active');
            $("#2").data('active', "0");

            $("#3").removeClass('active');
            $("#3").data('active', "0");

            $("#ShowHideCP").attr('style', 'visibility: hidden');
            $("#ShowHideE").attr('style', 'visibility: hidden');

        } else {
            $(elmnt).removeClass('active');
            $(elmnt).data('active', "0");
        }
    }

    if ($(elmnt)[0].id == "2") {
        var activo = $(elmnt).data('active');
        if (activo == "0") {

            $("#refVal").html("2");

            $(elmnt).addClass('active');
            $(elmnt).data('active', "1");

            $("#1").removeClass('active');
            $("#1").data('active', "0");

            $("#3").removeClass('active');
            $("#3").data('active', "0");

            $("#ShowHideCP").attr('style', 'visibility: hidden');
            $("#ShowHideE").attr('style', 'visibility: visible');

        } else {
            $(elmnt).removeClass('active');
            $(elmnt).data('active', "0");
        }

        $("#CentroSelected1").val("");

    }

    if ($(elmnt)[0].id == "3") {
        var activo = $(elmnt).data('active');
        if (activo == "0") {

            $("#refVal").html("3");

            $(elmnt).addClass('active');
            $(elmnt).data('active', "1");

            $("#1").removeClass('active');
            $("#1").data('active', "0");

            $("#2").removeClass('active');
            $("#2").data('active', "0");

            $("#ShowHideCP").attr('style', 'visibility: visible');
            $("#ShowHideE").attr('style', 'visibility: visible');


        } else {
            $(elmnt).removeClass('active');
            $(elmnt).data('active', "0");
        }
    }

    if ($(elmnt)[0].id == "4") {

        var activo = $(elmnt).data('active');
        if (activo == "0") {

            $("#compVal").html("4");

            $(elmnt).addClass('active');
            $(elmnt).data('active', "1");

            $("#5").removeClass('active');
            $("#5").data('active', "0");

            $("#6").removeClass('active');
            $("#6").data('active', "0");
             

            $("#ShowHideEComp").attr('style', 'visibility: hidden');
            $("#ShowHideCPComp").attr('style', 'visibility: hidden');

        } else {
            $(elmnt).removeClass('active');
            $(elmnt).data('active', "0");
        }
 
    }

    if ($(elmnt)[0].id == "5") {
        var activo = $(elmnt).data('active');
        if (activo == "0") {

            $("#compVal").html("5");

            $(elmnt).addClass('active');
            $(elmnt).data('active', "1");

            $("#4").removeClass('active');
            $("#4").data('active', "0");

            $("#6").removeClass('active');
            $("#6").data('active', "0");

            $("#ShowHideEComp").attr('style', 'visibility: visible');
            $("#ShowHideCPComp").attr('style', 'visibility: hidden');

        } else {
            $(elmnt).removeClass('active');
            $(elmnt).data('active', "0");
        }


        $("#CentroSelected2").val("");

    }

    if ($(elmnt)[0].id == "6") {
        var activo = $(elmnt).data('active');
        if (activo == "0") {

            $("#compVal").html("6");

            $(elmnt).addClass('active');
            $(elmnt).data('active', "1");

            $("#4").removeClass('active');
            $("#4").data('active', "0");

            $("#5").removeClass('active');
            $("#5").data('active', "0");

            $("#ShowHideEComp").attr('style', 'visibility: visible');
            $("#ShowHideCPComp").attr('style', 'visibility: visible');

        } else {
            $(elmnt).removeClass('active');
            $(elmnt).data('active', "0");
        }

    }

}

function FiltrarEntidad(e) {

    $("#EntidadSelected1").val(e.selectedOptions[0].text);

    $.ajax({
        type: "POST",
        url: 'FiltrarEstadoTipo3.php?idEntidad=' + $("#" + e.id).val(),
        data: $(this).serialize(),
        async: false,
        success: function (response) {
             
            var jsons = response.split("|");

            $("#CPenitenciario1_input").empty();

            //if (response.includes("Sin Resultados")) {
            var u = new Option("-Seleccionar-", "0");
            $(u).html("-Seleccionar-");
            $("#CPenitenciario1_input").append(u);
            //}
             
            var i;
            for (i = 0; i < jsons.length; i++) {

                var obj = JSON.parse(jsons[i]);

                var o = new Option(obj.centroPenDesc, obj.centroPenID);
                $(o).html(obj.centroPenDesc);
                $("#CPenitenciario1_input").append(o);

            }


        }
    });
  
}

function FiltrarEntidad2(e) {

    $("#EntidadSelected2").val(e.selectedOptions[0].text);

    $.ajax({
        type: "POST",
        url: 'FiltrarEstadoTipo3.php?idEntidad=' + $("#" + e.id).val(),
        data: $(this).serialize(),
        async: false,
        success: function (response) {


            var jsons = response.split("|");

            $("#CPenitenciario2_input").empty();

            //if (response.includes("Sin Resultados")) {
            var u = new Option("-Seleccionar-", "0");
            $(u).html("-Seleccionar-");
            $("#CPenitenciario2_input").append(u);
            //}



            var i;
            for (i = 0; i < jsons.length; i++) {

                var obj = JSON.parse(jsons[i]);

                var o = new Option(obj.centroPenDesc, obj.centroPenID);
                $(o).html(obj.centroPenDesc);
                $("#CPenitenciario2_input").append(o);

            }


        }
    });
 
}

function ActivaBtn() {
    var activo = $('#BtnActiva').data('active')
    if (activo == "0") {
         
        $('#Comparativoflag').html("1");
        $('#BtnActiva').data('active', '1')
        $('#BtnActiva').html('<i class="fas fa-window-minimize"></i> <span class="bolder" > COMPARATIVO</span>')
        $('#Filtros2').show();
        $('.btn-orange').show();
        $("#Anio2_input").select2({
            theme: 'bootstrap4', dropdownParent: $('body')
        });
        $("#Entidad2_input").select2({
            theme: 'bootstrap4', dropdownParent: $('body')
        });
        $("#CPenitenciario2_input").select2({
            theme: 'bootstrap4', dropdownParent: $('body')
        });
    } else {


        $('#Comparativoflag').html("0");
        $('#BtnActiva').data('active', '0')
        $('#BtnActiva').html('<i class="fa fa-plus"></i> <span class="bolder"> COMPARATIVO</span>')
        $('#Filtros2').hide();
        $('.btn-orange').hide();

    }
}

