<%@ Page Title="" Language="C#" MasterPageFile="~/DIFMaster.Master" AutoEventWireup="true" CodeBehind="admMenorAdd.aspx.cs" Inherits="vDIFCapullos.admMenorAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headCss" runat="server">
       <link href="css/VIINSOFT/capturaStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headStyle" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    
    <div class="row"> 
            <form id="mainForm" runat="server">
                <div class="col-12 bg-white p-2 ">
                    <h4 class="text-primary w-100 text-left pl-2">ORDEN PARA RECOGER</h4>
                    <h5 class="text-primary w-100 text-left pl-2">Datos del cliente</h5>
                    <div class="row bg-gray-200 rounded m-2 p-3">

                        <div class="col-lg-7 col-12" style="display: flex;">
                            <div class="lblTelFijo">
                                <label class="text-right p-2 font-weight-bold">Tel. fijo</label></div>
                            <div class="txtTelFijo">
                                <input class="form-control disabled text-left" type="text" id="txttelefonofijo" /></div>
                            <div class="lblExt">
                                <label class="text-right p-2 font-weight-bold">Ext.</label></div>
                            <div class="txtExt">
                                <input class="form-control disabled text-left" type="text" id="txtextension" /></div>
                        </div>
                        <div class="col-lg-5 col-12" style="display: flex;">
                            <div class="divLblRight">
                                <label class="text-right p-2 font-weight-bold">Celular</label></div>
                            <div class="divTxtRight">
                                <input class="form-control disabled text-left" type="text" id="txttelefonocel" /></div>
                        </div>
                        <div class="col-lg-7 col-12" style="display: flex;">
                            <div class="divLblLeft">
                                <label class="text-right p-2 font-weight-bold">Nombre</label></div>
                            <div class="divTxtLeft">
                                <input class="form-control disabled text-left" type="text" id="txtnombre" /></div>
                        </div>
                        <div class="col-lg-5 col-12" style="display: flex;">
                            <div class="divLblRight">
                                <label class="text-right p-2 font-weight-bold">Email</label></div>
                            <div class="divTxtRight">
                                <input class="form-control disabled text-left" type="text" id="txtemail" /></div>
                        </div>

                        <div class="col-lg-7 col-12" style="display: flex;">
                            <div class="divLblLeft">
                                <label class="text-right p-2 font-weight-bold">Calle</label></div>
                            <div class="divTxtLeft">
                                <input class="form-control disabled text-left" type="text" id="txtcalle" /></div>

                        </div>
                        <div class="col-lg-5 col-12" style="display: flex;">
                            <div class="divLblRight">
                                <label class="text-right p-2 font-weight-bold">Numero</label></div>
                            <div class="divTxtRight">
                                <input class="form-control disabled text-left" type="text" id="txtnumero" /></div>
                        </div>

                        <div class="col-lg-7 col-12" style="display: flex;">
                            <div class="divLblLeft">
                                <label class="text-right p-2 font-weight-bold">Colonia</label></div>
                            <div class="divTxtLeft">
                                <input class="form-control disabled text-left" type="text" id="txtcolonia" /></div>
                        </div>
                        <div class="col-lg-5 col-12" style="display: flex;">
                            <div class="divLblRight">
                                <label class="text-right p-2 font-weight-bold">Municipio</label></div>
                            <div class="divTxtRight">
                                <input class="form-control disabled text-left" type="text" id="txtmunicipio" /></div>
                        </div>

                        <div class="col-lg-7 col-12" style="display: flex; width: 100%">
                            <div class="lblDepto">
                                <label class="text-right p-2 font-weight-bold">Depto</label></div>
                            <div class="txtDepto">
                                <input class="form-control disabled text-left" type="text" id="txtdepto" /></div>

                            <div class="lblPiso">
                                <label class="text-right p-2 font-weight-bold">Piso</label></div>
                            <div class="txtPiso">
                                <input class="form-control disabled text-left" type="text" id="txtpiso" /></div>

                            <div class="lblDespacho">
                                <label class="text-right p-2 font-weight-bold">Despacho</label></div>
                            <div class="txtDespacho">
                                <input class="form-control disabled text-left" type="text" id="txtdespacho" /></div>
                        </div>

                        <div class="col-lg-5 col-12" style="display: flex;">
                            <div class="divLblRight">
                                <label class="text-right p-2 font-weight-bold">Contacto</label></div>
                            <div class="divTxtRight">
                                <input class="form-control disabled text-left" type="text" id="txtcontacto" /></div>
                        </div>

                        <div class="col-lg-7 col-12" style="display: flex;">
                            <div class="divLblLeft">
                                <label class="text-right p-2 font-weight-bold">Referencia</label></div>
                            <div class="divTxtLeft">
                                <input class="form-control disabled text-left" type="text" id="txtreferencia" /></div>
                        </div>
                        <div class="col-lg-5 col-12" style="display: flex;">
                            <div class="divLblRight">
                                <label class="text-right p-2 font-weight-bold">Zona</label></div>
                            <div class="divTxtRight">
                                <input type="hidden" id="hZona" value="0" />
                                <select onchange="valorZona(this)" id="ddlZona" class="form-control"></select>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
         </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerJs" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="footerScript" runat="server">
    <script>

        $(document).ready(function () {
            $("#TabGraficas").addClass("d-none");
            $("#TabTabuladores").addClass("d-none");

            //muestraMsg(1, "Prueba", 0, 'warningMaster');
        })
        

    </script>
</asp:Content>
