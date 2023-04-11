using Formulario_Prueba.Models;
using Formulario_Prueba.Servicios;
using Microsoft.AspNetCore.Mvc;

namespace Formulario_Prueba.Controllers
{
    public class CrearController : Controller
    {
        public CrearController()
        {
            
        }

        public IActionResult Index() 
        {
            return View();
        }
    }
}
