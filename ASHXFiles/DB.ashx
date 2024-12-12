<%@ WebHandler Language="C#" Class="DB" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using Entity;
using Business;
using System.Linq;

public class DB : IHttpHandler, System.Web.SessionState.IRequiresSessionState {

    Sitio sitio = new Sitio();

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        String O = "";
        string Anio1 = "";
        int Entidad1 = 0;
        string Municipio1 = "";
        string Centro1 = "";
        string Anio2 = "";
        int Entidad2 = 0;
        string Municipio2 = "";
        string Centro2 = "";

        try
        {
            O = context.Request["o"];
            //SenderTarget = context.Request["SenderTarget"];
            //idCombo = context.Request["idCombo"];

        }
        catch (Exception ex) { }

        if (O != "")
        {
            String R = "";
            switch (O)
            {
                case "sender":

                    //context.Session.Add("SenderTarget" + idCombo, SenderTarget);


                    break;
                case "Bloques":

                    InitInf();

                    EntidadPruebaBL epBloques = new EntidadPruebaBL(ref sitio);
                    List<Grafica1> g1List = new List<Grafica1>();

                    g1List = epBloques.Graf1();

                    var jsonSerialiserBloques = new JavaScriptSerializer();
                    var jsonBloques = jsonSerialiserBloques.Serialize(g1List);


                    R = "{\"Data1\":" + jsonBloques + "}";


                    break;
                case "Temas":

                    InitInf();

                    Anio1 = context.Request["Anio"];

                    if (string.IsNullOrEmpty(context.Request["Entidad"]))
                        Entidad1 = 0;
                    else
                        Entidad1 = Convert.ToInt32(context.Request["Entidad"]);

                    Municipio1 = context.Request["Municipio"];
                    Centro1 = context.Request["Centro"];
                    Anio2 = context.Request["AnioComp"];

                    if (string.IsNullOrEmpty(context.Request["EntidadComp"]))
                        Entidad2 = 0;
                    else
                        Entidad2 = Convert.ToInt32(context.Request["EntidadComp"]);

                    Municipio2 = context.Request["MunicipioComp"];
                    Centro2 = context.Request["CentroComp"];

                    if (string.IsNullOrEmpty(Anio1))
                    {
                        Anio1 = "0";
                    }

                    if (string.IsNullOrEmpty(Municipio1))
                    {
                        Municipio1 = "0";
                    }

                    if (string.IsNullOrEmpty(Centro1))
                    {
                        Centro1 = "0";
                    }

                    if (string.IsNullOrEmpty(Anio2))
                    {
                        Anio2 = "0";
                    }

                    if (string.IsNullOrEmpty(Municipio2))
                    {
                        Municipio2 = "0";
                    }

                    if (string.IsNullOrEmpty(Centro2))
                    {
                        Centro2 = "0";
                    }

                    EntidadPruebaBL epTemas = new EntidadPruebaBL(ref sitio);
                    List<Grafica2> g2List = new List<Grafica2>();

                    int Comparativoflag = Convert.ToInt32(context.Request["Comparativoflag"]);

                    g2List = epTemas.Graf2(Anio1,Entidad1,Municipio1,Centro1,Anio2,Entidad2,Municipio2,Centro2,Comparativoflag);



                    //g2List = g2List.OrderBy(foo => !foo.Comparativo)
                    //         .ToList();

                    var jsonSerialiserTemas = new JavaScriptSerializer();
                    var jsonTemas = jsonSerialiserTemas.Serialize(g2List);


                    R = "{\"Data1\":" + jsonTemas + "}";

                    break;

                case "MenorXGenero":

                    InitInf();

                    Anio1 = context.Request["Anio"];

                    if (string.IsNullOrEmpty(context.Request["Entidad"]))
                        Entidad1 = 0;
                    else
                        Entidad1 = Convert.ToInt32(context.Request["Entidad"]);

                    Municipio1 = context.Request["Municipio"];
                    Centro1 = context.Request["Centro"];

                    EntidadPruebaBL epPoblacion = new EntidadPruebaBL(ref sitio);
                    List<Grafica3> g3List = new List<Grafica3>();

                    g3List = epPoblacion.Graf3(Anio1, Entidad1, Municipio1, Centro1);

                    var jsonSerialiserPoblacion  = new JavaScriptSerializer();
                    var jsonPoblacion  = jsonSerialiserPoblacion.Serialize(g3List);


                    R = "{\"Data1\":" + jsonPoblacion + "}";


                    break;

                case "Vulnerabilidad":

                    InitInf();

                    Anio1 = context.Request["Anio"];

                    if (string.IsNullOrEmpty(context.Request["Entidad"]))
                        Entidad1 = 0;
                    else
                        Entidad1 = Convert.ToInt32(context.Request["Entidad"]);

                    Municipio1 = context.Request["Municipio"];
                    Centro1 = context.Request["Centro"];
                    Anio2 = context.Request["AnioComp"];

                    if (string.IsNullOrEmpty(context.Request["EntidadComp"]))
                        Entidad2 = 0;
                    else
                        Entidad2 = Convert.ToInt32(context.Request["EntidadComp"]);

                    Municipio2 = context.Request["MunicipioComp"];
                    Centro2 = context.Request["CentroComp"];

                    if (string.IsNullOrEmpty(Anio1))
                    {
                        Anio1 = "0";
                    }

                    if (string.IsNullOrEmpty(Municipio1))
                    {
                        Municipio1 = "0";
                    }

                    if (string.IsNullOrEmpty(Centro1))
                    {
                        Centro1 = "0";
                    }

                    if (string.IsNullOrEmpty(Anio2))
                    {
                        Anio2 = "0";
                    }

                    if (string.IsNullOrEmpty(Municipio2))
                    {
                        Municipio2 = "0";
                    }

                    if (string.IsNullOrEmpty(Centro2))
                    {
                        Centro2 = "0";
                    }

                    EntidadPruebaBL epInternos = new EntidadPruebaBL(ref sitio);
                    List<Grafica4> g4List = new List<Grafica4>();

                    Comparativoflag = Convert.ToInt32(context.Request["Comparativoflag"]);

                    g4List = epInternos.Graf4(Anio1,Entidad1,Municipio1,Centro1,Anio2,Entidad2,Municipio2,Centro2,Comparativoflag);

                    var jsonSerialiserVulnerabilidad  = new JavaScriptSerializer();
                    var jsonVulnerabilidad  = jsonSerialiserVulnerabilidad.Serialize(g4List);


                    R = "{\"Data1\":" + jsonVulnerabilidad + "}";


                    break;
                case "Responsables":

                    InitInf();

                    EntidadPruebaBL epResponsables = new EntidadPruebaBL(ref sitio);
                    List<Grafica5> g5List = new List<Grafica5>();

                    g5List = epResponsables.Graf5();

                    var jsonSerialiserResponsables  = new JavaScriptSerializer();
                    var jsonResponsables  = jsonSerialiserResponsables.Serialize(g5List);


                    R = "{\"Data1\":" + jsonResponsables + "}";


                    break;

                case "ComboAnios":


                    int Anio = DateTime.Now.Year;


                    string sql = "SELECT '" + (Anio + 1) + "' 'Prox','" + (Anio) + "' 'Actual','" + (Anio - 1) + "' 'Ant'";
                    DataTable dt = new DataTable();
                    string CS = ConfigurationManager.ConnectionStrings["xStrConn"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {

                        SqlCommand cmd = new SqlCommand(sql, con);
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        dt.Load(reader);
                        reader.Close();

                    }

                    JavaScriptSerializer jsZona = new JavaScriptSerializer();
                    R ="{\"Data1\":" + jsZona.Serialize(DTJSON(dt)) + "}";


                    break;
                case "datosMapa":


                    sql = "spConDash_MapaDatos";
                    dt = new DataTable();
                    CS = ConfigurationManager.ConnectionStrings["xStrConn"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {

                        SqlCommand cmd = new SqlCommand(sql, con);
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        dt.Load(reader);
                        reader.Close();

                    }

                    jsZona = new JavaScriptSerializer();
                    R ="{\"Data1\":" + jsZona.Serialize(DTJSON(dt)) + "}";


                    break;
              case "datosMapaCAFAM":


                    sql = "spConDash_MapaDatosCAFAM";
                    dt = new DataTable();
                    CS = ConfigurationManager.ConnectionStrings["xStrConn"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {

                        SqlCommand cmd = new SqlCommand(sql, con);
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        dt.Load(reader);
                        reader.Close();

                    }

                    jsZona = new JavaScriptSerializer();
                    R ="{\"Data1\":" + jsZona.Serialize(DTJSON(dt)) + "}";


                    break;


                case "MesAM":


                    CS = ConfigurationManager.ConnectionStrings["xStrConn"].ConnectionString;

                    DataSet ds = new DataSet();
                    String StrConsulta = "spConDash_PorMesAM";
                    SqlCommand MiComando = new SqlCommand(StrConsulta);
                    //MiComando.Parameters.AddWithValue("IdOrden", IdOrden);
                    MiComando.CommandType = CommandType.StoredProcedure;
                    ds = Obtener_DataSet(MiComando);

                    jsZona = new JavaScriptSerializer();
                    R ="{\"Data1\":" + jsZona.Serialize(DTJSON(ds.Tables[0])) + ", \"Data2\":" + jsZona.Serialize(DTJSON(ds.Tables[1])) + "}";


                    break;
              case "MesCAFAM":


                    CS = ConfigurationManager.ConnectionStrings["xStrConn"].ConnectionString;

                    ds = new DataSet();
                    StrConsulta = "spConDash_PorMesCAFAM";
                    MiComando = new SqlCommand(StrConsulta);
                    //MiComando.Parameters.AddWithValue("IdOrden", IdOrden);
                    MiComando.CommandType = CommandType.StoredProcedure;
                    ds = Obtener_DataSet(MiComando);

                    jsZona = new JavaScriptSerializer();
                    R ="{\"Data1\":" + jsZona.Serialize(DTJSON(ds.Tables[0])) + ", \"Data2\":" + jsZona.Serialize(DTJSON(ds.Tables[1])) + "}";


                    break;

                case "MunicipioAM":


                    CS = ConfigurationManager.ConnectionStrings["xStrConn"].ConnectionString;

                    ds = new DataSet();
                    StrConsulta = "spConDash_PorMunicipioAM '"+ context.Request["Mun"] +"'";
                    MiComando = new SqlCommand(StrConsulta);
                    //MiComando.Parameters.AddWithValue("IdOrden", IdOrden);
                    //MiComando.CommandType = CommandType.StoredProcedure;
                    ds = Obtener_DataSet(MiComando);

                    jsZona = new JavaScriptSerializer();
                    R ="{\"Data1\":" + jsZona.Serialize(DTJSON(ds.Tables[0])) + ", \"Data2\":" + jsZona.Serialize(DTJSON(ds.Tables[1])) + "}";


                    break;
               case "EscolaridadMunicipioCAFAM":


                    CS = ConfigurationManager.ConnectionStrings["xStrConn"].ConnectionString;

                    ds = new DataSet();
                    StrConsulta = "spConDash_PorEscolaridadMunicipioCAFAM '"+ context.Request["Mun"] +"'";
                    MiComando = new SqlCommand(StrConsulta);
                    //MiComando.Parameters.AddWithValue("IdOrden", IdOrden);
                    //MiComando.CommandType = CommandType.StoredProcedure;
                    ds = Obtener_DataSet(MiComando);

                    jsZona = new JavaScriptSerializer();
                    R ="{\"Data1\":" + jsZona.Serialize(DTJSON(ds.Tables[0])) + ", \"Data2\":" + jsZona.Serialize(DTJSON(ds.Tables[1])) + "}";


                    break;
                case "PoblacionAM":


                    CS = ConfigurationManager.ConnectionStrings["xStrConn"].ConnectionString;

                    ds = new DataSet();
                    StrConsulta = "spConDash_PorPoblacionAM";
                    MiComando = new SqlCommand(StrConsulta);
                    //MiComando.Parameters.AddWithValue("IdOrden", IdOrden);
                    MiComando.CommandType = CommandType.StoredProcedure;
                    ds = Obtener_DataSet(MiComando);

                    jsZona = new JavaScriptSerializer();
                    R ="{\"Data1\":" + jsZona.Serialize(DTJSON(ds.Tables[0])) + "}";


                    break;
                case "NivelRiesgoCAFAM":


                    CS = ConfigurationManager.ConnectionStrings["xStrConn"].ConnectionString;

                    ds = new DataSet();
                    StrConsulta = "spConDash_PorNivelRiesgoCAFAM";
                    MiComando = new SqlCommand(StrConsulta);
                    //MiComando.Parameters.AddWithValue("IdOrden", IdOrden);
                    MiComando.CommandType = CommandType.StoredProcedure;
                    ds = Obtener_DataSet(MiComando);

                    jsZona = new JavaScriptSerializer();
                    R ="{\"Data1\":" + jsZona.Serialize(DTJSON(ds.Tables[0])) + "}";


                    break;

                case "PoblacionAMDetalle":


                    CS = ConfigurationManager.ConnectionStrings["xStrConn"].ConnectionString;

                    ds = new DataSet();
                    StrConsulta = "spConDash_PorDetallePoblacionAM";
                    MiComando = new SqlCommand(StrConsulta);
                    //MiComando.Parameters.AddWithValue("IdOrden", IdOrden);
                    MiComando.CommandType = CommandType.StoredProcedure;
                    ds = Obtener_DataSet(MiComando);

                    jsZona = new JavaScriptSerializer();
                    R = "{\"Data1\":" + jsZona.Serialize(DTJSON(ds.Tables[0])) + ", \"Data2\":" + jsZona.Serialize(DTJSON(ds.Tables[1])) + ", \"Data3\":" + jsZona.Serialize(DTJSON(ds.Tables[2])) + ", \"Data4\":" + jsZona.Serialize(DTJSON(ds.Tables[3])) + ", \"Data5\":" + jsZona.Serialize(DTJSON(ds.Tables[4])) + "}";



                    break;

                case "TipoIngresoDet":



                    //sql = "sp_ObtenCitas";
                    //sql = "spConMenoresXFiltros 2022 , 0,0,0,2022 , 0,0,0,2 ";
                    sql = "spConMenoresXFiltros 2022 , 0,0";
                    dt = new DataTable();
                    CS = ConfigurationManager.ConnectionStrings["xStrConn"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {

                        SqlCommand cmd = new SqlCommand(sql, con);
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        dt.Load(reader);
                        reader.Close();

                    }

                    jsZona = new JavaScriptSerializer();
                    R ="{\"Data1\":" + jsZona.Serialize(DTJSON(dt)) + "}";


                    break;
                case "ComboMeses":

                    sql = "SELECT Indice,Mes FROM catMes";
                    dt = new DataTable();
                    CS = ConfigurationManager.ConnectionStrings["xStrConn"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {

                        SqlCommand cmd = new SqlCommand(sql, con);
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        dt.Load(reader);
                        reader.Close();

                    }

                    jsZona = new JavaScriptSerializer();
                    R ="{\"Data1\":" + jsZona.Serialize(DTJSON(dt)) + "}";


                    break;
                case "ComboProgramas":

                    sql = "SELECT Indice,Programa FROM catPrograma WHERE xrActivo = 1 ORDER BY Orden";
                    dt = new DataTable();
                    CS = ConfigurationManager.ConnectionStrings["xStrConn"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {

                        SqlCommand cmd = new SqlCommand(sql, con);
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        dt.Load(reader);
                        reader.Close();

                    }

                    jsZona = new JavaScriptSerializer();
                    R ="{\"Data1\":" + jsZona.Serialize(DTJSON(dt)) + "}";


                    break;

                case "ComboTipoEgresoCustom":

                    sql = "exec spConEgresoTipoFiltro";
                    dt = new DataTable();
                    CS = ConfigurationManager.ConnectionStrings["xStrConn"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {

                        SqlCommand cmd = new SqlCommand(sql, con);
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        dt.Load(reader);
                        reader.Close();

                    }

                    jsZona = new JavaScriptSerializer();
                    R ="{\"Data1\":" + jsZona.Serialize(DTJSON(dt)) + "}";

                    break;
                case "ComboConsultaUnidad":

                    sql = "select Indice, Consulta_Unidad  from catConsultaUnidad where xrActivo = 1 Order by Orden";
                    dt = new DataTable();
                    CS = ConfigurationManager.ConnectionStrings["xStrConn"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {

                        SqlCommand cmd = new SqlCommand(sql, con);
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        dt.Load(reader);
                        reader.Close();

                    }

                    jsZona = new JavaScriptSerializer();
                    R ="{\"Data1\":" + jsZona.Serialize(DTJSON(dt)) + "}";

                    break;



                case "Sexo":

                    sql = "SELECT Indice,Sexo FROM catSexo WHERE xrActivo = 1 ORDER BY Orden";
                    dt = new DataTable();
                    CS = ConfigurationManager.ConnectionStrings["xStrConn"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {

                        SqlCommand cmd = new SqlCommand(sql, con);
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        dt.Load(reader);
                        reader.Close();

                    }

                    jsZona = new JavaScriptSerializer();
                    R ="{\"Data1\":" + jsZona.Serialize(DTJSON(dt)) + "}";


                    break;
                case "SexoDash":
                    Anio = DateTime.Now.Year;

                    sql = "spConDash_PorSexo " + Anio;
                    dt = new DataTable();
                    CS = ConfigurationManager.ConnectionStrings["xStrConn"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {

                        SqlCommand cmd = new SqlCommand(sql, con);
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        dt.Load(reader);
                        reader.Close();

                    }

                    jsZona = new JavaScriptSerializer();
                    R ="{\"Data1\":" + jsZona.Serialize(DTJSON(dt)) + "}";

                    break;
                case "SexoDashAM":
                    Anio = DateTime.Now.Year;

                    sql = "spConDash_PorSexoAM";
                    dt = new DataTable();
                    CS = ConfigurationManager.ConnectionStrings["xStrConn"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {

                        SqlCommand cmd = new SqlCommand(sql, con);
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        dt.Load(reader);
                        reader.Close();

                    }

                    jsZona = new JavaScriptSerializer();
                    R ="{\"Data1\":" + jsZona.Serialize(DTJSON(dt)) + "}";

                    break;
                case "SexoDashCAFAM":
                    Anio = DateTime.Now.Year;

                    sql = "spConDash_PorSexoCAFAM";
                    dt = new DataTable();
                    CS = ConfigurationManager.ConnectionStrings["xStrConn"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {

                        SqlCommand cmd = new SqlCommand(sql, con);
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        dt.Load(reader);
                        reader.Close();

                    }

                    jsZona = new JavaScriptSerializer();
                    R ="{\"Data1\":" + jsZona.Serialize(DTJSON(dt)) + "}";

                    break;
                case "MenorPoblacionTipo":
                    Anio = DateTime.Now.Year;

                    sql = "spConMenorXPoblacionTipo " + Anio;
                    dt = new DataTable();
                    CS = ConfigurationManager.ConnectionStrings["xStrConn"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {

                        SqlCommand cmd = new SqlCommand(sql, con);
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        dt.Load(reader);
                        reader.Close();

                    }

                    jsZona = new JavaScriptSerializer();
                    R ="{\"Data1\":" + jsZona.Serialize(DTJSON(dt)) + "}";

                    break;
                case "EducacionDash":
                    Anio = DateTime.Now.Year;

                    sql = "spConDash_ConEducacion " + Anio;
                    dt = new DataTable();
                    CS = ConfigurationManager.ConnectionStrings["xStrConn"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {

                        SqlCommand cmd = new SqlCommand(sql, con);
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        dt.Load(reader);
                        reader.Close();

                    }

                    jsZona = new JavaScriptSerializer();
                    R ="{\"Data1\":" + jsZona.Serialize(DTJSON(dt)) + "}";

                    break;
                case "PsicologicoDash":
                    Anio = DateTime.Now.Year;

                    sql = "spConDash_ConTerapia " + Anio;
                    dt = new DataTable();
                    CS = ConfigurationManager.ConnectionStrings["xStrConn"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {

                        SqlCommand cmd = new SqlCommand(sql, con);
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        dt.Load(reader);
                        reader.Close();

                    }

                    jsZona = new JavaScriptSerializer();
                    R ="{\"Data1\":" + jsZona.Serialize(DTJSON(dt)) + "}";

                    break;
                default:
                    R = "{ Error: 'Operación invalida.' }";
                    break;
            }

            context.Response.Write(R);
        }
        else
        {

            context.Response.Write("{ Error: 'No ha solicitado ninguna operación' }");
        }
    }

    private void InitInf()
    {
        sitio = Sitio();
    }

    SqlConnection SqlConexion;

    public DataSet Obtener_DataSet(SqlCommand xMiComando)
    {

        String StrConexion = System.Configuration.ConfigurationManager.ConnectionStrings["xStrConn"].ToString();
        SqlConexion = new SqlConnection(StrConexion);


        xMiComando.Connection = SqlConexion;
        DataSet DS = new DataSet();
        SqlDataAdapter DA = new SqlDataAdapter(xMiComando);
        try
        {
            SqlConexion.Open();
            DA.Fill(DS);
        }
        catch (Exception ex)
        {
            //DS.Tables.Add(Crear_Informacion_Error(ex));
        }
        finally
        {
            SqlConexion.Close();
        }
        return DS;
    }

    private Sitio Sitio()
    {
        sitio.Conexion = System.Configuration.ConfigurationManager.ConnectionStrings["xStrConn"].ToString();
        return sitio;
    }

    public List<Dictionary<string, object>> DTJSON(DataTable table)
    {

        List<Dictionary<string, object>> parentRow = new List<Dictionary<string, object>>();
        Dictionary<string, object> childRow;
        foreach (DataRow row in table.Rows)
        {
            childRow = new Dictionary<string, object>();
            foreach (DataColumn col in table.Columns)
            {
                childRow.Add(col.ColumnName, row[col]);
            }
            parentRow.Add(childRow);
        }
        return parentRow;
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}