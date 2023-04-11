using Microsoft.Data.SqlClient;
using System.Data;

namespace Practica_4___Metodos_Dataser_CRUD
{
    internal class PracticaConexionDb
    {
        public class ConexionBD
        {
            private readonly string _cadenaConexion;

            public ConexionBD(string cadenaConexion)
            {
                _cadenaConexion = cadenaConexion;
            }

            public DataSet ObtenerDatos(string consulta)
            {
                using (var conexion = new SqlConnection(_cadenaConexion))
                {
                    conexion.Open();
                    var adaptador = new SqlDataAdapter(consulta, conexion);
                    var dataSet = new DataSet();
                    adaptador.Fill(dataSet);
                    return dataSet;
                }
            }

            public int EjecutarConsulta(string consulta)
            {
                using (var conexion = new SqlConnection(_cadenaConexion))
                {
                    conexion.Open();
                    var comando = new SqlCommand(consulta, conexion);
                    return comando.ExecuteNonQuery();
                }
            }

            public int ObtenerNumeroFilas(string consulta)
            {
                using (var conexion = new SqlConnection(_cadenaConexion))
                {
                    conexion.Open();
                    var comando = new SqlCommand(consulta, conexion);
                    var resultado = comando.ExecuteScalar();
                    return resultado != null ? int.Parse(resultado.ToString()) : 0;
                }
            }

            public int InsertarDatos(string consulta)
            {
                using (var conexion = new SqlConnection(_cadenaConexion))
                {
                    conexion.Open();
                    var comando = new SqlCommand(consulta, conexion);
                    return comando.ExecuteNonQuery();
                }
            }

            public int ActualizarDatos(string consulta)
            {
                using (var conexion = new SqlConnection(_cadenaConexion))
                {
                    conexion.Open();
                    var comando = new SqlCommand(consulta, conexion);
                    return comando.ExecuteNonQuery();
                }
            }

            public int EliminarDatos(string consulta)
            {
                using (var conexion = new SqlConnection(_cadenaConexion))
                {
                    conexion.Open();
                    var comando = new SqlCommand(consulta, conexion);
                    return comando.ExecuteNonQuery();
                }
            }

        }
    }
}
