using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using NPOI.XSSF.UserModel;
using NPOI.SS.UserModel;
using System.Security.Cryptography.X509Certificates;
using System.EnterpriseServices.Internal;
using System.IO;
using System.Linq.Expressions;
using System.Web;


namespace Versión_Final
{
    public partial class Registrar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)

        {

            if (Session["usuariologueado"] != null)
            {
                string usuariologueado = Session["usuariologueado"].ToString();
                lblBienvenida.Text = "Bienvenido " + usuariologueado;
            }
            else
            {
                Response.Redirect("login.aspx");
            }

            LeerDatos();

        }

        SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);



        void Limpiar()


        {
            nombres.Text = "";
            apellidos.Text = "";
            identificacion.Text = "";
            direccion.Text = "";
            salario.Text = "";
        }
        protected void BtnIngresar_clic(Object sender, EventArgs e)
        {
            conexion.Open();


            SqlCommand cmm = new SqlCommand("Insert into empleado values('" + nombres.Text + "','" + apellidos.Text + "','" + identificacion.Text + "','" + direccion.Text + "','" + salario.Text + "')", conexion);
            cmm.ExecuteNonQuery();
            conexion.Close();
            Limpiar();
            LeerDatos();



        }
        void LeerDatos()
        {
            SqlCommand leerdatos = new SqlCommand("Select * from empleado", conexion);
            SqlDataAdapter da = new SqlDataAdapter(leerdatos);
            DataTable dt = new DataTable();
            da.Fill(dt);
            empleado.DataSource = dt;
            empleado.DataBind();


        }
        protected void BtnCerrar_Click(object sender, EventArgs e)
        {
            Session.Remove("usuariologueado");
            Response.Redirect("login.aspx");

        }

        public DataTable empleados()
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "exportacion";
                cmd.Connection = conn;
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                da.Dispose();

            }
            return dt;
        }
        protected void BtnExportar_clic(object sender, EventArgs e)
        {

            DataTable dt = new DataTable();
            dt = empleados();
            Stream s = ExportarExcel(dt);
            if (s != null)
            {
                MemoryStream ms = s as MemoryStream;
                Response.AddHeader("Content-Disposition", string.Format("attachment;filename=" + HttpUtility.UrlEncode("empleadoss") + ".xlsx"));
                Response.ContentType = "application/vnd.ms-excel";
                Response.AddHeader("Content-lenght", ms.ToArray().Length.ToString());
                Response.BinaryWrite(ms.ToArray());
                Response.Flush();
                ms.Close();
                ms.Dispose();
            }
        }
        public Stream ExportarExcel(DataTable dt)
        {
            XSSFWorkbook workbook = new XSSFWorkbook();
            MemoryStream ms = new MemoryStream();
            ISheet sheet = workbook.CreateSheet("empleado");
            XSSFRow headerRow = headerRow = (XSSFRow)sheet.CreateRow(0);

            try
            {
                foreach (DataColumn column in dt.Columns)
                    headerRow.CreateCell(column.Ordinal).SetCellValue(column.ColumnName);
                int rowIndex = 1;
                foreach (DataRow row in dt.Rows)
                {
                    XSSFRow dataRow = (XSSFRow)sheet.CreateRow(rowIndex);
                    foreach (DataColumn column in dt.Columns)
                        dataRow.CreateCell(column.Ordinal).SetCellValue(row[column].ToString());
                    ++rowIndex;
                }
                for (int i = 0; i <= dt.Columns.Count; i++)
                    sheet.AutoSizeColumn(i);
                workbook.Write(ms);
                ms.Flush();

            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                ms.Close();
                sheet = null;
                headerRow = null;
                workbook = null;
            }
            return ms;
        }

    }
}
