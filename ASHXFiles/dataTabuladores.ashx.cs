using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Entity;
using Business;


namespace vDIFCapullos.ASHXFiles 
{
    /// <summary>
    /// Descripción breve de dataTabuladores
    /// </summary>
    public class dataTabuladores : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        Sitio sitio = new Sitio();
        blTabuladores blT;

        public void ProcessRequest(HttpContext context)
        {
        context.Response.ContentType = "text/plain";
        String O = context.Request.QueryString["o"].ToString();
        String Resp = "{\"Error\":\"0\"}";

        sitio.Conexion = System.Configuration.ConfigurationManager.ConnectionStrings["xStrConn"].ToString();
        blT = new blTabuladores(ref sitio);

        switch (O)
        {
                case "obtenerIngresosPorConceptos":
                    try
                    {
                        filtros.ComparativaFiltros repParams = new filtros.ComparativaFiltros();
                        filtros.ComparativaFiltros repParams_C = new filtros.ComparativaFiltros();
                        repParams = getFiltros( context, 0);
                        repParams_C = getFiltros(context, 1);

                        //String vAnio = context.Request["menorID"].ToString();
                        //String vMes = context.Request["menorID"].ToString();
                        //String vProgr = context.Request["menorID"].ToString();
                        //String vSexo = context.Request["menorID"].ToString();

                        //String vAnio_C = context.Request["menorID"].ToString();
                        //String vMes_C = context.Request["menorID"].ToString();
                        //String vProgr_C = context.Request["menorID"].ToString();
                        //String vSexo_C = context.Request["menorID"].ToString();
                        Resp = blT.obtenerIngresosPorConceptos(repParams , repParams_C); //vAnio, vMes, vProgr, vSexo, vAnio_C, vMes_C, vProgr_C, vSexo_C);
                    }
                    catch (Exception ex)
                    { Resp = "{\"Error\":\"1\",\"Msg\":\"" + ex.Message + "\" }"; }
                    break;

                case "obtenerInternosXPoblacionTipo":
                    try
                    {
                        filtros.ComparativaFiltros repParams = new filtros.ComparativaFiltros();
                        filtros.ComparativaFiltros repParams_C = new filtros.ComparativaFiltros();
                        repParams = getFiltros(context, 0);
                        repParams_C = getFiltros(context, 1); 
                        Resp = blT.obtenerDataTableInfo(repParams, repParams_C , "spConMenorXPoblacionTipoCOMP"); //vAnio, vMes, vProgr, vSexo, vAnio_C, vMes_C, vProgr_C, vSexo_C);
                    }
                    catch (Exception ex)
                    { Resp = "{\"Error\":\"1\",\"Msg\":\"" + ex.Message + "\" }"; }
                    break;
                case "obtenerConsultasXUnidad":
                    try
                    {
                        filtros.ComparativaFiltros repParams = new filtros.ComparativaFiltros();
                        filtros.ComparativaFiltros repParams_C = new filtros.ComparativaFiltros();
                        repParams = getFiltros(context, 0);
                        repParams_C = getFiltros(context, 1);
                        Resp = blT.obtenerDataTableInfo(repParams, repParams_C, "spConConsultasXUnidadComp"); //vAnio, vMes, vProgr, vSexo, vAnio_C, vMes_C, vProgr_C, vSexo_C);
                    }
                    catch (Exception ex)
                    { Resp = "{\"Error\":\"1\",\"Msg\":\"" + ex.Message + "\" }"; }
                    break;
                case "obtenerConsultaXUnidadArea":
                    try
                    {
                        filtros.ComparativaFiltros repParams = new filtros.ComparativaFiltros();
                        filtros.ComparativaFiltros repParams_C = new filtros.ComparativaFiltros();
                        repParams = getFiltros(context, 0);
                        repParams_C = getFiltros(context, 1);
                        string extraParam = context.Request.Params["Flt_Extra1"];
                        string extraParamName = "pUnidad";
                        Resp = blT.obtenerDataTableInfo2(repParams, repParams_C, "spConConsultasXUnidadAreaComp", extraParam, extraParamName); //vAnio, vMes, vProgr, vSexo, vAnio_C, vMes_C, vProgr_C, vSexo_C);
                    }
                    catch (Exception ex)
                    { Resp = "{\"Error\":\"1\",\"Msg\":\"" + ex.Message + "\" }"; }
                    break;
                case "obtenerEgresosXTipo":
                    try
                    {
                        filtros.ComparativaFiltros repParams = new filtros.ComparativaFiltros();
                        filtros.ComparativaFiltros repParams_C = new filtros.ComparativaFiltros();
                        repParams = getFiltros(context, 0);
                        repParams_C = getFiltros(context, 1);
                        string extraParam = context.Request.Params["Flt_Extra1"];
                        string extraParamName = "pTipo";
                        Resp = blT.obtenerDataTableInfo2(repParams, repParams_C, "spConEgresosXTipoCOMP", extraParam, extraParamName); //vAnio, vMes, vProgr, vSexo, vAnio_C, vMes_C, vProgr_C, vSexo_C);
                    }
                    catch (Exception ex)
                    { Resp = "{\"Error\":\"1\",\"Msg\":\"" + ex.Message + "\" }"; }
                    break;
                    
               
            }

            


        context.Response.Write(Resp);

    }

    private filtros.ComparativaFiltros getFiltros(HttpContext context , int esComp=0)
    {
        filtros.ComparativaFiltros repParams = new filtros.ComparativaFiltros();
        int Filt = 0;
        while (Filt < context.Request.Params.Count)
        {
            if (context.Request.Params.GetKey(Filt).Contains("Flt_"))
            {
                String Filtr_ID = context.Request.Params.GetKey(Filt).Replace("Flt_", "");
                String Filtr_Val = context.Request.Params[Filt].ToString();  
                if(Filtr_ID == (esComp == 0 ? "anio" : "anio2"))
                    repParams.anio =   Filtr_Val ;
                if(Filtr_ID == (esComp == 0 ? "mes" : "mes2"))
                    repParams.mes =   Filtr_Val ;
                if(Filtr_ID == (esComp == 0 ? "progr" : "progr2"))
                    repParams.programa =   Filtr_Val  ;
                if (Filtr_ID == (esComp == 0 ? "sexo" : "sexo2"))
                    repParams.sexo =  Filtr_Val  ; 
            }
            Filt++;
        }
        return repParams;
    }

    public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}