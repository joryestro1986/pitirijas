<%@ Page Title="" Language="C#" MasterPageFile="~/DIFMaster.Master" AutoEventWireup="true" CodeBehind="admMenor.aspx.cs" Inherits="vDIFCapullos.admMenor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headCss" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headStyle" runat="server">
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
     
     <%--<div class="footer fixed">
            <div class="row pl-3">
                <div class="col-12">  
                   <button id="btnRegresar" onclick="regresar();"   class="btn btn-primary btn-lg mt-1 pl-1 pr-1 col-lg-2 col-12">
                        <i class="fas fa-arrow-circle-left"></i> <small class="w-100 mt-1">REGRESAR</small> 
                    </button>   
                    <button id="btnNuevo" onclick="nuevoMenor();"   class="btn btn-success btn-lg mt-1 pl-1 pr-1 col-lg-2 col-5">
                        <i class="fas fa-add"></i>  <small class="w-100 mt-1">NUEVO</small>  
                    </button>
            </div> 
        </div>
    </div> --%>

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
