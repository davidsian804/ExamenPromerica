using Formulario_Prueba.Models;
using Formulario_Prueba.Servicios;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Reflection.Metadata.Ecma335;

namespace Formulario_Prueba.Controllers
{
    public class HomeController : Controller
    {
        private readonly IRepositorioLogin repositorioLogin;

        public HomeController(IRepositorioLogin repositorioLogin)
        {
            this.repositorioLogin = repositorioLogin;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public IActionResult Crear()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Crear(LoginViewModel loginViewModel)
        {
            if (!ModelState.IsValid)
            {
                return View(loginViewModel);
            }
                        
            await repositorioLogin.Crear(loginViewModel);

            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Mostrar()
        {
            var usuarios = await repositorioLogin.Obtener();
            return View(usuarios);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}