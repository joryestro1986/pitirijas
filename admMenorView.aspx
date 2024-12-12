<%@ Page Title="" Language="C#" MasterPageFile="~/DIFMaster.Master" AutoEventWireup="true" CodeBehind="admMenorView.aspx.cs" Inherits="vDIFCapullos.admMenorView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headCss" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headStyle" runat="server">
     <style> 
        .text-width-100 {
            width:135px
        }
        p {
            margin-top: 0;
            margin-bottom: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="row">
    <div class="col-lg-3">
         <div class="card mb-4" <%--style="height:96%"--%>>
            <div class="card-body text-center">
                <img id="imgFem2" src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava2.webp" alt="avatar" class="rounded-circle img-fluid d-none" style="width: 130px;">
                <img id="imgFem5" src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava5.webp" alt="avatar" class="rounded-circle img-fluid d-none" style="width: 130px;">
                 <img id="imgMas3" src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar" class="rounded-circle img-fluid d-none" style="width: 130px;">
                <h2 class="font-weight-bold mb-2"><label id="lblMenor"></label></h2>
                <p class="text-muted mb-1"><span class="font-weight-bold text-primary  me-1">Programa</span> <label id="lblPrograma"></label></p>
                <%--<p class="text-muted mb-4"><span class="font-weight-bold text-primary  me-1">Procedencia</span> HONDURAS</p>--%>
                <div class="badge-conteiner"> <p id="pGenero" class="badge girls-bg "><label id="lblGenero"></label></p></div>
                <div class="badge-conteiner"> <p id="pEstatus" class="badge green-bg "><label id="lblEstatus"></label></p> </div>
                <button title="hermanos" class="btn btn-default dim btn-lg float-right" type="button"><i class="text-muted  fa-lg fa fa-users"></i></button>
                 <div class="d-flex justify-content-center mb-2">
                    <%--<button type="button" class="btn btn-primary">hermanos</button>--%>
                     
                    <%--<button type="button" class="btn btn-outline-primary ms-1">Message</button>--%>
                </div> 
            </div>
         </div> 
                      <div class="card mb-4">
                        <div class="card-body">
                            <p class="mb-4"><i class="text-pink fa-lg fa fa-stethoscope"></i> <span class="font-weight-bold text-pink  me-1"> EXPEDIENTE MEDICO</span> </p>
                             <hr class="hr-pink">
                          <div class="row">
                            <div class="col-sm-6">
                              <p class="text-primary font-italic mb-0 text-width-100">Discapacidad </p>
                            </div>
                            <div class="col-sm-6">
                              <p class="text-muted mb-0"><i class="text-pink  fa fa-wheelchair"></i> <label id="lblDiscapacidad"></label> </p>
                            </div>
                          </div>
                          <hr> 
             
                        </div>
                    </div>
                 
    </div>
    <div class="col-lg-9">
       <div class="row">
             <div class="col-md-12">
                  <div class="card mb-4">
                    <div class="card-body">
                        <p class="mb-4"><i class="text-pink fa-lg fa fa-address-card"></i><span class="font-weight-bold text-pink  me-1"> DATOS GENERALES</span> </p>
                         <hr class="hr-pink">
                      <div class="row">
                        <div class="col-sm-3">
                          <p class="text-primary font-italic mb-0 text-width-100">Nombre</p> 
                        </div>
                        <div class="col-sm-9">
                          <p class="text-muted mb-0"><label id="lblNombre"></label></p>
                        </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <p class="text-primary font-italic mb-0 text-width-100">CURP</p>
                        </div>
                        <div class="col-sm-9">
                          <p class="text-muted mb-0"><label id="lblCURP"></label></p>
                        </div>
                      </div>
                       <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <p class="text-primary font-italic mb-0 text-width-100">Fecha de Nacimiento</p>
                        </div>
                        <div class="col-sm-9">
                          <p class="text-muted mb-0"><label id="lblFechaNacimiento"></label></p>
                        </div>
                      </div>
                        <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <p class="text-primary font-italic mb-0 text-width-100">Edad</p>
                        </div>
                        <div class="col-sm-9">
                          <p class="text-muted mb-0"><label id="lblEdad"></label></p>
                        </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <p class="text-primary font-italic mb-0 text-width-100">Sexo</p>
                        </div>
                        <div class="col-sm-9">
                          <p class="text-muted mb-0"><label id="lblSexo"></label></p>
                        </div>
                      </div>
                    </div>
                  </div>
             </div>
             <div class="col-md-6"> 
             </div>
        </div>
          <div class="row">
            <div class="col-md-6">
               <div class="h-100 card mb-4">
                    <div class="card-body">
                        <p class="mb-4"><i class="text-pink fa-lg fa fa-map-marker-alt"></i> <span class="font-weight-bold text-pink  me-1"> DOMICILIO ACTUAL</span> </p>
                         <hr class="hr-pink">
                      <div class="row">
                        <div class="col-sm-3">
                          <p class="text-primary font-italic mb-0 text-width-100">Estado</p>
                        </div>
                        <div class="col-sm-9">
                          <p class="text-muted mb-0"><label id="lblEstado"></label></p>
                        </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <p class="text-primary font-italic mb-0 text-width-100">Municipio</p>
                        </div>
                        <div class="col-sm-9">
                          <p class="text-muted mb-0"><label id="lblMpio"></label></p>
                        </div>
                      </div>
                       <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <p class="text-primary font-italic mb-0 text-width-100">calle</p>
                        </div>
                        <div class="col-sm-9">
                          <p class="text-muted mb-0"><label id="lblCalle"></label></p>
                        </div>
                      </div>
                        <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <p class="text-primary font-italic mb-0 text-width-100">Numero</p>
                        </div>
                        <div class="col-sm-9">
                          <p class="text-muted mb-0"><label id="lblNumero"></label></p>
                        </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <p class="text-primary font-italic mb-0 text-width-100">Colonia</p>
                        </div>
                        <div class="col-sm-9">
                          <p class="text-muted mb-0"><label id="lblColonia"></label></p>
                        </div>
                      </div>
             
                    </div>
                </div>
            </div>
            <div class="col-md-6"> 
              <div class="h-100 card mb-4 mb-md-0">
                 <div class="card-body">
                        <p class="mb-4"><i class="text-pink fa-lg fa fa-home"></i><span class="font-weight-bold text-pink  me-1"> ORIGEN</span> </p>
                         <hr class="hr-pink">
                      <div class="row">
                        <div class="col-sm-3">
                          <p class="text-primary font-italic mb-0 text-width-100">Pais</p>
                        </div>
                        <div class="col-sm-9">
                          <p class="text-muted mb-0"><label id="lblPaisOrigen"></label></p>
                        </div>
                      </div>
                      <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <p class="text-primary font-italic mb-0 text-width-100">Pertenencia</p>
                        </div>
                        <div class="col-sm-9">
                          <p class="text-muted mb-0"><label id="lblPertenencia"></label></p>
                        </div>
                      </div>
                       <hr>
                      <div class="row">
                        <div class="col-sm-3">
                          <p class="text-primary font-italic mb-0 text-width-100">Tipo de Migrante</p>
                        </div>
                        <div class="col-sm-9">
                          <p class="text-muted mb-0"><label id="lblMigranteTipo"></label></p>
                        </div>
                      </div>
                        <hr>  
                    </div>

                  

              </div>
            </div>
          </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerJs" runat="server">
    <script src="js/jquery-3.1.1.min.js"></script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="footerScript" runat="server">
    <script>

        $(document).ready(function () {
            $("#TabGraficas").addClass("d-none");
            $("#TabTabuladores").addClass("d-none");
            $("#divTabs").addClass("d-none");

             
            $("#lblMenor").html("CARLA AYALA ALSINA");
            $("#lblPrograma").html("Monarcas");
            $("#lblGenero").html("NIÑAS");
            $("#lblEstatus").html("INTERNADO");

            $("#lblNombre").html("CARLA AYALA ALSINA");
            cargaMenorData();

            //muestraMsg(1, "Prueba", 0, 'warningMaster');
        });

        function cargaMenorData() {

            vMenorID = obtenerQS('menorID');

            $.ajax({
                url: "ashxFiles/dataMenores.ashx?o=obtenerMenorDetalle",
                type: "GET",
                data: {
                    "menorID": vMenorID                     
                },
                contentType: "application/json",
                dataType: "json",
                success: function (response) {
                    if (response.data.length > 0) {
                        rData = response.data[0];

                        $("#lblMenor").html(rData.Nombre);
                        $("#lblPrograma").html(rData.Programa);
                        $("#lblGenero").html(rData.Genero);
                        $("#lblEstatus").html(rData.Estatus);

                        $("#lblNombre").html(rData.Nombre);                        
                        $("#lblCURP").html(rData.CURP);
                        $("#lblFechaNacimiento").html(rData.fechaNac);
                        $("#lblEdad").html(rData.Edad);
                        $("#lblSexo").html(rData.Sexo);

                        $("#lblEstado").html(rData.Estado);
                        $("#lblMpio").html(rData.Mpio);
                        $("#lblCalle").html(rData.Calle);
                        $("#lblNumero").html(rData.Numero);
                        $("#lblColonia").html(rData.Colonia);

                        $("#lblPaisOrigen").html(rData.Pais);
                        $("#lblPertenencia").html(rData.Pertenencia);
                        $("#lblMigranteTipo").html(rData.MigranteTipo);

                        $("#lblDiscapacidad").html(rData.Discapacidad);
                        

                        $("#lblGenero").html(rData.Genero);

                        var strBColor = rData.xtSexo_Sexo == 1 ? 'girls-bg' : 'boys-bg'; 
                        var strBEstatusColor = rData.xtEstatus_Estatus == 1 ? 'bg-muted' :((rData.xtEstatus_Estatus == 2 || rData.xtEstatus_Estatus == 3 )? 'bg-warning' : 'green-bg'); 

                        $("#pGenero").removeClass("girls-bg").removeClass("boys-bg").addClass(strBColor);
                        $("#pEstatus").removeClass().addClass('badge ' + strBEstatusColor);

                        $("#imgFem2").removeClass("d-none").addClass("d-none");
                        $("#imgFem5").removeClass("d-none").addClass("d-none");
                        $("#imgMas3").removeClass("d-none").addClass("d-none");
                        
                        if (rData.xtSexo_Sexo == 1) {
                            if (rData.xrMigrante == 1) {
                                $("#imgFem5").removeClass("d-none");
                            }
                            else { $("#imgFem2").removeClass("d-none"); }
                        }
                        else
                            $("#imgMas3").removeClass("d-none");
                    }

                }, // fin success
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    muestraMsg(1, errorThrown, 0, 'warningMaster');
                }
            }); // fin ajax
        }
        

    </script>
</asp:Content>
