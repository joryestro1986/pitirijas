<%@ Page Language="C#" MasterPageFile="~/DIFMaster.Master" AutoEventWireup="true" CodeBehind="Graficas.aspx.cs" Inherits="vDIFCapullos.Graficas" %>


<asp:Content ID="Content2" ContentPlaceHolderID="headCss" runat="Server">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="font-awesome/css/all.css" rel="stylesheet" />
    <link href="css/animate.css" rel="stylesheet" />
    <link href="css/select2.min.css" rel="stylesheet">
    <link href="css/select2-bootstrap4.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/plugins/dataTables/datatablesMC.min.css" rel="stylesheet" />

<%--    <link href="css/UNODC.css" rel="stylesheet" />--%>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="headStyle" runat="Server">
        <style>




        #shade { background-color: #aea7a76b; left: 0; opacity: 0.75; position: absolute; top:0;  width: 100%; z-index: 9998; }
        .shade { color: red;text-align: center; position: fixed;  top:150px; width: 100%; z-index: 9999;cursor: auto;}

        .EstandarComp {
            border-right-style: solid;
            border-right-color: #ffffff;
            height: 49px;
            margin-top: -3px;
            margin-bottom: -3px;
        }

        .EstandarCompred {
            border-right-style: solid;
            border-right-color: #ff0000;
            height: 49px;
            margin-top: -3px;
            margin-bottom: -3px;
        }

        .EstandarCompAppr {
            border-right-style: solid;
            border-right-color: #0B438C;
            height: 49px;
            margin-top: -3px;
            margin-bottom: -3px;
        }


        #chart-area4 {
            margin: 0 auto;
            background: transparent url(../img/G_03_A.png) no-repeat center center;
            height: 200px !important;
            width: 200px !important;
        }

        #chart-area5 {
            margin: 0 auto;
            background: transparent url(../img/G_02_A.png) no-repeat center center;
            height: 200px !important;
            width: 200px !important;
        }

        #chart-area6 {
            margin: 0 auto;
            background: transparent url(../img/G_05_A.png) no-repeat center center;
            height: 200px !important;
            width: 200px !important;
        }

        #chart-area7 {
            margin: 0 auto;
            background: transparent url(../img/G_04_A.png) no-repeat center center;
            height: 200px !important;
            width: 200px !important;
        }




        canvas {
            -moz-user-select: none;
            -webkit-user-select: none;
            -ms-user-select: none;
        }
    </style>
    <style>


/*        .btn-orange {
            background-color: transparent;
            color: #808080;
            border-color: #808080;
        }

            .btn-orange:hover, .btn-orange.active {
                background-color: darkorange;
                color: white;
                border-color: darkorange;
            }*/

        .btn-down > .pri {
            display: block;
        }

        .btn-down > .sec {
            display: none;
        }

        .btn-down:hover > .pri {
            display: none;
            cursor: pointer;
        }

        .btn-down:hover > .sec {
            display: block;
            cursor: pointer;
        }

            .btn-down:hover > .sec:hover {
                opacity: .7;
            }

        .bolder {
            font-weight: bolder;
        }

        @media (min-width: 576px) {
            .modal-dialog {
                max-width: none;
                margin: .5rem;
            }
        }

/*        .select2-container--bootstrap4 .select2-results__option--highlighted,
        .select2-container--bootstrap4 .select2-results__option--highlighted.select2-results__option[aria-selected=true] {
            background-color: #0B438C;
        }

        .select2-container--bootstrap4.select2-container--focus .select2-selection {
            box-shadow: none;
            border-color: #232d82;
        }

        .pace .pace-progress {background-color: #0B438C;}*/
    </style>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="Server">

    <div id="shade" style="display: none;"></div>
    <div id="waitingPopupLoading" style="display: none;" class="shade"><div style="padding-top: 200px;"><i style="font-size: 50px;color: #6f6a6a;" class="fas fa-spinner fa-pulse"></i></div></div>
    <div id="divContentG" style="display:none"></div>
    <div id="divContentR" style="display:none"></div>
    <div id="divContentJ" style="display:none"></div>
    <div id="EntidadSelected1" style="display:none"></div>
    <div id="EntidadSelected2" style="display:none"></div>
    <div id="CentroSelected1" style="display:none"></div>
    <div id="CentroSelected2" style="display:none"></div>
    <div id="municipioSel" style="display:none"></div>
    <div id="municipioSelComp" style="display:none"></div>
    <div id="EstandarRefflag" style="display:none"></div>
    <div id="EstandarComflag" style="display:none"></div>
    <div id="Comparativoflag" style="display:none">0</div>


    <div id="BloqueSel" style="display:none"></div>
    <div id="TemaSel" style="display:none"></div>

    <div id="refVal" style="display:none">1</div>
    <div id="compVal" style="display:none">4</div>


<%--    <div id="wrapper">



        <div id="page-wrapper" class="gray-bg dashbard-1">--%>

    <div class="col-lg-12">
<div class="cardContent mb-4">
<div class="card-body text-center">




            <div id="FiltrosDIF">
            <div class="row" style="padding-top:20px;">
                <div class="col-12 col-sm-2 offset-sm-1" style="text-align:left;">
                    <h3><b>REFERENCIA</b></h3>
                </div>
                <div class="col-12 col-sm-2 no-padding">
                    <button id="1" class="btn btn-gray btn-block active" onclick="ActivaColor(this);" data-active="0">GLOBAL</button>
                </div>
                <div class="col-12 col-sm-2 no-padding">
                    <button id="2" class="btn btn-gray btn-block" onclick="ActivaColor(this);" data-active="0">PROGRAMA</button>
                </div>
                <div class="col-12 col-sm-2 no-padding">
                    <button id="3" class="btn btn-gray btn-block" onclick="ActivaColor(this);" data-active="0">SEXO</button>
                </div>
            </div>
            <div id="Filtros1" class="rowFullScreen"  style="padding-top:20px;">

                       <div class="col-12 col-sm-6 col-xl-3">
                            <select id="Anio1_input">
                            </select>
                       </div>
                       <div class="col-12 col-sm-6 col-xl-3">
                         <select onchange="FiltrarEntidad(this);" id="Entidad1_input" >
                                <option value="0">-Mes-</option>
                        </select>
                       </div>
                       <div id="ShowHideE" class="col-12 col-sm-6 col-xl-3" style="visibility:hidden">
                            <select id="CPenitenciario1_input" >
                                <option value="0">-Programa-</option>
                            </select>
                       </div>
                       <div id="ShowHideCP" class="col-12 col-sm-6 col-xl-3" style="visibility:hidden">
                            <select id="Sexo1_input" >
                                <option value="0">-Sexo-</option>
                            </select>
                        </div>

            </div>
            <div class="row" style="padding-top:20px;">
                <div class="col-12 col-sm-2 offset-sm-1" style="text-align:left;">
                    <button id="BtnActiva" class="btn btn-link" style="color:#676a6c; font-size:15px;" onclick="ActivaBtn();" data-active="0"><i class="fa fa-plus"></i><span class="bolder"> COMPARATIVO</span></button>
                </div>
                <div class="col-12 col-sm-2 no-padding">
                    <button id="4" class="btn btn-orange btn-block active" onclick="ActivaColor(this);" data-active="0" style="display:none">GLOBAL</button>
                </div>
                <div class="col-12 col-sm-2 no-padding">
                    <button id="5" class="btn btn-orange btn-block" onclick="ActivaColor(this);" data-active="0" style="display:none">PROGRAMA</button>
                </div>
                <div class="col-12 col-sm-2 no-padding">
                    <button id="6" class="btn btn-orange btn-block" onclick="ActivaColor(this);" data-active="0" style="display:none">SEXO</button>
                </div>
            </div>
            <div id="Filtros2" class="rowFullScreen" style="padding-top:20px; display:none !important;">
<%--                <div class="col-12 col-sm-2 offset-sm-1">
                    <div style="display:flex;">
                    <select id="Anio2_input" class="form-control">
                    </select>
                     <select onchange="FiltrarEntidad(this);" id="Entidad2_input" class="form-control">
                        <option value="0">-Mes-</option>
                    </select>
                    </div>
                </div>
                <div id="ShowHideEComp" class="col-12 col-sm-2" style="visibility:hidden">
                     <select id="CPenitenciario2_input" class="form-control">
                        <option value="0">-Programa-</option>
                    </select>
                </div>
                <div id="ShowHideCPComp" class="col-12 col-sm-2" style="visibility:hidden">
                     <select id="Sexo2_input" class="form-control">
                        <option value="0">-Sexo-</option>
                    </select>
                </div>--%>


                       <div class="col-12 col-sm-6 col-xl-3">
                            <select id="Anio2_input">
                            </select>
                       </div>
                       <div class="col-12 col-sm-6 col-xl-3">
                         <select onchange="FiltrarEntidad(this);" id="Entidad2_input" >
                                <option value="0">-Mes-</option>
                        </select>
                       </div>
                       <div id="ShowHideEComp" class="col-12 col-sm-6 col-xl-3" style="visibility:hidden">
                            <select id="CPenitenciario2_input" >
                                <option value="0">-Programa-</option>
                            </select>
                       </div>
                       <div id="ShowHideCPComp" class="col-12 col-sm-6 col-xl-3" style="visibility:hidden">
                            <select id="Sexo2_input" >
                                <option value="0">-Sexo-</option>
                            </select>
                        </div>



            </div>

            </div>

<%--            <div class="row no-padding" style="padding-top:20px !important;">
                <div class="col-sm-10 offset-sm-1">
                    <div class="ibox collapsed">
                        <div class="ibox-title">
                            <h5>BLOQUES</h5>

                            <div onclick="MostrarXBloques()" class="ibox-tools">

                                <div style="display:inline-flex">

                                    <a class="collapse-link">
                                        <i id="collapseXBloque" class="fa fa-chevron-up"></i>
                                    </a>
                                    <div id="refBloque" style="display:none;"><i class="fas fa-sync-alt" style="color: #c4c4c4; font-size: 11px; padding-left: 5px; cursor:pointer"></i></div>

                                </div>


                            </div>

                        </div>
                        <div class="ibox-content">
                            <div class="row">



                                <div id="divmychart1" class="col-12 col-sm-4">
                                    <canvas id="mychart1" />
                                </div>
                                <div id="divmychart2" class="col-12 col-sm-4">
                                    <canvas id="mychart2" />
                                </div>
                                <div id="divmychart3" class="col-12 col-sm-4">
                                    <canvas id="mychart3" />
                                </div>


                                <div class="col-12 col-sm-4">
                                    <div id="bc1" style="text-align: center;color: #fd5300;padding-top: 5px;font-size: 15px;"><i class="fa fa-square" style="padding-right:10px; font-size:15px;"></i><span id="BloqueComparativo1"></span>%</div>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <div id="bc2" style="text-align: center;color: #fd5300;padding-top: 5px;font-size: 15px;"><i class="fa fa-square" style="padding-right:10px; font-size:15px;"></i><span id="BloqueComparativo2"></span>%</div>
                                </div>
                                <div class="col-12 col-sm-4">

                                    <div id="bc3" style="text-align: center;color: #fd5300;padding-top: 5px;font-size: 15px;"><i class="fa fa-square" style="padding-right:10px; font-size:15px;"></i><span id="BloqueComparativo3"></span>%</div>

                                </div>


                                <div id="Gobernabilidad" style="text-align:center; color: #00a914; font-size: 23px;" class="col-12 col-sm-4">
                                    <b>Capullos</b>
                                </div>
                                <div id="Justicia" style="text-align:center; color: #017ece; font-size: 23px;" class="col-12 col-sm-4">
                                    <b>Monarcas</b>
                                </div>
                                <div id="ReinsercionSocial" style="text-align:center; color: #7f1979; font-size: 23px;" class="col-12 col-sm-4">
                                    <b>Fabriles</b>
                                </div>



                                <div id="BloqueEstadoDivLeft">
                                </div>

                                <div id="BloqueEstadoDiv">
                                    <div style="text-align: center;color: #232d82;padding-top: 50px;font-size: 20px;width: 100%"><i class="fa fa-square" style="padding-right:10px; font-size:30px;"></i><span id="BloqueEstado"></span></div>
                                </div>

                                <div id="BloqueCentroDiv">
                                    <div style="text-align: center;color: #fd5300;padding-top: 50px;font-size: 20px;width: 100%"><i class="fa fa-square" style="padding-right:10px; font-size:30px;"></i><span id="BloqueCentro"></span></div>
                                </div>

                                <div id="BloqueCentroDivRight">
                                </div>


                                <div class="col-12">

                                    <div id="BloqueValidador" style="display:none; padding-top:20px;">
                                        <div class="alert alert-danger" style="width:100%; text-align:center" role="alert">
                                            <span id="textMessageBlock"></span>
                                        </div>
                                    </div>


                                </div>






                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>
            <div class="row no-padding" style="padding-top:20px !important;">
                <div class="col-sm-10 offset-sm-1">
                    <div class="ibox collapsed">
                        <div class="ibox-title">
                            <h5>TIPOS DE INGRESOS</h5>

                            <div onclick="MostrarXTema()" class="ibox-tools">

                                <div style="display:inline-flex">

                                    <a class="collapse-link">
                                        <i id="collapseXTema" class="fa fa-chevron-up"></i>
                                    </a>
                                    <div id="refTema" style="display:none;"><i class="fas fa-sync-alt" style="color: #c4c4c4; font-size: 11px; padding-left: 5px; cursor:pointer"></i></div>

                                </div>

                            </div>


                        </div>
                        <div class="ibox-content" style="height:480px !important">
                            <div >
                                <div class="col-12 col-sm-12" style="margin-bottom: -20px;">
                                    <div id="BarChartContent">
                                        <canvas id="myChartBar"></canvas>
                                    </div>
                                </div>


                                <div id="TemaEstadoDivLeft">
                                </div>

                                <div id="TemaEstadoDiv" style="display:none !important;">
                                    <div style="text-align: center; color: #232d82;padding-top: 50px;font-size: 20px;width: 100%"><i class="fa fa-square" style="padding-right:10px; font-size:30px;"></i><span id="TemaEstado">Centro de reinsercion femenil Santa Martha</span></div>
                                </div>

                                <div id="TemaCentroDiv">
                                    <div style="text-align: center;color: #fd5300;padding-top: 50px;font-size: 20px;width: 100%; visibility:hidden;"><i class="fa fa-square" style="padding-right:10px; font-size:30px;"></i><span id="TemaCentro">Centro de reinsercion femenil Santa Martha</span></div>
                                </div>

                                <div id="TemaCentroDivRight">
                                </div>

                                <div class="col-12">

                                    <div id="TemaValidador" style="display:none; padding-top:20px;">
                                        <div class="alert alert-danger" style="width:100%; text-align:center" role="alert">
                                            <span id="textMessageTema"></span>
                                        </div>
                                    </div>


                                </div>



                            </div>


                        </div>
                    </div>
                </div>
            </div>

            <div class="row no-padding">
                <div class="col-sm-10 offset-sm-1">
                    <div class="ibox collapsed">
                        <div class="ibox-title">
                            <h5>INGRESOS</h5>

                            <div onclick="MostrarXPresupuesto()" class="ibox-tools">

                                <div style="display:inline-flex">

                                    <a class="collapse-link">
                                        <i id="collapseXPresupuestos" class="fa fa-chevron-up"></i>
                                    </a>
                                    <div id="refPresupuestos" style="display:none;"><i class="fas fa-sync-alt" style="color: #c4c4c4; font-size: 11px; padding-left: 5px; cursor:pointer"></i></div>

                                </div>

                            </div>


                        </div>
                        <div class="ibox-content">
                            <div class="row">
                                <div class="col-12 col-sm-12" style="margin-bottom: -20px;">
                                    <div id="BarChartPresupuestos" style="text-align:center !important;">
                                        <canvas id="myChartPresupuestos"></canvas>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-12" style="padding-top: 18px;">



                                </div>


                                <div id="PresupuestosEstadoDivLeft" style="display:none;">
                                </div>

                                <div id="PresupuestosEstadoDiv" style="display:none;">
                                    <div style="text-align: center; color: #232d82;padding-top: 50px;font-size: 20px;width: 100%"><i class="fa fa-square" style="padding-right:10px; font-size:30px;"></i><span id="TemaEstado"></span></div>
                                </div>

                                <div id="PresupuestosCentroDiv" style="display:none;">
                                    <div style="text-align: center;color: #fd5300;padding-top: 50px;font-size: 20px;width: 100%"><i class="fa fa-square" style="padding-right:10px; font-size:30px; display:none;"></i><span id="TemaCentro" style="display:none;">Centro de reinsercion femenil Santa Martha</span></div>
                                </div>

                                <div id="PresupuestosCentroDivRight" style="display:none;">
                                </div>

                                <div class="col-12">

                                    <div id="PresupuestosValidador" style="display:none; padding-top:20px;">
                                        <div class="alert alert-danger" style="width:100%; text-align:center" role="alert">
                                            <span id="textMessagePresupuestos"></span>
                                        </div>
                                    </div>


                                </div>



                            </div>


                        </div>
                    </div>
                </div>
            </div>

<%--            <div class="row no-padding">
                <div class="col-sm-10 offset-sm-1">
                    <div class="ibox collapsed">
                        <div class="ibox-title">
                            <h5>ESTÁNDAR</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i id="collapseXEstandares" class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <div class="row">

                                <div class="col-12 col-sm-2">Bloque</div>
                                <div class="col-12 col-sm-2">Tema</div>
                                <div class="col-12 col-sm-2">Estándar</div>
                                <div class="col-12 col-sm-6"></div>


                                <div class="col-12 col-sm-2">

                                    <select style="width:100%;" onchange="FiltrarEstandares(this)" id="ComboBloque" class="form-control2">
                                        <!--<option id="Option6">Bloques</option>-->
                                    </select>

                                </div>
                                <div class="col-12 col-sm-2">

                                    <select style="width:100%;" onchange="FiltrarEstandares(this)" id="ComboTema" class="form-control2">
                                        <!--<option id="Option5">Tema</option>-->
                                    </select>

                                </div>
                                <div class="col-12 col-sm-2">

                                    <select style="width:100%;" onchange="FiltrarEstandares(this)" id="ComboEstandar" class="form-control2">
                                        <!--<option id="Option7">Estandar</option>-->
                                    </select>

                                </div>
                                <div class="col-12 col-sm-6"></div>

                                <div class="col-12 col-sm-4">
                                    <table><tr><td id="imagenTema"><img id="imagenTemaIMG" /></td><td style="text-align:left"><span id="TemaNum" style="color:#232d82;font-size:20px;"></span><br><span id="TemaDesc" style="color:#fd5300; font-size:20px;"></span></td></tr></table>
                                </div>
                                <div class="col-12 col-sm-4">
                                    <table><tr><td id="imagenBloque"><img id="imagenBloqueIMG" /></td><td style="text-align:left"><span style="color:#232d82;font-size:20px;"></span><br><span style="color:#fd5300; font-size:20px;"></span></td></tr></table>
                                </div>
                                <div class="col-12 col-sm-4"></div>

                                <div class="col-12 col-sm-4" style="padding-top:20px;">
                                    <div class="row no-padding">
                                        <div class="col-12">
                                            <h4 style="color:#00a914; font-size: 23px;"><table style="width:100%"><tr><td>Gobernabilidad</td><td style="text-align:right"><span id="barraGober"></span></td></tr></table></h4>
                                        </div>
                                        <div class="col-12" style="padding-bottom:20px;">
                                            <!--<div class="progress" style="height:40px;">
                                                <div id="barraGober2" class="progress-bar"></div>
                                            </div>-->

                                            <div style="display: flex; flex-flow: row nowrap;">


                                                <div class="progress" style="height:40px; width:100%">
                                                    <div id="barraGober2" class="progress-bar"></div>
                                                </div>

                                                <div style="margin-left: -100%;width: 100%;">
                                                    <div id="GobCompGraph" class="EstandarComp" style="width:0%">
                                                    </div>
                                                    <div id="GobComp" style="color: #fd5300;"><span id="GobCompAmount"></span></div>



                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </div>

                                <div class="col-12 col-sm-4" style="padding-top:20px;">
                                    <div class="row no-padding">
                                        <div class="col-12">
                                            <h4 style="color:#37a6de; font-size: 23px;"><table style="width:100%"><tr><td>Justicia</td><td style="text-align:right"><span id="BarraJus"></span></td></tr></table></h4>
                                        </div>
                                        <div class="col-12">
                                            <!--<div class="progress" style="height:40px;">
                                                <div id="BarraJus2" class="progress-bar"></div>
                                            </div>-->

                                            <div style="display: flex; flex-flow: row nowrap;">


                                                <div class="progress" style="height:40px; width:100%">
                                                    <div id="BarraJus2" class="progress-bar"></div>
                                                </div>

                                                <div style="margin-left: -100%;width: 100%;">
                                                    <div id="jusCompGraph" class="EstandarComp" style="width:0%">
                                                    </div>
                                                    <div id="jusComp" style="color: #fd5300;"><span id="jusCompAmount"></span></div>



                                                </div>
                                            </div>



                                        </div>
                                    </div>
                                </div>


                                <div class="col-12 col-sm-4" style="padding-top:20px;">
                                    <div class="row no-padding">
                                        <div class="col-12">
                                            <h4 style="color:#802981; font-size: 23px;"><table style="width:100%"><tr><td>Reinserción social</td><td style="text-align:right"><span id="barraRe"></span></td></tr></table></h4>
                                        </div>
                                        <div class="col-12">
                                            <!--<div class="progress" style="height:40px;">
                                                <div id="barraRe2" class="progress-bar"></div>
                                            </div>-->

                                            <div style="display: flex; flex-flow: row nowrap;">


                                                <div class="progress" style="height:40px; width:100%">
                                                    <div id="barraRe2" class="progress-bar"></div>
                                                </div>

                                                <div style="margin-left: -100%;width: 100%;">
                                                    <div id="ReCompGraph" class="EstandarComp" style="width:0%">
                                                    </div>
                                                    <div id="ReComp" style="color: #fd5300;"><span id="ReCompAmount"></span></div>



                                                </div>
                                            </div>





                                        </div>
                                    </div>
                                </div>

                                <div class="col-12 col-sm-12" style="height:30px;">

                                    <div id="EstandarValidador" style="display:none; padding-top:20px;">
                                        <div class="alert alert-danger" style="width:100%; text-align:center" role="alert">
                                            <span id="textMessageEstandar"> No se ha encontrado información.</span>
                                        </div>
                                    </div>

                                </div>


                                <div class="col-12 col-sm-12" style="height:30px;">
                                </div>

                                <div class="col-4" style="padding-top:10px;" id="DivG">
                                </div>
                                <div class="col-4" style="padding-top:10px;" id="DivR">
                                </div>
                                <div class="col-4" style="padding-top:10px;" id="DivJ">
                                </div>


                                <div id="EstandarEstadoDivLeft">
                                </div>

                                <div id="EstandarEstadoDiv" style="display:none;">
                                    <div style="text-align: center;color: #232d82;padding-top: 50px;font-size: 20px;width: 100%"><i class="fa fa-square" style="padding-right:10px; font-size:30px;"></i><span id="EstandarEstado"></span></div>
                                </div>

                                <div id="EstandarCentroDiv" style="display:none;">
                                    <div style="text-align: center;color: #fd5300;padding-top: 50px;font-size: 20px;width: 100%"><i class="fa fa-square" style="padding-right:10px; font-size:30px;"></i><span id="EstandarCentro"></span></div>
                                </div>

                                <div id="EstandarCentroDivRight">
                                </div>






                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>
            <div class="row no-padding" style="display:none !important;">
                <div class="col-sm-10 offset-sm-1">
                    <div class="ibox collapsed">
                        <div class="ibox-title">
                            <h5>POBLACIÓN OBJETIVO</h5>
                            <div onclick="MostrarXPoblacion()" class="ibox-tools">
                                <div style="display:inline-flex">

                                    <a class="collapse-link">
                                        <i id="collapseXPoblacion" class="fa fa-chevron-up"></i>
                                    </a>
                                    <div id="refPob" style="display:none;"><i class="fas fa-sync-alt" style="color: #c4c4c4; font-size: 11px; padding-left: 5px; cursor:pointer"></i></div>

                                </div>
                            </div>
                        </div>
                        <div class="ibox-content">


                            <div class="row">



                                <div id="Div3" style="text-align:center; font-size: 30px;" class="col-12 col-sm-3">
                                    <b><span style="color:#232d82" id="P1"></span></b>
                                </div>
                                <div id="Div11" style="text-align:center; font-size: 30px;" class="col-12 col-sm-3">
                                    <b><span style="color:#232d82" id="P2"></span></b>
                                </div>
                                <div id="Div12" style="text-align:center; font-size: 30px;" class="col-12 col-sm-3">
                                    <b><span style="color:#232d82" id="P3"></span></b>
                                </div>
                                <div id="Div13" style="text-align:center; font-size: 30px;" class="col-12 col-sm-3">
                                    <b><span style="color:#232d82" id="P4"></span></b>
                                </div>

                                <div id="divPob4" class="col-12 col-sm-3">
                                    <canvas id="chart-area4" width="400" height="400" />
                                </div>
                                <div id="divPob6" class="col-12 col-sm-3">
                                    <canvas id="chart-area6" width="400" height="400" />
                                </div>
                                <div id="divPob5" class="col-12 col-sm-3">
                                    <canvas id="chart-area5" width="400" height="400" />
                                </div>
                                <div id="divPob7" class="col-12 col-sm-3">
                                    <canvas id="chart-area7" width="400" height="400" />
                                </div>
                                <div id="Div6" style="text-align:center; font-size: 15px;" class="col-12 col-sm-3">
                                    <b>Niñas y niños  que viven en los centros penitenciarios</b>
                                </div>
                                <div id="Div8" style="text-align:center; font-size: 15px;" class="col-12 col-sm-3">
                                    <b>Personas privadas de la libertad</b>
                                </div>
                                <div id="Div7" style="text-align:center; font-size: 15px;" class="col-12 col-sm-3">
                                    <b>Personas que trabajan en  centros penitenciarios</b>
                                </div>
                                <div id="Div10" style="text-align:center; font-size: 15px;" class="col-12 col-sm-3">
                                    <b>Visitas</b>
                                </div>

                                <div class="col-12 col-sm-3" id="divPoblacionComparativo1">
                                    <div style="text-align: center;color: #fd5300;padding-top: 5px;font-size: 15px;"><i class="fa fa-square" style="padding-right:10px; font-size:15px;"></i><span id="PoblacionComparativo1"></span></div>
                                </div>
                                <div class="col-12 col-sm-3" id="divPoblacionComparativo2">
                                    <div style="text-align: center;color: #fd5300;padding-top: 5px;font-size: 15px;"><i class="fa fa-square" style="padding-right:10px; font-size:15px;"></i><span id="PoblacionComparativo2"></span></div>
                                </div>
                                <div class="col-12 col-sm-3" id="divPoblacionComparativo3">
                                    <div style="text-align: center;color: #fd5300;padding-top: 5px;font-size: 15px;"><i class="fa fa-square" style="padding-right:10px; font-size:15px;"></i><span id="PoblacionComparativo3"></span></div>
                                </div>
                                <div class="col-12 col-sm-3" id="divPoblacionComparativo4">
                                    <div style="text-align: center;color: #fd5300;padding-top: 5px;font-size: 15px;"><i class="fa fa-square" style="padding-right:10px; font-size:15px;"></i><span id="PoblacionComparativo4"></span></div>
                                </div>








                                <div id="PoblacionEstadoDivLeft">
                                </div>

                                <div id="PoblacionEstadoDiv">
                                    <div style="text-align: center;color: #232d82;padding-top: 50px;font-size: 20px;width: 100%"><i class="fa fa-square" style="padding-right:10px; font-size:30px;"></i><span id="PoblacionEstado">Centro de reinsercion femenil Santa Martha</span></div>
                                </div>

                                <div id="PoblacionCentroDiv">
                                    <div style="text-align: center;color: #fd5300;padding-top: 50px;font-size: 20px;width: 100%"><i class="fa fa-square" style="padding-right:10px; font-size:30px;"></i><span id="PoblacionCentro">Centro de reinsercion femenil Santa Martha</span></div>
                                </div>

                                <div id="PoblacionCentroDivRight">
                                </div>

                                <div class="col-12">

                                    <div id="PobValidador" style="display:none; padding-top:20px;">
                                        <div class="alert alert-danger" style="width:100%; text-align:center" role="alert">
                                            <span id="textMessagePob"></span>
                                        </div>
                                    </div>


                                </div>




                            </div>

                        </div>




                    </div>
                </div>
            </div>
            <div class="row no-padding" style="display:none !important;">
                <div class="col-sm-10 offset-sm-1">
                    <div class="ibox collapsed">
                        <div class="ibox-title">
                            <h5>GRUPOS EN SITUACIÓN DE VULNERABILIDAD</h5>
                            <div onclick="MostrarXVulnerable()" class="ibox-tools">
                                <div style="display:inline-flex">

                                    <a class="collapse-link">
                                        <i id="collapseXVulnerable" class="fa fa-chevron-up"></i>
                                    </a>
                                    <div id="refVul" style="display:none;"><i class="fas fa-sync-alt" style="color: #c4c4c4; font-size: 11px; padding-left: 5px; cursor:pointer"></i></div>

                                </div>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <div class="row">

                                <div class="col-12 col-sm-2">



                                    <table id="tbVulnerabilidad" style="width:100%">
                                        <tr style="height: 12px;">
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <!--<tr style="height: 25px;">
        <td>
        </td>
        <td>
        </td>
    </tr>
    <tr style="height: 60px;">
        <td style="text-align: right;">
            Mujeres
        </td>
        <td>
            <img height="50px" width="50px" src="img/G_AM_C_Mesa de trabajo 1.png" />
        </td>
    </tr>
    <tr style="height: 60px;">
        <td style="text-align: right;">
            Personas Extranjeras
        </td>
        <td>
            <img height="50px" width="50px" src="img/G_E_C_Mesa de trabajo 1.png" />
        </td>
    </tr>
    <tr style="height: 60px;">
        <td style="text-align: right;">
            Personas con VIH/SIDA
        </td>
        <td>
            <img height="50px" width="50px" src="img/G_VS_C_Mesa de trabajo 1.png" />
        </td>
    </tr>
    <tr style="height: 60px;">
        <td style="text-align: right;">
            Personas Indigenas
        </td>
        <td>
            <img height="50px" width="50px" src="img/G_I_C_Mesa de trabajo 1.png" />
        </td>
    </tr>
    <tr style="height: 60px;">
        <td style="text-align: right;">
            Personas con Discapacidad
        </td>
        <td>
            <img height="50px" width="50px" src="img/G_D_C_Mesa de trabajo 1.png" />
        </td>
    </tr>
    <tr style="height: 60px;">
        <td style="text-align: right;">
            Personas LGBTI
        </td>
        <td>
            <img height="50px" width="50px" src="img/G_LGBTI_C_Mesa de trabajo 1.png" />
        </td>
    </tr>
    <tr style="height: 60px;">
        <td style="text-align: right;">
            Personas con uso de sustancias psicoactivas
        </td>
        <td>
            <img height="50px" width="50px" src="img/G_PS_C_Mesa de trabajo 1.png" />
        </td>
    </tr>
    <tr style="height: 60px;">
        <td style="text-align: right;">
            Mujeres
        </td>
        <td>
            <img height="50px" width="50px" src="img/G_M_C_Mesa de trabajo 1.png" />
        </td>
    </tr>
    <tr style="height: 60px;">
        <td style="text-align: right;">
            Mujeres embarazadas y en periodo de lactancia
        </td>
        <td>
            <img height="50px" width="50px" src="img/G_MEL_C_Mesa de trabajo 1.png" />
        </td>
    </tr>
    <tr style="height: 60px;">
        <td style="text-align: right;">
            Mujeres con hijos
        </td>
        <td>
            <img height="50px" width="50px" src="img/G_MVH_C_Mesa de trabajo 1.png" />
        </td>
    </tr>-->
                                    </table>


                                </div>
                                <div style="margin-left: -30px;" class="col-12 col-sm-10">
                                    <div id="divVul">
                                        <canvas id="hChartVulnerabilidad" width="100%" height="100"></canvas>
                                    </div>
                                </div>

                                <div id="VulneraEstadoDivLeft">
                                </div>

                                <div id="VulneraEstadoDiv">
                                    <div style="text-align: center;color: #232d82;padding-top: 50px;font-size: 20px;width: 100%"><i class="fa fa-square" style="padding-right:10px; font-size:30px;"></i><span id="VulneraEstado">Centro de reinsercion femenil Santa Martha</span></div>
                                </div>

                                <div id="VulneraCentroDiv">
                                    <div style="text-align: center;color: #fd5300;padding-top: 50px;font-size: 20px;width: 100%"><i class="fa fa-square" style="padding-right:10px; font-size:30px;"></i><span id="VulneraCentro">Centro de reinsercion femenil Santa Martha</span></div>
                                </div>

                                <div id="VulneraCentroDivRight">
                                </div>


                                <div class="col-12">

                                    <div id="VulValidador" style="display:none; padding-top:20px;">
                                        <div class="alert alert-danger" style="width:100%; text-align:center" role="alert">
                                            <span id="textMessageVul"></span>
                                        </div>
                                    </div>


                                </div>





                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row no-padding" style="display:none !important;">
                <div class="col-sm-10 offset-sm-1">
                    <div class="ibox collapsed">
                        <div class="ibox-title">
                            <h5>RESPONSABLES</h5>
                            <div onclick="MostrarXResponsable()" class="ibox-tools">
                                <div style="display:inline-flex">

                                    <a class="collapse-link">
                                        <i id="collapseXResponsable" class="fa fa-chevron-up"></i>
                                    </a>
                                    <div id="refRes" style="display:none;"><i class="fas fa-sync-alt" style="color: #c4c4c4; font-size: 11px; padding-left: 5px; cursor:pointer"></i></div>

                                </div>
                            </div>
                        </div>
                        <div class="ibox-content">

                            <div class="row">

                                <div class="col-12 col-sm-2">

                                    <table id="tbResponsables" style="width:100%">

                                        <tr style="height: 20px;">
                                            <td style="text-align: right;">
                                            </td>
                                            <td>
                                            </td>
                                        </tr>

                                        <!--<tr style="height: 90px;">
                                            <td style="text-align: right;">
                                                Área de custodia penitenciaria
                                            </td>
                                            <td>
                                                <img height="50px" width="50px" src="img/R_ACP_C.png" />
                                            </td>
                                        </tr>
                                        <tr style="height: 65px;">
                                            <td style="text-align: right;">
                                                Area técnica
                                            </td>
                                            <td>
                                                <img height="50px" width="50px" src="img/R_T_C.png" />
                                            </td>
                                        </tr>
                                        <tr style="height: 85px;">
                                            <td style="text-align: right;">
                                                Area médica
                                            </td>
                                            <td>
                                                <img height="50px" width="50px" src="img/R_AM_C.png" />
                                            </td>
                                        </tr>
                                        <tr style="height: 75px;">
                                            <td style="text-align: right;">
                                                Área jurídica
                                            </td>
                                            <td>
                                                <img height="50px" width="50px" src="img/R_AJ_C.png" />
                                            </td>
                                        </tr>
                                        <tr style="height: 75px;">
                                            <td style="text-align: right;">
                                                Área administrativa
                                            </td>
                                            <td>
                                                <img height="50px" width="50px" src="img/R_A_C.png" />
                                            </td>
                                        </tr>
                                        <tr style="height: 75px;">
                                            <td style="text-align: right;">
                                                Responsable de <br> protección civil
                                            </td>
                                            <td>
                                                <img height="50px" width="50px" src="img/R_RPP_C.png" />
                                            </td>
                                        </tr>
                                        <tr style="height: 80px;">
                                            <td style="text-align: right;">
                                                Responsable <br> de adicciones
                                            </td>
                                            <td>
                                                <img height="50px" width="50px" src="img/R_RA_C.png" />
                                            </td>
                                        </tr>
                                        <tr style="height: 75px;">
                                            <td style="text-align: right;">
                                                Area central
                                            </td>
                                            <td>
                                                <img height="50px" width="50px" src="img/R_C_C.png" />
                                            </td>
                                        </tr>-->
                                    </table>


                                </div>
                                <div style="margin-left: -30px;" class="col-12 col-sm-10">
                                    <div id="divRespo">
                                        <canvas id="hResponsables" width="100%" height="100"></canvas>
                                    </div>
                                </div>

                                <div id="ResponsableEstadoDivLeft">
                                </div>

                                <div id="ResponsableEstadoDiv">
                                    <div style="text-align: center;color: #232d82;padding-top: 50px;font-size: 20px;width: 100%"><i class="fa fa-square" style="padding-right:10px; font-size:30px;"></i><span id="ResponsableEstado">Centro de reinsercion femenil Santa Martha</span></div>
                                </div>

                                <div id="ResponsableCentroDiv">
                                    <div style="text-align: center;color: #fd5300;padding-top: 50px;font-size: 20px;width: 100%"><i class="fa fa-square" style="padding-right:10px; font-size:30px;"></i><span id="ResponsableCentro">Centro de reinsercion femenil Santa Martha</span></div>
                                </div>

                                <div id="ResponsableCentroDivRight">
                                </div>

                                <div class="col-12">

                                    <div id="ResValidador" style="display:none; padding-top:20px;">
                                        <div class="alert alert-danger" style="width:100%; text-align:center" role="alert">
                                            <span id="textMessageRes"></span>
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
</div>


<%--        </div>




    </div>--%>

                                <!-- Clientes Modal-->
        <div class="modal fade" id="DIFDetalle" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalLabel">Detalle</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div id="" class="modal-body">
                        <iframe id="DetalleGridFrame" class="frameDetHW" frameBorder="0">

                        </iframe>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="footerJs" runat="Server">

    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.metisMenu.js"></script>
    <script src="js/jquery.slimscroll.min.js"></script>
    <script src="js/select2.full.min.js"></script>
    <script src="js/inspinia.js"></script>
    <script src="js/pace.min.js"></script>
    <script src="js/Chart.min.js"></script>
    <script src="js/utils.js"></script>
    <script src="js/chartjs-demo.js"></script>

    <script src="js/plugins/dataTables/datatables.min.js"></script>
    <script src="js/plugins/dataTables/dataTables.bootstrap4.min.js"></script>

</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="footerScript" runat="Server">

        <script>

            function MostrarXBloques() {


                if ($("#collapseXBloque").attr('class') == "fa fa-chevron-down") {

                    $("#refBloque").attr("style", "display:block;");

                    if ($('#Comparativoflag').html() == "1") {

                        $("#BloqueEstadoDivLeft").removeClass("col-12 col-sm-4");
                        $("#BloqueEstadoDivLeft").addClass("col-12 col-sm-2");

                        $("#BloqueEstadoDiv").addClass("col-12 col-sm-4");
                        $("#BloqueCentroDiv").attr("style", "display:block;");
                        $("#BloqueCentroDiv").addClass("col-12 col-sm-4");

                        $("#BloqueCentroDivRight").removeClass("col-12 col-sm-4");
                        $("#BloqueCentroDivRight").addClass("col-12 col-sm-2");
                    }
                    else {

                        $("#BloqueEstadoDivLeft").removeClass("col-12 col-sm-2");
                        $("#BloqueEstadoDivLeft").addClass("col-12 col-sm-4");

                        $("#BloqueEstadoDiv").addClass("col-12 col-sm-4");
                        $("#BloqueCentroDiv").attr("style", "display:none;");

                        $("#BloqueCentroDivRight").removeClass("col-12 col-sm-2");
                        $("#BloqueCentroDivRight").addClass("col-12 col-sm-4");
                    }


                    if ($("#CentroSelected1").val() == "" || $("#CentroSelected1").val() == "-Seleccionar-") {
                        $("#BloqueEstado").html($("#EntidadSelected1").val());
                    }
                    else {
                        $("#BloqueEstado").html($("#CentroSelected1").val());
                    }


                    if ($("#CentroSelected2").val() == "" || $("#CentroSelected2").val() == "-Seleccionar-") {
                        $("#BloqueCentro").html($("#EntidadSelected2").val());
                    }
                    else {

                        $("#BloqueCentro").html($("#CentroSelected2").val());
                    }


                    var Anio = "";
                    var Entidad = "";
                    var Municipio = "";
                    var Centro = "";

                    var AnioComp = "";
                    var EntidadComp = "";
                    var MunicipioComp = "";
                    var CentroComp = "";


                    if ($("#refVal").html() == "1") {

                        Anio = $("#Anio1_input").val();
                        Entidad = "";
                        Centro = "";
                        Municipio = "";

                    }

                    if ($("#refVal").html() == "2") {

                        Anio = $("#Anio1_input").val();

                        Entidad = $("#Entidad1_input").val();
                        if (Entidad == "-Seleccionar-" || Entidad == "0") {
                            Entidad = "";
                        }

                        Centro = "";
                        Municipio = "";

                    }

                    if ($("#refVal").html() == "3") {


                        Anio = $("#Anio1_input").val();

                        Entidad = $("#Entidad1_input").val();
                        if (Entidad == "-Seleccionar-" || Entidad == "0") {
                            Entidad = "";
                        }

                        Municipio = $("#municipioSel").val();

                        var Centro = $("#CPenitenciario1_input").val();
                        if (Centro == "-Seleccionar-" || Centro == "0") {
                            Centro = "";
                        }

                    }

                    if ($("#compVal").html() == "4") {

                        AnioComp = $("#Anio2_input").val();

                        EntidadComp = "";
                        MunicipioComp = "";
                        CentroComp = "";

                    }

                    if ($("#compVal").html() == "5") {

                        AnioComp = $("#Anio2_input").val();

                        EntidadComp = $("#Entidad2_input").val();
                        if (EntidadComp == "-Seleccionar-" || EntidadComp == "0") {
                            EntidadComp = "";
                        }

                        MunicipioComp = "";
                        CentroComp = "";

                    }

                    if ($("#compVal").html() == "6") {

                        AnioComp = $("#Anio2_input").val();

                        EntidadComp = $("#Entidad2_input").val();
                        if (EntidadComp == "-Seleccionar-" || EntidadComp == "0") {
                            EntidadComp = "";
                        }

                        MunicipioComp = $("#municipioSelComp").val();

                        CentroComp = $("#CPenitenciario2_input").val();
                        if (CentroComp == "-Seleccionar-" || CentroComp == "0") {
                            CentroComp = "";
                        }

                    }


                    displayWaitingPopup();

                    setTimeout(function () { Bloques(Anio, Entidad, Municipio, Centro, AnioComp, EntidadComp, MunicipioComp, CentroComp); }, 1000);


                }
                else
                    $("#refBloque").attr("style", "display:none;");


            }

            function MostrarXTema() {


                if ($("#collapseXTema").attr('class') == "fa fa-chevron-down") {

                    $("#refTema").attr("style", "display:block;");

                    if ($('#Comparativoflag').html() == "1") {

                        $("#TemaEstadoDivLeft").removeClass("col-12 col-sm-4");
                        $("#TemaEstadoDivLeft").addClass("col-12 col-sm-2");

                        $("#TemaEstadoDiv").addClass("col-12 col-sm-4");
                        $("#TemaCentroDiv").attr("style", "display:block;");
                        $("#TemaCentroDiv").addClass("col-12 col-sm-4");

                        $("#TemaCentroDivRight").removeClass("col-12 col-sm-4");
                        $("#TemaCentroDivRight").addClass("col-12 col-sm-2");
                    }
                    else {

                        $("#TemaEstadoDivLeft").removeClass("col-12 col-sm-2");
                        $("#TemaEstadoDivLeft").addClass("col-12 col-sm-4");

                        $("#TemaEstadoDiv").addClass("col-12 col-sm-4");
                        $("#TemaCentroDiv").attr("style", "display:none;");

                        $("#TemaCentroDivRight").removeClass("col-12 col-sm-2");
                        $("#TemaCentroDivRight").addClass("col-12 col-sm-4");
                    }

                    //$("#TemaEstado").html($("#EntidadSelected2").text());
                    //$("#TemaCentro").html($("#CPenitenciario1_input").text());

                    if ($("#CentroSelected1").val() == "" || $("#CentroSelected1").val() == "-Seleccionar-") {
                        $("#TemaEstado").html($("#EntidadSelected1").val());
                    }
                    else {
                        $("#TemaEstado").html($("#CentroSelected1").val());
                    }

                    if ($("#CentroSelected2").val() == "" || $("#CentroSelected2").val() == "-Seleccionar-") {
                        $("#TemaCentro").html($("#EntidadSelected2").val());
                    }
                    else {
                        $("#TemaCentro").html($("#CentroSelected2").val());
                    }




                   var Anio = "";
                    var Mes = "";
                   var Programa = "";
                    var Sexo = "";

                   var AnioComp = "";
                    var MesComp = "";
                   var ProgramaComp = "";
                    var SexoComp = "";


                    if ($("#refVal").html() == "1") {

                        Anio = $("#Anio1_input").val();
                        Mes = $("#Entidad1_input").val();
                        if (Mes == "-Seleccionar-" || Mes == "0") {
                            Mes = "";
                        }
                       Programa = "";

                        Sexo = "";

                    }

                    if ($("#refVal").html() == "2") {

                        Anio = $("#Anio1_input").val();

                        Mes = $("#Entidad1_input").val();
                        if (Mes == "-Seleccionar-" || Mes == "0") {
                            Mes = "";
                        }

                        var Programa = $("#CPenitenciario1_input").val();
                        if (Programa == "-Seleccionar-" || Programa == "0") {
                            Programa = "";
                        }

                        Sexo = "";

                    }

                    if ($("#refVal").html() == "3") {


                        Anio = $("#Anio1_input").val();

                        Mes = $("#Entidad1_input").val();
                        if (Mes == "-Seleccionar-" || Mes == "0") {
                            Mes = "";
                        }

                        var Programa = $("#CPenitenciario1_input").val();
                        if (Programa == "-Seleccionar-" || Programa == "0") {
                            Programa = "";
                        }

                        var Sexo = $("#Sexo1_input").val();
                        if (Sexo == "-Seleccionar-" || Sexo == "0") {
                            Sexo = "";
                        }

                    }

                    if ($("#compVal").html() == "4") {

                        AnioComp = $("#Anio2_input").val();
                        MesComp = $("#Entidad2_input").val();
                        if (MesComp == "-Seleccionar-" || MesComp == "0") {
                            MesComp = "";
                        }
                        ProgramaComp = "";

                        SexoComp = "";

                    }

                    if ($("#compVal").html() == "5") {

                        AnioComp = $("#Anio2_input").val();
                        MesComp = $("#Entidad2_input").val();
                        if (MesComp == "-Seleccionar-" || MesComp == "0") {
                            MesComp = "";
                        }

                        var ProgramaComp = $("#CPenitenciario2_input").val();
                        if (ProgramaComp == "-Seleccionar-" || ProgramaComp == "0") {
                            ProgramaComp = "";
                        }

                        SexoComp = "";


                    }

                    if ($("#compVal").html() == "6") {

                        AnioComp = $("#Anio2_input").val();
                        MesComp = $("#Entidad2_input").val();
                        if (MesComp == "-Seleccionar-" || MesComp == "0") {
                            MesComp = "";
                        }

                        var ProgramaComp = $("#CPenitenciario2_input").val();
                        if (ProgramaComp == "-Seleccionar-" || ProgramaComp == "0") {
                            ProgramaComp = "";
                        }

                        var SexoComp = $("#Sexo2_input").val();
                        if (SexoComp == "-Seleccionar-" || SexoComp == "0") {
                            SexoComp = "";
                        }

                    }


                    displayWaitingPopup();

                    setTimeout(function () { Tema(Anio, Mes, Programa, Sexo, AnioComp, MesComp, ProgramaComp, SexoComp); }, 1000);


                }
                else
                    $("#refTema").attr("style", "display:none;");


            }

            function MostrarXPresupuesto() {


                if ($("#collapseXPresupuestos").attr('class') == "fa fa-chevron-down") {

                    $("#refPresupuestos").attr("style", "display:block;");

                    if ($('#Comparativoflag').html() == "1") {

                        $("#PresupuestosEstadoDivLeft").removeClass("col-12 col-sm-4");
                        $("#PresupuestosEstadoDivLeft").addClass("col-12 col-sm-2");

                        $("#PresupuestosEstadoDiv").addClass("col-12 col-sm-4");
                        $("#PresupuestosCentroDiv").attr("style", "display:block;");
                        $("#PresupuestosCentroDiv").addClass("col-12 col-sm-4");

                        $("#PresupuestosCentroDivRight").removeClass("col-12 col-sm-4");
                        $("#PresupuestosCentroDivRight").addClass("col-12 col-sm-2");
                    }
                    else {

                        $("#PresupuestosEstadoDivLeft").removeClass("col-12 col-sm-2");
                        $("#PresupuestosEstadoDivLeft").addClass("col-12 col-sm-4");

                        $("#PresupuestosEstadoDiv").addClass("col-12 col-sm-4");
                        $("#PresupuestosCentroDiv").attr("style", "display:none;");

                        $("#PresupuestosCentroDivRight").removeClass("col-12 col-sm-2");
                        $("#PresupuestosCentroDivRight").addClass("col-12 col-sm-4");
                    }

                    //$("#TemaEstado").html($("#EntidadSelected2").text());
                    //$("#TemaCentro").html($("#CPenitenciario1_input").text());

                    if ($("#CentroSelected1").val() == "" || $("#CentroSelected1").val() == "-Seleccionar-") {
                        $("#PresupuestosEstado").html($("#EntidadSelected1").val());
                    }
                    else {
                        $("#PresupuestosEstado").html($("#CentroSelected1").val());
                    }

                    if ($("#CentroSelected2").val() == "" || $("#CentroSelected2").val() == "-Seleccionar-") {
                        $("#PresupuestosCentro").html($("#EntidadSelected2").val());
                    }
                    else {
                        $("#PresupuestosCentro").html($("#CentroSelected2").val());
                    }




                    var Anio = "";
                    var Mes = "";
                    var Programa = "";
                    var Sexo = "";

                    var AnioComp = "";
                    var MesComp = "";
                    var ProgramaComp = "";
                    var SexoComp = "";


                    if ($("#refVal").html() == "1") {

                        Anio = $("#Anio1_input").val();
                        Mes = $("#Entidad1_input").val();
                        if (Mes == "-Seleccionar-" || Mes == "0") {
                            Mes = "";
                        }
                        Programa = "";

                        Sexo = "";

                    }

                    if ($("#refVal").html() == "2") {

                        Anio = $("#Anio1_input").val();

                        Mes = $("#Entidad1_input").val();
                        if (Mes == "-Seleccionar-" || Mes == "0") {
                            Mes = "";
                        }

                        var Programa = $("#CPenitenciario1_input").val();
                        if (Programa == "-Seleccionar-" || Programa == "0") {
                            Programa = "";
                        }

                        Sexo = "";

                    }

                    if ($("#refVal").html() == "3") {


                        Anio = $("#Anio1_input").val();

                        Mes = $("#Entidad1_input").val();
                        if (Mes == "-Seleccionar-" || Mes == "0") {
                            Mes = "";
                        }

                        var Programa = $("#CPenitenciario1_input").val();
                        if (Programa == "-Seleccionar-" || Programa == "0") {
                            Programa = "";
                        }

                        var Sexo = $("#Sexo1_input").val();
                        if (Sexo == "-Seleccionar-" || Sexo == "0") {
                            Sexo = "";
                        }

                    }

                    if ($("#compVal").html() == "4") {

                        AnioComp = $("#Anio2_input").val();
                        MesComp = $("#Entidad2_input").val();
                        if (MesComp == "-Seleccionar-" || MesComp == "0") {
                            MesComp = "";
                        }
                        ProgramaComp = "";

                        SexoComp = "";

                    }

                    if ($("#compVal").html() == "5") {

                        AnioComp = $("#Anio2_input").val();
                        MesComp = $("#Entidad2_input").val();
                        if (MesComp == "-Seleccionar-" || MesComp == "0") {
                            MesComp = "";
                        }

                        var ProgramaComp = $("#CPenitenciario2_input").val();
                        if (ProgramaComp == "-Seleccionar-" || ProgramaComp == "0") {
                            ProgramaComp = "";
                        }

                        SexoComp = "";


                    }

                    if ($("#compVal").html() == "6") {

                        AnioComp = $("#Anio2_input").val();
                        MesComp = $("#Entidad2_input").val();
                        if (MesComp == "-Seleccionar-" || MesComp == "0") {
                            MesComp = "";
                        }

                        var ProgramaComp = $("#CPenitenciario2_input").val();
                        if (ProgramaComp == "-Seleccionar-" || ProgramaComp == "0") {
                            ProgramaComp = "";
                        }

                        var SexoComp = $("#Sexo2_input").val();
                        if (SexoComp == "-Seleccionar-" || SexoComp == "0") {
                            SexoComp = "";
                        }

                    }


                    displayWaitingPopup();

                    setTimeout(function () { Presupuestos(Anio, Mes, Programa, Sexo, AnioComp, MesComp, ProgramaComp, SexoComp); }, 1000);


                }
                else
                    $("#refTema").attr("style", "display:none;");


            }



            function MostrarXEstandares(Anio, Entidad, Municipio, Centro, AnioComp, EntidadComp, MunicipioComp, CentroComp, ComboTema, ComboBloque, ComboEstandar) {

                ////Fijos
                //Entidad = "";
                //ComboBloque = "";
                //ComboEstandar = "";
                //ComboTema = "";
                //EntidadComp = "";
                //Municipio = "";
                //MunicipioComp = "";
                //Centro = "";
                //CentroComp = "";


                //$("#EstandarEstado").html($("#EntidadSelected2").text())
                //$("#EstandarCentro").html($("#CPenitenciario1_input").text())


                if ($('#Comparativoflag').html() == "1") {

                    $("#EstandarEstadoDivLeft").removeClass("col-12 col-sm-4");
                    $("#EstandarEstadoDivLeft").addClass("col-12 col-sm-2");

                    $("#EstandarEstadoDiv").attr("style", "display:block;");
                    $("#EstandarEstadoDiv").addClass("col-12 col-sm-4");
                    $("#EstandarCentroDiv").attr("style", "display:block;");
                    $("#EstandarCentroDiv").addClass("col-12 col-sm-4");

                    $("#EstandarCentroDivRight").removeClass("col-12 col-sm-4");
                    $("#EstandarCentroDivRight").addClass("col-12 col-sm-2");
                }
                else {

                    $("#EstandarEstadoDivLeft").removeClass("col-12 col-sm-2");
                    $("#EstandarEstadoDivLeft").addClass("col-12 col-sm-4");

                    $("#EstandarEstadoDiv").attr("style", "display:block;");
                    $("#EstandarEstadoDiv").addClass("col-12 col-sm-4");
                    $("#EstandarCentroDiv").attr("style", "display:none;");

                    $("#EstandarCentroDivRight").removeClass("col-12 col-sm-2");
                    $("#EstandarCentroDivRight").addClass("col-12 col-sm-4");
                }








                if ($("#CentroSelected1").val() == "" || $("#CentroSelected1").val() == "-Seleccionar-") {
                    $("#EstandarEstado").html($("#EntidadSelected1").val());
                }
                else {
                    $("#EstandarEstado").html($("#CentroSelected1").val());
                }

                if ($("#CentroSelected2").val() == "" || $("#CentroSelected2").val() == "-Seleccionar-") {
                    $("#EstandarCentro").html($("#EntidadSelected2").val());
                }
                else {
                    $("#EstandarCentro").html($("#CentroSelected2").val());
                }


                var Comparativoflag = $('#Comparativoflag').html();


                $.ajax({
                    type: "POST",
                    url: "MostrarBarraEstandar.php?Anio=" + Anio + "&Entidad=" + Entidad + "&Municipio=" + Municipio + "&Centro=" + Centro + "&AnioComp=" + AnioComp + "&EntidadComp=" + EntidadComp + "&MunicipioComp=" + MunicipioComp + "&CentroComp=" + CentroComp + "&bloqueID=" + ComboBloque + "&estandarID=" + ComboEstandar + "&TemaID=" + ComboTema + "&Comparativoflag=" + Comparativoflag,
                    data: $(this).serialize(),
                    async: false,
                    success: function (response) {
                        ArrayResponse = response.split("|");

                        for (i = 0; i < ArrayResponse.length; i++) {

                            var jsonData = JSON.parse(ArrayResponse[i]);

                            if (i == 0) {

                                //var porcentajeG = parseFloat(jsonData.porcG).toFixed(3);
                                var porcentajeG = (Math.floor(jsonData.porcG * 100) / 100).toFixed(2);
                                porcentajeG = porcentajeG * 100;
                                porcentajeG = porcentajeG.toFixed(2);
                                porcentajeG = parseInt(porcentajeG);


                                //var porcentajeJ = parseFloat(jsonData.porcJ).toFixed(3);
                                var porcentajeJ = (Math.floor(jsonData.porcJ * 100) / 100).toFixed(2);
                                porcentajeJ = porcentajeJ * 100;
                                porcentajeJ = porcentajeJ.toFixed(2);
                                porcentajeJ = parseInt(porcentajeJ);

                                //var porcentajeR = parseFloat(jsonData.porcR).toFixed(3);
                                var porcentajeR = (Math.floor(jsonData.porcR * 100) / 100).toFixed(2);
                                porcentajeR = porcentajeR * 100;
                                porcentajeR = porcentajeR.toFixed(2);
                                porcentajeR = parseInt(porcentajeR);


                                if (isNaN(porcentajeG) && isNaN(porcentajeJ) && isNaN(porcentajeR))
                                    $("#EstandarRefflag").html("1");
                                else
                                    $("#EstandarRefflag").html("");

                                if (porcentajeG > 0)
                                    $("#barraGober").html(porcentajeG + "%");
                                else
                                    $("#barraGober").html("");

                                if (porcentajeJ > 0)
                                    $("#BarraJus").html(porcentajeJ + "%");
                                else
                                    $("#BarraJus").html("");


                                if (porcentajeR > 0)
                                    $("#barraRe").html(porcentajeR + "%");
                                else
                                    $("#barraRe").html("");








                                $("#barraGober2").attr("style", "width:" + porcentajeG + "%; background-color:#00a914;");

                                $("#BarraJus2").attr("style", "width:" + porcentajeJ + "%; background-color:#37a6de;");

                                $("#barraRe2").attr("style", "width:" + porcentajeR + "%; background-color: #802981;");




                            }
                            else {


                                if (Comparativoflag == "1") {

                                    //var porcentajeG = parseFloat(jsonData.porcG).toFixed(3);
                                    var porcentajeG = (Math.floor(jsonData.porcG * 100) / 100).toFixed(2);
                                    porcentajeG = porcentajeG * 100;
                                    porcentajeG = porcentajeG.toFixed(2);
                                    porcentajeG = parseInt(porcentajeG);

                                    //var porcentajeR = parseFloat(jsonData.porcR).toFixed(3);
                                    var porcentajeR = (Math.floor(jsonData.porcR * 100) / 100).toFixed(2);
                                    porcentajeR = porcentajeR * 100;
                                    porcentajeR = porcentajeR.toFixed(2);
                                    porcentajeR = parseInt(porcentajeR);

                                    //var porcentajeJ = parseFloat(jsonData.porcJ).toFixed(3);
                                    var porcentajeJ = (Math.floor(jsonData.porcJ * 100) / 100).toFixed(2);
                                    porcentajeJ = porcentajeJ * 100;
                                    porcentajeJ = porcentajeJ.toFixed(2);
                                    porcentajeJ = parseInt(porcentajeJ);


                                    if (isNaN(porcentajeG) && isNaN(porcentajeJ) && isNaN(porcentajeR))
                                        $("#EstandarComflag").html("1");
                                    else
                                        $("#EstandarComflag").html("");



                                    if (isNaN(porcentajeG) || porcentajeG == 0) {
                                        $("#GobCompAmount").html("0");
                                        $("#GobCompGraph").attr("style", "width:0%;");
                                        $("#GobComp").attr("style", "width:0%;color: #ffffff;");

                                        $("#GobCompGraph").removeClass("EstandarCompred");
                                        $("#GobCompGraph").removeClass("EstandarCompAppr");
                                        $("#GobCompGraph").addClass("EstandarComp");

                                    }
                                    else {

                                        if (porcentajeG < 70) {
                                            $("#GobCompAmount").html(porcentajeG);


                                            $("#GobCompGraph").attr("style", "width:" + porcentajeG + "%;");
                                            porcentajeG = porcentajeG + 1;
                                            $("#GobComp").attr("style", "width:" + porcentajeG + "%;color: #ff0000;text-align: right;");


                                            $("#GobCompGraph").removeClass("EstandarComp");
                                            $("#GobCompGraph").removeClass("EstandarCompAppr");
                                            $("#GobCompGraph").addClass("EstandarCompred");

                                        }
                                        else {
                                            $("#GobCompAmount").html(porcentajeG);


                                            //Aqui se le agrega el CSS
                                            $("#GobCompGraph").attr("style", "width:" + porcentajeG + "%;");

                                            $("#GobCompGraph").removeClass("EstandarCompred");
                                            $("#GobCompGraph").removeClass("EstandarComp");
                                            $("#GobCompGraph").addClass("EstandarCompAppr");




                                            porcentajeG = porcentajeG + 1;
                                            $("#GobComp").attr("style", "width:" + porcentajeG + "%;color: #232d82;text-align: right;");
                                        }
                                    }





                                    if (isNaN(porcentajeR) || porcentajeR == 0) {
                                        $("#ReCompAmount").html("0");
                                        $("#ReCompGraph").attr("style", "width:0%;");
                                        $("#ReComp").attr("style", "width:0%;color: #ffffff;");

                                        $("#ReCompGraph").removeClass("EstandarCompred");
                                        $("#ReCompGraph").removeClass("EstandarCompAppr");
                                        $("#ReCompGraph").addClass("EstandarComp");

                                    }
                                    else {


                                        if (porcentajeR < 70) {
                                            $("#ReCompAmount").html(porcentajeR);
                                            $("#ReCompGraph").attr("style", "width:" + porcentajeR + "%;");
                                            porcentajeR = porcentajeR + 1;
                                            $("#ReComp").attr("style", "width:" + porcentajeR + "%;color: #ff0000;text-align: right;");

                                            $("#ReCompGraph").removeClass("EstandarComp");
                                            $("#ReCompGraph").removeClass("EstandarCompAppr");
                                            $("#ReCompGraph").addClass("EstandarCompred");

                                        }
                                        else {
                                            $("#ReCompAmount").html(porcentajeR);


                                            //Aqui se le agrega el CSS
                                            $("#ReCompGraph").attr("style", "width:" + porcentajeR + "%;");

                                            $("#ReCompGraph").removeClass("EstandarCompred");
                                            $("#ReCompGraph").removeClass("EstandarComp");
                                            $("#ReCompGraph").addClass("EstandarCompAppr");

                                            porcentajeR = porcentajeR + 1;
                                            $("#ReComp").attr("style", "width:" + porcentajeR + "%;color: #232d82;text-align: right;");
                                        }

                                    }



                                    $("#jusCompGraph").attr("style", "width:" + porcentajeJ + "%;");




                                    if (isNaN(porcentajeJ) || porcentajeJ == 0) {


                                        $("#jusCompAmount").html("0");
                                        $("#jusCompGraph").attr("style", "width:0%;");
                                        $("#jusComp").attr("style", "width:0%;color: #ffffff;");

                                        $("#jusCompGraph").removeClass("EstandarCompred");
                                        $("#jusCompGraph").removeClass("EstandarCompAppr");
                                        $("#jusCompGraph").addClass("EstandarComp");
                                    }
                                    else {


                                        if (porcentajeJ < 70) {
                                            $("#jusCompAmount").html(porcentajeJ);
                                            $("#jusCompGraph").attr("style", "width:" + porcentajeJ + "%;");
                                            porcentajeJ = porcentajeJ + 1;
                                            $("#jusComp").attr("style", "width:" + porcentajeJ + "%;color: #ff0000;text-align: right;");

                                            $("#jusCompGraph").removeClass("EstandarComp");
                                            $("#jusCompGraph").removeClass("EstandarCompAppr");
                                            $("#jusCompGraph").addClass("EstandarCompred");

                                        } else {
                                            $("#jusCompAmount").html(porcentajeJ);

                                            //Aqui se le agrega el CSS
                                            $("#jusCompGraph").attr("style", "width:" + porcentajeJ + "%;");

                                            $("#jusCompGraph").removeClass("EstandarCompred");
                                            $("#jusCompGraph").removeClass("EstandarComp");
                                            $("#jusCompGraph").addClass("EstandarCompAppr");

                                            porcentajeJ = porcentajeJ + 1;
                                            $("#jusComp").attr("style", "width:" + porcentajeJ + "%;color: #232d82;text-align: right;");
                                        }

                                    }

                                }

                            }



                        }



                    }
                });




                if ($("#EstandarRefflag").html() == "1" && $("#EstandarComflag").html() == "1")
                    $("#EstandarValidador").attr("style", "display:block;");
                else
                    $("#EstandarValidador").attr("style", "display:none;");





                var divContentG = "";
                var divContentR = "";
                var divContentJ = "";
                var ContentG = "";
                var ContentR = "";
                var ContentJ = "";
                var jsonData2 = "";
                var ArrayResponse2 = "";

                $("#DivG").empty();
                $("#DivR").empty();
                $("#DivJ").empty();

                if ($("#collapseXEstandares").attr('class') == "fa fa-chevron-down") {


                    $.ajax({
                        type: "POST",
                        url: "GetFileContent.php?FileName=GobernabilidadComp.txt",
                        data: $(this).serialize(),
                        async: false,
                        success: function (response) {
                            //$("#divContentG").text(response);
                            divContentG = response;
                        }
                    });

                    $.ajax({
                        type: "POST",
                        url: "GetFileContent.php?FileName=JusticiaComp.txt",
                        data: $(this).serialize(),
                        async: false,
                        success: function (response) {
                            //$("#divContentJ").text(response);
                            divContentJ = response;
                        }
                    });

                    $.ajax({
                        type: "POST",
                        url: "GetFileContent.php?FileName=ReinsercionComp.txt",
                        data: $(this).serialize(),
                        async: false,
                        success: function (response) {
                            //$("#divContentR").text(response);
                            divContentR = response;
                        }
                    });



                    //REFERENCIA
                    $.ajax({
                        type: "POST",
                        url: "MostrarXEstandar.php?Anio=" + Anio + "&Entidad=" + Entidad + "&Municipio=" + Municipio + "&Centro=" + Centro + "&bloqueID=" + ComboBloque + "&estandarID=" + ComboEstandar + "&TemaID=" + ComboTema,
                        beforeSend: function () {

                        },
                        complete: function () {
                        },
                        data: $(this).serialize(),
                        async: false,
                        success: function (response) {

                            var ArrayResponse1 = response.split("|");


                            //COMPARACION

                            $.ajax({
                                type: "POST",
                                url: "MostrarXEstandar.php?Anio=" + AnioComp + "&Entidad=" + EntidadComp + "&Municipio=" + MunicipioComp + "&Centro=" + CentroComp + "&bloqueID=" + ComboBloque + "&estandarID=" + ComboEstandar + "&TemaID=" + ComboTema,
                                beforeSend: function () {

                                },
                                complete: function () {
                                    hideWaitingPopup();
                                },
                                data: $(this).serialize(),
                                async: false,
                                success: function (response2) {

                                    ArrayResponse2 = response2.split("|");

                                }
                            });


                            for (i = 0; i < ArrayResponse1.length; i++) {

                                var jsonData1 = JSON.parse(ArrayResponse1[i]);
                                jsonData2 = JSON.parse(ArrayResponse2[i]);


                                if (jsonData1.bloqueID == "1") {

                                    ContentG = divContentG;


                                    //var porcentajeG = parseFloat(jsonData1.porc).toFixed(3);
                                    var porcentajeG = (Math.floor(jsonData1.porc * 100) / 100).toFixed(2);

                                    if (isNaN(porcentajeG))
                                        porcentajeG = 0;

                                    porcentajeG = porcentajeG * 100;
                                    porcentajeG = porcentajeG.toFixed(2);
                                    porcentajeG = parseInt(porcentajeG);

                                    if (Comparativoflag == "1") {

                                        //var porcentajeG2 = parseFloat(jsonData2.porc).toFixed(3);
                                        var porcentajeG2 = (Math.floor(jsonData2.porc * 100) / 100).toFixed(2);
                                        porcentajeG2 = porcentajeG2 * 100;
                                        porcentajeG2 = porcentajeG2.toFixed(2);
                                        porcentajeG2 = parseInt(porcentajeG2);

                                        if (jsonData1.estandarCode == jsonData2.estandarCode) {

                                            ContentG = ContentG.replace("@estandarCode", jsonData1.estandarCode);
                                            ContentG = ContentG.replace("@objetivo", jsonData1.objetivo);


                                            if (porcentajeG != -100)
                                                ContentG = ContentG.replace("@porc", porcentajeG);
                                            else
                                                ContentG = ContentG.replace("@porc", "NA");

                                            if (porcentajeG2 != -100)
                                                ContentG = ContentG.replace("@count", porcentajeG2);
                                            else
                                                ContentG = ContentG.replace("@count", "NA");

                                            $("#DivG").append(ContentG + "<div style=\"padding-top:3px;\"></div>");
                                        }
                                        else {

                                            ContentG = ContentG.replace("@estandarCode", jsonData1.estandarCode);
                                            ContentG = ContentG.replace("@objetivo", jsonData1.objetivo);
                                            ContentG = ContentG.replace("@porc", porcentajeG);
                                            ContentG = ContentG.replace("@count", "NA");

                                            $("#DivG").append(ContentG + "<div style=\"padding-top:3px;\"></div>");

                                            ContentG = divContentG;

                                            ContentG = ContentG.replace("@estandarCode", jsonData2.estandarCode);
                                            ContentG = ContentG.replace("@objetivo", jsonData2.objetivo);
                                            ContentG = ContentG.replace("@porc", "NA");
                                            ContentG = ContentG.replace("@count", porcentajeG2);

                                            $("#DivG").append(ContentG + "<div style=\"padding-top:3px;\"></div>");

                                        }
                                    }
                                    else {

                                        $("#GobCompAmount").html("0");
                                        $("#GobCompGraph").attr("style", "width:0%;");
                                        $("#GobComp").attr("style", "width:0%;color: #ffffff;");

                                        $("#GobCompGraph").removeClass("EstandarCompred");
                                        $("#GobCompGraph").removeClass("EstandarCompAppr");
                                        $("#GobCompGraph").addClass("EstandarComp");



                                        $("#jusCompAmount").html("0");
                                        $("#jusCompGraph").attr("style", "width:0%;");
                                        $("#jusComp").attr("style", "width:0%;color: #ffffff;");

                                        $("#jusCompGraph").removeClass("EstandarCompred");
                                        $("#jusCompGraph").removeClass("EstandarCompAppr");
                                        $("#jusCompGraph").addClass("EstandarComp");




                                        $("#ReCompAmount").html("0");
                                        $("#ReCompGraph").attr("style", "width:0%;");
                                        $("#ReComp").attr("style", "width:0%;color: #ffffff;");

                                        $("#ReCompGraph").removeClass("EstandarCompred");
                                        $("#ReCompGraph").removeClass("EstandarCompAppr");
                                        $("#ReCompGraph").addClass("EstandarComp");


                                        ContentG = ContentG.replace("@estandarCode", jsonData1.estandarCode);
                                        ContentG = ContentG.replace("@objetivo", jsonData1.objetivo);


                                        if (porcentajeG != -100)
                                            ContentG = ContentG.replace("@porc", porcentajeG);
                                        else
                                            ContentG = ContentG.replace("@porc", "NA");


                                        ContentG = ContentG.replace("@count", 0);




                                        $("#DivG").append(ContentG + "<div style=\"padding-top:3px;\"></div>");

                                    }



                                }

                                if (jsonData1.bloqueID == "2") {

                                    ContentR = divContentR;



                                    //var porcentajeR = parseFloat(jsonData1.porc).toFixed(3);
                                    var porcentajeR = (Math.floor(jsonData1.porc * 100) / 100).toFixed(2);

                                    if (isNaN(porcentajeR))
                                        porcentajeR = 0;

                                    porcentajeR = porcentajeR * 100;
                                    porcentajeR = porcentajeR.toFixed(2);
                                    porcentajeR = parseInt(porcentajeR);

                                    if (Comparativoflag == "1") {

                                        //var porcentajeR2 = parseFloat(jsonData2.porc).toFixed(3);
                                        var porcentajeR2 = (Math.floor(jsonData2.porc * 100) / 100).toFixed(2);
                                        porcentajeR2 = porcentajeR2 * 100;
                                        porcentajeR2 = porcentajeR2.toFixed(2);
                                        porcentajeR2 = parseInt(porcentajeR2);


                                        if (jsonData1.estandarCode == jsonData2.estandarCode) {

                                            ContentR = ContentR.replace("@estandarCode", jsonData1.estandarCode);
                                            ContentR = ContentR.replace("@objetivo", jsonData1.objetivo);

                                            if (porcentajeR != -100)
                                                ContentR = ContentR.replace("@porc", porcentajeR);
                                            else
                                                ContentR = ContentR.replace("@porc", "NA");

                                            if (porcentajeR2 != -100)
                                                ContentR = ContentR.replace("@count", porcentajeR2);
                                            else
                                                ContentR = ContentR.replace("@count", "NA");

                                            $("#DivR").append(ContentR + "<div style=\"padding-top:3px;\"></div>");

                                        }
                                        else {

                                            ContentR = ContentR.replace("@estandarCode", jsonData1.estandarCode);
                                            ContentR = ContentR.replace("@objetivo", jsonData1.objetivo);
                                            ContentR = ContentR.replace("@porc", porcentajeR);
                                            ContentR = ContentR.replace("@count", "NA");

                                            $("#DivR").append(ContentR + "<div style=\"padding-top:3px;\"></div>");

                                            ContentR = divContentR;

                                            ContentR = ContentR.replace("@estandarCode", jsonData2.estandarCode);
                                            ContentR = ContentR.replace("@objetivo", jsonData2.objetivo);
                                            ContentR = ContentR.replace("@porc", "NA");
                                            ContentR = ContentR.replace("@count", porcentajeR2);

                                            $("#DivR").append(ContentR + "<div style=\"padding-top:3px;\"></div>");

                                        }

                                    }
                                    else {


                                        $("#GobCompAmount").html("0");
                                        $("#GobCompGraph").attr("style", "width:0%;");
                                        $("#GobComp").attr("style", "width:0%;color: #ffffff;");

                                        $("#GobCompGraph").removeClass("EstandarCompred");
                                        $("#GobCompGraph").removeClass("EstandarCompAppr");
                                        $("#GobCompGraph").addClass("EstandarComp");



                                        $("#jusCompAmount").html("0");
                                        $("#jusCompGraph").attr("style", "width:0%;");
                                        $("#jusComp").attr("style", "width:0%;color: #ffffff;");

                                        $("#jusCompGraph").removeClass("EstandarCompred");
                                        $("#jusCompGraph").removeClass("EstandarCompAppr");
                                        $("#jusCompGraph").addClass("EstandarComp");




                                        $("#ReCompAmount").html("0");
                                        $("#ReCompGraph").attr("style", "width:0%;");
                                        $("#ReComp").attr("style", "width:0%;color: #ffffff;");

                                        $("#ReCompGraph").removeClass("EstandarCompred");
                                        $("#ReCompGraph").removeClass("EstandarCompAppr");
                                        $("#ReCompGraph").addClass("EstandarComp");





                                        ContentR = ContentR.replace("@estandarCode", jsonData1.estandarCode);
                                        ContentR = ContentR.replace("@objetivo", jsonData1.objetivo);


                                        if (porcentajeR != -100)
                                            ContentR = ContentR.replace("@porc", porcentajeR);
                                        else
                                            ContentR = ContentR.replace("@porc", "NA");


                                        ContentR = ContentR.replace("@count", 0);




                                        $("#DivR").append(ContentR + "<div style=\"padding-top:3px;\"></div>");



                                    }




                                }

                                if (jsonData1.bloqueID == "3") {

                                    ContentJ = divContentJ;

                                    //var porcentajeJ = parseFloat(jsonData1.porc).toFixed(3);
                                    var porcentajeJ = (Math.floor(jsonData1.porc * 100) / 100).toFixed(2);


                                    if (isNaN(porcentajeJ))
                                        porcentajeJ = 0;

                                    porcentajeJ = porcentajeJ * 100;
                                    porcentajeJ = porcentajeJ.toFixed(2);
                                    porcentajeJ = parseInt(porcentajeJ);

                                    if (Comparativoflag == "1") {

                                        //var porcentajeJ2 = parseFloat(jsonData2.porc).toFixed(3);
                                        var porcentajeJ2 = (Math.floor(jsonData2.porc * 100) / 100).toFixed(2);
                                        porcentajeJ2 = porcentajeJ2 * 100;
                                        porcentajeJ2 = porcentajeJ2.toFixed(2);
                                        porcentajeJ2 = parseInt(porcentajeJ2);

                                        if (jsonData1.estandarCode == jsonData2.estandarCode) {

                                            ContentJ = ContentJ.replace("@estandarCode", jsonData1.estandarCode);
                                            ContentJ = ContentJ.replace("@objetivo", jsonData1.objetivo);

                                            if (porcentajeJ != -100)
                                                ContentJ = ContentJ.replace("@porc", porcentajeJ);
                                            else
                                                ContentJ = ContentJ.replace("@porc", "NA");

                                            if (porcentajeJ2 != -100)
                                                ContentJ = ContentJ.replace("@count", porcentajeJ2);
                                            else
                                                ContentJ = ContentJ.replace("@count", "NA");



                                            $("#DivJ").append(ContentJ + "<div style=\"padding-top:3px;\"></div>");
                                        }
                                        else {

                                            ContentJ = ContentJ.replace("@estandarCode", jsonData1.estandarCode);
                                            ContentJ = ContentJ.replace("@objetivo", jsonData1.objetivo);
                                            ContentJ = ContentJ.replace("@porc", porcentajeJ);
                                            ContentJ = ContentJ.replace("@count", "NA");

                                            $("#DivJ").append(ContentJ + "<div style=\"padding-top:3px;\"></div>");

                                            ContentJ = divContentJ;

                                            ContentJ = ContentJ.replace("@estandarCode", jsonData2.estandarCode);
                                            ContentJ = ContentJ.replace("@objetivo", jsonData2.objetivo);
                                            ContentJ = ContentJ.replace("@porc", "NA");
                                            ContentJ = ContentJ.replace("@count", porcentajeJ2);

                                            $("#DivJ").append(ContentJ + "<div style=\"padding-top:3px;\"></div>");

                                        }
                                    }
                                    else {

                                        $("#GobCompAmount").html("0");
                                        $("#GobCompGraph").attr("style", "width:0%;");
                                        $("#GobComp").attr("style", "width:0%;color: #ffffff;");

                                        $("#GobCompGraph").removeClass("EstandarCompred");
                                        $("#GobCompGraph").removeClass("EstandarCompAppr");
                                        $("#GobCompGraph").addClass("EstandarComp");



                                        $("#jusCompAmount").html("0");
                                        $("#jusCompGraph").attr("style", "width:0%;");
                                        $("#jusComp").attr("style", "width:0%;color: #ffffff;");

                                        $("#jusCompGraph").removeClass("EstandarCompred");
                                        $("#jusCompGraph").removeClass("EstandarCompAppr");
                                        $("#jusCompGraph").addClass("EstandarComp");




                                        $("#ReCompAmount").html("0");
                                        $("#ReCompGraph").attr("style", "width:0%;");
                                        $("#ReComp").attr("style", "width:0%;color: #ffffff;");

                                        $("#ReCompGraph").removeClass("EstandarCompred");
                                        $("#ReCompGraph").removeClass("EstandarCompAppr");
                                        $("#ReCompGraph").addClass("EstandarComp");







                                        ContentJ = ContentJ.replace("@estandarCode", jsonData1.estandarCode);
                                        ContentJ = ContentJ.replace("@objetivo", jsonData1.objetivo);


                                        if (porcentajeJ != -100)
                                            ContentJ = ContentJ.replace("@porc", porcentajeJ);
                                        else
                                            ContentJ = ContentJ.replace("@porc", "NA");


                                        ContentJ = ContentJ.replace("@count", 0);




                                        $("#DivJ").append(ContentJ + "<div style=\"padding-top:3px;\"></div>");



                                    }







                                }


                            }

                        }
                    });


                    /***********************************************************************************
    
                    //REFERENCIA
                    $.ajax({
                        type: "POST",
                        url: "MostrarXEstandar.php?Anio=" + Anio + "&Entidad=" + Entidad + "&Municipio=" + Municipio + "&Centro=" + Centro + "&bloqueID=" + ComboBloque + "&estandarID=" + ComboEstandar + "&TemaID=" + ComboTema,
                        beforeSend: function () {
    
                            //alert(Anio);
                            //alert(Entidad);
                            //alert(Municipio);
                            //alert(Centro);
                            //alert(ComboBloque);
                            //alert(ComboEstandar);
                            //alert(ComboTema);
    
                            //displayWaitingPopup();
    
                        },
                        complete: function () {
                            //hideWaitingPopup();
                        },
                        data: $(this).serialize(),
                        async: false,
                        success: function (response) {
    
                            //alert(response)
                            ArrayResponse = response.split("|");
                            //var jsonData = JSON.parse(response);
    
    
                            for (i = 0; i < ArrayResponse.length; i++) {
    
                                var jsonData = JSON.parse(ArrayResponse[i]);
    
                                //alert(jsonData.estandarCode);
    
                                if (jsonData.bloqueID == "1") {
    
                                    ContentG = divContentG;
    
    
                                    var porcentajeG = parseFloat(jsonData.porc).toFixed(2);
                                    porcentajeG = porcentajeG * 100;
                                    porcentajeG = porcentajeG.toFixed(2);
                                    porcentajeG = parseInt(porcentajeG);
    
                                    ContentG = ContentG.replace("@estandarCode", jsonData.estandarCode);
                                    ContentG = ContentG.replace("@objetivo", jsonData.objetivo);
                                    ContentG = ContentG.replace("@porc", porcentajeG);
                                    ContentG = ContentG.replace("@count", "@" + i);
    
    
                                    $("#DivG").append(ContentG + "<div style=\"padding-top:3px;\"></div>");
                                }
    
                                if (jsonData.bloqueID == "2") {
    
                                    ContentR = divContentR;
    
    
    
                                    var porcentajeR = parseFloat(jsonData.porc).toFixed(2);
                                    porcentajeR = porcentajeR * 100;
                                    porcentajeR = porcentajeR.toFixed(2);
                                    porcentajeR = parseInt(porcentajeR);
    
                                    ContentR = ContentR.replace("@estandarCode", jsonData.estandarCode);
                                    ContentR = ContentR.replace("@objetivo", jsonData.objetivo);
                                    ContentR = ContentR.replace("@porc", porcentajeR);
                                    ContentR = ContentR.replace("@count", "@" + i);
    
    
    
                                    $("#DivR").append(ContentR + "<div style=\"padding-top:3px;\"></div>");
                                }
    
                                if (jsonData.bloqueID == "3") {
    
                                    ContentJ = divContentJ;
    
                                    var porcentajeJ = parseFloat(jsonData.porc).toFixed(2);
                                    porcentajeJ = porcentajeJ * 100;
                                    porcentajeJ = porcentajeJ.toFixed(2);
                                    porcentajeJ = parseInt(porcentajeJ);
    
                                    ContentJ = ContentJ.replace("@estandarCode", jsonData.estandarCode);
                                    ContentJ = ContentJ.replace("@objetivo", jsonData.objetivo);
                                    ContentJ = ContentJ.replace("@porc", porcentajeJ);
                                    ContentJ = ContentJ.replace("@count", "@" + i);
    
    
                                    $("#DivJ").append(ContentJ + "<div style=\"padding-top:3px;\"></div>");
                                }
    
    
                            }
    
                            //alert("acabo");
    
    
                        }
                    });
    
                    var CompareG = $("#DivG").html();
                    var CompareR = $("#DivR").html();
                    var CompareJ = $("#DivJ").html();
    
                    //COMPArACION
                    $.ajax({
                        type: "POST",
                        url: "MostrarXEstandar.php?Anio=" + AnioComp + "&Entidad=" + EntidadComp + "&Municipio=" + MunicipioComp + "&Centro=" + CentroComp + "&bloqueID=" + ComboBloque + "&estandarID=" + ComboEstandar + "&TemaID=" + ComboTema,
                        beforeSend: function () {
    
                            //alert(Anio);
                            //alert(Entidad);
                            //alert(Municipio);
                            //alert(Centro);
                            //alert(ComboBloque);
                            //alert(ComboEstandar);
                            //alert(ComboTema);
    
                            //displayWaitingPopup();
    
                        },
                        complete: function () {
                            hideWaitingPopup();
                        },
                        data: $(this).serialize(),
                        async: false,
                        success: function (response) {
    
                            //alert(response)
                            ArrayResponse = response.split("|");
                            //var jsonData = JSON.parse(response);
    
    
                            for (i = 0; i < ArrayResponse.length; i++) {
    
                                var jsonData = JSON.parse(ArrayResponse[i]);
    
                                //alert(jsonData.estandarCode);
    
                                if (jsonData.bloqueID == "1") {
    
                                    var porcentajeJ = parseFloat(jsonData.porc).toFixed(2);
                                    porcentajeJ = porcentajeJ * 100;
                                    porcentajeJ = porcentajeJ.toFixed(2);
                                    porcentajeJ = parseInt(porcentajeJ);
    
                                    CompareG = CompareG.replace("@" + i, porcentajeJ);
                                }
    
                                $("#DivG").html(CompareG);
    
                                if (jsonData.bloqueID == "2") {
    
    
                                    var porcentajeR = parseFloat(jsonData.porc).toFixed(2);
                                    porcentajeR = porcentajeR * 100;
                                    porcentajeR = porcentajeR.toFixed(2);
                                    porcentajeR = parseInt(porcentajeR);
    
                                    CompareR = CompareR.replace("@" + i, porcentajeR);
    
                                }
    
                                $("#DivR").html(CompareR);
    
                                if (jsonData.bloqueID == "3") {
    
                                    var porcentajeJ = parseFloat(jsonData.porc).toFixed(2);
                                    porcentajeJ = porcentajeJ * 100;
                                    porcentajeJ = porcentajeJ.toFixed(2);
                                    porcentajeJ = parseInt(porcentajeJ);
    
                                    CompareJ = CompareJ.replace("@" + i, porcentajeJ);
                                }
    
                                $("#DivJ").html(CompareJ);
    
    
                            }
    
                            //alert("acabo2");
    
    
                        }
                    });
    
    
                 ***********************************************************************************/






                }







            }

            function MostrarXPoblacion() {

                if ($("#collapseXPoblacion").attr('class') == "fa fa-chevron-down") {

                    //

                    $("#refPob").attr("style", "display:block;");

                    if ($('#Comparativoflag').html() == "1") {

                        $("#PoblacionEstadoDivLeft").removeClass("col-12 col-sm-4");
                        $("#PoblacionEstadoDivLeft").addClass("col-12 col-sm-2");

                        $("#PoblacionEstadoDiv").addClass("col-12 col-sm-4");
                        $("#PoblacionCentroDiv").attr("style", "display:block;");
                        $("#PoblacionCentroDiv").addClass("col-12 col-sm-4");

                        $("#PoblacionCentroDivRight").removeClass("col-12 col-sm-4");
                        $("#PoblacionCentroDivRight").addClass("col-12 col-sm-2");
                    }
                    else {

                        $("#PoblacionEstadoDivLeft").removeClass("col-12 col-sm-2");
                        $("#PoblacionEstadoDivLeft").addClass("col-12 col-sm-4");

                        $("#PoblacionEstadoDiv").addClass("col-12 col-sm-4");
                        $("#PoblacionCentroDiv").attr("style", "display:none;");

                        $("#PoblacionCentroDivRight").removeClass("col-12 col-sm-2");
                        $("#PoblacionCentroDivRight").addClass("col-12 col-sm-4");
                    }

                    //$("#PoblacionEstado").html($("#EntidadSelected2").text());
                    //$("#PoblacionCentro").html($("#CPenitenciario1_input").text());

                    if ($("#CentroSelected1").val() == "" || $("#CentroSelected1").val() == "-Seleccionar-") {
                        $("#PoblacionEstado").html($("#EntidadSelected1").val());
                    }
                    else {
                        $("#PoblacionEstado").html($("#CentroSelected1").val());
                    }

                    if ($("#CentroSelected2").val() == "" || $("#CentroSelected2").val() == "-Seleccionar-") {
                        $("#PoblacionCentro").html($("#EntidadSelected2").val());
                    }
                    else {

                        $("#PoblacionCentro").html($("#CentroSelected2").val());
                    }


                    $(document).ready(function () {

                        //TabGraficas

                        var Anio = "";
                        var Entidad = "";
                        var Municipio = "";
                        var Centro = "";

                        var AnioComp = "";
                        var EntidadComp = "";
                        var MunicipioComp = "";
                        var CentroComp = "";


                        if ($("#refVal").html() == "1") {

                            Anio = $("#Anio1_input").val();
                            Entidad = "";
                            Centro = "";
                            Municipio = "";

                        }

                        if ($("#refVal").html() == "2") {

                            Anio = $("#Anio1_input").val();

                            Entidad = $("#Entidad1_input").val();
                            if (Entidad == "-Seleccionar-" || Entidad == "0") {
                                Entidad = "";
                            }

                            Centro = "";
                            Municipio = "";

                        }

                        if ($("#refVal").html() == "3") {


                            Anio = $("#Anio1_input").val();

                            Entidad = $("#Entidad1_input").val();
                            if (Entidad == "-Seleccionar-" || Entidad == "0") {
                                Entidad = "";
                            }

                            Municipio = $("#municipioSel").val();

                            var Centro = $("#CPenitenciario1_input").val();
                            if (Centro == "-Seleccionar-" || Centro == "0") {
                                Centro = "";
                            }

                        }

                        if ($("#compVal").html() == "4") {

                            AnioComp = $("#Anio2_input").val();

                            EntidadComp = "";
                            MunicipioComp = "";
                            CentroComp = "";

                        }

                        if ($("#compVal").html() == "5") {

                            AnioComp = $("#Anio2_input").val();

                            EntidadComp = $("#Entidad2_input").val();
                            if (EntidadComp == "-Seleccionar-" || EntidadComp == "0") {
                                EntidadComp = "";
                            }

                            MunicipioComp = "";
                            CentroComp = "";

                        }

                        if ($("#compVal").html() == "6") {

                            AnioComp = $("#Anio2_input").val();

                            EntidadComp = $("#Entidad2_input").val();
                            if (EntidadComp == "-Seleccionar-" || EntidadComp == "0") {
                                EntidadComp = "";
                            }

                            MunicipioComp = $("#municipioSelComp").val();

                            CentroComp = $("#CPenitenciario2_input").val();
                            if (CentroComp == "-Seleccionar-" || CentroComp == "0") {
                                CentroComp = "";
                            }

                        }


                        displayWaitingPopup();

                        setTimeout(function () { GraphicsImages(Anio, Entidad, Municipio, Centro, AnioComp, EntidadComp, MunicipioComp, CentroComp); }, 1000);

                    })

                }
                else
                    $("#refPob").attr("style", "display:none;");
            }

            function MostrarXVulnerable() {


                if ($("#collapseXVulnerable").attr('class') == "fa fa-chevron-down") {


                    $("#refVul").attr("style", "display:block;");

                    if ($('#Comparativoflag').html() == "1") {

                        $("#VulneraEstadoDivLeft").removeClass("col-12 col-sm-4");
                        $("#VulneraEstadoDivLeft").addClass("col-12 col-sm-2");

                        $("#VulneraEstadoDiv").addClass("col-12 col-sm-4");
                        $("#VulneraCentroDiv").attr("style", "display:block;");
                        $("#VulneraCentroDiv").addClass("col-12 col-sm-4");

                        $("#VulneraCentroDivRight").removeClass("col-12 col-sm-4");
                        $("#VulneraCentroDivRight").addClass("col-12 col-sm-2");
                    }
                    else {

                        $("#VulneraEstadoDivLeft").removeClass("col-12 col-sm-2");
                        $("#VulneraEstadoDivLeft").addClass("col-12 col-sm-4");

                        $("#VulneraEstadoDiv").addClass("col-12 col-sm-4");
                        $("#VulneraCentroDiv").attr("style", "display:none;");

                        $("#VulneraCentroDivRight").removeClass("col-12 col-sm-2");
                        $("#VulneraCentroDivRight").addClass("col-12 col-sm-4");
                    }


                    //$("#VulneraEstado").html($("#EntidadSelected2").text());
                    //$("#VulneraCentro").html($("#CPenitenciario1_input").text());

                    if ($("#CentroSelected1").val() == "" || $("#CentroSelected1").val() == "-Seleccionar-") {
                        $("#VulneraEstado").html($("#EntidadSelected1").val());
                    }
                    else {
                        $("#VulneraEstado").html($("#CentroSelected1").val());
                    }

                    if ($("#CentroSelected2").val() == "" || $("#CentroSelected2").val() == "-Seleccionar-") {
                        $("#VulneraCentro").html($("#EntidadSelected2").val());
                    }
                    else {

                        $("#VulneraCentro").html($("#CentroSelected2").val());
                    }


                    var Anio = "";
                    var Entidad = "";
                    var Municipio = "";
                    var Centro = "";

                    var AnioComp = "";
                    var EntidadComp = "";
                    var MunicipioComp = "";
                    var CentroComp = "";


                    if ($("#refVal").html() == "1") {

                        Anio = $("#Anio1_input").val();
                        Entidad = "";
                        Centro = "";
                        Municipio = "";

                    }

                    if ($("#refVal").html() == "2") {

                        Anio = $("#Anio1_input").val();

                        Entidad = $("#Entidad1_input").val();
                        if (Entidad == "-Seleccionar-" || Entidad == "0") {
                            Entidad = "";
                        }

                        Centro = "";
                        Municipio = "";

                    }

                    if ($("#refVal").html() == "3") {


                        Anio = $("#Anio1_input").val();

                        Entidad = $("#Entidad1_input").val();
                        if (Entidad == "-Seleccionar-" || Entidad == "0") {
                            Entidad = "";
                        }

                        Municipio = $("#municipioSel").val();

                        var Centro = $("#CPenitenciario1_input").val();
                        if (Centro == "-Seleccionar-" || Centro == "0") {
                            Centro = "";
                        }

                    }

                    if ($("#compVal").html() == "4") {

                        AnioComp = $("#Anio2_input").val();

                        EntidadComp = "";
                        MunicipioComp = "";
                        CentroComp = "";

                    }

                    if ($("#compVal").html() == "5") {

                        AnioComp = $("#Anio2_input").val();

                        EntidadComp = $("#Entidad2_input").val();
                        if (EntidadComp == "-Seleccionar-" || EntidadComp == "0") {
                            EntidadComp = "";
                        }

                        MunicipioComp = "";
                        CentroComp = "";

                    }

                    if ($("#compVal").html() == "6") {

                        AnioComp = $("#Anio2_input").val();

                        EntidadComp = $("#Entidad2_input").val();
                        if (EntidadComp == "-Seleccionar-" || EntidadComp == "0") {
                            EntidadComp = "";
                        }

                        MunicipioComp = $("#municipioSelComp").val();

                        CentroComp = $("#CPenitenciario2_input").val();
                        if (CentroComp == "-Seleccionar-" || CentroComp == "0") {
                            CentroComp = "";
                        }

                    }


                    displayWaitingPopup();


                    setTimeout(function () { Vulnerabilidad(Anio, Entidad, Municipio, Centro, AnioComp, EntidadComp, MunicipioComp, CentroComp); }, 1000);


                }
                else
                    $("#refVul").attr("style", "display:none;");


            }

            function MostrarXResponsable() {

                //$("#ResponsableEstado").html($("#EntidadSelected2").text());
                //$("#ResponsableCentro").html($("#CPenitenciario1_input").text());

                $("#refRes").attr("style", "display:block;");


                if ($('#Comparativoflag').html() == "1") {

                    $("#ResponsableEstadoDivLeft").removeClass("col-12 col-sm-4");
                    $("#ResponsableEstadoDivLeft").addClass("col-12 col-sm-2");

                    $("#ResponsableEstadoDiv").addClass("col-12 col-sm-4");
                    $("#ResponsableCentroDiv").attr("style", "display:block;");
                    $("#ResponsableCentroDiv").addClass("col-12 col-sm-4");

                    $("#ResponsableCentroDivRight").removeClass("col-12 col-sm-4");
                    $("#ResponsableCentroDivRight").addClass("col-12 col-sm-2");
                }
                else {

                    $("#ResponsableEstadoDivLeft").removeClass("col-12 col-sm-2");
                    $("#ResponsableEstadoDivLeft").addClass("col-12 col-sm-4");

                    $("#ResponsableEstadoDiv").addClass("col-12 col-sm-4");
                    $("#ResponsableCentroDiv").attr("style", "display:none;");

                    $("#ResponsableCentroDivRight").removeClass("col-12 col-sm-2");
                    $("#ResponsableCentroDivRight").addClass("col-12 col-sm-4");
                }

                if ($("#CentroSelected1").val() == "" || $("#CentroSelected1").val() == "-Seleccionar-") {
                    $("#ResponsableEstado").html($("#EntidadSelected1").val());
                }
                else {
                    $("#ResponsableEstado").html($("#CentroSelected1").val());
                }

                if ($("#CentroSelected2").val() == "" || $("#CentroSelected2").val() == "-Seleccionar-") {
                    $("#ResponsableCentro").html($("#EntidadSelected2").val());
                }
                else {
                    $("#ResponsableCentro").html($("#CentroSelected2").val());
                }



                if ($("#collapseXResponsable").attr('class') == "fa fa-chevron-down") {

                    var Anio = "";
                    var Entidad = "";
                    var Municipio = "";
                    var Centro = "";

                    var AnioComp = "";
                    var EntidadComp = "";
                    var MunicipioComp = "";
                    var CentroComp = "";


                    if ($("#refVal").html() == "1") {

                        Anio = $("#Anio1_input").val();
                        Entidad = "";
                        Centro = "";
                        Municipio = "";

                    }

                    if ($("#refVal").html() == "2") {

                        Anio = $("#Anio1_input").val();

                        Entidad = $("#Entidad1_input").val();
                        if (Entidad == "-Seleccionar-" || Entidad == "0") {
                            Entidad = "";
                        }

                        Centro = "";
                        Municipio = "";

                    }

                    if ($("#refVal").html() == "3") {


                        Anio = $("#Anio1_input").val();

                        Entidad = $("#Entidad1_input").val();
                        if (Entidad == "-Seleccionar-" || Entidad == "0") {
                            Entidad = "";
                        }

                        Municipio = $("#municipioSel").val();

                        var Centro = $("#CPenitenciario1_input").val();
                        if (Centro == "-Seleccionar-" || Centro == "0") {
                            Centro = "";
                        }

                    }

                    if ($("#compVal").html() == "4") {

                        AnioComp = $("#Anio2_input").val();

                        EntidadComp = "";
                        MunicipioComp = "";
                        CentroComp = "";

                    }

                    if ($("#compVal").html() == "5") {

                        AnioComp = $("#Anio2_input").val();

                        EntidadComp = $("#Entidad2_input").val();
                        if (EntidadComp == "-Seleccionar-" || EntidadComp == "0") {
                            EntidadComp = "";
                        }

                        MunicipioComp = "";
                        CentroComp = "";

                    }

                    if ($("#compVal").html() == "6") {

                        AnioComp = $("#Anio2_input").val();

                        EntidadComp = $("#Entidad2_input").val();
                        if (EntidadComp == "-Seleccionar-" || EntidadComp == "0") {
                            EntidadComp = "";
                        }

                        MunicipioComp = $("#municipioSelComp").val();

                        CentroComp = $("#CPenitenciario2_input").val();
                        if (CentroComp == "-Seleccionar-" || CentroComp == "0") {
                            CentroComp = "";
                        }

                    }


                    displayWaitingPopup();


                    setTimeout(function () { Responsables(Anio, Entidad, Municipio, Centro, AnioComp, EntidadComp, MunicipioComp, CentroComp); }, 1000);



                }
                else
                    $("#refRes").attr("style", "display:none;");


            }


            function ObtenerMunicipio(e) {

                $("#CentroSelected1").val(e.selectedOptions[0].text);


                $.ajax({
                    type: "POST",
                    url: 'ObtenerMunicipio.php?idCentro=' + $("#" + e.id).val(),
                    data: $(this).serialize(),
                    async: false,
                    success: function (response) {
                        $("#municipioSel").val(response);
                    }
                });

            }

            function ObtenerTema() {

                $.ajax({
                    type: "POST",
                    url: 'ObtenerTema.php',
                    data: $(this).serialize(),
                    async: false,
                    success: function (response) {

                        var jsons = response.split("|");


                        $("#ComboTema").empty();

                        var u = new Option("-Seleccionar-", "0");
                        $(u).html("-Seleccionar-");
                        $("#ComboTema").append(u);


                        var i;
                        for (i = 0; i < jsons.length; i++) {

                            var obj = JSON.parse(jsons[i]);

                            var o = new Option(obj.TemaDesc, obj.TemaID);
                            $(o).html(obj.TemaDesc);
                            $("#ComboTema").append(o);

                        }




                    }
                });

            }

            function ObtenerBloques() {

                $.ajax({
                    type: "POST",
                    url: 'ObtenerBloques.php',
                    data: $(this).serialize(),
                    async: false,
                    success: function (response) {


                        var jsons = response.split("|");

                        $("#ComboBloque").empty();

                        var u = new Option("-Seleccionar-", "0");
                        $(u).html("-Seleccionar-");
                        $("#ComboBloque").append(u);


                        var i;
                        for (i = 0; i < jsons.length; i++) {

                            var obj = JSON.parse(jsons[i]);

                            var o = new Option(obj.bloqueCode, obj.bloqueID);
                            $(o).html(obj.bloqueCode);
                            $("#ComboBloque").append(o);

                        }


                    }
                });

            }

            function ObtenerEstandar() {

                $.ajax({
                    type: "POST",
                    url: 'ObtenerEstandar.php',
                    data: $(this).serialize(),
                    async: false,
                    success: function (response) {

                        var jsons = response.split("|");

                        $("#ComboEstandar").empty();


                        var u = new Option("-Seleccionar-", "0");
                        $(u).html("-Seleccionar-");
                        $("#ComboEstandar").append(u);



                        var i;
                        for (i = 0; i < jsons.length; i++) {

                            var obj = JSON.parse(jsons[i]);

                            var o = new Option(obj.EstandarCode, obj.EstandarID);
                            $(o).html(obj.EstandarCode);
                            $("#ComboEstandar").append(o);

                        }





                    }
                });

            }

            function ObtenerMunicipioComp(e) {


                $("#CentroSelected2").val(e.selectedOptions[0].text);

                $.ajax({
                    type: "POST",
                    url: 'ObtenerMunicipio.php?idCentro=' + $("#" + e.id).val(),
                    data: $(this).serialize(),
                    async: false,
                    success: function (response) {

                        $("#municipioSelComp").val(response);
                    }
                });

            }


            function displayWaitingPopup() {

                $("#shade").css('height', $(document).height());
                $("#shade").show();
                $("#waitingPopupLoading").show();
            }

            function hideWaitingPopup() {

                $("#shade").hide();
                $("#waitingPopupLoading").hide();
            }

            function FiltrarEstandares(e) {


                if (e.id == "ComboBloque") {




                    if ($("#" + e.id).val() != "0") {

                        $.ajax({
                            type: "POST",
                            url: 'ObtenerBloquesID.php?BloqueID=' + $("#" + e.id).val(),
                            data: $(this).serialize(),
                            async: false,
                            success: function (response) {

                                var obj = JSON.parse(response);

                                $("#BloqueSel").val(obj.BloqueCode);

                            }

                        });
                    }
                    else
                        $("#BloqueSel").val("");





                }

                if (e.id == "ComboTema") {

                    if ($("#" + e.id).val() != "0") {


                        $.ajax({
                            type: "POST",
                            url: 'ObtenerTemaID.php?TemaID=' + $("#" + e.id).val(),
                            data: $(this).serialize(),
                            async: false,
                            success: function (response) {

                                var obj = JSON.parse(response);

                                if ($("#" + e.id).val().length == 1)
                                    $("#imagenTemaIMG").attr("src", "img/T_0" + $("#" + e.id).val() + "_A.png");
                                else
                                    $("#imagenTemaIMG").attr("src", "img/T_" + $("#" + e.id).val() + "_A.png");



                                $("#TemaNum").html("Tema " + obj.TemaCode);
                                $("#TemaDesc").html(obj.TemaDesc);


                                $("#TemaSel").val(obj.TemaCode);




                            }




                        });

                    }
                    else
                        $("#TemaSel").val("");






                }


                var TextoCE = "0";
                if (e.id != "ComboEstandar") {


                    $.ajax({
                        type: "POST",
                        url: 'EstandarComboFilter.php?BloqueCode=' + $("#BloqueSel").val() + '&TemaCode=' + $("#TemaSel").val(),
                        data: $(this).serialize(),
                        async: false,
                        success: function (response) {

                            var jsons = response.split("|");


                            $("#ComboEstandar").empty();

                            var u = new Option("-Seleccionar-", "0");
                            $(u).html("-Seleccionar-");
                            $("#ComboEstandar").append(u);


                            var i;
                            for (i = 0; i < jsons.length; i++) {

                                var obj = JSON.parse(jsons[i]);

                                var o = new Option(obj.EstandarCode, obj.EstandarID);
                                $(o).html(obj.EstandarCode);
                                $("#ComboEstandar").append(o);

                            }




                        }

                    });

                }
                else {

                    TextoCE = e.selectedOptions[0].text;

                }






                var Anio = "";
                var Entidad = "";
                var Municipio = "";
                var Centro = "";

                var AnioComp = "";
                var EntidadComp = "";
                var MunicipioComp = "";
                var CentroComp = "";


                if ($("#refVal").html() == "1") {

                    Anio = $("#Anio1_input").val();
                    Entidad = "";
                    Centro = "";
                    Municipio = "";

                }

                if ($("#refVal").html() == "2") {

                    Anio = $("#Anio1_input").val();

                    Entidad = $("#Entidad1_input").val();
                    if (Entidad == "-Seleccionar-" || Entidad == "0") {
                        Entidad = "";
                    }

                    Centro = "";
                    Municipio = "";

                }

                if ($("#refVal").html() == "3") {


                    Anio = $("#Anio1_input").val();

                    Entidad = $("#Entidad1_input").val();
                    if (Entidad == "-Seleccionar-" || Entidad == "0") {
                        Entidad = "";
                    }

                    Municipio = $("#municipioSel").val();

                    var Centro = $("#CPenitenciario1_input").val();
                    if (Centro == "-Seleccionar-" || Centro == "0") {
                        Centro = "";
                    }

                }

                if ($("#compVal").html() == "4") {

                    AnioComp = $("#Anio2_input").val();

                    EntidadComp = "";
                    MunicipioComp = "";
                    CentroComp = "";

                }

                if ($("#compVal").html() == "5") {

                    AnioComp = $("#Anio2_input").val();

                    EntidadComp = $("#Entidad2_input").val();
                    if (EntidadComp == "-Seleccionar-" || EntidadComp == "0") {
                        EntidadComp = "";
                    }

                    MunicipioComp = "";
                    CentroComp = "";

                }

                if ($("#compVal").html() == "6") {

                    AnioComp = $("#Anio2_input").val();

                    EntidadComp = $("#Entidad2_input").val();
                    if (EntidadComp == "-Seleccionar-" || EntidadComp == "0") {
                        EntidadComp = "";
                    }

                    MunicipioComp = $("#municipioSelComp").val();

                    CentroComp = $("#CPenitenciario2_input").val();
                    if (CentroComp == "-Seleccionar-" || CentroComp == "0") {
                        CentroComp = "";
                    }

                }

                var ComboTema = $("#ComboTema").val();
                var ComboBloque = $("#ComboBloque").val();

                if (TextoCE == "-Seleccionar-")
                    TextoCE = "0";

                var ComboEstandar = TextoCE;


                displayWaitingPopup();

                setTimeout(function () { MostrarXEstandares(Anio, Entidad, Municipio, Centro, AnioComp, EntidadComp, MunicipioComp, CentroComp, ComboTema, ComboBloque, ComboEstandar); }, 1000);



            }

            //displayWaitingPopup();


            //Checar variables desde un Request
            var _QueryString = (function () {
                var _get = {};
                var re = /[?&]([^=&]+)(=?)([^&]*)/g;
                while (m = re.exec(location.search))
                    _get[decodeURIComponent(m[1])] = (m[2] == '=' ? decodeURIComponent(m[3]) : true);
                return _get;
            })();



            $(document).ready(function () {


                $("#TabGraficas").addClass('active');


                $("#third").select2({
                    placeholder: 'meh'
                });

                $("#fourth").select2({
                    placeholder: 'meh'
                });

                $("#fifth").select2({
                    placeholder: 'meh'
                });

                $("#sixth").select2({
                    placeholder: 'meh'
                });



                $("#Anio1_input").select2({
                    theme: 'bootstrap4', dropdownParent: $('body')
                });
                $("#Entidad1_input").select2({
                    theme: 'bootstrap4', dropdownParent: $('body')
                });
                $("#CPenitenciario1_input").select2({
                    theme: 'bootstrap4', dropdownParent: $('body')
                });
                $("#Sexo1_input").select2({
                    theme: 'bootstrap4', dropdownParent: $('body')
                });


                $("#Anio2_input").select2({
                    theme: 'bootstrap4', dropdownParent: $('body')
                });
                $("#Entidad2_input").select2({
                    theme: 'bootstrap4', dropdownParent: $('body')
                });
                $("#CPenitenciario2_input").select2({
                    theme: 'bootstrap4', dropdownParent: $('body')
                });
                $("#ComboTema").select2({
                    theme: 'bootstrap4', dropdownParent: $('body')
                })
                $("#ComboBloque").select2({
                    theme: 'bootstrap4', dropdownParent: $('body')
                })
                $("#ComboEstandar").select2({
                    theme: 'bootstrap4', dropdownParent: $('body')
                });
                $("#Sexo2_input").select2({
                    theme: 'bootstrap4', dropdownParent: $('body')
                });



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




                ObtenerTema();
                ObtenerBloques();
                ObtenerEstandar();

            })

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
                    $('#BtnActiva').html('<i class="fas fa-window-minimize" style="vertical-align:super;"></i> <span class="bolder" > COMPARATIVO</span>')
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
                    $("#Sexo2_input").select2({
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
            function Busqueda() {
                $('#btndownall').show();
                $('#btnrefresh').show();
                $('#Results').show();

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
                        $("#ShowHideCP").removeClass("d-none").addClass("d-none");
                        $("#ShowHideE").removeClass("d-none");


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
            function ModalS(Archivo, Tipo) {
                $('#modaldoc').modal('show');
            }

            var randomScalingFactor = function () {
                return Math.round(Math.random() * 100);
            };


            function BloqueGobernabilidad(Porcentaje, PorcentajeCentro) {

                Porcentaje = parseFloat(Porcentaje);
                PorcentajeCentro = parseFloat(PorcentajeCentro);

                Porcentaje = Porcentaje * 100;
                Porcentaje = truncateDecimals(Porcentaje, 1);

                if ($('#Comparativoflag').html() == "1") {
                    PorcentajeCentro = PorcentajeCentro * 100;
                    PorcentajeCentro = truncateDecimals(PorcentajeCentro, 1);
                }
                else
                    PorcentajeCentro = 0;


                //alert($("#EntidadSelected1").text());
                //alert($("#EntidadSelected2").text());
                //alert($("#CentroSelected1").text());
                //alert($("#CentroSelected2").text());


                // Limpiar gráfica
                var divmychart1 = document.getElementById('divmychart1');
                divmychart1.innerHTML = '&nbsp;';
                $('#divmychart1').append('<canvas id="mychart1" />');





                var GraphCompColor = "";
                if (isNaN(Porcentaje))
                    GraphCompColor = "#f9f9f9";
                else
                    GraphCompColor = "#ffffff00";

                if (isNaN(PorcentajeCentro))
                    $("#bc1").css("display", "none");
                else
                    $("#bc1").css("display", "block");




                $("#BloqueComparativo1").html(PorcentajeCentro);

                var data = {
                    //labels: ["", "", "", "", ""],
                    datasets: [
                        {
                            data: [100 - PorcentajeCentro, PorcentajeCentro],
                            backgroundColor: [GraphCompColor, "#fd5300"]
                        },
                        {
                            data: [100 - Porcentaje, Porcentaje],
                            backgroundColor: ["#c4c4c4", "#00a914"]
                        }

                    ]
                };

                var myChart = new Chart(document.getElementById('mychart1'), {
                    type: 'doughnut',
                    data: data,
                    options: {
                        //cutoutPercentage: 50,
                        cutoutPercentage: 70,
                        maintainAspectRatio: true,
                        responsive: true,
                        legend: {
                            position: 'bottom',
                            //display: false
                        },
                        tooltips: { enabled: false },
                        hover: { mode: null },
                    },
                    plugins: [{
                        id: 'total',
                        beforeDraw: function (chart) {
                            const width = chart.chart.width;
                            const height = chart.chart.height;
                            const ctx = chart.chart.ctx;
                            ctx.restore();
                            const fontSize = (height / 114).toFixed(2);
                            ctx.font = fontSize + "em sans-serif";
                            ctx.textBaseline = 'middle';
                            var total = data.datasets[1].data.reduce(function (previousValue, currentValue, currentIndex, array) {


                                if (isNaN(currentValue))
                                    currentValue = "";
                                else
                                    currentValue = currentValue + "%";

                                return currentValue;

                            });
                            const text = total;
                            const textX = Math.round((width - ctx.measureText(text).width) / 2);
                            const textY = height / 2;
                            ctx.fillText(text, textX, textY);
                            ctx.save();
                        }
                    }]
                });


            }

            function BloqueJusticia(Porcentaje, PorcentajeCentro) {

                Porcentaje = parseFloat(Porcentaje);
                PorcentajeCentro = parseFloat(PorcentajeCentro);

                Porcentaje = Porcentaje * 100;
                Porcentaje = truncateDecimals(Porcentaje, 1);

                if ($('#Comparativoflag').html() == "1") {
                    PorcentajeCentro = PorcentajeCentro * 100;
                    PorcentajeCentro = truncateDecimals(PorcentajeCentro, 1);
                }
                else
                    PorcentajeCentro = 0;


                // Limpiar gráfica
                var divmychart2 = document.getElementById('divmychart2');
                divmychart2.innerHTML = '&nbsp;';
                $('#divmychart2').append('<canvas id="mychart2" />');


                var GraphCompColor = "";
                if (isNaN(Porcentaje))
                    GraphCompColor = "#f9f9f9";
                else
                    GraphCompColor = "#ffffff00";

                if (isNaN(PorcentajeCentro))
                    $("#bc2").css("display", "none");
                else
                    $("#bc2").css("display", "block");

                $("#BloqueComparativo2").html(PorcentajeCentro);


                var data = {
                    //labels: ["", "", "", "", ""],
                    datasets: [
                        {
                            data: [100 - PorcentajeCentro, PorcentajeCentro],
                            backgroundColor: [GraphCompColor, "#fd5300"]
                        },
                        {
                            data: [100 - Porcentaje, Porcentaje],
                            backgroundColor: ["#c4c4c4", "#017ece"]
                        }

                    ]
                };

                var myChart = new Chart(document.getElementById('mychart2'), {
                    type: 'doughnut',
                    data: data,
                    options: {
                        //cutoutPercentage: 50,
                        cutoutPercentage: 70,
                        maintainAspectRatio: true,
                        responsive: true,
                        legend: {
                            position: 'bottom',
                            //display: false
                        },
                        tooltips: { enabled: false },
                        hover: { mode: null },
                    },
                    plugins: [{
                        id: 'total',
                        beforeDraw: function (chart) {
                            const width = chart.chart.width;
                            const height = chart.chart.height;
                            const ctx = chart.chart.ctx;
                            ctx.restore();
                            const fontSize = (height / 114).toFixed(2);
                            ctx.font = fontSize + "em sans-serif";
                            ctx.textBaseline = 'middle';
                            var total = data.datasets[1].data.reduce(function (previousValue, currentValue, currentIndex, array) {

                                if (isNaN(currentValue))
                                    currentValue = "";
                                else
                                    currentValue = currentValue + "%";


                                return currentValue;


                            });
                            const text = total;
                            const textX = Math.round((width - ctx.measureText(text).width) / 2);
                            const textY = height / 2;
                            ctx.fillText(text, textX, textY);
                            ctx.save();
                        }
                    }]
                });




            }

            function BloqueReinsercionSocial(Porcentaje, PorcentajeCentro) {

                Porcentaje = parseFloat(Porcentaje);
                PorcentajeCentro = parseFloat(PorcentajeCentro);

                Porcentaje = Porcentaje * 100;
                Porcentaje = truncateDecimals(Porcentaje, 1);

                if ($('#Comparativoflag').html() == "1") {
                    PorcentajeCentro = PorcentajeCentro * 100;
                    PorcentajeCentro = truncateDecimals(PorcentajeCentro, 1);
                }
                else
                    PorcentajeCentro = 0;

                // Limpiar gráfica
                var divmychart3 = document.getElementById('divmychart3');
                divmychart3.innerHTML = '&nbsp;';
                $('#divmychart3').append('<canvas id="mychart3" />');


                var GraphCompColor = "";
                if (isNaN(Porcentaje))
                    GraphCompColor = "#f9f9f9";
                else
                    GraphCompColor = "#ffffff00";


                if (isNaN(PorcentajeCentro))
                    $("#bc3").css("display", "none");
                else
                    $("#bc3").css("display", "block");

                $("#BloqueComparativo3").html(PorcentajeCentro);

                var data = {
                    //labels: ["", "", "", "", ""],
                    datasets: [
                        {
                            data: [100 - PorcentajeCentro, PorcentajeCentro],
                            backgroundColor: [GraphCompColor, "#fd5300"]
                        },
                        {
                            data: [100 - Porcentaje, Porcentaje],
                            backgroundColor: ["#c4c4c4", "#7f1979"]
                        }

                    ]
                };

                var myChart = new Chart(document.getElementById('mychart3'), {
                    type: 'doughnut',
                    data: data,
                    options: {
                        //cutoutPercentage: 50,
                        cutoutPercentage: 70,
                        maintainAspectRatio: true,
                        responsive: true,
                        legend: {
                            position: 'bottom',
                            //display: false
                        },
                        tooltips: { enabled: false },
                        hover: { mode: null },
                    },
                    plugins: [{
                        id: 'total',
                        beforeDraw: function (chart) {
                            const width = chart.chart.width;
                            const height = chart.chart.height;
                            const ctx = chart.chart.ctx;
                            ctx.restore();
                            const fontSize = (height / 114).toFixed(2);
                            ctx.font = fontSize + "em sans-serif";
                            ctx.textBaseline = 'middle';
                            var total = data.datasets[1].data.reduce(function (previousValue, currentValue, currentIndex, array) {


                                if (isNaN(currentValue))
                                    currentValue = "";
                                else
                                    currentValue = currentValue + "%";

                                return currentValue;

                            });
                            const text = total;
                            const textX = Math.round((width - ctx.measureText(text).width) / 2);
                            const textY = height / 2;
                            ctx.fillText(text, textX, textY);
                            ctx.save();
                        }
                    }]
                });



            }

            function Bloques(Anio, Entidad, Municipio, Centro, AnioComp, EntidadComp, MunicipioComp, CentroComp) {

                $('#Comparativoflag').html("1"); //PROVISIONAL


                var Comparativoflag = $('#Comparativoflag').html();

                $.ajax({
                    type: "POST",
                    /*url: "Bloques.php?Anio=" + Anio + "&Entidad=" + Entidad + "&Municipio=" + Municipio + "&Centro=" + Centro + "&AnioComp=" + AnioComp + "&EntidadComp=" + EntidadComp + "&MunicipioComp=" + MunicipioComp + "&CentroComp=" + CentroComp + "&Comparativoflag=" + Comparativoflag,*/
                    url: "ASHXFiles/DB.ashx?o=Bloques",
                    contentType: "application/json",
                    dataType: "json",
                    async: false,
                    beforeSend: function () {


                        //displayWaitingPopup();

                    },
                    complete: function () {
                        hideWaitingPopup();
                    },
                    //data: $(this).serialize(),
                    //async: false,
                    success: function (response) {


                        var GPorcentaje = response.Data1[0].porcG;
                        var JPorcentaje = response.Data1[0].porcJ;
                        var RPorcentaje = response.Data1[0].porcR;
                        var GPorcentajeComp = response.Data1[1].porcG;
                        var JPorcentajeComp = response.Data1[1].porcJ;
                        var RPorcentajeComp = response.Data1[1].porcR;
                        //var PorcentajeCentroPen = jsonData.PorcentajeCentroPen


                        if (GPorcentaje == null || GPorcentaje == "") {
                            GPorcentaje = 0;
                        }

                        if (JPorcentaje == null || JPorcentaje == "") {
                            JPorcentaje = 0;
                        }

                        if (RPorcentaje == null || RPorcentaje == "") {
                            RPorcentaje = 0;
                        }

                        if (GPorcentajeComp == null || GPorcentajeComp == "") {
                            GPorcentajeComp = 0;
                        }

                        if (JPorcentajeComp == null || JPorcentajeComp == "") {
                            JPorcentajeComp = 0;
                        }

                        if (RPorcentajeComp == null || RPorcentajeComp == "") {
                            RPorcentajeComp = 0;
                        }


                        //Mensaje validador de resultados

                        $("#BloqueValidador").attr('style', 'display:none;');

                        BloqueGobernabilidad(GPorcentaje, GPorcentajeComp);
                        BloqueJusticia(JPorcentaje, JPorcentajeComp);
                        BloqueReinsercionSocial(RPorcentaje, RPorcentajeComp);




                        GPorcentaje = parseFloat(GPorcentaje).toFixed(2);
                        JPorcentaje = parseFloat(JPorcentaje).toFixed(2);
                        RPorcentaje = parseFloat(RPorcentaje).toFixed(2);
                        GPorcentajeComp = parseFloat(GPorcentajeComp).toFixed(2);
                        JPorcentajeComp = parseFloat(JPorcentajeComp).toFixed(2);
                        RPorcentajeComp = parseFloat(RPorcentajeComp).toFixed(2);

                        if (GPorcentaje == "0.00" && JPorcentaje == "0.00" && RPorcentaje == "0.00" && GPorcentajeComp == "0.00" && JPorcentajeComp == "0.00" && RPorcentajeComp == "0.00") {

                            $("#BloqueValidador").attr('style', 'display:block; padding-top:20px;');
                            $("#textMessageBlock").html("No hay ninguna informacion para los filtros seleccionados");

                        }
                        else {

                            if (GPorcentaje == "0.00" && JPorcentaje == "0.00" && RPorcentaje == "0.00") {

                                $("#BloqueValidador").attr('style', 'display:block; padding-top:20px;');
                                $("#textMessageBlock").html("No hay información en " + $("#BloqueEstado").html());

                                if (GPorcentajeComp == "0.00" && JPorcentajeComp == "0.00" && RPorcentajeComp == "0.00") {

                                    $("#BloqueValidador").attr('style', 'display:block; padding-top:20px;');
                                    $("#textMessageBlock").html("No hay información en " + $("#BloqueCentro").html());
                                }

                            }


                            if (GPorcentajeComp == "0.00" && JPorcentajeComp == "0.00" && RPorcentajeComp == "0.00") {


                                if ($('#Comparativoflag').html() == "1") {
                                    $("#BloqueValidador").attr('style', 'display:block; padding-top:20px;');
                                    $("#textMessageBlock").html("No hay información en " + $("#BloqueCentro").html());
                                }





                                if (GPorcentaje == "0.00" && JPorcentaje == "0.00" && RPorcentaje == "0.00") {

                                    $("#BloqueValidador").attr('style', 'display:block; padding-top:20px;');
                                    $("#textMessageBlock").html("No hay información en " + $("#BloqueEstado").html());
                                }

                            }

                        }

                    }
                });
            }



            function Tema(Anio, Entidad, Municipio, Centro, AnioComp, EntidadComp, MunicipioComp, CentroComp) {


                // Limpiar gráfica
                var barChartContent = document.getElementById('BarChartContent');
                barChartContent.innerHTML = '&nbsp;';
                $('#BarChartContent').append('<canvas id="myChartBar"></canvas>');

                var ctx = document.getElementById("myChartBar").getContext("2d");



                var Comparativoflag = $('#Comparativoflag').html();

                //const EstadoArreglo = [];
                //const CentroArreglo = [];
                //const EtiquetaArreglo = [];

                var ArregloGlobal = [];
                var AfrodescencienteArregloBase = [];
                var DiscapacidadArregloBase = [];
                var IndigenaArregloBase = [];
                var internacionalesArregloBase = [];
                var nacionalesArregloBase = [];
                var AfrodescencienteArregloComp = [];
                var DiscapacidadArregloComp= [];
                var IndigenaArregloComp = [];
                var internacionalesArregloComp = [];
                var nacionalesArregloComp = [];

                ArregloGlobal.push(AfrodescencienteArregloBase);
                ArregloGlobal.push(DiscapacidadArregloBase);
                ArregloGlobal.push(IndigenaArregloBase);
                ArregloGlobal.push(internacionalesArregloBase);
                ArregloGlobal.push(nacionalesArregloBase);
                ArregloGlobal.push(AfrodescencienteArregloComp);
                ArregloGlobal.push(DiscapacidadArregloComp);
                ArregloGlobal.push(IndigenaArregloComp);
                ArregloGlobal.push(internacionalesArregloComp);
                ArregloGlobal.push(nacionalesArregloComp);


                $.ajax({
                    type: "POST",
                    /*                url: "Temas.php?Anio=" + Anio + "&Entidad=" + Entidad + "&Municipio=" + Municipio + "&Centro=" + Centro + "&AnioComp=" + AnioComp + "&EntidadComp=" + EntidadComp + "&MunicipioComp=" + MunicipioComp + "&CentroComp=" + CentroComp + "&Comparativoflag=" + Comparativoflag,*/
                    url: "ASHXFiles/DB.ashx?o=Temas&Anio=" + Anio + "&Entidad=" + Entidad + "&Municipio=" + Municipio + "&Centro=" + Centro + "&AnioComp=" + AnioComp + "&EntidadComp=" + EntidadComp + "&MunicipioComp=" + MunicipioComp + "&CentroComp=" + CentroComp + "&Comparativoflag=" + Comparativoflag,
                    contentType: "application/json",
                    dataType: "json",
                    async: false,
                    beforeSend: function () {

                        //displayWaitingPopup();

                    },
                    complete: function () {

                        hideWaitingPopup();
                    },
                    //data: $(this).serialize(),
                    //async: false,
                    success: function (response) {
                        //var arrayTemas = response.split("|")

                        $('#tdImagenesTemas').empty();
                        $('#tdTemas').empty();

                        if (response.Data1.length > 0) {
                            var Jsd = response.Data1;

                            $.each(Jsd, function (index) {

                                var Ene = Jsd[index].Ene;
                                var Feb = Jsd[index].Feb;
                                var Mar = Jsd[index].Mar;
                                var Abr = Jsd[index].Abr;
                                var May = Jsd[index].May;
                                var Jun = Jsd[index].Jun;
                                var Jul = Jsd[index].Jul;
                                var Ago = Jsd[index].Ago;
                                var Sep = Jsd[index].Sep;
                                var Oct = Jsd[index].Oct;
                                var Nov = Jsd[index].Nov;
                                var Dic = Jsd[index].Dic;
                                var Comparativo = Jsd[index].Comparativo;
                                var concepto = Jsd[index].concepto;


                                ArregloGlobal[index].push(Ene)
                                ArregloGlobal[index].push(Feb)
                                ArregloGlobal[index].push(Mar)
                                ArregloGlobal[index].push(Abr)
                                ArregloGlobal[index].push(May)
                                ArregloGlobal[index].push(Jun)
                                ArregloGlobal[index].push(Jul)
                                ArregloGlobal[index].push(Ago)
                                ArregloGlobal[index].push(Sep)
                                ArregloGlobal[index].push(Oct)
                                ArregloGlobal[index].push(Nov)
                                ArregloGlobal[index].push(Dic)
                                ArregloGlobal[index].push(Comparativo)
                                ArregloGlobal[index].push(concepto)


                            });


                        }

                    }
                });

                if ($("#CentroSelected1").val() == "" || $("#CentroSelected1").val() == "-Seleccionar-") {
                    $("#TemaEstado").html($("#EntidadSelected1").val());
                }
                else {
                    $("#TemaEstado").html($("#CentroSelected1").val());
                }

                if ($("#CentroSelected2").val() == "" || $("#CentroSelected2").val() == "-Seleccionar-") {
                    $("#TemaCentro").html($("#EntidadSelected2").val());
                }
                else {

                    $("#TemaCentro").html($("#CentroSelected2").val());
                }





                $("#TemaValidador").attr('style', 'display:none;');



                //if ((isNaN(Estado1) || Estado1 == 0) && (isNaN(Estado2) || Estado2 == 0) && (isNaN(Estado3) || Estado3 == 0) && (isNaN(Estado4) || Estado4 == 0) && (isNaN(Estado5) || Estado5 == 0) && (isNaN(Estado6) || Estado6 == 0) && (isNaN(Estado7) || Estado7 == 0) && (isNaN(Estado8) || Estado8 == 0) && (isNaN(Estado9) || Estado9 == 0) && (isNaN(Estado10) || Estado10 == 0) && (isNaN(Estado11) || Estado11 == 0) && (isNaN(Estado12) || Estado12 == 0) && (isNaN(Centro1) || Centro1 == 0) && (isNaN(Centro2) || Centro2 == 0) && (isNaN(Centro3) || Centro3 == 0) && (isNaN(Centro4) || Centro4 == 0) && (isNaN(Centro5) || Centro5 == 0) && (isNaN(Centro6) || Centro6 == 0) && (isNaN(Centro7) || Centro7 == 0) && (isNaN(Centro8) || Centro8 == 0) && (isNaN(Centro9) || Centro9 == 0) && (isNaN(Centro10) || Centro10 == 0) && (isNaN(Centro11) || Centro11 == 0) && (isNaN(Centro12) || Centro12 == 0)) {

                //    $("#TemaValidador").attr('style', 'display:block; padding-top:20px;');
                //    $("#textMessageTema").html("No hay ninguna informacion para los filtros seleccionados");

                //}
                //else {

                //    if ((isNaN(Estado1) || Estado1 == 0) && (isNaN(Estado2) || Estado2 == 0) && (isNaN(Estado3) || Estado3 == 0) && (isNaN(Estado4) || Estado4 == 0) && (isNaN(Estado5) || Estado5 == 0) && (isNaN(Estado6) || Estado6 == 0) && (isNaN(Estado7) || Estado7 == 0) && (isNaN(Estado8) || Estado8 == 0) && (isNaN(Estado9) || Estado9 == 0) && (isNaN(Estado10) || Estado10 == 0) && (isNaN(Estado11) || Estado11 == 0) && (isNaN(Estado12) || Estado12 == 0)) {

                //        $("#TemaValidador").attr('style', 'display:block; padding-top:20px;');
                //        $("#textMessageTema").html("No hay información en " + $("#TemaEstado").html());

                //        if ((isNaN(Centro1) || Centro1 == 0) && (isNaN(Centro2) || Centro2 == 0) && (isNaN(Centro3) || Centro3 == 0) && (isNaN(Centro4) || Centro4 == 0) && (isNaN(Centro5) || Centro5 == 0) && (isNaN(Centro6) || Centro6 == 0) && (isNaN(Centro7) || Centro7 == 0) && (isNaN(Centro8) || Centro8 == 0) && (isNaN(Centro9) || Centro9 == 0) && (isNaN(Centro10) || Centro10 == 0) && (isNaN(Centro11) || Centro11 == 0) && (isNaN(Centro12) || Centro12 == 0)) {

                //            $("#TemaValidador").attr('style', 'display:block; padding-top:20px;');
                //            $("#textMessageTema").html("No hay información en " + $("#TemaCentro").html());
                //        }

                //    }


                //    if ((isNaN(Centro1) || Centro1 == 0) && (isNaN(Centro2) || Centro2 == 0) && (isNaN(Centro3) || Centro3 == 0) && (isNaN(Centro4) || Centro4 == 0) && (isNaN(Centro5) || Centro5 == 0) && (isNaN(Centro6) || Centro6 == 0) && (isNaN(Centro7) || Centro7 == 0) && (isNaN(Centro8) || Centro8 == 0) && (isNaN(Centro9) || Centro9 == 0) && (isNaN(Centro10) || Centro10 == 0) && (isNaN(Centro11) || Centro11 == 0) && (isNaN(Centro12) || Centro12 == 0)) {


                //        if ($('#Comparativoflag').html() == "1") {
                //            $("#TemaValidador").attr('style', 'display:block; padding-top:20px;');
                //            $("#textMessageTema").html("No hay información en " + $("#TemaCentro").html());
                //        }





                //        if ((isNaN(Estado1) || Estado1 == 0) && (isNaN(Estado2) || Estado2 == 0) && (isNaN(Estado3) || Estado3 == 0) && (isNaN(Estado4) || Estado4 == 0) && (isNaN(Estado5) || Estado5 == 0) && (isNaN(Estado6) || Estado6 == 0) && (isNaN(Estado7) || Estado7 == 0) && (isNaN(Estado8) || Estado8 == 0) && (isNaN(Estado9) || Estado9 == 0) && (isNaN(Estado10) || Estado10 == 0) && (isNaN(Estado11) || Estado11 == 0) && (isNaN(Estado12) || Estado12 == 0)) {

                //            $("#TemaValidador").attr('style', 'display:block; padding-top:20px;');
                //            $("#textMessageTema").html("No hay información en " + $("#TemaEstado").html());
                //        }

                //    }

                //}

                const Meses = [];

                //Armar Meses
                for (var count = 0; count < ArregloGlobal.length; count++) {
                    if (ArregloGlobal[count].length > 0) {
                        if (ArregloGlobal[count][0] != null)
                            Meses.push('ENE');

                        if (ArregloGlobal[count][1] != null)
                            Meses.push('FEB');

                        if (ArregloGlobal[count][2] != null)
                            Meses.push('MAR');

                        if (ArregloGlobal[count][3] != null)
                            Meses.push('ABR');

                        if (ArregloGlobal[count][4] != null)
                            Meses.push('MAY');

                        if (ArregloGlobal[count][5] != null)
                            Meses.push('JUN');

                        if (ArregloGlobal[count][6] != null)
                            Meses.push('JUL');

                        if (ArregloGlobal[count][7] != null)
                            Meses.push('AGO');

                        if (ArregloGlobal[count][8] != null)
                            Meses.push('SEPT');

                        if (ArregloGlobal[count][9] != null)
                            Meses.push('OCT');

                        if (ArregloGlobal[count][10] != null)
                            Meses.push('NOV');

                        if (ArregloGlobal[count][11] != null)
                            Meses.push('DIC');

                        break;

                    }
                }


                
                /*                Meses.push('ENE', 'FEB', 'MAR', 'ABRIL', 'MAY', 'JUN', 'JUL', 'AGO', 'SEPT', 'OCT', 'NOV');*/

                var data;
                if (Meses.length > 1) {
                    data = {
                        labels: Meses,
                        datasets: [{
                            label: ArregloGlobal[0][13],
                            stack: "Base",
                            backgroundColor: "#B80D6B",
                            data: ArregloGlobal[0]
                        }, {
                            label: ArregloGlobal[1][13],
                            stack: "Base",
                            backgroundColor: "#FF3399",
                            data: ArregloGlobal[1]
                        },
                        {
                            label: ArregloGlobal[2][13],
                            stack: "Base",
                            backgroundColor: "#FF66CC",
                            data: ArregloGlobal[2]
                        },
                        {
                            label: ArregloGlobal[3][13],
                            stack: "Base",
                            backgroundColor: "#F9D2E4",
                            data: ArregloGlobal[3]
                        },
                        {
                            label: ArregloGlobal[4][13],
                            stack: "Base",
                            backgroundColor: "#FFCDCD",
                            data: ArregloGlobal[4]
                        },
                        {
                            label: ArregloGlobal[5][13],
                            stack: "Comp",
                            backgroundColor: "#B80D6B",
                            data: ArregloGlobal[5]
                        }, {
                            label: ArregloGlobal[6][13],
                            stack: "Comp",
                            backgroundColor: "#FF3399",
                            data: ArregloGlobal[6]
                        },
                        {
                            label: ArregloGlobal[7][13],
                            stack: "Comp",
                            backgroundColor: "#FF66CC",
                            data: ArregloGlobal[7]
                        },
                        {
                            label: ArregloGlobal[8][13],
                            stack: "Comp",
                            backgroundColor: "#F9D2E4",
                            data: ArregloGlobal[8]
                        },
                        {
                            label: ArregloGlobal[9][13],
                            stack: "Comp",
                            backgroundColor: "#FFCDCD",
                            data: ArregloGlobal[9]
                        }                          
                        ]
                    };
                }
                else {

                    var DTArray;
                    var DSArray;
                    var AlFin = [];
                    var comparativo = "";

                    //Armar Información
                    for (var count = 0; count < ArregloGlobal.length; count++) {
                        if (ArregloGlobal[count].length > 0) {

                            if (ArregloGlobal[count][0] != null)
                                DTArray = { valor: ArregloGlobal[count][0], concepto: ArregloGlobal[count][13], Comparativo: ArregloGlobal[count][12] };

                            if (ArregloGlobal[count][1] != null)
                                DTArray = { valor: ArregloGlobal[count][1], concepto: ArregloGlobal[count][13], Comparativo: ArregloGlobal[count][12] };

                            if (ArregloGlobal[count][2] != null)
                                DTArray = { valor: ArregloGlobal[count][2], concepto: ArregloGlobal[count][13], Comparativo: ArregloGlobal[count][12] };

                            if (ArregloGlobal[count][3] != null)
                                DTArray = { valor: ArregloGlobal[count][3], concepto: ArregloGlobal[count][13], Comparativo: ArregloGlobal[count][12] };

                            if (ArregloGlobal[count][4] != null)
                                DTArray = { valor: ArregloGlobal[count][4], concepto: ArregloGlobal[count][13], Comparativo: ArregloGlobal[count][12] };

                            if (ArregloGlobal[count][5] != null)
                                DTArray = { valor: ArregloGlobal[count][5], concepto: ArregloGlobal[count][13], Comparativo: ArregloGlobal[count][12] };

                            if (ArregloGlobal[count][6] != null)
                                DTArray = { valor: ArregloGlobal[count][6], concepto: ArregloGlobal[count][13], Comparativo: ArregloGlobal[count][12] };

                            if (ArregloGlobal[count][7] != null)
                                DTArray = { valor: ArregloGlobal[count][7], concepto: ArregloGlobal[count][13], Comparativo: ArregloGlobal[count][12] };

                            if (ArregloGlobal[count][8] != null)
                                DTArray = { valor: ArregloGlobal[count][8], concepto: ArregloGlobal[count][13], Comparativo: ArregloGlobal[count][12] };

                            if (ArregloGlobal[count][9] != null)
                                DTArray = { valor: ArregloGlobal[count][9], concepto: ArregloGlobal[count][13], Comparativo: ArregloGlobal[count][12] };

                            if (ArregloGlobal[count][10] != null)
                                DTArray = { valor: ArregloGlobal[count][10], concepto: ArregloGlobal[count][13], Comparativo: ArregloGlobal[count][12] };

                            if (ArregloGlobal[count][11] != null)
                                DTArray = { valor: ArregloGlobal[count][11], concepto: ArregloGlobal[count][13], Comparativo: ArregloGlobal[count][12] };

                            if (DTArray.Comparativo == null)
                                comparativo = "Base";
                            else
                                comparativo = DTArray.Comparativo;

                            DSArray = { label: "", stack: comparativo, backgroundColor: "#B80D6B", data: DTArray.valor };
                            AlFin.push(DSArray);
                        }
                    }

                    //var feed = { label: "", stack: "Base", backgroundColor: "#B80D6B", data: ArregloGlobal[0] };
                    //var dos = { label: "", stack: "Base", backgroundColor: "#FF3399", data: ArregloGlobal[1] };

                    
                    //AlFin.push(feed);
                    //AlFin.push(dos);



                    data = {
                        labels: Meses,
                        datasets: AlFin
                    };



                    //data = {
                    //    labels: Meses,
                    //    datasets: [{
                    //        label: "",
                    //        stack: "Base",
                    //        backgroundColor: "#B80D6B",
                    //        data: ArregloGlobal[0]
                    //    }, {
                    //            label: "",
                    //            stack: "Base",
                    //            backgroundColor: "#FF3399",
                    //            data: ArregloGlobal[1]
                    //        }
                    //    ]
                    //};

                }

                







                ctx.canvas.parentNode.style.height = '400px';
                ctx.canvas.parentNode.style.width = '100%';



                var myBarChart = new Chart(ctx, {
                    type: 'bar',
                    data: data,
                    options: {
                        //animation: {
                        //    duration: 1000,
                        //    onComplete() {
                        //        let chartInstance = this.chart;
                        //        let ctx = chartInstance.ctx;
                        //        ctx.textAlign = "end";
                        //        ctx.textBaseline = "top";
                        //        ctx.fillStyle = "#000000";
                        //        ctx.font = "10px sans-serif";
                        //        this.data.datasets.forEach(function (dataset, i) {
                        //            var label = dataset.label;
                        //            var meta = chartInstance.controller.getDatasetMeta(i);
                        //            meta.data.forEach(function (bar, index) {
                        //                var data = dataset.data[index];
                        //                if (label.indexOf("%") >= 0) data += "%";
                        //                ctx.fillText(data, bar._model.x, bar._model.y);
                        //            });
                        //        });
                        //    },
                        //},
                        plugins: {
                            legend: {
                                display: true
                            },
                            datalabels: {
                                color: 'black',
                                labels: {
                                    title: {
                                        font: {
                                            family: "sans-serif",
                                            size: 100,
                                            weight: 'bold'
                                        }
                                    }
                                },
                                formatter: function (value, context) {
                                    return context.datasetIndex == 1 ? context.chart.data.labels[context.dataIndex] : ' ';
                                }
                            }
                        },
                        tooltips: {
                            enabled: true,
                            mode: 'single',
                            callbacks: {
                                //beforeTitle: function (tooltipItem, data) {
                                //    return "------------------------------";
                                //},
                                title: function (tooltipItems, data) {
                                    return data.datasets[tooltipItems[0].datasetIndex].data[13];
                                },
                                //afterTitle: function (tooltipItem, data) {
                                //    return "------------------------------";
                                //},
                                //beforeBody: function (tooltipItem, data) {
                                //    const newLineArray = [];
                                //    newLineArray.push('Linea 1');
                                //    newLineArray.push('Linea 2');
                                //    newLineArray.push('Linea 3');
                                //    newLineArray.push('Linea 4');
                                //    return newLineArray;
                                //},
                                //beforeLabel: function (tooltipItem, data) {
                                //    return "Despues de iniciar el cuerpo";
                                //},
                                label: function (tooltipItems, data) {
                                    var i = tooltipItems.index;
                                    return data.labels[i] + ": " + data.datasets[tooltipItems.datasetIndex].data[i];
                                },
                                //afterLabel: function (tooltipItem, data) {
                                //    return "Despues del label";
                                //},
                                //afterBody: function (tooltipItem, data) {
                                //    return "Termina Cuerpo";
                                //},
                                //beforeFooter: function (tooltipItem, data) {
                                //    return "Inicia PIE";
                                //},
                                //footer: function (tooltipItem, data) {
                                //    return 'Pie'
                                //},
                                //afterFooter: function (tooltipItem, data) {
                                //    return "Termina PIE";
                                //},
                            },
                            //backgroundColor: '#f1e6e8',
                            titleFontSize: 20,
                            //titleFontColor: '#0066ff',
                            //bodyFontColor: '#000',
                            bodyFontSize: 13,
                            displayColors: true
                        },
                        barValueSpacing: 1,
                        maintainAspectRatio: false,
                        scales: {
                            yAxes: [{
                                ticks: {
                                    min: 0,
                                    max: 25,
                                    stepSize: 10
                                },
                                gridLines: {
                                    lineWidth: 0
                                },
                                stacked: true
                            }],
                            xAxes: [{
                                // Change here
                                barPercentage: 0.6,
                                categoryPercentage: 0.6,
                                gridLines: {
                                    lineWidth: 0
                                },
                                stacked: true
                            }]
                        }
                    }

                });

                document.getElementById("myChartBar").onclick = function (evt) {
                    //var activePoints = myBarChart.getElementsAtEventForMode(evt, 'point', myBarChart.options);
                    //var firstPoint = activePoints[0];
                    //var label = myBarChart.data.labels[firstPoint._index];
                    //var value = myBarChart.data.datasets[firstPoint._datasetIndex].data[firstPoint._index];
                    //alert(label + ": " + value);



                    TipoIngresoDrillDown()


                };


            }



            function TipoIngresoDrillDown() {

                // Poblar tabla
                var barChartContent = document.getElementById('BarChartContent');
                barChartContent.innerHTML = '&nbsp;';

                var sTabla = '<table id="PedidosDataTable" class="table table-striped table-bordered table-hover dataTables-example" >\n';
                sTabla += '<thead>\n';
                sTabla += '<tr>\n';
                //sTabla += '<th>Indice</th>\n';
                sTabla += '<th>Nombre</th>\n';
                sTabla += '<th>Fecha</th>\n';
                sTabla += '<th>Estatus</th>\n';
                sTabla += '</tr>\n';
                sTabla += '</thead>\n';

                   $.ajax({
                      url: "ASHXFiles/DB.ashx?o=TipoIngresoDet",
                      type: "GET",
                      data: {
                      },
                      contentType: "application/json",
                      dataType: "json",
                      async: false,
                      success: function (response2) {
                          var Jsd = response2.Data1;


                          $.each(Jsd, function (index) {

                              sTabla += '<tr>\n';
/*                              sTabla += '<td>' + Jsd[index].Indice + '</td>\n'*/
                              sTabla += '<td>' + Jsd[index].Nombre + '</td>\n'
                              sTabla += '<td>' + Jsd[index].fechaNac + '</td>\n'
                              sTabla += '<td>' + Jsd[index].Estatus + '</td>\n'
                              sTabla += '</tr>\n';
                             
                          });
                      }
                   })

                   sTabla += '</table>\n';

                   $('#BarChartContent').append(sTabla);

                $('#PedidosDataTable').DataTable({
                    language: {
                        "decimal": "",
                        "emptyTable": "No hay información",
                        "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                        "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                        "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                        "infoPostFix": "",
                        "thousands": ",",
                        "lengthMenu": "Mostrar _MENU_ Entradas",
                        "loadingRecords": "Cargando...",
                        "processing": "Procesando...",
                        "search": "Buscar:",
                        "zeroRecords": "Sin resultados encontrados",
                        "paginate": {
                            "first": "Primero",
                            "last": "Ultimo",
                            "next": "Siguiente",
                            "previous": "Anterior"
                        }
                    },
                    pageLength: 5,
                    bFilter: false,
                    dom: 'rtip',
                    //columnDefs: [
                    //    {
                    //        "targets": [0],
                    //        "visible": false,
                    //        "searchable": true,
                    //        "width": "25%"
                    //    }
                    //],
                    lengthMenu: [[5], [5]]
                });

                $('#PedidosDataTable tbody').on('click', 'tr', function (e) {
                    //var Name = $(this).find('td:first').text();
                    //alert(Name);

                    $('#DIFDetalle').modal('show');
                    $('#DetalleGridFrame').attr('src', "admMenorView.aspx?menorID=17")
                });

            }

            function Presupuestos(Anio, Entidad, Municipio, Centro, AnioComp, EntidadComp, MunicipioComp, CentroComp) {

                $('#Comparativoflag').html("1");

                // Limpiar gráfica
                var barChartContent = document.getElementById('BarChartPresupuestos');
                barChartContent.innerHTML = '&nbsp;';
                $('#BarChartPresupuestos').append('<canvas id="myChartPresupuestos"></canvas>');

                var ctx = document.getElementById("myChartPresupuestos").getContext("2d");



                var Comparativoflag = $('#Comparativoflag').html();

                const labelsArreglo = [];
                const DatosArreglo = [];


                $.ajax({
                    type: "POST",
                    /*                url: "Temas.php?Anio=" + Anio + "&Entidad=" + Entidad + "&Municipio=" + Municipio + "&Centro=" + Centro + "&AnioComp=" + AnioComp + "&EntidadComp=" + EntidadComp + "&MunicipioComp=" + MunicipioComp + "&CentroComp=" + CentroComp + "&Comparativoflag=" + Comparativoflag,*/
                    url: "ASHXFiles/DB.ashx?o=MenorXGenero&Anio=" + Anio + "&Entidad=" + Entidad + "&Municipio=" + Municipio + "&Centro=" + Centro,
                    contentType: "application/json",
                    dataType: "json",
                    async: false,
                    beforeSend: function () {

                        //displayWaitingPopup();

                    },
                    complete: function () {

                        hideWaitingPopup();
                    },
                    //data: $(this).serialize(),
                    //async: false,
                    success: function (response) {
                        //var arrayTemas = response.split("|")

                        //$('#tdImagenesTemas').empty();
                        //$('#tdTemas').empty();

                        if (response.Data1.length > 0) {
                            var Jsd = response.Data1;

                            $.each(Jsd, function (index) {

                                var labels;
                                var Datos;


                                labels = response.Data1[index].GENERO;
                                Datos = response.Data1[index].cant;



                                labelsArreglo.push(labels);
                                DatosArreglo.push(Datos);

                            });


                        }

                    }
                });

                if ($("#CentroSelected1").val() == "" || $("#CentroSelected1").val() == "-Seleccionar-") {
                    $("#PresupuestosEstado").html($("#EntidadSelected1").val());
                }
                else {
                    $("#PresupuestosEstado").html($("#CentroSelected1").val());
                }

                if ($("#CentroSelected2").val() == "" || $("#CentroSelected2").val() == "-Seleccionar-") {
                    $("#PresupuestosCentro").html($("#EntidadSelected2").val());
                }
                else {

                    $("#PresupuestosCentro").html($("#CentroSelected2").val());
                }





                $("#PresupuestosValidador").attr('style', 'display:none;');



                //if ((isNaN(Estado1) || Estado1 == 0) && (isNaN(Estado2) || Estado2 == 0) && (isNaN(Estado3) || Estado3 == 0) && (isNaN(Estado4) || Estado4 == 0) && (isNaN(Estado5) || Estado5 == 0) && (isNaN(Estado6) || Estado6 == 0) && (isNaN(Estado7) || Estado7 == 0) && (isNaN(Estado8) || Estado8 == 0) && (isNaN(Estado9) || Estado9 == 0) && (isNaN(Estado10) || Estado10 == 0) && (isNaN(Estado11) || Estado11 == 0) && (isNaN(Estado12) || Estado12 == 0) && (isNaN(Centro1) || Centro1 == 0) && (isNaN(Centro2) || Centro2 == 0) && (isNaN(Centro3) || Centro3 == 0) && (isNaN(Centro4) || Centro4 == 0) && (isNaN(Centro5) || Centro5 == 0) && (isNaN(Centro6) || Centro6 == 0) && (isNaN(Centro7) || Centro7 == 0) && (isNaN(Centro8) || Centro8 == 0) && (isNaN(Centro9) || Centro9 == 0) && (isNaN(Centro10) || Centro10 == 0) && (isNaN(Centro11) || Centro11 == 0) && (isNaN(Centro12) || Centro12 == 0)) {

                //    $("#TemaValidador").attr('style', 'display:block; padding-top:20px;');
                //    $("#textMessageTema").html("No hay ninguna informacion para los filtros seleccionados");

                //}
                //else {

                //    if ((isNaN(Estado1) || Estado1 == 0) && (isNaN(Estado2) || Estado2 == 0) && (isNaN(Estado3) || Estado3 == 0) && (isNaN(Estado4) || Estado4 == 0) && (isNaN(Estado5) || Estado5 == 0) && (isNaN(Estado6) || Estado6 == 0) && (isNaN(Estado7) || Estado7 == 0) && (isNaN(Estado8) || Estado8 == 0) && (isNaN(Estado9) || Estado9 == 0) && (isNaN(Estado10) || Estado10 == 0) && (isNaN(Estado11) || Estado11 == 0) && (isNaN(Estado12) || Estado12 == 0)) {

                //        $("#TemaValidador").attr('style', 'display:block; padding-top:20px;');
                //        $("#textMessageTema").html("No hay información en " + $("#TemaEstado").html());

                //        if ((isNaN(Centro1) || Centro1 == 0) && (isNaN(Centro2) || Centro2 == 0) && (isNaN(Centro3) || Centro3 == 0) && (isNaN(Centro4) || Centro4 == 0) && (isNaN(Centro5) || Centro5 == 0) && (isNaN(Centro6) || Centro6 == 0) && (isNaN(Centro7) || Centro7 == 0) && (isNaN(Centro8) || Centro8 == 0) && (isNaN(Centro9) || Centro9 == 0) && (isNaN(Centro10) || Centro10 == 0) && (isNaN(Centro11) || Centro11 == 0) && (isNaN(Centro12) || Centro12 == 0)) {

                //            $("#TemaValidador").attr('style', 'display:block; padding-top:20px;');
                //            $("#textMessageTema").html("No hay información en " + $("#TemaCentro").html());
                //        }

                //    }


                //    if ((isNaN(Centro1) || Centro1 == 0) && (isNaN(Centro2) || Centro2 == 0) && (isNaN(Centro3) || Centro3 == 0) && (isNaN(Centro4) || Centro4 == 0) && (isNaN(Centro5) || Centro5 == 0) && (isNaN(Centro6) || Centro6 == 0) && (isNaN(Centro7) || Centro7 == 0) && (isNaN(Centro8) || Centro8 == 0) && (isNaN(Centro9) || Centro9 == 0) && (isNaN(Centro10) || Centro10 == 0) && (isNaN(Centro11) || Centro11 == 0) && (isNaN(Centro12) || Centro12 == 0)) {


                //        if ($('#Comparativoflag').html() == "1") {
                //            $("#TemaValidador").attr('style', 'display:block; padding-top:20px;');
                //            $("#textMessageTema").html("No hay información en " + $("#TemaCentro").html());
                //        }





                //        if ((isNaN(Estado1) || Estado1 == 0) && (isNaN(Estado2) || Estado2 == 0) && (isNaN(Estado3) || Estado3 == 0) && (isNaN(Estado4) || Estado4 == 0) && (isNaN(Estado5) || Estado5 == 0) && (isNaN(Estado6) || Estado6 == 0) && (isNaN(Estado7) || Estado7 == 0) && (isNaN(Estado8) || Estado8 == 0) && (isNaN(Estado9) || Estado9 == 0) && (isNaN(Estado10) || Estado10 == 0) && (isNaN(Estado11) || Estado11 == 0) && (isNaN(Estado12) || Estado12 == 0)) {

                //            $("#TemaValidador").attr('style', 'display:block; padding-top:20px;');
                //            $("#textMessageTema").html("No hay información en " + $("#TemaEstado").html());
                //        }

                //    }

                //}


                var data = {
                    labels: labelsArreglo,
                    datasets: [
                        {
                            data: DatosArreglo,
                            backgroundColor: [
                                "#F5C4E9",
                                "#C35ADF",
                                "#EC9ED9",
                                "#CF3DAB"
                            ]
                        }]
                };





                //ctx.canvas.parentNode.style.height = '400px';
                //ctx.canvas.parentNode.style.width = '70%';
                //ctx.canvas.parentNode.style.top = 0;
                //ctx.canvas.parentNode.style.bottom = 0;
                //ctx.canvas.parentNode.style.left = 0;
                //ctx.canvas.parentNode.style.right = 0;
                //ctx.canvas.parentNode.style.margin = 'auto';


                var myBarChart = new Chart(ctx, {
                    type: 'pie',
                    data: data
                    //options: {
                    //    legend: {
                    //        display: false
                    //    },
                    //    barValueSpacing: 1,
                    //    maintainAspectRatio: false,
                    //    scales: {
                    //        yAxes: [{
                    //            ticks: {
                    //                min: 0,
                    //                max: 100,
                    //                stepSize: 50
                    //            },
                    //            gridLines: {
                    //                lineWidth: 0
                    //            },
                    //            stacked: true
                    //        }],
                    //        xAxes: [{
                    //            // Change here
                    //            barPercentage: 0.6,
                    //            categoryPercentage: 0.6,
                    //            gridLines: {
                    //                lineWidth: 0
                    //            },
                    //            stacked: true
                    //        }]
                    //    }
                    //}
                });


            }


            function GraphicsImages(Anio, Entidad, Municipio, Centro, AnioComp, EntidadComp, MunicipioComp, CentroComp) {

                $('#Comparativoflag').html("1");


                var porcNN;
                var porcPPL;
                var porcPP;
                var porcVIS;
                var porcNN2;
                var porcPPL2;
                var porcPP2;
                var porcVIS2;

                var Comparativoflag = $('#Comparativoflag').html();



                $.ajax({
                    type: "POST",
                    /*url: "MostrarXPoblacion.php?Anio=" + Anio + "&Entidad=" + Entidad + "&Municipio=" + Municipio + "&Centro=" + Centro + "&AnioComp=" + AnioComp + "&EntidadComp=" + EntidadComp + "&MunicipioComp=" + MunicipioComp + "&CentroComp=" + CentroComp + "&Comparativoflag=" + Comparativoflag,*/
                    url: "ASHXFiles/DB.ashx?o=Poblacion",
                    contentType: "application/json",
                    dataType: "json",
                    async: false,
                    beforeSend: function () {
                        //displayWaitingPopup();

                    },
                    complete: function () {
                        hideWaitingPopup();
                    },
                    //data: $(this).serialize(),
                    //async: false,
                    success: function (response) {


                        //var arrayTemas = response.split("|")

                        //var jsonData = JSON.parse(arrayTemas[0]);
                        //var jsonData2 = JSON.parse(arrayTemas[1]);

                        porcNN = response.Data1[0].porcNN;
                        porcPPL = response.Data1[0].porcPPL;
                        porcPP = response.Data1[0].porcPP;
                        porcVIS = response.Data1[0].porcVIS;
                        porcNN2 = response.Data1[1].porcNN;
                        porcPPL2 = response.Data1[1].porcPPL;
                        porcPP2 = response.Data1[1].porcPP;
                        porcVIS2 = response.Data1[1].porcVIS;





                    }
                });


                porcNN = parseFloat(porcNN);
                porcNN = porcNN * 100;
                porcNN = truncateDecimals(porcNN, 1);

                porcPPL = parseFloat(porcPPL);
                porcPPL = porcPPL * 100;
                porcPPL = truncateDecimals(porcPPL, 1);

                porcPP = parseFloat(porcPP);
                porcPP = porcPP * 100;
                porcPP = truncateDecimals(porcPP, 1);

                porcVIS = parseFloat(porcVIS);
                porcVIS = porcVIS * 100;
                porcVIS = truncateDecimals(porcVIS, 1);




                if (isNaN(porcNN))
                    $("#P1").html("");
                else
                    $("#P1").html(porcNN + "%");

                if (isNaN(porcPPL))
                    $("#P2").html("");
                else
                    $("#P2").html(porcPPL + "%");

                if (isNaN(porcPP))
                    $("#P3").html("");
                else
                    $("#P3").html(porcPP + "%");

                if (isNaN(porcVIS))
                    $("#P4").html("");
                else
                    $("#P4").html(porcVIS + "%");



                if ($('#Comparativoflag').html() == "1") {

                    porcNN2 = parseFloat(porcNN2);
                    porcNN2 = porcNN2 * 100;
                    porcNN2 = truncateDecimals(porcNN2, 1);

                    porcPPL2 = parseFloat(porcPPL2);
                    porcPPL2 = porcPPL2 * 100;
                    porcPPL2 = truncateDecimals(porcPPL2, 1);

                    porcPP2 = parseFloat(porcPP2);
                    porcPP2 = porcPP2 * 100;
                    porcPP2 = truncateDecimals(porcPP2, 1);

                    porcVIS2 = parseFloat(porcVIS2);
                    porcVIS2 = porcVIS2 * 100;
                    porcVIS2 = truncateDecimals(porcVIS2, 1);

                }
                else {
                    porcNN2 = 0;
                    porcPPL2 = 0;
                    porcPP2 = 0;
                    porcVIS2 = 0;
                }




                if (isNaN(porcNN2)) {

                    $("#PoblacionComparativo1").html("");
                    $("#divPoblacionComparativo1").css("display", "none");
                }
                else {

                    $("#PoblacionComparativo1").html(porcNN2 + "%");
                    $("#divPoblacionComparativo1").css("display", "block");
                }



                if (isNaN(porcPPL2)) {

                    $("#PoblacionComparativo2").html("");
                    $("#divPoblacionComparativo2").css("display", "none");
                }
                else {

                    $("#PoblacionComparativo2").html(porcPPL2 + "%");
                    $("#divPoblacionComparativo2").css("display", "block");
                }


                if (isNaN(porcPP2)) {

                    $("#PoblacionComparativo3").html("");


                    $("#divPoblacionComparativo3").css("display", "none");

                }
                else {

                    $("#divPoblacionComparativo3").css("display", "block");

                    $("#PoblacionComparativo3").html(porcPP2 + "%");
                }


                if (isNaN(porcVIS2)) {

                    $("#PoblacionComparativo4").html("");

                    $("#divPoblacionComparativo4").css("display", "none");

                }
                else {

                    $("#divPoblacionComparativo4").css("display", "block");

                    $("#PoblacionComparativo4").html(porcVIS2 + "%");
                }











                //Mensaje validador de resultados

                $("#PobValidador").attr('style', 'display:none;');



                if ((porcNN == "0.0" || isNaN(porcNN)) && (porcPPL == "0.0" || isNaN(porcPPL)) && (porcPP == "0.0" || isNaN(porcPP)) && (porcVIS == "0.0" || isNaN(porcVIS)) && (porcNN2 == "0.0" || isNaN(porcNN2)) && (porcPPL2 == "0.0" || isNaN(porcPPL2)) && (porcPP2 == "0.0" || isNaN(porcPP2)) && (porcVIS2 == "0.0" || isNaN(porcVIS2))) {

                    $("#PobValidador").attr('style', 'display:block; padding-top:20px;');
                    $("#textMessagePob").html("No hay ninguna informacion para los filtros seleccionados");

                }
                else {



                    if ((porcNN == "0.0" || isNaN(porcNN)) && (porcPPL == "0.0" || isNaN(porcPPL)) && (porcPP == "0.0" || isNaN(porcPP)) && (porcVIS == "0.0" || isNaN(porcVIS))) {

                        $("#PobValidador").attr('style', 'display:block; padding-top:20px;');
                        $("#textMessagePob").html("No hay información en " + $("#PoblacionEstado").html());

                        if ((porcNN2 == "0.0" || isNaN(porcNN2)) && (porcPPL2 == "0.0" || isNaN(porcPPL2)) && (porcPP2 == "0.0" || isNaN(porcPP2)) && (porcVIS2 == "0.0" || isNaN(porcVIS2))) {

                            $("#PobValidador").attr('style', 'display:block; padding-top:20px;');
                            $("#textMessagePob").html("No hay información en " + $("#PoblacionCentro").html());
                        }

                    }


                    if ($('#Comparativoflag').html() == "1") {

                        if ((porcNN2 == "0.0" || isNaN(porcNN2)) && (porcPPL2 == "0.0" || isNaN(porcPPL2)) && (porcPP2 == "0.0" || isNaN(porcPP2)) && (porcVIS2 == "0.0" || isNaN(porcVIS2))) {

                            $("#PobValidador").attr('style', 'display:block; padding-top:20px;');
                            $("#textMessagePob").html("No hay información en " + $("#PoblacionCentro").html());



                            if ((porcNN == "0.0" || isNaN(porcNN)) && (porcPPL == "0.0" || isNaN(porcPPL)) && (porcPP == "0.0" || isNaN(porcPP)) && (porcVIS == "0.0" || isNaN(porcVIS))) {

                                $("#PobValidador").attr('style', 'display:block; padding-top:20px;');
                                $("#textMessagePob").html("No hay información en " + $("#PoblacionEstado").html());
                            }

                        }

                    }





                }












                var data1 = {
                    datasets: [
                        {
                            data: [100 - porcNN2, porcNN2],
                            backgroundColor: ["#ffffff00", "#fd5300"]
                        },
                        {
                            data: [100 - porcNN, porcNN],
                            backgroundColor: ["#ccc", "#232d82"]
                        }

                    ]
                };


                var config1 = {
                    type: 'doughnut',
                    data: data1,
                    options: {
                        cutoutPercentage: 70,
                        responsive: true,


                        tooltips: {
                            enabled: false
                        }

                    }
                };

                var data2 = {
                    datasets: [
                        {
                            data: [100 - porcPPL2, porcPPL2],
                            backgroundColor: ["#ffffff00", "#fd5300"]
                        },
                        {
                            data: [100 - porcPPL, porcPPL],
                            backgroundColor: ["#ccc", "#232d82"]
                        }

                    ]
                };

                var config2 = {
                    type: 'doughnut',
                    data: data2,
                    options: {
                        cutoutPercentage: 70,
                        responsive: true,


                        tooltips: {
                            enabled: false
                        }

                    }
                };

                var data3 = {
                    datasets: [
                        {
                            data: [100 - porcPP2, porcPP2],
                            backgroundColor: ["#ffffff00", "#fd5300"]
                        },
                        {
                            data: [100 - porcPP, porcPP],
                            backgroundColor: ["#ccc", "#232d82"]
                        }

                    ]
                };

                var config3 = {
                    type: 'doughnut',
                    data: data3,
                    options: {
                        cutoutPercentage: 70,
                        responsive: true,


                        tooltips: {
                            enabled: false
                        }

                    }
                };


                var data4 = {
                    datasets: [
                        {
                            data: [100 - porcVIS2, porcVIS2],
                            backgroundColor: ["#ffffff00", "#fd5300"]
                        },
                        {
                            data: [100 - porcVIS, porcVIS],
                            backgroundColor: ["#ccc", "#232d82"]
                        }

                    ]
                };

                var config4 = {
                    type: 'doughnut',
                    data: data4,
                    options: {
                        cutoutPercentage: 70,
                        responsive: true,


                        tooltips: {
                            enabled: false
                        }

                    }
                };



                // Limpiar gráfica
                var divPob4 = document.getElementById('divPob4');
                divPob4.innerHTML = '&nbsp;';
                $('#divPob4').append('<canvas id="chart-area4" width="400" height="400" />');

                // Limpiar gráfica
                var divPob5 = document.getElementById('divPob5');
                divPob5.innerHTML = '&nbsp;';
                $('#divPob5').append('<canvas id="chart-area5" width="400" height="400" />');


                // Limpiar gráfica
                var divPob6 = document.getElementById('divPob6');
                divPob6.innerHTML = '&nbsp;';
                $('#divPob6').append('<canvas id="chart-area6" width="400" height="400" />');


                // Limpiar gráfica
                var divPob7 = document.getElementById('divPob7');
                divPob7.innerHTML = '&nbsp;';
                $('#divPob7').append('<canvas id="chart-area7" width="400" height="400" />');




                var ctx = document.getElementById("chart-area4").getContext("2d");
                window.myDoughnut = new Chart(ctx, config1);

                var ctx = document.getElementById("chart-area5").getContext("2d");
                window.myDoughnut = new Chart(ctx, config2);
                var ctx = document.getElementById("chart-area6").getContext("2d");
                window.myDoughnut = new Chart(ctx, config3);
                var ctx = document.getElementById("chart-area7").getContext("2d");
                window.myDoughnut = new Chart(ctx, config4);




            }


            function Vulnerabilidad(Anio, Entidad, Municipio, Centro, AnioComp, EntidadComp, MunicipioComp, CentroComp) {

                $('#Comparativoflag').html("1");


                var Estado1;
                var Centro1;
                var Estado2;
                var Centro2;
                var Estado3;
                var Centro3;
                var Estado4;
                var Centro4;
                var Estado5;
                var Centro5;
                var Estado6;
                var Centro6;
                var Estado7;
                var Centro7;
                var Estado8;
                var Centro8;
                var Estado9;
                var Centro9;
                var Estado10;
                var Centro10;

                var Comparativoflag = $('#Comparativoflag').html();

                $.ajax({
                    type: "POST",
                    /*                url: "Vulnerabilidad.php?Anio=" + Anio + "&Entidad=" + Entidad + "&Municipio=" + Municipio + "&Centro=" + Centro + "&AnioComp=" + AnioComp + "&EntidadComp=" + EntidadComp + "&MunicipioComp=" + MunicipioComp + "&CentroComp=" + CentroComp + "&Comparativoflag=" + Comparativoflag,*/
                    url: "ASHXFiles/DB.ashx?o=Vulnerabilidad",
                    contentType: "application/json",
                    dataType: "json",
                    async: false,
                    beforeSend: function () {
                        //displayWaitingPopup();

                    },
                    complete: function () {
                        //hideWaitingPopup();
                    },
                    //data: $(this).serialize(),
                    //async: false,
                    success: function (response) {
                        //var arrayTemas = response.split("|")


                        $('#tbVulnerabilidad').empty();


                        if (response.Data1.length > 0) {
                            var Jsd = response.Data1;

                            $.each(Jsd, function (index) {

                                switch (Jsd[index].grupoID) {
                                    case 1:
                                        $('#tbVulnerabilidad').append('<tr style="height: 70px;"><td style="text-align:right;">' + Jsd[index].grupoDesc + '</td><td><img height="50px" width="50px" src="img/G_MEL_C_Mesa de trabajo 1.png" /></td></tr>');
                                        break;
                                    case 2:
                                        $('#tbVulnerabilidad').append('<tr style="height: 70px;"><td style="text-align:right;">' + Jsd[index].grupoDesc + '</td><td><img height="50px" width="50px" src="img/G_MVH_C_Mesa de trabajo 1.png" /></td></tr>');
                                        break;
                                    case 3:
                                        $('#tbVulnerabilidad').append('<tr style="height: 70px;"><td style="text-align:right;">' + Jsd[index].grupoDesc + '</td><td><img height="50px" width="50px" src="img/G_AM_C_Mesa de trabajo 1.png" /></td></tr>');
                                        break;
                                    case 4:
                                        $('#tbVulnerabilidad').append('<tr style="height: 70px;"><td style="text-align:right;">' + Jsd[index].grupoDesc + '</td><td><img height="50px" width="50px" src="img/G_D_C_Mesa de trabajo 1.png" /></td></tr>');
                                        break;
                                    case 5:
                                        $('#tbVulnerabilidad').append('<tr style="height: 70px;"><td style="text-align:right;">' + Jsd[index].grupoDesc + '</td><td><img height="50px" width="50px" src="img/G_PS_C_Mesa de trabajo 1.png" /></td></tr>');
                                        break;
                                    case 6:
                                        $('#tbVulnerabilidad').append('<tr style="height: 70px;"><td style="text-align:right;">' + Jsd[index].grupoDesc + '</td><td><img height="50px" width="50px" src="img/G_VS_C_Mesa de trabajo 1.png" /></td></tr>');
                                        break;
                                    case 7:
                                        $('#tbVulnerabilidad').append('<tr style="height: 70px;"><td style="text-align:right;">' + Jsd[index].grupoDesc + '</td><td><img height="50px" width="50px" src="img/G_E_C_Mesa de trabajo 1.png" /></td></tr>');
                                        break;
                                    case 8:
                                        $('#tbVulnerabilidad').append('<tr style="height: 70px;"><td style="text-align:right;">' + Jsd[index].grupoDesc + '</td><td><img height="50px" width="50px" src="img/G_I_C_Mesa de trabajo 1.png" /></td></tr>');
                                        break;
                                    case 9:
                                        $('#tbVulnerabilidad').append('<tr style="height: 70px;"><td style="text-align:right;">' + Jsd[index].grupoDesc + '</td><td><img height="50px" width="50px" src="img/G_LGBTI_C_Mesa de trabajo 1.png" /></td></tr>');
                                        break;
                                }

                            });


                        }

                        Estado1 = response.Data1[0].Estado;
                        Centro1 = response.Data1[0].Centro;
                        Estado1 = (Math.floor(Estado1 * 100) / 100).toFixed(2);
                        Centro1 = (Math.floor(Centro1 * 100) / 100).toFixed(2);
                        Estado1 = Estado1 * 100;
                        Centro1 = Centro1 * 100;
                        Estado1 = parseInt(Estado1);
                        Centro1 = parseInt(Centro1);


                        Estado2 = response.Data1[1].Estado;
                        Centro2 = response.Data1[1].Centro;
                        Estado2 = (Math.floor(Estado2 * 100) / 100).toFixed(2);
                        Centro2 = (Math.floor(Centro2 * 100) / 100).toFixed(2);
                        Estado2 = Estado2 * 100;
                        Centro2 = Centro2 * 100;
                        Estado2 = parseInt(Estado2);
                        Centro2 = parseInt(Centro2);


                        Estado3 = response.Data1[2].Estado;
                        Centro3 = response.Data1[2].Centro;
                        //Estado3 = parseFloat(Estado3).toFixed(3);
                        //Centro3 = parseFloat(Centro3).toFixed(3);
                        Estado3 = (Math.floor(Estado3 * 100) / 100).toFixed(2);
                        Centro3 = (Math.floor(Centro3 * 100) / 100).toFixed(2);
                        Estado3 = Estado3 * 100;
                        Centro3 = Centro3 * 100;
                        Estado3 = parseInt(Estado3);
                        Centro3 = parseInt(Centro3);


                        Estado4 = response.Data1[3].Estado;
                        Centro4 = response.Data1[3].Centro;
                        Estado4 = (Math.floor(Estado4 * 100) / 100).toFixed(2);
                        Centro4 = (Math.floor(Centro4 * 100) / 100).toFixed(2);
                        Estado4 = Estado4 * 100;
                        Centro4 = Centro4 * 100;
                        Estado4 = parseInt(Estado4);
                        Centro4 = parseInt(Centro4);


                        Estado5 = response.Data1[4].Estado;
                        Centro5 = response.Data1[4].Centro;
                        Estado5 = (Math.floor(Estado5 * 100) / 100).toFixed(2);
                        Centro5 = (Math.floor(Centro5 * 100) / 100).toFixed(2);

                        Estado5 = Estado5 * 100;
                        Centro5 = Centro5 * 100;
                        Estado5 = parseInt(Estado5);
                        Centro5 = parseInt(Centro5);


                        Estado6 = response.Data1[5].Estado;
                        Centro6 = response.Data1[5].Centro;
                        //Estado6 = parseFloat(Estado6).toFixed(3);
                        //Centro6 = parseFloat(Centro6).toFixed(3);
                        Estado6 = (Math.floor(Estado6 * 100) / 100).toFixed(2);
                        Centro6 = (Math.floor(Centro6 * 100) / 100).toFixed(2);
                        Estado6 = Estado6 * 100;
                        Centro6 = Centro6 * 100;
                        Estado6 = parseInt(Estado6);
                        Centro6 = parseInt(Centro6);

                        Estado7 = response.Data1[6].Estado;
                        Centro7 = response.Data1[6].Centro;
                        //Estado7 = parseFloat(Estado7).toFixed(3);
                        //Centro7 = parseFloat(Centro7).toFixed(3);
                        Estado7 = (Math.floor(Estado7 * 100) / 100).toFixed(2);
                        Centro7 = (Math.floor(Centro7 * 100) / 100).toFixed(2);
                        Estado7 = Estado7 * 100;
                        Centro7 = Centro7 * 100;
                        Estado7 = parseInt(Estado7);
                        Centro7 = parseInt(Centro7);


                        Estado8 = response.Data1[7].Estado;
                        Centro8 = response.Data1[7].Centro;
                        //Estado8 = parseFloat(Estado8).toFixed(3);
                        //Centro8 = parseFloat(Centro8).toFixed(3);
                        Estado8 = (Math.floor(Estado8 * 100) / 100).toFixed(2);
                        Centro8 = (Math.floor(Centro8 * 100) / 100).toFixed(2);
                        Estado8 = Estado8 * 100;
                        Centro8 = Centro8 * 100;
                        Estado8 = parseInt(Estado8);
                        Centro8 = parseInt(Centro8);

                        Estado9 = response.Data1[8].Estado;
                        Centro9 = response.Data1[8].Centro;
                        //Estado9 = parseFloat(Estado9).toFixed(3);
                        //Centro9 = parseFloat(Centro9).toFixed(3);
                        Estado9 = (Math.floor(Estado9 * 100) / 100).toFixed(2);
                        Centro9 = (Math.floor(Centro9 * 100) / 100).toFixed(2);
                        Estado9 = Estado9 * 100;
                        Centro9 = Centro9 * 100;
                        Estado9 = parseInt(Estado9);
                        Centro9 = parseInt(Centro9);


                        Estado10 = response.Data1[9].Estado;
                        Centro10 = response.Data1[9].Centro;
                        //Estado10 = parseFloat(Estado10).toFixed(3);
                        //Centro10 = parseFloat(Centro10).toFixed(3);
                        Estado10 = (Math.floor(Estado10 * 100) / 100).toFixed(2);
                        Centro10 = (Math.floor(Centro10 * 100) / 100).toFixed(2);
                        Estado10 = Estado10 * 100;
                        Centro10 = Centro10 * 100;
                        Estado10 = parseInt(Estado10);
                        Centro10 = parseInt(Centro10);



                    }
                });


                var ValorEstado = $("#Entidad1_input").text();
                var ValorComparativo = "";

                if ($("#5").attr('class') != "btn btn-orange btn-block active")
                    ValorComparativo = $("#CPenitenciario2_input").text();
                else
                    ValorComparativo = $("#Entidad2_input").text();



                $("#VulValidador").attr('style', 'display:none;');


                if ($('#Comparativoflag').html() == "0") {
                    Centro1 = 0;
                    Centro2 = 0;
                    Centro3 = 0;
                    Centro4 = 0;
                    Centro5 = 0;
                    Centro6 = 0;
                    Centro7 = 0;
                    Centro8 = 0;
                    Centro9 = 0;
                    Centro10 = 0;
                }


                if ((isNaN(Estado1) || Estado1 == 0) && (isNaN(Estado2) || Estado2 == 0) && (isNaN(Estado3) || Estado3 == 0) && (isNaN(Estado4) || Estado4 == 0) && (isNaN(Estado5) || Estado5 == 0) && (isNaN(Estado6) || Estado6 == 0) && (isNaN(Estado7) || Estado7 == 0) && (isNaN(Estado8) || Estado8 == 0) && (isNaN(Estado9) || Estado9 == 0) && (isNaN(Estado10) || Estado11 == 0) && (isNaN(Centro1) || Centro1 == 0) && (isNaN(Centro2) || Centro2 == 0) && (isNaN(Centro3) || Centro3 == 0) && (isNaN(Centro4) || Centro4 == 0) && (isNaN(Centro5) || Centro5 == 0) && (isNaN(Centro6) || Centro6 == 0) && (isNaN(Centro7) || Centro7 == 0) && (isNaN(Centro8) || Centro8 == 0) && (isNaN(Centro9) || Centro9 == 0) && (isNaN(Centro10) || Centro10 == 0)) {

                    $("#VulValidador").attr('style', 'display:block; padding-top:20px;');
                    $("#textMessageVul").html("No hay ninguna informacion para los filtros seleccionados");

                }
                else {

                    if ((isNaN(Estado1) || Estado1 == 0) && (isNaN(Estado2) || Estado2 == 0) && (isNaN(Estado3) || Estado3 == 0) && (isNaN(Estado4) || Estado4 == 0) && (isNaN(Estado5) || Estado5 == 0) && (isNaN(Estado6) || Estado6 == 0) && (isNaN(Estado7) || Estado7 == 0) && (isNaN(Estado8) || Estado8 == 0) && (isNaN(Estado9) || Estado9 == 0) && (isNaN(Estado10) || Estado10 == 0)) {

                        $("#VulValidador").attr('style', 'display:block; padding-top:20px;');
                        $("#textMessageVul").html("No hay información en " + $("#VulneraEstado").html());

                        if ((isNaN(Centro1) || Centro1 == 0) && (isNaN(Centro2) || Centro2 == 0) && (isNaN(Centro3) || Centro3 == 0) && (isNaN(Centro4) || Centro4 == 0) && (isNaN(Centro5) || Centro5 == 0) && (isNaN(Centro6) || Centro6 == 0) && (isNaN(Centro7) || Centro7 == 0) && (isNaN(Centro8) || Centro8 == 0) && (isNaN(Centro9) || Centro9 == 0) && (isNaN(Centro10) || Centro10 == 0)) {

                            $("#VulValidador").attr('style', 'display:block; padding-top:20px;');
                            $("#textMessageVul").html("No hay información en " + $("#VulneraCentro").html());
                        }

                    }


                    if ((isNaN(Centro1) || Centro1 == 0) && (isNaN(Centro2) || Centro2 == 0) && (isNaN(Centro3) || Centro3 == 0) && (isNaN(Centro4) || Centro4 == 0) && (isNaN(Centro5) || Centro5 == 0) && (isNaN(Centro6) || Centro6 == 0) && (isNaN(Centro7) || Centro7 == 0) && (isNaN(Centro8) || Centro8 == 0) && (isNaN(Centro9) || Centro9 == 0) && (isNaN(Centro10) || Centro10 == 0)) {


                        if ($('#Comparativoflag').html() == "1") {
                            $("#VulValidador").attr('style', 'display:block; padding-top:20px;');
                            $("#textMessageVul").html("No hay información en " + $("#VulneraCentro").html());
                        }





                        if ((isNaN(Estado1) || Estado1 == 0) && (isNaN(Estado2) || Estado2 == 0) && (isNaN(Estado3) || Estado3 == 0) && (isNaN(Estado4) || Estado4 == 0) && (isNaN(Estado5) || Estado5 == 0) && (isNaN(Estado6) || Estado6 == 0) && (isNaN(Estado7) || Estado7 == 0) && (isNaN(Estado8) || Estado8 == 0) && (isNaN(Estado9) || Estado9 == 0) && (isNaN(Estado10) || Estado10 == 0)) {

                            $("#VulValidador").attr('style', 'display:block; padding-top:20px;');
                            $("#textMessageVul").html("No hay información en " + $("#VulneraEstado").html());
                        }

                    }

                }


                // Limpiar gráfica
                var divVul = document.getElementById('divVul');
                divVul.innerHTML = '&nbsp;';
                $('#divVul').append('<canvas id="hChartVulnerabilidad" width="100%" height="100"></canvas>');


                if (isNaN(Estado1))
                    Estado1 = 0;

                if (isNaN(Estado2))
                    Estado2 = 0;

                if (isNaN(Estado3))
                    Estado3 = 0;

                if (isNaN(Estado4))
                    Estado4 = 0;

                if (isNaN(Estado5))
                    Estado5 = 0;

                if (isNaN(Estado6))
                    Estado6 = 0;

                if (isNaN(Estado7))
                    Estado7 = 0;

                if (isNaN(Estado8))
                    Estado8 = 0;

                if (isNaN(Estado9))
                    Estado9 = 0;

                if (isNaN(Estado10))
                    Estado10 = 0;

                if (isNaN(Centro1))
                    Centro1 = 0;

                if (isNaN(Centro2))
                    Centro2 = 0;

                if (isNaN(Centro3))
                    Centro3 = 0;

                if (isNaN(Centro4))
                    Centro4 = 0;

                if (isNaN(Centro5))
                    Centro5 = 0;

                if (isNaN(Centro6))
                    Centro6 = 0;

                if (isNaN(Centro7))
                    Centro7 = 0;

                if (isNaN(Centro8))
                    Centro8 = 0;

                if (isNaN(Centro9))
                    Centro9 = 0;

                if (isNaN(Centro10))
                    Centro10 = 0;


                var ctx = document.getElementById("hChartVulnerabilidad").getContext("2d");



                var data = {
                    //labels: ["Mujeres", "Personas Extranjeras", "Personas con VIH/SIDA", "Personas Indigenas", "Personas con Discapacidad", "Personas LGBTI", "Personas con uso de sustancias psicoactivas", "Mujeres", "Mujeres embarazadas y en periodo de lactancia", "Mujeres con hijos"],
                    labels: ["Mujeres embarazadas y\nen periodo de lactancia", "Mujeres que viven con\nsus hijas e hijos en el\ncentro penitenciario", "Personas adultas mayores", "Personas con discapacidad", "Personas con uso de\nsustancias psicoactivas", "Personas con VIH/SIDA", "Personas extranjeras", "Personas indígenas", "Personas LGBTI"],
                    datasets: [{
                        label: "",
                        backgroundColor: "#232d82",
                        data: [Estado1, Estado2, Estado3, Estado4, Estado5, Estado6, Estado7, Estado8, Estado9, Estado10]
                    },
                    {
                        label: "",
                        backgroundColor: "#fd5300",
                        data: [Centro1, Centro2, Centro3, Centro4, Centro5, Centro6, Centro7, Centro8, Centro9, Centro10]
                    }
                    ]
                };

                ctx.canvas.parentNode.style.height = '650px';
                ctx.canvas.parentNode.style.width = '100%';

                var myBarChart = new Chart(ctx, {
                    type: 'horizontalBar',
                    data: data,
                    options: {
                        legend: {
                            display: false
                        },
                        barValueSpacing: 20,
                        maintainAspectRatio: false,
                        scales: {
                            xAxes: [{
                                ticks: {
                                    min: 0,
                                    max: 100,
                                    stepSize: 50
                                },
                                gridLines: {
                                    lineWidth: 0
                                }
                            }],
                            yAxes: [{
                                // Change here                           
                                barPercentage: 0.6,
                                categoryPercentage: 0.6,
                                gridLines: {
                                    lineWidth: 0
                                },
                                display: false //this will remove all the y-axis grid lines

                            }]
                        }
                    }
                });

                hideWaitingPopup();

            }

            function Responsables(Anio, Entidad, Municipio, Centro, AnioComp, EntidadComp, MunicipioComp, CentroComp) {

                $('#Comparativoflag').html("1");

                var Estado1;
                var Centro1;
                var Estado2;
                var Centro2;
                var Estado3;
                var Centro3;
                var Estado4;
                var Centro4;
                var Estado5;
                var Centro5;
                var Estado6;
                var Centro6;
                var Estado7;
                var Centro7;
                var Estado8;
                var Centro8;
                var Estado9;
                var Centro9;

                var Comparativoflag = $('#Comparativoflag').html();


                $.ajax({
                    type: "POST",
                    /*                url: "Responsables.php?Anio=" + Anio + "&Entidad=" + Entidad + "&Municipio=" + Municipio + "&Centro=" + Centro + "&AnioComp=" + AnioComp + "&EntidadComp=" + EntidadComp + "&MunicipioComp=" + MunicipioComp + "&CentroComp=" + CentroComp + "&Comparativoflag=" + Comparativoflag,*/
                    url: "ASHXFiles/DB.ashx?o=Responsables",
                    contentType: "application/json",
                    dataType: "json",
                    async: false,
                    beforeSend: function () {
                        //displayWaitingPopup();

                    },
                    complete: function () {
                        //hideWaitingPopup();
                    },
                    //data: $(this).serialize(),
                    //async: false,
                    success: function (response) {
                        /*                    var arrayTemas = response.split("|")*/

                        $('#tbResponsables').empty();


                        if (response.Data1.length > 0) {
                            var Jsd = response.Data1;

                            $.each(Jsd, function (index) {

                                switch (Jsd[index].areaID) {
                                    case 1:
                                        $('#tbResponsables').append('<tr style="height: 75px;"><td style="text-align:right;">' + Jsd[index].areaDesc + '</td><td><img height="50px" width="50px" src="img/R_A_C.png" /></td></tr>');
                                        break;
                                    case 2:
                                        $('#tbResponsables').append('<tr style="height: 75px;"><td style="text-align:right;">' + Jsd[index].areaDesc + '</td><td><img height="50px" width="50px" src="img/R_C_C.png" /></td></tr>');
                                        break;
                                    case 3:
                                        $('#tbResponsables').append('<tr style="height: 90px;"><td style="text-align:right;">' + Jsd[index].areaDesc + '</td><td><img height="50px" width="50px" src="img/R_ACP_C.png" /></td></tr>');
                                        break;
                                    case 4:
                                        $('#tbResponsables').append('<tr style="height: 75px;"><td style="text-align:right;">' + Jsd[index].areaDesc + '</td><td><img height="50px" width="50px" src="img/R_AJ_C.png" /></td></tr>');
                                        break;
                                    case 5:
                                        $('#tbResponsables').append('<tr style="height: 85px;"><td style="text-align:right;">' + Jsd[index].areaDesc + '</td><td><img height="50px" width="50px" src="img/R_AM_C.png" /></td></tr>');
                                        break;
                                    case 6:
                                        $('#tbResponsables').append('<tr style="height: 65px;"><td style="text-align:right;">' + Jsd[index].areaDesc + '</td><td><img height="50px" width="50px" src="img/R_T_C.png" /></td></tr>');
                                        break;
                                    case 7:
                                        $('#tbResponsables').append('<tr style="height: 80px;"><td style="text-align:right;">' + Jsd[index].areaDesc + '</td><td><img height="50px" width="50px" src="img/R_RA_C.png" /></td></tr>');
                                        break;
                                    case 8:
                                        $('#tbResponsables').append('<tr style="height: 75px;"><td style="text-align:right;">' + Jsd[index].areaDesc + '</td><td><img height="50px" width="50px" src="img/R_RPP_C.png" /></td></tr>');
                                        break;
                                }


                            });


                        }



                        Estado1 = response.Data1[0].Estado;
                        Centro1 = response.Data1[0].Centro;
                        //Estado1 = parseFloat(Estado1).toFixed(3);
                        //Centro1 = parseFloat(Centro1).toFixed(3);
                        Estado1 = (Math.floor(Estado1 * 100) / 100).toFixed(2);
                        Centro1 = (Math.floor(Centro1 * 100) / 100).toFixed(2);
                        Estado1 = Estado1 * 100;
                        Centro1 = Centro1 * 100;
                        Estado1 = parseInt(Estado1);
                        Centro1 = parseInt(Centro1);



                        Estado2 = response.Data1[1].Estado;
                        Centro2 = response.Data1[1].Centro;
                        //Estado2 = parseFloat(Estado2).toFixed(3);
                        //Centro2 = parseFloat(Centro2).toFixed(3);
                        Estado2 = (Math.floor(Estado2 * 100) / 100).toFixed(2);
                        Centro2 = (Math.floor(Centro2 * 100) / 100).toFixed(2);
                        Estado2 = Estado2 * 100;
                        Centro2 = Centro2 * 100;
                        Estado2 = parseInt(Estado2);
                        Centro2 = parseInt(Centro2);



                        Estado3 = response.Data1[2].Estado;
                        Centro3 = response.Data1[2].Centro;
                        //Estado3 = parseFloat(Estado3).toFixed(3);
                        //Centro3 = parseFloat(Centro3).toFixed(3);
                        Estado3 = (Math.floor(Estado3 * 100) / 100).toFixed(2);
                        Centro3 = (Math.floor(Centro3 * 100) / 100).toFixed(2);
                        Estado3 = Estado3 * 100;
                        Centro3 = Centro3 * 100;
                        Estado3 = parseInt(Estado3);
                        Centro3 = parseInt(Centro3);


                        Estado4 = response.Data1[3].Estado;
                        Centro4 = response.Data1[3].Centro;
                        //Estado4 = parseFloat(Estado4).toFixed(3);
                        //Centro4 = parseFloat(Centro4).toFixed(3);
                        Estado4 = (Math.floor(Estado4 * 100) / 100).toFixed(2);
                        Centro4 = (Math.floor(Centro4 * 100) / 100).toFixed(2);
                        Estado4 = Estado4 * 100;
                        Centro4 = Centro4 * 100;
                        Estado4 = parseInt(Estado4);
                        Centro4 = parseInt(Centro4);


                        Estado5 = response.Data1[4].Estado;
                        Centro5 = response.Data1[4].Centro;
                        //Estado5 = parseFloat(Estado5).toFixed(3);
                        //Centro5 = parseFloat(Centro5).toFixed(3);
                        Estado5 = (Math.floor(Estado5 * 100) / 100).toFixed(2);
                        Centro5 = (Math.floor(Centro5 * 100) / 100).toFixed(2);
                        Estado5 = Estado5 * 100;
                        Centro5 = Centro5 * 100;
                        Estado5 = parseInt(Estado5);
                        Centro5 = parseInt(Centro5);

                        Estado6 = response.Data1[5].Estado;
                        Centro6 = response.Data1[5].Centro;
                        //Estado6 = parseFloat(Estado6).toFixed(3);
                        //Centro6 = parseFloat(Centro6).toFixed(3);
                        Estado6 = (Math.floor(Estado6 * 100) / 100).toFixed(2);
                        Centro6 = (Math.floor(Centro6 * 100) / 100).toFixed(2);
                        Estado6 = Estado6 * 100;
                        Centro6 = Centro6 * 100;
                        Estado6 = parseInt(Estado6);
                        Centro6 = parseInt(Centro6);


                        Estado7 = response.Data1[6].Estado;
                        Centro7 = response.Data1[6].Centro;
                        //Estado7 = parseFloat(Estado7).toFixed(3);
                        //Centro7 = parseFloat(Centro7).toFixed(3);
                        Estado7 = (Math.floor(Estado7 * 100) / 100).toFixed(2);
                        Centro7 = (Math.floor(Centro7 * 100) / 100).toFixed(2);
                        Estado7 = Estado7 * 100;
                        Centro7 = Centro7 * 100;
                        Estado7 = parseInt(Estado7);
                        Centro7 = parseInt(Centro7);


                        Estado8 = response.Data1[7].Estado;
                        Centro8 = response.Data1[7].Centro;
                        //Estado8 = parseFloat(Estado8).toFixed(3);
                        //Centro8 = parseFloat(Centro8).toFixed(3);
                        Estado8 = (Math.floor(Estado8 * 100) / 100).toFixed(2);
                        Centro8 = (Math.floor(Centro8 * 100) / 100).toFixed(2);
                        Estado8 = Estado8 * 100;
                        Centro8 = Centro8 * 100;
                        Estado8 = parseInt(Estado8);
                        Centro8 = parseInt(Centro8);


                        Estado9 = response.Data1[8].Estado;
                        Centro9 = response.Data1[8].Centro;
                        //Estado9 = parseFloat(Estado9).toFixed(3);
                        //Centro9 = parseFloat(Centro9).toFixed(3);
                        Estado9 = (Math.floor(Estado9 * 100) / 100).toFixed(2);
                        Centro9 = (Math.floor(Centro9 * 100) / 100).toFixed(2);
                        Estado9 = Estado9 * 100;
                        Centro9 = Centro9 * 100;
                        Estado9 = parseInt(Estado9);
                        Centro9 = parseInt(Centro9);
                    }
                });


                $("#ResValidador").attr('style', 'display:none;');


                if ($('#Comparativoflag').html() == "0") {

                    Centro1 = 0;
                    Centro2 = 0;
                    Centro3 = 0;
                    Centro4 = 0;
                    Centro5 = 0;
                    Centro6 = 0;
                    Centro7 = 0;
                    Centro8 = 0;
                    Centro9 = 0;
                }

                if ((isNaN(Estado1) || Estado1 == 0) && (isNaN(Estado2) || Estado2 == 0) && (isNaN(Estado3) || Estado3 == 0) && (isNaN(Estado4) || Estado4 == 0) && (isNaN(Estado5) || Estado5 == 0) && (isNaN(Estado6) || Estado6 == 0) && (isNaN(Estado7) || Estado7 == 0) && (isNaN(Estado8) || Estado8 == 0) && (isNaN(Estado9) || Estado9 == 0) && (isNaN(Centro1) || Centro1 == 0) && (isNaN(Centro2) || Centro2 == 0) && (isNaN(Centro3) || Centro3 == 0) && (isNaN(Centro4) || Centro4 == 0) && (isNaN(Centro5) || Centro5 == 0) && (isNaN(Centro6) || Centro6 == 0) && (isNaN(Centro7) || Centro7 == 0) && (isNaN(Centro8) || Centro8 == 0) && (isNaN(Centro9) || Centro9 == 0)) {

                    $("#ResValidador").attr('style', 'display:block; padding-top:20px;');
                    $("#textMessageRes").html("No hay ninguna informacion para los filtros seleccionados");

                }
                else {

                    if ((isNaN(Estado1) || Estado1 == 0) && (isNaN(Estado2) || Estado2 == 0) && (isNaN(Estado3) || Estado3 == 0) && (isNaN(Estado4) || Estado4 == 0) && (isNaN(Estado5) || Estado5 == 0) && (isNaN(Estado6) || Estado6 == 0) && (isNaN(Estado7) || Estado7 == 0) && (isNaN(Estado8) || Estado8 == 0) && (isNaN(Estado9) || Estado9 == 0)) {

                        $("#ResValidador").attr('style', 'display:block; padding-top:20px;');
                        $("#textMessageRes").html("No hay información en " + $("#ResponsableEstado").html());

                        if ((isNaN(Centro1) || Centro1 == 0) && (isNaN(Centro2) || Centro2 == 0) && (isNaN(Centro3) || Centro3 == 0) && (isNaN(Centro4) || Centro4 == 0) && (isNaN(Centro5) || Centro5 == 0) && (isNaN(Centro6) || Centro6 == 0) && (isNaN(Centro7) || Centro7 == 0) && (isNaN(Centro8) || Centro8 == 0) && (isNaN(Centro9) || Centro9 == 0)) {

                            $("#ResValidador").attr('style', 'display:block; padding-top:20px;');
                            $("#textMessageRes").html("No hay información en " + $("#ResponsableCentro").html());
                        }

                    }


                    if ((isNaN(Centro1) || Centro1 == 0) && (isNaN(Centro2) || Centro2 == 0) && (isNaN(Centro3) || Centro3 == 0) && (isNaN(Centro4) || Centro4 == 0) && (isNaN(Centro5) || Centro5 == 0) && (isNaN(Centro6) || Centro6 == 0) && (isNaN(Centro7) || Centro7 == 0) && (isNaN(Centro8) || Centro8 == 0) && (isNaN(Centro9) || Centro9 == 0)) {

                        if ($('#Comparativoflag').html() == "1") {
                            $("#ResValidador").attr('style', 'display:block; padding-top:20px;');
                            $("#textMessageRes").html("No hay información en " + $("#ResponsableCentro").html());
                        }





                        if ((isNaN(Estado1) || Estado1 == 0) && (isNaN(Estado2) || Estado2 == 0) && (isNaN(Estado3) || Estado3 == 0) && (isNaN(Estado4) || Estado4 == 0) && (isNaN(Estado5) || Estado5 == 0) && (isNaN(Estado6) || Estado6 == 0) && (isNaN(Estado7) || Estado7 == 0) && (isNaN(Estado8) || Estado8 == 0) && (isNaN(Estado9) || Estado9 == 0)) {

                            $("#ResValidador").attr('style', 'display:block; padding-top:20px;');
                            $("#textMessageRes").html("No hay información en " + $("#ResponsableEstado").html());
                        }

                    }

                }



                // Limpiar gráfica
                var divRespo = document.getElementById('divRespo');
                divRespo.innerHTML = '&nbsp;';
                $('#divRespo').append('<canvas id="hResponsables" width="100%" height="100"></canvas>');


                if (isNaN(Estado1))
                    Estado1 = 0;

                if (isNaN(Estado2))
                    Estado2 = 0;

                if (isNaN(Estado3))
                    Estado3 = 0;

                if (isNaN(Estado4))
                    Estado4 = 0;

                if (isNaN(Estado5))
                    Estado5 = 0;

                if (isNaN(Estado6))
                    Estado6 = 0;

                if (isNaN(Estado7))
                    Estado7 = 0;

                if (isNaN(Estado8))
                    Estado8 = 0;

                if (isNaN(Centro1))
                    Centro1 = 0;

                if (isNaN(Centro2))
                    Centro2 = 0;

                if (isNaN(Centro3))
                    Centro3 = 0;

                if (isNaN(Centro4))
                    Centro4 = 0;

                if (isNaN(Centro5))
                    Centro5 = 0;

                if (isNaN(Centro6))
                    Centro6 = 0;

                if (isNaN(Centro7))
                    Centro7 = 0;

                if (isNaN(Centro8))
                    Centro8 = 0;


                var ctx = document.getElementById("hResponsables").getContext("2d");


                var ValorEstado = $("#Entidad1_input").text();
                var ValorComparativo = "";

                if ($("#5").attr('class') != "btn btn-orange btn-block active")
                    ValorComparativo = $("#CPenitenciario2_input").text();
                else
                    ValorComparativo = $("#Entidad2_input").text();




                var data = {
                    //labels: ["Área de custodia penitenciaria", "Area técnica", "Area médica", "Área jurídica", "Área Administrativa", "Responsable de protección civil", "Responsable de adicciones", "Mujeres", "Area Central"],
                    labels: ["Área administrativa", "Area central", "Área de custodia\npenitenciaria", "Área jurídica", "Area médica", "Area técnica", "Responsable de\nadicciones", "Responsable de\nprotección civil"],
                    datasets: [{
                        label: "",
                        backgroundColor: "#232d82",
                        data: [Estado1, Estado2, Estado3, Estado4, Estado5, Estado6, Estado7, Estado8]
                    },
                    {
                        label: "",
                        backgroundColor: "#fd5300",
                        data: [Centro1, Centro2, Centro3, Centro4, Centro5, Centro6, Centro7, Centro8]
                    }
                    ]
                };

                ctx.canvas.parentNode.style.height = '650px';
                ctx.canvas.parentNode.style.width = '100%';

                var myBarChart = new Chart(ctx, {
                    type: 'horizontalBar',
                    data: data,
                    options: {
                        legend: {
                            display: false
                        },
                        barValueSpacing: 20,
                        maintainAspectRatio: false,
                        scales: {
                            xAxes: [{
                                ticks: {
                                    min: 0,
                                    max: 100,
                                    stepSize: 50
                                },
                                gridLines: {
                                    lineWidth: 0
                                }
                            }],
                            yAxes: [{
                                // Change here
                                barPercentage: 0.6,
                                categoryPercentage: 0.6,
                                gridLines: {
                                    lineWidth: 0
                                },
                                display: false //this will remove all the y-axis grid lines
                            }]
                        }
                    }
                });


                hideWaitingPopup();

            }


            truncateDecimals = function (number, digits) {
                var multiplier = Math.pow(10, digits),
                    adjustedNum = number * multiplier,
                    truncatedNum = Math[adjustedNum < 0 ? 'ceil' : 'floor'](adjustedNum);

                return truncatedNum / multiplier;
            };

            //function MostrarGraficas(e) {

            //    if (e.id.includes("CPenitenciario")) {


            //        $.ajax({
            //            type: "POST",
            //            url: 'ObtenerMunicipio.php?idCentro=' + $("#" + e.id).val(),
            //            data: $(this).serialize(),
            //            async: false,
            //            success: function (response) {


            //                if (e.id == "CPenitenciario1_input")
            //                    $("#municipioSel").val(response);
            //                else
            //                    $("#municipioSelComp").val(response);



            //            }
            //        });


            //    }


            //    if (e.id.includes("Entidad2_input")) {


            //        $.ajax({
            //            type: "POST",
            //            url: 'FiltrarEstadoTipo3.php?idEntidad=' + $("#" + e.id).val(),
            //            data: $(this).serialize(),
            //            async: false,
            //            success: function (response) {


            //                var jsons = response.split("|");

            //                $("#CPenitenciario2_input").empty();

            //                //if (response.includes("Sin Resultados")) {
            //                var u = new Option("-Seleccionar-", "0");
            //                $(u).html("-Seleccionar-");
            //                $("#CPenitenciario2_input").append(u);
            //                //}



            //                var i;
            //                for (i = 0; i < jsons.length; i++) {

            //                    var obj = JSON.parse(jsons[i]);

            //                    var o = new Option(obj.centroPenDesc, obj.centroPenID);
            //                    $(o).html(obj.centroPenDesc);
            //                    $("#CPenitenciario2_input").append(o);

            //                }


            //            }
            //        });


            //    }




            //    var Anio = $("#Anio1_input").val();
            //    var Entidad = $("#Entidad1_input").val();

            //    if (Entidad == "-Seleccionar-" || Entidad == "0") {
            //        Entidad = "";
            //    }


            //    var Municipio = $("#municipioSel").val();
            //    var Centro = $("#CPenitenciario1_input").val();

            //    if (Centro == "-Seleccionar-" || CentroComp == "0") {
            //        Centro = "";
            //    }

            //    var AnioComp = $("#Anio2_input").val();
            //    var EntidadComp = $("#Entidad2_input").val();

            //    if (EntidadComp == "-Seleccionar-" || EntidadComp == "0") {
            //        EntidadComp = "";
            //    }

            //    var MunicipioComp = $("#municipioSelComp").val();
            //    var CentroComp = $("#CPenitenciario2_input").val();

            //    if (CentroComp == "-Seleccionar-" || CentroComp == "0") {
            //        CentroComp = "";
            //    }




            //    //Anio = 2020;
            //    //Entidad = "";
            //    //Municipio = "";
            //    //Centro = "";
            //    //AnioComp = 2020;
            //    //EntidadComp = "";
            //    //MunicipioComp = "";
            //    //CentroComp = "";

            //    Bloques(Anio, Entidad, Municipio, Centro, AnioComp, EntidadComp, MunicipioComp, CentroComp);
            //    Tema(Anio, Entidad, Municipio, Centro, AnioComp, EntidadComp, MunicipioComp, CentroComp);
            //    //            GraphicsImages();
            //    Vulnerabilidad(Anio, Entidad, Municipio, Centro, AnioComp, EntidadComp, MunicipioComp, CentroComp);
            //    Responsables(Anio, Entidad, Municipio, Centro, AnioComp, EntidadComp, MunicipioComp, CentroComp);



            //}


            window.onload = function () {
                //            var ctx = document.getElementById('chart-area').getContext('2d');
                //            window.myDoughnut = new Chart(ctx, config);
                //            ctx = document.getElementById('chart-area2').getContext('2d');
                //            window.myDoughnut = new Chart(ctx, config2);
                //            ctx = document.getElementById('chart-area3').getContext('2d');
                //            window.myDoughnut = new Chart(ctx, config3);
                var colorNames = Object.keys(window.chartColors);

                var newDataset = {
                    backgroundColor: [],
                    data: [],
                    label: 'New dataset ' + config.data.datasets.length,
                };

                for (var index = 0; index < config.data.labels.length; ++index) {
                    newDataset.data.push(randomScalingFactor());

                    var colorName = colorNames[index % colorNames.length];
                    var newColor = window.chartColors[colorName];
                    newDataset.backgroundColor.push(newColor);
                }

                config.data.datasets.push(newDataset);
                window.myDoughnut.update();
                config2.data.datasets.push(newDataset);
                window.myDoughnut.update();
                config3.data.datasets.push(newDataset);
                window.myDoughnut.update();
            };

            document.getElementById('randomizeData').addEventListener('click', function () {
                config.data.datasets.forEach(function (dataset) {
                    dataset.data = dataset.data.map(function () {
                        return randomScalingFactor();
                    });
                });

                window.myDoughnut.update();
            });

            var colorNames = Object.keys(window.chartColors);
            document.getElementById('addDataset').addEventListener('click', function () {
                var newDataset = {
                    backgroundColor: [],
                    data: [],
                    label: 'New dataset ' + config.data.datasets.length,
                };

                for (var index = 0; index < config.data.labels.length; ++index) {
                    newDataset.data.push(randomScalingFactor());

                    var colorName = colorNames[index % colorNames.length];
                    var newColor = window.chartColors[colorName];
                    newDataset.backgroundColor.push(newColor);
                }

                config.data.datasets.push(newDataset);
                window.myDoughnut.update();
            });

            document.getElementById('addData').addEventListener('click', function () {
                if (config.data.datasets.length > 0) {
                    config.data.labels.push('data #' + config.data.labels.length);

                    var colorName = colorNames[config.data.datasets[0].data.length % colorNames.length];
                    var newColor = window.chartColors[colorName];

                    config.data.datasets.forEach(function (dataset) {
                        dataset.data.push(randomScalingFactor());
                        dataset.backgroundColor.push(newColor);
                    });

                    window.myDoughnut.update();
                }
            });

            document.getElementById('removeDataset').addEventListener('click', function () {
                config.data.datasets.splice(0, 1);
                window.myDoughnut.update();
            });

            document.getElementById('removeData').addEventListener('click', function () {
                config.data.labels.splice(-1, 1); // remove the label first

                config.data.datasets.forEach(function (dataset) {
                    dataset.data.pop();
                    dataset.backgroundColor.pop();
                });

                window.myDoughnut.update();
            });

            document.getElementById('changeCircleSize').addEventListener('click', function () {
                if (window.myDoughnut.options.circumference === Math.PI) {
                    window.myDoughnut.options.circumference = 2 * Math.PI;
                    window.myDoughnut.options.rotation = -Math.PI / 2;
                } else {
                    window.myDoughnut.options.circumference = Math.PI;
                    window.myDoughnut.options.rotation = -Math.PI;
                }

                window.myDoughnut.update();
            });
        </script>


</asp:Content>

