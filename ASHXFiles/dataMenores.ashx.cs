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
    /// Descripción breve de dataMenores
    /// </summary>
    public class dataMenores:  IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        Sitio sitio = new Sitio();
        blMenores blM  ;
        public void ProcessRequest(HttpContext context)
        {

            context.Response.ContentType = "text/plain";
            String O = context.Request.QueryString["o"].ToString();
            String Resp = "{\"Error\":\"0\"}";

            sitio.Conexion = System.Configuration.ConfigurationManager.ConnectionStrings["xStrConn"].ToString();
            blM = new blMenores(ref sitio);

            switch (O)
            {
                case "obtenerMenorDetalle":
                    try
                    { 
                        String vMenorID = context.Request["menorID"].ToString();
                        //DataTable dt = blM.getMenorInfo(vMenorID);
                        //Resp = getJsonName(null, dt, true); 
                        Resp = blM.getMenorInfo(vMenorID);
                    }
                    catch (Exception ex)
                    { Resp = "{\"Error\":\"1\",\"Msg\":\"" + ex.Message + "\" }"; }
                    break;
            }
            context.Response.Write(Resp);


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