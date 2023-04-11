using Dapper;
using Formulario_Prueba.Models;
using Microsoft.Data.SqlClient;
using System.Data;

using System.Transactions;

namespace Formulario_Prueba.Servicios
{
    public interface IRepositorioLogin
    {
        Task Crear(LoginViewModel loginViewModel);
        Task<IEnumerable<LoginViewModel>> Obtener();
    }

    public class RepositorioLogin: IRepositorioLogin
    {
        private readonly string connectionString;

        public RepositorioLogin(IConfiguration configuration)
        {
            connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        //Obtener lista de Usuarios
        public async Task<IEnumerable<LoginViewModel>> Obtener()
        {
            using var connection = new SqlConnection(connectionString);
            return await connection.QueryAsync<LoginViewModel>
                ("SELECT * FROM usuarios");
        }


        //Registrar Usuario
        public async Task Crear(LoginViewModel loginViewModel)
        {
            using var connection = new SqlConnection(connectionString);
            var Id = await connection.ExecuteScalarAsync<int>(
                "sp_insertar_usuario",
                new
                {
                    loginViewModel.Nombre,
                    loginViewModel.Contrasena
                },
                commandType: CommandType.StoredProcedure
            );

            loginViewModel.Id = Id;
        }



    }



}
