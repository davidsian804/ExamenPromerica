using System.ComponentModel.DataAnnotations;

namespace Formulario_Prueba.Models
{
    public class LoginViewModel
    {

        public int Id { get; set; }

        [Required(ErrorMessage = "El nombre de Usuario es requerido")]
        [Display(Name = "Nombre de usuario:")]
        [StringLength(maximumLength: 50, ErrorMessage = "No puede ser mayor a {1} caracteres")]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "La contraseña es requerida")]
        [Display(Name = "Contraseña:")]
        [DataType(DataType.Password)]
        [StringLength(maximumLength: 50, ErrorMessage = "No puede ser mayor a {1} caracteres")]
        public string Contrasena { get; set; }

    }
}
