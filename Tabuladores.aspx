<%@ Page Language="C#" MasterPageFile="~/DIFMaster.Master" AutoEventWireup="true" CodeBehind="Tabuladores.aspx.cs" Inherits="vDIFCapullos.Tabuladores" MaintainScrollPositionOnPostback="true" %>

<%@ Register Src="~/ctrlFiltros.ascx" TagPrefix="uc1" TagName="ctrlFiltros" %>
 
<asp:Content ID="Content2" ContentPlaceHolderID="headCss" runat="Server">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="font-awesome/css/all.css" rel="stylesheet" />
    <link href="css/animate.css" rel="stylesheet" />
    <link href="css/select2.min.css" rel="stylesheet">
    <link href="css/select2-bootstrap4.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet" /> 
<%--    <link href="css/plugins/dataTables/datatablesMC.min.css" rel="stylesheet" />--%> 
<%--    <link href="css/UNODC.css" rel="stylesheet" />--%> 
    <link href="css/datatables.min.css" rel="stylesheet" />
    <%--<link href="css/plugins/dataTables/datatables.min.css" rel="stylesheet" />--%>
    <%--RESPONSIVE DATATABLE
    <link href="css/plugins/dataTables/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="css/plugins/dataTables/fixedHeader.bootstrap.min.css" rel="stylesheet" />
    <link href="css/plugins/dataTables/responsive.bootstrap.min.css" rel="stylesheet" />
    --%> 
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="headStyle" runat="Server">
        <style>
            .table-striped tbody tr:nth-of-type(odd) {
                background-color: #faeaf1;
            }

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


 <%--   <div id="wrapper">  
        <div id="page-wrapper" class="gray-bg dashbard-1"> --%>
    <div class="col-lg-12">
        <div class="cardContent mb-4">
        <div class="card-body text-center">
        <uc1:ctrlFiltros runat="server" id="ctrlFiltros" />

          <%--  <div id="FiltrosDIF">
                            <div class="row" style="padding-top:20px;">
                <div class="col-12 col-sm-2 offset-sm-1">
                    <h3><b>REFERENCIA</b></h3>
                </div>
                <div class="col-12 col-sm-2 no-padding">
                    <button id="1" class="btn btn-gray btn-block active" onclick="ActivaColor(this);" data-active="0">GLOBAL</button>
                </div>
                <div class="col-12 col-sm-2 no-padding">
                    <button id="2" class="btn btn-gray btn-block" onclick="ActivaColor(this);" data-active="0">PROGRAMA</button>
                </div>
                <div class="col-12 col-sm-2 no-padding" style="display:none;">
                    <button id="3" class="btn btn-gray btn-block" onclick="ActivaColor(this);" data-active="0">CENTRO PENITENCIARIO</button>
                </div>
            </div>
            <div id="Filtros1" class="row" style="padding-top:20px;">
                <div class="col-12 col-sm-2 offset-sm-1">
                    <select id="Anio1_input" class="form-control">
                    </select>
                </div>
                <div id="ShowHideE" class="col-12 col-sm-2" >
                    <select onchange="FiltrarEntidad(this);" id="Entidad1_input" class="form-control">
                        <option value="0">-Mes-</option>
                    </select>
                </div>
                <div id="ShowHideCP" class="col-12 col-sm-4" style="visibility:hidden">
                    <select id="CPenitenciario1_input" class="form-control">
                        <option value="0">-Programa-</option>
                    </select>
                </div>
            </div>
            <div class="row" style="padding-top:20px;">
                <div class="col-12 col-sm-2 offset-sm-1 no-padding">
                    <button id="BtnActiva" class="btn btn-link" style="color:#676a6c; font-size:15px;" onclick="ActivaBtn();" data-active="0"><i class="fa fa-plus"></i><span class="bolder"> COMPARATIVO</span></button>
                </div>
                <div class="col-12 col-sm-2 no-padding">
                    <button id="4" class="btn btn-orange btn-block active" onclick="ActivaColor(this);" data-active="0" style="display:none">GLOBAL</button>
                </div>
                <div class="col-12 col-sm-2 no-padding">
                    <button id="5" class="btn btn-orange btn-block" onclick="ActivaColor(this);" data-active="0" style="display:none">PROGRAMA</button>
                </div>
                <div class="col-12 col-sm-2 no-padding" style="display:none;">
                    <button id="6" class="btn btn-orange btn-block" onclick="ActivaColor(this);" data-active="0" style="display:none">CENTRO PENITENCIARIO</button>
                </div>
            </div>
            <div id="Filtros2" class="row" style="padding-top:20px; display:none;">
                <div class="col-12 col-sm-2 offset-sm-1">
                    <select id="Anio2_input" class="form-control">
                    </select>
                </div>
                <div id="ShowHideEComp" class="col-12 col-sm-2">
                    <select onchange="FiltrarEntidad2(this);" id="Entidad2_input" class="form-control">
                        <option value="0">-Mes-</option>
                    </select>
                </div>
                <div id="ShowHideCPComp" class="col-12 col-sm-4" style="visibility: hidden">
                    <select onchange="ObtenerMunicipioComp(this)" id="CPenitenciario2_input" class="form-control">
                        <option value="0">-Programa-</option>
                    </select>
                </div>
            </div>
            </div>--%>

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
            
        </div>
            <div class="row no-padding" style="padding-top:20px !important;">
                <div class="col-sm-10 offset-sm-1">
                    <div class="ibox collapsed" >
                        <div class="ibox-title collapse-link border-bottom" onclick="drawTable('reporteDIFIngresos', 'obtenerIngresosPorConceptos', 'IngresosDataTable');">
                            <h5>INGRESOS</h5>
                            
                            <div  class="ibox-tools">
                          <%--  <div onclick="MostrarXTipoIngreso()" class="ibox-tools">--%>

                                <div style="display:inline-flex"> 
                                    <a >
                                        <i id="collapseXTema" class="fa fa-chevron-up"></i>
                                    </a>
                                    <div id="refTema" style="display:none;">
                                        <i class="fas fa-sync-alt" style="color: #c4c4c4; font-size: 11px; padding-left: 5px; cursor:pointer"></i>
                                    </div>  
                                </div> 
                            </div> 

                        </div>
                        <div class="ibox-content">
                             <div class="table-responsive">
                              <table id="IngresosDataTable"
                                    class="table table-striped table-bordered table-hover dataTables-example"
                                    style="width:100% !important;"> 
                                    <%--<thead>
                                        <tr>
                                           <th style="width:140px;">Id</th> 
                                            <th>Usuario</th>
                                            <th>Tipo Usuario</th>
                                            <th>Estado</th>
                                            <th>Ultima Actividad</th>
                                        </tr>
                                    </thead>--%>
                                </table>
                            </div>
                        </div>
                            <div class="row d-none">  
                                <div class="col-12 col-sm-12" style="margin-bottom: -20px;">
                                    <div id="BarChartContent" style="text-align:center !important;">
                                        <canvas id="myChartBar"></canvas>
                                    </div>
                                </div>
                                 
                                <div id="TemaEstadoDivLeft">
                                </div>

                                <div id="TemaEstadoDiv" style="display:none !important;">
                                    <div style="text-align: center; color: #232d82;padding-top: 50px;font-size: 20px;width: 100%">
                                        <i class="fa fa-square" style="padding-right:10px; font-size:30px;"></i>
                                        <span id="TemaEstado"></span>
                                    </div>
                                </div>

                                <div id="TemaCentroDiv">
                                    <div style="text-align: center;color: #fd5300;padding-top: 50px;font-size: 20px;width: 100%; visibility:hidden;">
                                        <i class="fa fa-square" style="padding-right:10px; font-size:30px;"></i>
                                        <span id="TemaCentro"></span>
                                    </div>
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
            <div class="row no-padding">
                <div class="col-sm-10 offset-sm-1">
                    <div class="ibox collapsed">
                        <div class="ibox-title collapse-link border-bottom" onclick="drawTable('reporteDIFInternos', 'obtenerInternosXPoblacionTipo', 'InternosDataTable');">
                            <h5>INTERNOS</h5>

                            <div  class="ibox-tools">

                                <div style="display:inline-flex">

                                    <a  >
                                        <i id="collapseXPresupuestos" class="fa fa-chevron-up"></i>
                                    </a>
                                    <div id="refPresupuestos" style="display:none;"><i class="fas fa-sync-alt" style="color: #c4c4c4; font-size: 11px; padding-left: 5px; cursor:pointer"></i></div>

                                </div>

                            </div>


                        </div>
                        <div class="ibox-content">
                            <div class="table-responsive">
                              <table id="InternosDataTable"
                                    class="table table-striped table-bordered table-hover dataTables-example"
                                    style="width:100% !important;">  
                                </table>
                            </div>
                            <div class="row d-none">
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
                                    <div style="text-align: center;color: #fd5300;padding-top: 50px;font-size: 20px;width: 100%"><i class="fa fa-square" style="padding-right:10px; font-size:30px;"></i><span id="TemaCentro">Centro de reinsercion femenil Santa Martha</span></div>
                                </div>

                                <div id="PresupuestosCentroDivRight" style="display:none;">
                                </div>

                                <div class="col-12" style="display:none;">

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
            <div class="row no-padding">
                <div class="col-sm-10 offset-sm-1">
                    <div class="ibox collapsed">
                        <div class="ibox-title collapse-link border-bottom" onclick="drawTable('reporteDIFConsultas', 'obtenerConsultasXUnidad', 'ConsultasDataTable');drawTable2('reporteDIFArea', 'obtenerConsultaXUnidadArea', 'ConsultaAreaDataTable',3);">
                            <h5>CONSULTAS</h5>

                            <div  class="ibox-tools">

                                <div style="display:inline-flex">

                                    <a  >
                                        <i id="collapseXConsulta" class="fa fa-chevron-up"></i>
                                    </a>
                                    <div id="refPob" style="display:none;"><i class="fas fa-sync-alt" style="color: #c4c4c4; font-size: 11px; padding-left: 5px; cursor:pointer"></i></div>

                                </div>

                            </div>


                        </div>
                        <div class="ibox-content">
                             <div class="table-responsive">
                              <table id="ConsultasDataTable"
                                    class="table table-striped table-bordered table-hover dataTables-example"
                                    style="width:100% !important;">  
                                </table>
                            </div>
                             <div   class="row" style="padding-top:20px;">
                                <div   class="col-12 col-sm-2"  >
                                     <select id="consultaUnidad_input" class="form-control" onchange="drawTable2('reporteDIFArea', 'obtenerConsultaXUnidadArea', 'ConsultaAreaDataTable',3);"> </select>
                                </div>
                            </div>
                            <div class="table-responsive">
                              <table id="ConsultaAreaDataTable"
                                    class="table table-striped table-bordered table-hover dataTables-example"
                                    style="width:100% !important;">  
                                </table>
                            </div>

                            <div class="row d-none">
                                <div class="col-12 col-sm-12" style="margin-bottom: -20px;">
                                    <div id="ConsultaContent" style="text-align:center !important;">
                                    </div>
                                </div>


                                <div id="ConsultaEstadoDivLeft">
                                </div>

                                <div id="ConsultaEstadoDiv" style="display:none !important;">
                                    <div style="text-align: center; color: #232d82;padding-top: 50px;font-size: 20px;width: 100%"><i class="fa fa-square" style="padding-right:10px; font-size:30px;"></i><span id="TemaEstado">Centro de reinsercion femenil Santa Martha</span></div>
                                </div>

                                <div id="ConsultaCentroDiv">
                                    <div style="text-align: center;color: #fd5300;padding-top: 50px;font-size: 20px;width: 100%; visibility:hidden;"><i class="fa fa-square" style="padding-right:10px; font-size:30px;"></i><span id="TemaCentro">Centro de reinsercion femenil Santa Martha</span></div>
                                </div>

                                <div id="ConsultaCentroDivRight">
                                </div>

                                <div class="col-12">

                                    <div id="ConsultaValidador" style="display:none; padding-top:20px;">
                                        <div class="alert alert-danger" style="width:100%; text-align:center" role="alert">
                                            <span id="textMessageConsulta"></span>
                                        </div>
                                    </div>


                                </div>



                            </div>


                        </div>
                    </div>
                </div>
            </div>
            <div class="row no-padding d-none">
                <div class="col-sm-10 offset-sm-1">
                    <div class="ibox collapsed">
                        <div class="ibox-title">
                            <h5>SERVICIOS MÉDICOS</h5>
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

                                </div>


                                <div class="col-12 col-sm-12" style="margin-bottom: -20px;">
                                    <div id="divVul">
                                        <canvas id="hChartVulnerabilidad" width="100%" height="100"></canvas>
                                    </div>
                                </div>


                                <div id="VulneraEstadoDivLeft" style="display:none;">
                                </div>

                                <div id="VulneraEstadoDiv" style="display:none;">
                                    <div style="text-align: center;color: #232d82;padding-top: 50px;font-size: 20px;width: 100%"><i class="fa fa-square" style="padding-right:10px; font-size:30px;"></i><span id="VulneraEstado">Centro de reinsercion femenil Santa Martha</span></div>
                                </div>

                                <div id="VulneraCentroDiv" style="display:none;">
                                    <div style="text-align: center;color: #fd5300;padding-top: 50px;font-size: 20px;width: 100%"><i class="fa fa-square" style="padding-right:10px; font-size:30px;"></i><span id="VulneraCentro">Centro de reinsercion femenil Santa Martha</span></div>
                                </div>

                                <div id="VulneraCentroDivRight" style="display:none;">
                                </div>


                                <div class="col-12" style="display:none;">

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
            <div class="row no-padding">
                <div class="col-sm-10 offset-sm-1">
                    <div class="ibox collapsed">
                        <div class="ibox-title collapse-link border-bottom" onclick="drawTable2('reporteDIFEgresos', 'obtenerEgresosXTipo', 'EgresosDataTable',2);" >
                            <h5>EGRESOS</h5>
                            <div class="ibox-tools">
                                <div style="display:inline-flex"> 
                                    <a class="">
                                        <i id="collapseXResponsable" class="fa fa-chevron-up"></i>
                                    </a>
                                    <div id="refRes" style="display:none;"><i class="fas fa-sync-alt" style="color: #c4c4c4; font-size: 11px; padding-left: 5px; cursor:pointer"></i></div>

                                </div>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <div   class="row" style="padding-top:20px;">
                                <div   class="col-12 col-sm-2"  >
                                     <select id="TipoEgreso_input" class="form-control" onchange="drawTable2('reporteDIFEgresos', 'obtenerEgresosXTipo', 'EgresosDataTable',2);"> </select>
                                </div>
                            </div>
                            <div class="table-responsive">
                              <table id="EgresosDataTable"
                                    class="table table-striped table-bordered table-hover dataTables-example"
                                    style="width:100% !important;">  
                                </table>
                            </div>
                            <div class="row d-none">

                                <div class="col-12 col-sm-2">

                                </div>


                                <div class="col-12 col-sm-12" style="margin-bottom: -20px;">
                                    <div id="divRespo">
                                        <canvas id="hResponsables" width="100%" height="100"></canvas>
                                    </div>
                                </div>

                                <div id="ResponsableEstadoDivLeft" style="display:none;">
                                </div>

                                <div id="ResponsableEstadoDiv" style="display:none;">
                                    <div style="text-align: center;color: #232d82;padding-top: 50px;font-size: 20px;width: 100%"><i class="fa fa-square" style="padding-right:10px; font-size:30px;"></i><span id="ResponsableEstado">Centro de reinsercion femenil Santa Martha</span></div>
                                </div>

                                <div id="ResponsableCentroDiv" style="display:none;">
                                    <div style="text-align: center;color: #fd5300;padding-top: 50px;font-size: 20px;width: 100%"><i class="fa fa-square" style="padding-right:10px; font-size:30px;"></i><span id="ResponsableCentro">Centro de reinsercion femenil Santa Martha</span></div>
                                </div>

                                <div id="ResponsableCentroDivRight" style="display:none;">
                                </div>

                                <div class="col-12" style="display:none;">

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
                        <iframe id="DetalleGridFrame" width="450" height="450" frameBorder="0">

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
    <script src="js/bootstrap.js"></script>
    <script src="js/popper.min.js"></script> 
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
    <%--RESPONSIVE DATATABLE
        <script src="js/plugins/dataTables/dataTables.fixedHeader.min.js"></script>
    <script src="js/plugins/dataTables/dataTables.responsive.min.js"></script>
    <script src="js/plugins/dataTables/responsive.bootstrap.min.js"></script>
        --%>
    <script src="js/VIINSOFT/filtros.js"></script>

</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="footerScript" runat="Server">

        <script>

            $(document).ready(function () {

                //$("#TabTabuladores").addClass('active');

                /*
                GraphicsImages();
                ObtenerTema();
                ObtenerBloques();
                ObtenerEstandar();
                */

                //$('#consultaUnidad_input').click(function (e) {
                //    e.preventDefault();
                //});
                $("#consultaUnidad_input").change(function () {
                  
                    // Do some javascript
                     return false;
                });

                $("#TipoEgreso_input").select2({ //MES
                    theme: 'bootstrap4', dropdownParent: $('body')
                });

                $("#consultaUnidad_input").select2({ //MES
                    theme: 'bootstrap4', dropdownParent: $('body')
                });

                $.ajax({
                    type: "POST",
                    url: "ASHXFiles/DB.ashx?o=ComboTipoEgresoCustom",
                    contentType: "application/json",
                    dataType: "json",
                    async: false,
                    success: function (response) { 
                        if (response.Data1.length > 0) {
                            var Jsd = response.Data1;

                            $.each(Jsd, function (index) { 
                                var o = new Option(Jsd[index].tipo, Jsd[index].indice);
                                $(o).html(Jsd[index].Mes);
                                $('#TipoEgreso_input').append(o);

                            });
                             
                        }

                    }
                });

                
                $.ajax({
                    type: "POST",
                    url: "ASHXFiles/DB.ashx?o=ComboConsultaUnidad",
                    contentType: "application/json",
                    dataType: "json",
                    async: false,
                    success: function (response) {
                        if (response.Data1.length > 0) {
                            var Jsd = response.Data1;

                            $.each(Jsd, function (index) {
                                var o = new Option(Jsd[index].Consulta_Unidad, Jsd[index].Indice);
                                $(o).html(Jsd[index].Mes);
                                $('#consultaUnidad_input').append(o);

                            });

                        }

                    }
                });

            });

          //#######################################  INDICADORES  ##########################################
            function MostrarXTipoIngreso() {


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

                    /* centro y tema no aplican en DIF
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
                    }*/

                      
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

                    setTimeout(function () {
                        drawTable_TipoIngreso2(Anio, Entidad, Municipio, Centro, AnioComp, EntidadComp, MunicipioComp, CentroComp);
                    }, 1000);


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

                    setTimeout(function () {
                        drawTable_Presupuestos(Anio, Entidad, Municipio, Centro, AnioComp, EntidadComp, MunicipioComp, CentroComp
                        );
                    }, 1000);


                }
                else
                    $("#refPresupuestos").attr("style", "display:none;");


            }

            function MostrarXConsultas() {

                if ($("#collapseXConsulta").attr('class') == "fa fa-chevron-down") {
 

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

                        setTimeout(function () {
                            drawTable_Consultas(Anio, Entidad, Municipio, Centro, AnioComp, EntidadComp, MunicipioComp, CentroComp);
                        }, 1000);

                    })

                }
                else
                    $("#refPob").attr("style", "display:none;");
            }
             
            //#######################################  TABLAS ##########################################
           

            function getFiltros(){
                var objFiltros = [];

                var vAnio2 = "";
                if ($('#Filtros2').is(':visible'))
                    vAnio2 = getCleanVal($("#Anio2_input").val());

                var vMes = getCleanVal($("#Entidad1_input").val());
                //if (vMes == "-Seleccionar-" || vMes == "0" || vMes == undefined) {
                //    vMes = "";
                //}
                var vMes2 = getCleanVal($("#Entidad2_input").val());
                //if (vMes2 == "-Seleccionar-" || vMes2 == "0" || vMes2 == undefined) {
                //    vMes2 = "";
                //}

                var vProgr = getCleanVal($("#CPenitenciario1_input").val());
                //if (vProgr == "-Seleccionar-" || vProgr == "0" || vProgr == undefined) {
                //    vProgr = "";
                //}
                var vProgr2 = getCleanVal($("#CPenitenciario2_input").val());
                //if (vProgr2 == "-Seleccionar-" || vProgr2 == "0" || vProgr2 == undefined) {
                //    vProgr2 = "";
                //}

                var vSexo = getCleanVal($("#Sexo1_input").val());
                //if (vSexo == "-Seleccionar-" || vSexo == "0" || vSexo == undefined) {
                //    vSexo = "";
                //}
                var vSexo2 = getCleanVal($("#Sexo1_input").val()) ;
                //if (vSexo2 == "-Seleccionar-" || vSexo2 == "0" || vSexo2 == undefined) {
                //    vSexo2 = "";
                //}

                objFiltros.push({
                    "anio": $("#Anio1_input").val(),
                    "mes": vMes,
                    "progr": vProgr,
                    "sexo": vSexo,
                    "anio2": vAnio2,
                    "mes2": (vMes2 == "" ? vMes : vMes2),
                    "progr2": vProgr2,
                    "sexo2": vSexo2 
                });
                

                //objFiltros.push({ "anio": $("#Anio1_input").val() });
                //objFiltros.push({ "mes": vMes  });
                //objFiltros.push({ "progr": vProgr  });
                //objFiltros.push({ "sexo": vSexo  });
                //objFiltros.push({ "anio2": vAnio2 });
                //objFiltros.push({ "mes2": vMes2 });
                //objFiltros.push({ "progr2": vProgr2 });
                //objFiltros.push({ "sexo2": vSexo2 });

                return objFiltros;
            }

           function getCleanVal(valor){
                if (valor == "-Seleccionar-" || valor == "0" || valor == undefined) {
                    return  "";
                }
                else
                    return valor;
            }
            var table;
         
            function drawTable(strNombreReporte, strMetodo, strTableName)  {
                displayWaitingPopup();
                var oFilters = getFiltros();
                var mapData;
                $.ajax({
                    url: "ASHXFiles/dataTabuladores.ashx?o=" + strMetodo,
                    type: "GET",
                    contentType: "application/json",
                    dataType: "json",
                    data: {
                        Flt_anio: oFilters[0].anio,
                        Flt_mes: oFilters[0].mes,
                        Flt_progr: oFilters[0].progr,
                        Flt_sexo: oFilters[0].sexo,
                        Flt_anio2: oFilters[0].anio2,
                        Flt_mes2: oFilters[0].mes2,
                        Flt_progr2: oFilters[0].progr2,
                        Flt_sexo2: oFilters[0].sexo2
                    },
                    async: false,
                    success: function (response) {
                        mapData = response;

                    }, // fin success
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        muestraMsg(1, errorThrown, 0, 'warningMaster');
                    }
                }); // fin ajax

                let colNames = [
                    {
                        "title": '',
                        "data": '',
                        "render": function (data, type, full, meta) {
                            return meta.row + 1;
                        }

                    }
                ];
                 
                var cols;
             
                for (var txt in Object.keys(mapData.data[0])) {
                    cols = {
                        "data": txt
                    };
                }

                $.each(mapData.data[0], function (key, val) {
                    let obj = {
                        "title": key,
                        "data": key,
                        "render": function (data, type, full, meta) {
                            return full[key];
                        }
                    }
                    colNames.push(obj);
                });

                var s = screen.width;

                var vBolResponsive;
                if (screen.width > 1280)
                    vBolResponsive = false;
                else
                    vBolResponsive = true;

                
                if (table != undefined )
                  {
                  //table.ajax.reload();
                    if (table.context[0].sTableId != strTableName) {
                        table.destroy();
                    }
                }
                 
                $("#" + strTableName).html(""); 
                
                table =   $("#" + strTableName).DataTable({
                    language: { url: "/Datos/Spanish.json" },
                    data: mapData.data,
                    //columns: cols,
                    columns: colNames,
                    destroy:true,
                    responsive: true, // vBolResponsive
                    "dom": "<'row'<'col-sm-12 col-md-4'i><'col-sm-12 col-md-7'f><'col-sm-12 col-md-1 '<'html5buttons'B>>>" +
                        "<'row'<'col-sm-12  'tr>>" +
                        "<'row'<'col-sm-12 col-md-5'l><'col-sm-12 col-md-7'p>>",
                    "buttons": [
                        { extend: 'copy', text: '<i class="fa fa-copy"></i>', title: strNombreReporte, titleAttr: 'COPY', footer: true, exportOptions: { columns: ':visible' } },
                        { extend: 'csv', text: '<i class="fa fa-file-csv"></i>', title: strNombreReporte, titleAttr: 'CSV', footer: true, exportOptions: { columns: ':visible' } },
                        { extend: 'excel', text: '<i class="fa fa-file-excel"></i>', title: strNombreReporte, titleAttr: 'EXCEL', footer: true, message: 'Titulo', exportOptions: { columns: ':visible' } },
                        {
                            extend: 'pdf', text: '<i class="fa fa-file-pdf"></i>', title: strNombreReporte, titleAttr: 'PDF', footer: true
                            , exportOptions: { columns: ':visible' }, orientation: 'landscape' //,  pageSize: 'LEGAL'
                        },
                        {
                            extend: 'print', text: '<i class="fa fa-print"></i>', titleAttr: 'PRINT', footer: true, exportOptions: { columns: ':visible' },
                            customize: function (win) {
                                $(win.document.body).addClass('white-bg');
                                $(win.document.body).css('font-size', '10px');

                                $(win.document.body).find('table')
                                    .addClass('compact')
                                    .css('font-size', 'inherit');
                            }
                        }
                    ]
                 
                });

                //new $.fn.dataTable.FixedHeader(table);
                 
                hideWaitingPopup();
            }

            function drawTable_TipoIngreso2(Anio, Entidad, Municipio, Centro, AnioComp, EntidadComp, MunicipioComp, CentroComp) {
                /*
                // Poblar tabla
                var barChartContent = document.getElementById('BarChartContent');
                barChartContent.innerHTML = '&nbsp;';

                var sTabla = '<table id="PedidosDataTable" class="table table-striped table-bordered table-hover dataTables-example" >\n';
                sTabla += '<thead>\n';
                sTabla += '<tr>\n';
                // sTabla += '<th>Indice</th>\n';
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
                            //  sTabla += '<td>' + Jsd[index].Indice + '</td>\n' 
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
                    responsive: true,
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
               */

               
                var mapData;
                $.ajax({
                    url: "ASHXFiles/dataTabuladores.ashx?o=obtenerIngresosPorConceptos",
                    type: "GET",
                    contentType: "application/json",
                    dataType: "json",
                    data: {
                        Flt_anio: "2022",
                        Flt_mes: "0",
                        Flt_progr: "0",
                        Flt_sexo: "0",
                        Flt_anio2: "2022",
                        Flt_mes2: "0",
                        Flt_progr2: "0",
                        Flt_sexo2: "0" 
                    },
                    async: false,
                    success: function (response) {
                        mapData = response;

                    }, // fin success
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        muestraMsg(1, errorThrown, 0, 'warningMaster');
                    }
                }); // fin ajax

                let colNames = [
                    {
                        "title": '',
                        "data": '',
                        "render": function (data, type, full, meta) {
                            return meta.row + 1;
                        }

                    }
                ];

                //fetch("ASHXFiles/dataTabuladores.ashx?o=obtenerIngresosPorConceptos", {
                //    method: 'POST', // or 'PUT'
                //    headers: {
                //        'Content-Type': 'application/json',
                //    },
                //    body: JSON.stringify({
                //        Flt_anio: "2022",
                //        Flt_mes: "0",
                //        Flt_progr: "0",
                //        Flt_sexo: "0",
                //        Flt_anio2: "0",
                //        Flt_mes2: "0",
                //        Flt_progr2: "0",
                //        Flt_sexo2: "0" }),
                //    } )
                //    .then(resp => resp.json())
                //    .then((data) => {
                //          mapData = data;//parseData(data); 
                      
                        var cols;
                        //response.rows.forEach(el => {
                        //    cols = {
                        //        "data": el.
                        //    }
                        //});
                        for (var txt in Object.keys(mapData.data[0])) { 
                            cols = {
                                "data": txt
                            };
                        }

                        $.each(mapData.data[0], function (key, val) {
                            let obj = {
                                "title": key, 
                                "data": key,
                                "render": function (data, type, full, meta) {
                                    return full[key];
                                }
                            }
                            colNames.push(obj);
                        });

                        var s = screen.width;

                        var vBolResponsive;
                            if (screen.width > 1280)
                                vBolResponsive = false;
                            else
                                vBolResponsive = true;
                         

                        if(table !=undefined)
                            table.destroy();

                        table = $("#IngresosDataTable").DataTable({
                            language: { url: "/Datos/Spanish.json" },
                            data: mapData.data,
                            //columns: cols,
                            columns: colNames,
                            //[
                            //    //{ data: 'Id' },
                            //    { data: '', tile: '' },
                            //    { data: 'Tipo Usuario', tile: '' },
                            //    { data: 'Estado', tile: '' },
                            //    { data: ' ', title: 'Ultima Actividad' }
                            //],
                            //responsive: {
                            //    details: {
                            //        renderer: function (api, rowIdx, columns) {
                            //            var data = $.map(columns, function (col, i) {
                            //                return col.hidden ?
                            //                    '<tr data-dt-row="' + col.rowIndex + '" data-dt-column="' + col.columnIndex + '">' +
                            //                    '<td class="font-weight-bold">' + col.title + ':' + '</td> ' +
                            //                    '<td>' + col.data + '</td>' +
                            //                    '</tr>' :
                            //                    '';
                            //            }).join('');

                            //            return data ?
                            //                $('<table/>').append(data) :
                            //                false;
                            //        }
                            //    }
                            //}
                            responsive: true // vBolResponsive
                            

                        //new $.fn.dataTable.FixedHeader(table);

                        //if (data.Error == -1) {
                        //    muestraMsg(1, (data.errCustom == 1 ? "Ocurrio un error!" : data.Msg), 1, 'warningMaster');
                        //}
                    //});
                        });

                hideWaitingPopup();

                //$('#PedidosDataTable tbody').on('click', 'tr', function (e) {
                //    //var Name = $(this).find('td:first').text();
                //    //alert(Name);

                //    $('#DIFDetalle').modal('show');
                //    $('#DetalleGridFrame').attr('src', "admMenorView.aspx?menorID=17")
                //});

            }

            function getFiltrosByType(tipo) {
                var oFilters = getFiltros();
                var rFilter;
                if (tipo == 1) {
                    rFilter = {
                        Flt_anio: oFilters[0].anio,
                        Flt_mes: oFilters[0].mes,
                        Flt_progr: oFilters[0].progr,
                        Flt_sexo: oFilters[0].sexo,
                        Flt_anio2: oFilters[0].anio2,
                        Flt_mes2: oFilters[0].mes2,
                        Flt_progr2: oFilters[0].progr2,
                        Flt_sexo2: oFilters[0].sexo2  
                    }
                }
                if (tipo == 2) {
                    rFilter = {
                        Flt_anio: oFilters[0].anio,
                        Flt_mes: oFilters[0].mes,
                        Flt_progr: oFilters[0].progr,
                        Flt_sexo: oFilters[0].sexo,
                        Flt_anio2: oFilters[0].anio2,
                        Flt_mes2: oFilters[0].mes2,
                        Flt_progr2: oFilters[0].progr2,
                        Flt_Extra1: $("#TipoEgreso_input").val()
                    }
                }
                if (tipo == 3) {
                    rFilter = {
                        Flt_anio: oFilters[0].anio,
                        Flt_mes: oFilters[0].mes,
                        Flt_progr: oFilters[0].progr,
                        Flt_sexo: oFilters[0].sexo,
                        Flt_anio2: oFilters[0].anio2,
                        Flt_mes2: oFilters[0].mes2,
                        Flt_progr2: oFilters[0].progr2,
                        Flt_Extra1: $("#consultaUnidad_input").val() == undefined ? 1 : $("#consultaUnidad_input").val()
                    }
                }

                return rFilter;
            }

            var table2;
            function drawTable2(strNombreReporte, strMetodo, strTableName, tipo) {
                displayWaitingPopup();
                var fData = getFiltrosByType(tipo);
                var mapData;
                $.ajax({
                    url: "ASHXFiles/dataTabuladores.ashx?o=" + strMetodo,
                    type: "GET",
                    contentType: "application/json",
                    dataType: "json",
                    data: fData,
                    async: false,
                    success: function (response) {
                        mapData = response;

                    }, // fin success
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        muestraMsg(1, errorThrown, 0, 'warningMaster');
                    }
                }); // fin ajax

                let colNames = [
                    {
                        "title": '',
                        "data": '',
                        "render": function (data, type, full, meta) {
                            return meta.row + 1;
                        }

                    }
                ];

                var cols;

                for (var txt in Object.keys(mapData.data[0])) {
                    cols = {
                        "data": txt
                    };
                }

                $.each(mapData.data[0], function (key, val) {
                    let obj = {
                        "title": key,
                        "data": key,
                        "render": function (data, type, full, meta) {
                            return full[key];
                        }
                    }
                    colNames.push(obj);
                });

                var s = screen.width; 
                var vBolResponsive;
                if (screen.width > 1280)
                    vBolResponsive = false;
                else
                    vBolResponsive = true;

                 
                if (table2 != undefined) {
                    if (table2.context[0].sTableId != strTableName) {
                    //    table2.ajax.reload();
                    //    hideWaitingPopup();
                    //    return;
                    //}
                    //else {
                      
                        table2.destroy();
                    } 
                } 
                $("#" + strTableName).html(""); 

                table2 = $("#" + strTableName).DataTable({
                    language: { url: "/Datos/Spanish.json" },
                    data: mapData.data,
                    //columns: cols,
                    columns: colNames,
                    "pageLength": 25,
                    destroy: true,
                    responsive: true, // vBolResponsive
                    "dom": "<'row'<'col-sm-12 col-md-4'i><'col-sm-12 col-md-7'f><'col-sm-12 col-md-1 '<'html5buttons'B>>>" +
                        "<'row'<'col-sm-12  'tr>>" +
                        "<'row'<'col-sm-12 col-md-5'l><'col-sm-12 col-md-7'p>>",
                    "buttons": [
                        { extend: 'copy', text: '<i class="fa fa-copy"></i>', title: strNombreReporte, titleAttr: 'COPY', footer: true, exportOptions: { columns: ':visible' } },
                        { extend: 'csv', text: '<i class="fa fa-file-csv"></i>', title: strNombreReporte, titleAttr: 'CSV', footer: true, exportOptions: { columns: ':visible' } },
                        { extend: 'excel', text: '<i class="fa fa-file-excel"></i>', title: strNombreReporte, titleAttr: 'EXCEL', footer: true, message: 'Titulo', exportOptions: { columns: ':visible' } },
                        {
                            extend: 'pdf', text: '<i class="fa fa-file-pdf"></i>', title: strNombreReporte, titleAttr: 'PDF', footer: true
                            , exportOptions: { columns: ':visible' }, orientation: 'landscape' //,  pageSize: 'LEGAL'
                        },
                        {
                            extend: 'print', text: '<i class="fa fa-print"></i>', titleAttr: 'PRINT', footer: true, exportOptions: { columns: ':visible' },
                            customize: function (win) {
                                $(win.document.body).addClass('white-bg');
                                $(win.document.body).css('font-size', '10px');

                                $(win.document.body).find('table')
                                    .addClass('compact')
                                    .css('font-size', 'inherit');
                            }
                        }
                    ]

                });
                 
                //new $.fn.dataTable.FixedHeader(table2);

                hideWaitingPopup();
            }

            function drawTable_Presupuestos(Anio, Entidad, Municipio, Centro, AnioComp, EntidadComp, MunicipioComp, CentroComp) {


                // Poblar tabla
                var barChartContent = document.getElementById('BarChartPresupuestos');
                barChartContent.innerHTML = '&nbsp;';

                var sTabla = '<table id="PresupuestosDataTable" class="table table-striped table-bordered table-hover dataTables-example" >\n';
                sTabla += '<thead>\n';
                sTabla += '<tr>\n';
                /*                sTabla += '<th>Indice</th>\n';*/
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
                            /*                            sTabla += '<td>' + Jsd[index].Indice + '</td>\n'*/
                            sTabla += '<td>' + Jsd[index].Nombre + '</td>\n'
                            sTabla += '<td>' + Jsd[index].fechaNac + '</td>\n'
                            sTabla += '<td>' + Jsd[index].Estatus + '</td>\n'
                            sTabla += '</tr>\n';

                        });
                    }
                })

                sTabla += '</table>\n';

                $('#BarChartPresupuestos').append(sTabla);

                $('#PresupuestosDataTable').DataTable({
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

                hideWaitingPopup();

                //$('#PedidosDataTable tbody').on('click', 'tr', function (e) {
                //    //var Name = $(this).find('td:first').text();
                //    //alert(Name);

                //    $('#DIFDetalle').modal('show');
                //    $('#DetalleGridFrame').attr('src', "admMenorView.aspx?menorID=17")
                //});


            }

            function drawTable_Consultas(Anio, Entidad, Municipio, Centro, AnioComp, EntidadComp, MunicipioComp, CentroComp) {

                // Poblar tabla
                var barChartContent = document.getElementById('ConsultaContent');
                barChartContent.innerHTML = '&nbsp;';

                var sTabla = '<table id="ConsultasDataTable" class="table table-striped table-bordered table-hover dataTables-example" >\n';
                sTabla += '<thead>\n';
                sTabla += '<tr>\n';
                /*                sTabla += '<th>Indice</th>\n';*/
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
                            /*                            sTabla += '<td>' + Jsd[index].Indice + '</td>\n'*/
                            sTabla += '<td>' + Jsd[index].Nombre + '</td>\n'
                            sTabla += '<td>' + Jsd[index].fechaNac + '</td>\n'
                            sTabla += '<td>' + Jsd[index].Estatus + '</td>\n'
                            sTabla += '</tr>\n';

                        });
                    }
                })

                sTabla += '</table>\n';

                $('#ConsultaContent').append(sTabla);

                $('#ConsultasDataTable').DataTable({
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

                hideWaitingPopup();

                //$('#PedidosDataTable tbody').on('click', 'tr', function (e) {
                //    //var Name = $(this).find('td:first').text();
                //    //alert(Name);

                //    $('#DIFDetalle').modal('show');
                //    $('#DetalleGridFrame').attr('src', "admMenorView.aspx?menorID=17")
                //});


            }
            
             //#######################################  FUNCIONES ##########################################
            function displayWaitingPopup() { 
                //            var dynHtmlPart1 = '<div id="shade" style="display: none;"></div>';
                //            $('body').append(dynHtmlPart1);
                $("#shade").css('height', $(document).height());
                $("#shade").show();
                //            var dynHtml = '<div id="waitingPopupLoading" style="display: none;" class="shade" ><div style="padding-top: 200px;"><i style="font-size: 50px;color: #6f6a6a;" class="fas fa-spinner fa-pulse"></i></div></div>';
                //            $('body').append(dynHtml);
                $("#waitingPopupLoading").show();
            }

            function hideWaitingPopup() { 
                $("#shade").hide();
                $("#waitingPopupLoading").hide();
            }
              
        </script>


</asp:Content>
