using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;
using Entity;

namespace vDIFCapullos
{
    public partial class Login : System.Web.UI.Page
    {
        Sitio sitio = new Sitio();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitInf();
                EntidadPruebaBL epBL = new EntidadPruebaBL(ref sitio);

                string salida = epBL.test();
            }
        }

        private void InitInf()
        {
            sitio = Sitio();
            Session["Sitio"] = sitio;
        }

        private Sitio Sitio()
        {
            sitio.Conexion = System.Configuration.ConfigurationManager.ConnectionStrings["xStrConn"].ToString();
            //sitio.projectPath = AppDomain.CurrentDomain.BaseDirectory;
            return sitio;
        }
    }
}