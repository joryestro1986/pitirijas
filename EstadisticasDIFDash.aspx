<%@ Page Language="C#" MasterPageFile="~/DIFMaster.Master" AutoEventWireup="true" CodeBehind="EstadisticasDIFDash.aspx.cs" Inherits="vDIFCapullos.EstadisticasDIFDash" %>


<asp:Content ID="Content2" ContentPlaceHolderID="headCss" runat="Server">

    <link href="css/DIF.css" rel="stylesheet" />
    <link href="font-awesome/css/all.css" rel="stylesheet" />
    <link href="font-awesome/css/all.min.css" rel="stylesheet" />
    <link href="font-awesome/css/fa-regular.css" rel="stylesheet" />
    <link href="font-awesome/css/fa-regular.min.css" rel="stylesheet" />
    <link href="font-awesome/css/fa-solid.min.css" rel="stylesheet" />
    <link href="font-awesome/css/fa-solid.css" rel="stylesheet" />
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="font-awesome/css/fontawesome-all.css" rel="stylesheet" />
    <link href="font-awesome/css/fontawesome-all.min.css" rel="stylesheet" />
    <link href="font-awesome/css/fontawesome.css" rel="stylesheet" />
    <link href="font-awesome/css/fontawesome.min.css" rel="stylesheet" />
    <link href="font-awesome/css/regular.css" rel="stylesheet" />
    <link href="font-awesome/css/regular.min.css" rel="stylesheet" />
    <link href="font-awesome/css/solid.css" rel="stylesheet" />
    <link href="font-awesome/css/solid.min.css" rel="stylesheet" />

    <link href="css/animate.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="headStyle" runat="Server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="Server">


    <div class="col-lg-12">
    <div class="card mb-4">
    <div class="card-body text-center">
    
                <div class="HeaderDashboard">
           <span style="display:table-cell;vertical-align:middle;">Estadísticas</span> 
        </div>


    <div style="padding-top:20px;">
        <div class="textMobilePob">Población del Sistema DIF</div>

    <table style="width:100%">
        <tr>
            <td class="cellShow"></td>
            <td><span id="edadBebe" class="bigPurpleFont">de 3 a 11</span></td>
            <td><span class="IconosHM"><i class="fas fa-male"></i></span></td>
            <td><span id="cantBebeH" class="boldFont"></span><span id="cantBebeHPorc" class="porcentajeP"></span></td>
            <td></td>
            <td style="text-align: right;"><span class="IconosHM"><i class="fas fa-female"></i></span></td>
            <td><span id="cantBebeM" class="boldFont"></span><span id="cantBebeMPorc" class="porcentajeP"></span></td>
        </tr>
        <tr>
            <td class="PobSMPorc"><span class="poblacionSM">Población del Sistema DIF</span></td>
            <td><span id="edadNinio" class="bigPurpleFont"></span></td>
            <td><span class="IconosHM"><i class="fas fa-male"></i></span></td>
            <td><span id="cantNinio" class="boldFont"></span><span id="cantNinioPorc" class="porcentajeP"></span></td>
            <td></td>
            <td style="text-align: right;"><span class="IconosHM"><i class="fas fa-female"></i></span></td>
            <td><span id="cantNinia" class="boldFont"></span><span id="cantNiniaPorc" class="porcentajeP"></span></td>
        </tr>
        <tr>
            <td class="cellShow"></td>
            <td><span id="edadAdol" class="bigPurpleFont"></span></td>
            <td><span class="IconosHM"><i class="fas fa-male"></i></span></td>
            <td><span id="cantAdolH" class="boldFont"></span><span id="cantAdolHPorc" class="porcentajeP"></span></td>
            <td></td>
            <td style="text-align: right;"><span class="IconosHM"><i class="fas fa-female"></i></span></td>
            <td><span id="cantAdolM" class="boldFont"></span><span id="cantAdolMPorc" class="porcentajeP"></span></td>
        </tr>
    </table>

    <div class="textMobilePob">Tipo de Internos</div>

    <table style="width:100%">
        <tr>
            <td><span class="IconosResidencia"><i class="fa fa-home" aria-hidden="true"></i></span> </td>
            <td><span id="fis" class="boldFont"></span></td>
            <td><span class="IconosResidencia"><i class="fa fa-users" aria-hidden="true"></i></span></td>
            <td><span id="int" class="boldFont"></span></td>
            <td><span class="IconosResidencia"><i class="fa fa-hospital-o" aria-hidden="true"></i></span></td>
            <td><span id="hosp" class="boldFont"></span></td>
        </tr>
    </table>

    </div>



                                <div class="col-12 col-sm-12" style="margin-bottom: -20px;">
                                        <div class="lineWrapper" id="BarChartContent">
                                            <canvas id="myChartBar"></canvas>
                                        </div>
                                </div>



    <div style="padding-top:40px">

                <table style="width:100%;">
            <tr>
<%--            <td style="width:10%"></td>
            <td style="width:30%; text-align:center;">Población atendida en el área escolar en el Centro de Atención al Menor y La Familia</td>
            <td style="width:20%"></td>
            <td style="width:30%; text-align:center;">Personas atendidas con terapia en el Centro Psicológico Integral y Fortalecimiento Familiar</td>
            <td style="width:10%"></td>--%>


            <td class="poblacionEM">Población atendida en el área escolar en el Centro de Atención al Menor y La Familia</td>
            <td style="width:30%"></td>
            <td class="poblacionEM">Personas atendidas con terapia en el Centro Psicológico Integral y Fortalecimiento Familiar</td>


            </tr>
        </table>

        <table style="width:100%;">

            <tr>
            <td rowspan="2"><span class="IconosHM"><i class="fa fa-graduation-cap" aria-hidden="true"></i></span></td>
            <td><span class="IconosHM"><i class="fas fa-male"></i></span></td>
            <td><span id="escNinio" class="boldFontEM">0</span></td>
            <td><span class="IconosHM"><i class="fas fa-female"></i></span></td>
            <td><span id="escNinia" class="boldFontEM">0</span></td>
            <td style="text-align: center;"><span id="ninioRango" class="bigPurpleFontEM"></span></td>
            <td><span class="IconosHM"><i class="fas fa-male"></i></span></td>
            <td><span id="psiNinio" class="boldFontEM">0</span></td>
            <td><span class="IconosHM"><i class="fas fa-female"></i></span></td>
            <td><span id="psiNinia" class="boldFontEM">0</span></td>
            <td rowspan="2" style="text-align: end;"><span class="IconosHM"><i class="fa fa-meh-o" aria-hidden="true"></i></span></td>
            </tr>

            <tr>

            <td><span class="IconosHM"><i class="fas fa-male"></i></span></td>
            <td><span id="escAdolH" class="boldFontEM">0</span></td>
            <td><span  class="IconosHM"><i class="fas fa-female"></i></span></td>
            <td><span id="escAdolM" class="boldFontEM">0</span></td>
            <td style="text-align: center;"><span id="adolRango" class="bigPurpleFontEM"></span></td>
            <td><span class="IconosHM"><i class="fas fa-male"></i></span></td>
            <td><span id="psiAdolH" class="boldFontEM">0</span></td>
            <td><span class="IconosHM"><i class="fas fa-female"></i></span></td>
            <td><span id="psiAdolM" class="boldFontEM">0</span></td>

            </tr>
        </table>

    </div>

    <div style="padding-top:40px">

        <div class="textMobilePob">Campamentos de verano realizados en el Sistema DIF</div>
         
        <table>
            <tr>

                <td class="poblacionCamp" rowspan="3">Campamentos de verano realizados en el Sistema DIF</td>
                <td style="width:2%" rowspan="3"></td>
                <td rowspan="3"><span class="IconosCamp"><i class='fa fa-tree'></i></span></td>
                <td style="width: 5%;"></td>
                <td class="campColor1">42%</td>
                <td style="width:5%"></td>
                <td class="campColor1">43%</td>
                <td style="width:5%"></td>
                <td class="campColor1">40%</td>
            </tr>
            <tr>

                <td></td>
                <td class="campColor2">58%</td>
                <td style="width:5%"></td>
                <td class="campColor2">57%</td>
                <td style="width:5%"></td>
                <td class="campColor2">60%</td>
                <td style="width:5%"></td>
            </tr>
            <tr>
                <td></td>
                <td style="text-align:center;"><span class="bigPurpleFontCamp">2017</span></td>
                <td style="width:5%"></td>
                <td style="text-align:center;"><span class="bigPurpleFontCamp">2018</span></td>
                <td style="width:5%"></td>
                <td style="text-align:center;"><span class="bigPurpleFontCamp">2019</span></td>
                <td style="width:5%"></td>
            </tr>
        </table>
        
    </div>


    </div>
    </div>
    </div>





</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerJs" runat="Server">
        <script src="js/Chart.min.js"></script>
    <script src="js/jquery-3.1.1.min.js"></script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="footerScript" runat="Server">

    <script type="text/javascript">

        $(document).ready(function () {

            $("#TabDashInicial").addClass('active');


            //P O B L A C I O N
            $.ajax({
                type: "POST",
                url: "ASHXFiles/DB.ashx?o=SexoDash",
                contentType: "application/json",
                dataType: "json",
                async: false,
                success: function (response) {

                    if (response.Data1.length > 0) {
                        var Jsd = response.Data1;
                        var Total = 0;
                        var Porc = 0;

                        $.each(Jsd, function (index) {
                            Total = Total + parseInt(Jsd[index].cant);
                        });


                        $.each(Jsd, function (index) {


                            if (index == 0) {
                                $("#edadBebe").html(Jsd[index].rangoEdad);
                                $("#cantBebeM").html(Jsd[index].cant);

                                Porc = parseInt(Jsd[index].cant) * 100;
                                Porc = Porc / Total;
                                Porc = Porc.toFixed(2);

                                $("#cantBebeMPorc").html("(" + Porc + "%)");

                            }

                            if (index == 1) {
                                $("#edadBebe").html(Jsd[index].rangoEdad);
                                $("#cantBebeH").html(Jsd[index].cant);

                                Porc = parseInt(Jsd[index].cant) * 100;
                                Porc = Porc / Total;
                                Porc = Porc.toFixed(2);

                                $("#cantBebeHPorc").html("(" + Porc + "%)");

                            }


                            if (index == 2) {
                                $("#edadNinio").html(Jsd[index].rangoEdad);
                                $("#cantNinia").html(Jsd[index].cant);

                                Porc = parseInt(Jsd[index].cant) * 100;
                                Porc = Porc / Total;
                                Porc = Porc.toFixed(2);

                                $("#cantNiniaPorc").html("(" + Porc + "%)");

                            }


                            if (index == 3) {
                                $("#edadNinio").html(Jsd[index].rangoEdad);
                                $("#cantNinio").html(Jsd[index].cant);

                                Porc = parseInt(Jsd[index].cant) * 100;
                                Porc = Porc / Total;
                                Porc = Porc.toFixed(2);

                                $("#cantNinioPorc").html("(" + Porc + "%)");

                            }

                            if (index == 4) {
                                $("#edadAdol").html(Jsd[index].rangoEdad);
                                $("#cantAdolM").html(Jsd[index].cant);

                                Porc = parseInt(Jsd[index].cant) * 100;
                                Porc = Porc / Total;
                                Porc = Porc.toFixed(2);

                                $("#cantAdolMPorc").html("(" + Porc + "%)");

                            }

                            if (index == 5) {
                                $("#cantAdolH").html(Jsd[index].cant);

                                Porc = parseInt(Jsd[index].cant) * 100;
                                Porc = Porc / Total;
                                Porc = Porc.toFixed(2);

                                $("#cantAdolHPorc").html("(" + Porc + "%)");

                            }

                            //var o = new Option(Jsd[index].Sexo, Jsd[index].Indice);
                            //$(o).html(Jsd[index].Mes);
                            //$('#Sexo1_input').append(o);

                        });



                    }

                }
            });

            $.ajax({
                type: "POST",
                url: "ASHXFiles/DB.ashx?o=MenorPoblacionTipo",
                contentType: "application/json",
                dataType: "json",
                async: false,
                success: function (response) {


                    if (response.Data1.length > 0) {
                        var Jsd = response.Data1;

                        $.each(Jsd, function (index) {

                            if (index == 0) {
                                $("#fis").html(Jsd[index].cant);
                            }


                            if (index == 1) {
                                $("#int").html(Jsd[index].cant);
                            }


                            if (index == 2) {
                                $("#hosp").html(Jsd[index].cant);
                            }

                            //var o = new Option(Jsd[index].Sexo, Jsd[index].Indice);
                            //$(o).html(Jsd[index].Mes);
                            //$('#Sexo1_input').append(o);

                        });



                    }

                }
            });






            //G R A F I C A
            var barChartContent = document.getElementById('BarChartContent');
            barChartContent.innerHTML = '&nbsp;';
            $('#BarChartContent').append('<canvas id="myChartBar"></canvas>');

            var ctx = document.getElementById("myChartBar").getContext("2d");



            //ctx.canvas.parentNode.style.width = '50%';
            //ctx.canvas.parentNode.style.top = 0;
            //ctx.canvas.parentNode.style.bottom = 0;
            //ctx.canvas.parentNode.style.left = 0;
            //ctx.canvas.parentNode.style.right = 0;
            //ctx.canvas.parentNode.style.margin = 'auto';


            new Chart(document.getElementById("myChartBar"), {
                type: 'bar',
                data: {
                    labels: ["Capullos", "Monarcas", "Fabriles"],
                    datasets: [
                        {
                            label: "Niñas",
                            stack: "Base",
                            backgroundColor: ["#67519c", "#67519c", "#67519c"],
                            data: [28, 47, 44]
                        },
                        {
                            label: "Niños",
                            stack: "Comp",
                            backgroundColor: ["#b898c9", "#b898c9", "#b898c9"],
                            data: [24, 50, 0]
                        }
                    ]
                },
                options: {
                    legend: { display: false },
                    title: {
                        display: true,
                        text: 'Población de 10 a 17 años en los Centros de Atención al Menor y la Familia'
                    },
                    scales: {
                        yAxes: [{
                            ticks: {
                                mirror: true, //Show y-axis labels inside horizontal bars
                                min: 0,
                                max: 50,
                                stepSize: 10
                            },
                            stacked: true
                        }],
                        xAxes: [{
                            barPercentage: 0.6,
                            categoryPercentage: 0.6,
                            stacked: true
                        }]
                    }
                }
            });

            // E D U C A C I O N  /  P S I C O L O G I C O
            $.ajax({
                type: "POST",
                url: "ASHXFiles/DB.ashx?o=EducacionDash",
                contentType: "application/json",
                dataType: "json",
                async: false,
                success: function (response) {


                    if (response.Data1.length > 0) {
                        var Jsd = response.Data1;

                        $.each(Jsd, function (index) {

                            if (index == 0) {
                                $("#ninioRango").html(Jsd[index].rangoEdad);

                                $("#escNinia").html(Jsd[index].cant);
                            }


                            if (index == 1) {
                                $("#escNinio").html(Jsd[index].cant);
                            }


                            if (index == 2) {
                                $("#adolRango").html(Jsd[index].rangoEdad);
                                $("#escAdolM").html(Jsd[index].cant);
                            }

                            if (index == 3) {
                                $("#escAdolH").html(Jsd[index].cant);
                            }

                        });



                    }

                }
            });

            $.ajax({
                type: "POST",
                url: "ASHXFiles/DB.ashx?o=PsicologicoDash",
                contentType: "application/json",
                dataType: "json",
                async: false,
                success: function (response) {


                    if (response.Data1.length > 0) {
                        var Jsd = response.Data1;

                        $.each(Jsd, function (index) {

                            if (index == 0) {
                                $("#psiNinia").html(Jsd[index].cant);
                            }


                            if (index == 1) {
                                $("#psiNinio").html(Jsd[index].cant);
                            }


                            if (index == 2) {
                                $("#psiAdolM").html(Jsd[index].cant);
                            }


                            if (index == 3) {
                                $("#psiAdolH").html(Jsd[index].cant);
                            }

                        });



                    }

                }
            });

        })



    </script>




</asp:Content>

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <link href="css/DIF.css" rel="stylesheet" />
    <link href="font-awesome/css/all.css" rel="stylesheet" />
    <link href="font-awesome/css/all.min.css" rel="stylesheet" />
    <link href="font-awesome/css/fa-regular.css" rel="stylesheet" />
    <link href="font-awesome/css/fa-regular.min.css" rel="stylesheet" />
    <link href="font-awesome/css/fa-solid.min.css" rel="stylesheet" />
    <link href="font-awesome/css/fa-solid.css" rel="stylesheet" />
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="font-awesome/css/fontawesome-all.css" rel="stylesheet" />
    <link href="font-awesome/css/fontawesome-all.min.css" rel="stylesheet" />
    <link href="font-awesome/css/fontawesome.css" rel="stylesheet" />
    <link href="font-awesome/css/fontawesome.min.css" rel="stylesheet" />
    <link href="font-awesome/css/regular.css" rel="stylesheet" />
    <link href="font-awesome/css/regular.min.css" rel="stylesheet" />
    <link href="font-awesome/css/solid.css" rel="stylesheet" />
    <link href="font-awesome/css/solid.min.css" rel="stylesheet" />



    <link href="css/animate.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <script src="js/Chart.min.js"></script>
    <script src="js/jquery-3.1.1.min.js"></script>

</head>
<body class="BodyDashboard">
        <div style="display:flex;">
         <div>
            <span><img style="position: absolute;" height="80" src="images/DIFLogo.png" /></span>
        </div>
        <div class="HeaderDashboard">
           <span style="display:table-cell;vertical-align:middle;">Estadísticas DIF</span> 
        </div>
        </div>



    <table style="width:100%">
        <tr>
            <td style="width:10%"></td>
            <td rowspan="3"><span style="vertical-align:middle; font-size:25px;">Población del Sistema Municipal DIF</span></td>
            <td><span id="edadNinio" class="bigPurpleFont"></span></td>
            <td><span class="IconosHM"><i class="fas fa-male"></i></span></td>
            <td><span id="cantNinio" class="boldFont"></span><span id="cantNinioPorc" class="boldFont"></span></td>
            <td></td>
            <td style="text-align: right;"><span class="IconosHM"><i class="fas fa-female"></i></span></td>
            <td><span id="cantNinia" class="boldFont"></span><span id="cantNiniaPorc" class="boldFont"></span></td>
            <td style="width:10%"></td>
        </tr>
        <tr>
            <td style="width:10%"></td>
            <td><span id="edadAdol" class="bigPurpleFont"></span></td>
            <td><span class="IconosHM"><i class="fas fa-male"></i></span></td>
            <td><span id="cantAdolH" class="boldFont"></span><span id="cantAdolHPorc" class="boldFont"></span></td>
            <td></td>
            <td style="text-align: right;"><span class="IconosHM"><i class="fas fa-female"></i></span></td>
            <td><span id="cantAdolM" class="boldFont"></span><span id="cantAdolMPorc" class="boldFont"></span></td>
            <td style="width:10%"></td>
        </tr>
        <tr>
            <td style="width:10%"></td>
            <td><span class="IconosResidencia"><i class="fa fa-home" aria-hidden="true"></i></span> </td>
            <td><span id="fis" style="font-weight:bold; font-size:25px;"></span></td>
            <td style="text-align:center;"><span class="IconosResidencia"><i class="fa fa-users" aria-hidden="true"></i></span></td>
            <td><span id="int" style="padding-left: 50px; font-weight:bold; font-size:25px;"></span></td>
            <td><span class="IconosResidencia"><i class="fa fa-hospital-o" aria-hidden="true"></i></span></td>
            <td style="text-align:center;"><span id="hosp" style="font-weight:bold; font-size:25px;"></span></td>
            <td style="width:10%"></td>
        </tr>
    </table>

                                <div class="col-12 col-sm-12" style="margin-bottom: -20px;">
                                        <div id="BarChartContent">
                                            <canvas id="myChartBar"></canvas>
                                        </div>
                                </div>



    <div style="padding-top:40px">

                <table style="width:100%;">
            <tr>
            <td style="width:10%"></td>
            <td style="width:30%; text-align:center;">Población atendida en el área escolar en el Centro de Atención al Menor y La Familia</td>
            <td style="width:20%"></td>
            <td style="width:30%; text-align:center;">Personas atendidas con terapia en el Centro Psicológico Integral y Fortalecimiento Familiar</td>
            <td style="width:10%"></td>
            </tr>
        </table>

        <table style="width:100%;">

            <tr>
            <td style="width:10%"></td>
            <td rowspan="2"><span class="IconosHM"><i class="fa fa-graduation-cap" aria-hidden="true"></i></span></td>
            <td><span class="IconosHM"><i class="fas fa-male"></i></span></td>
            <td><span id="escNinio" class="boldFontEM">0</span></td>
            <td><span class="IconosHM"><i class="fas fa-female"></i></span></td>
            <td><span id="escNinia" class="boldFontEM">0</span></td>
            <td style="text-align: center;"><span id="ninioRango" class="bigPurpleFontEM"></span></td>
            <td><span class="IconosHM"><i class="fas fa-male"></i></span></td>
            <td><span id="psiNinio" class="boldFontEM">0</span></td>
            <td><span class="IconosHM"><i class="fas fa-female"></i></span></td>
            <td><span id="psiNinia" class="boldFontEM">0</span></td>
            <td rowspan="2" style="text-align: end;"><span class="IconosHM"><i class="fa fa-meh-o" aria-hidden="true"></i></span></td>
            <td style="width:10%"></td>
            </tr>

            <tr>
            <td style="width:10%"></td>

            <td><span class="IconosHM"><i class="fas fa-male"></i></span></td>
            <td><span id="escAdolH" class="boldFontEM">0</span></td>
            <td><span  class="IconosHM"><i class="fas fa-female"></i></span></td>
            <td><spanid="escAdolM" class="boldFontEM">0</spanid="escAdolM"></td>
            <td style="text-align: center;"><span id="adolRango" class="bigPurpleFontEM"></span></td>
            <td><span class="IconosHM"><i class="fas fa-male"></i></span></td>
            <td><span id="psiAdolH" class="boldFontEM">0</span></td>
            <td><span class="IconosHM"><i class="fas fa-female"></i></span></td>
            <td><span id="psiAdolM" class="boldFontEM">0</span></td>

            <td style="width:10%"></td>
            </tr>
        </table>

    </div>

    <div style="padding-top:40px">
         
        <table>
            <tr>
                <td style="width:15%"></td>
                <td style="width:10%" rowspan="3">Campamentos de verano realizados en el Sistema Municipal DIF</td>
                <td style="width:2%" rowspan="3"></td>
                <td rowspan="3"><span class="IconosHM"><i style="font-size:150px;" class='fa fa-tree'></i></span></td>
                <td style="width: 5%;"></td>
                <td class="campColor1">42%</td>
                <td style="width:5%"></td>
                <td class="campColor1">43%</td>
                <td style="width:5%"></td>
                <td class="campColor1">40%</td>
                <td style="width:15%"></td>
            </tr>
            <tr>
                <td style="width:15%"></td>
                <td></td>
                <td class="campColor2">58%</td>
                <td style="width:5%"></td>
                <td class="campColor2">57%</td>
                <td style="width:5%"></td>
                <td class="campColor2">60%</td>
                <td style="width:5%"></td>
                <td style="width:15%"></td>
            </tr>
            <tr>
                <td style="width:15%"></td>
                <td></td>
                <td style="text-align:center;"><span class="bigPurpleFontCamp">2017</span></td>
                <td style="width:5%"></td>
                <td style="text-align:center;"><span class="bigPurpleFontCamp">2018</span></td>
                <td style="width:5%"></td>
                <td style="text-align:center;"><span class="bigPurpleFontCamp">2019</span></td>
                <td style="width:5%"></td>
                <td style="width:15%"></td>
            </tr>
        </table>
        
    </div>





    


</body>
</html>
<script type="text/javascript">

    $(document).ready(function () {




        //P O B L A C I O N
        $.ajax({
            type: "POST",
            url: "ASHXFiles/DB.ashx?o=SexoDash",
            contentType: "application/json",
            dataType: "json",
            async: false,
            success: function (response) {

                if (response.Data1.length > 0) {
                    var Jsd = response.Data1;
                    var Total = 0;
                    var Porc = 0;

                    $.each(Jsd, function (index) {
                        Total = Total + parseInt(Jsd[index].cant);
                    });


                    $.each(Jsd, function (index) {

                        if (index == 0) {
                            $("#edadNinio").html(Jsd[index].rangoEdad);
                            $("#cantNinia").html(Jsd[index].cant);

                            Porc = parseInt(Jsd[index].cant) * 100;
                            Porc = Porc / Total;
                            Porc = Porc.toFixed(2);

                            $("#cantNiniaPorc").html("(" + Porc + "%)");


                        }

                        if (index == 1) {
                            $("#cantNinio").html(Jsd[index].cant);

                            Porc = parseInt(Jsd[index].cant) * 100;
                            Porc = Porc / Total;
                            Porc = Porc.toFixed(2);

                            $("#cantNinioPorc").html("(" + Porc + "%)");
                        }

                        if (index == 2) {
                            $("#edadAdol").html(Jsd[index].rangoEdad);
                            $("#cantAdolM").html(Jsd[index].cant);

                            Porc = parseInt(Jsd[index].cant) * 100;
                            Porc = Porc / Total;
                            Porc = Porc.toFixed(2);

                            $("#cantAdolMPorc").html("(" + Porc + "%)");
                            
                        }

                        if (index == 3) {
                            $("#cantAdolH").html(Jsd[index].cant);

                            Porc = parseInt(Jsd[index].cant) * 100;
                            Porc = Porc / Total;
                            Porc = Porc.toFixed(2);

                            $("#cantAdolHPorc").html("(" + Porc + "%)");
                            
                        }

                        //var o = new Option(Jsd[index].Sexo, Jsd[index].Indice);
                        //$(o).html(Jsd[index].Mes);
                        //$('#Sexo1_input').append(o);

                    });



                }

            }
        });

        $.ajax({
            type: "POST",
            url: "ASHXFiles/DB.ashx?o=MenorPoblacionTipo",
            contentType: "application/json",
            dataType: "json",
            async: false,
            success: function (response) {


                if (response.Data1.length > 0) {
                    var Jsd = response.Data1;

                    $.each(Jsd, function (index) {

                        if (index == 0) {
                            $("#fis").html(Jsd[index].cant);
                        }


                        if (index == 1) {
                            $("#int").html(Jsd[index].cant);
                        }


                        if (index == 2) {
                            $("#hosp").html(Jsd[index].cant);
                        }

                        //var o = new Option(Jsd[index].Sexo, Jsd[index].Indice);
                        //$(o).html(Jsd[index].Mes);
                        //$('#Sexo1_input').append(o);

                    });



                }

            }
        });






        //G R A F I C A
        var barChartContent = document.getElementById('BarChartContent');
        barChartContent.innerHTML = '&nbsp;';
        $('#BarChartContent').append('<canvas id="myChartBar"></canvas>');

        var ctx = document.getElementById("myChartBar").getContext("2d");



        ctx.canvas.parentNode.style.width = '50%';
        ctx.canvas.parentNode.style.top = 0;
        ctx.canvas.parentNode.style.bottom = 0;
        ctx.canvas.parentNode.style.left = 0;
        ctx.canvas.parentNode.style.right = 0;
        ctx.canvas.parentNode.style.margin = 'auto';


        new Chart(document.getElementById("myChartBar"), {
            type: 'bar',
            data: {
                labels: ["Capullos", "Monarcas", "Fabriles"],
                datasets: [
                    {
                        label: "Niñas",
                        stack: "Base",
                        backgroundColor: ["#67519c", "#67519c", "#67519c"],
                        data: [28, 47, 44]
                    },
                    {
                        label: "Niños",
                        stack: "Comp",
                        backgroundColor: ["#b898c9", "#b898c9", "#b898c9"],
                        data: [24, 50, 0]
                    }
                ]
            },
            options: {
                legend: { display: false },
                title: {
                    display: true,
                    text: 'Población de 10 a 17 años en los Centros de Atención al Menor y la Familia'
                },
                scales: {
                    yAxes: [{                       
                        ticks: {
                            mirror: true, //Show y-axis labels inside horizontal bars
                            min: 0,
                            max: 50,
                            stepSize: 10
                        },
                        stacked: true
                    }],
                    xAxes: [{
                        barPercentage: 0.6,
                        categoryPercentage: 0.6,
                        stacked: true
                    }]
                }
            }
        });

        // E D U C A C I O N  /  P S I C O L O G I C O
        $.ajax({
            type: "POST",
            url: "ASHXFiles/DB.ashx?o=EducacionDash",
            contentType: "application/json",
            dataType: "json",
            async: false,
            success: function (response) {


                if (response.Data1.length > 0) {
                    var Jsd = response.Data1;

                    $.each(Jsd, function (index) {

                        if (index == 0) {
                            $("#ninioRango").html(Jsd[index].rangoEdad);
                            
                            $("#escNinia").html(Jsd[index].cant);
                        }


                        if (index == 1) {
                            $("#escNinio").html(Jsd[index].cant);
                        }


                        if (index == 2) {
                            $("#adolRango").html(Jsd[index].rangoEdad);
                            $("#escAdolH").html(Jsd[index].cant);
                        }

                    });



                }

            }
        });

        $.ajax({
            type: "POST",
            url: "ASHXFiles/DB.ashx?o=PsicologicoDash",
            contentType: "application/json",
            dataType: "json",
            async: false,
            success: function (response) {


                if (response.Data1.length > 0) {
                    var Jsd = response.Data1;

                    $.each(Jsd, function (index) {

                        if (index == 0) {
                            $("#psiNinio").html(Jsd[index].cant);
                        }


                        if (index == 1) {
                            $("#psiNinia").html(Jsd[index].cant);
                        }


                        if (index == 2) {
                            $("#psiAdolH").html(Jsd[index].cant);
                        }

                    });



                }

            }
        });

    })



</script>--%>
