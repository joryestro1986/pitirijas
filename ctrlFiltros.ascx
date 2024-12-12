<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctrlFiltros.ascx.cs" Inherits="vDIFCapullos.ctrlFiltros" %>
 
 <div id="refVal" style="display:none">1</div> <%--en la funcion ActivaColor , este valor cambia--%>
 <div id="compVal" style="display:none">4</div>

<div id="FiltrosDIF">
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
                    <div class="col-12 col-sm-2 no-padding">
                        <button id="3" class="btn btn-gray btn-block" onclick="ActivaColor(this);" data-active="0">SEXO</button>
                    </div>
                </div>
                <div id="Filtros1" class="row" style="padding-top:20px;">
                    <div class="col-12 col-sm-2 offset-sm-1">
                        <div style="display:flex;">
                        <select id="Anio1_input" class="form-control">
                        </select>
                         <select onchange="FiltrarEntidad(this);" id="Entidad1_input" class="form-control">
                            <option value="0">-Mes-</option>
                        </select>
                        </div>
                    </div>
                    <div id="ShowHideE" class="col-12 col-sm-2" style="visibility:hidden">
                         <select id="CPenitenciario1_input" class="form-control">
                            <option value="0">-Programa-</option>
                        </select>
                    </div>
                    <div id="ShowHideCP" class="col-12 col-sm-2" style="visibility:hidden">
                         <select id="Sexo1_input" class="form-control">
                            <option value="0">-Sexo-</option>
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
                    <div class="col-12 col-sm-2 no-padding">
                        <button id="6" class="btn btn-orange btn-block" onclick="ActivaColor(this);" data-active="0" style="display:none">SEXO</button>
                    </div>
                </div>
                <div id="Filtros2" class="row" style="padding-top:20px; display:none;">
                    <div class="col-12 col-sm-2 offset-sm-1">
                        <div style="display:flex;">
                         <select id="Anio2_input" class="form-control">
                        </select>
                         <select onchange="FiltrarEntidad2(this);" id="Entidad2_input" class="form-control">
                            <option value="0">-Mes-</option>
                        </select>
                        </div>

                    </div>
                    <div id="ShowHideEComp" class="col-12 col-sm-2" style="visibility: hidden">
                         <select onchange="ObtenerMunicipioComp(this)" id="CPenitenciario2_input" class="form-control">
                            <option value="0">-Programa-</option>
                        </select>
                    </div>
                    <div id="ShowHideCPComp" class="col-12 col-sm-2" style="visibility: hidden">
                         <select id="Sexo2_input" class="form-control">
                            <option value="0">-Sexo-</option>
                        </select>
                    </div>
                </div>
            </div>