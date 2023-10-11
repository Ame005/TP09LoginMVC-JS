using Microsoft.AspNetCore.Mvc;

namespace TP09Login.Controllers;

public class AccountController : Controller
{
    /*
    public IActionResult Index()
    {
        return View();
    }
    */
    public IActionResult Login()
    {
        return View();
    }
    //si el form esta mal que salte una alerta warning
    public IActionResult Registro()
    {
        ViewBag.GenerosEleccion=BD.ObtenerGeneros();
        ViewBag.PreguntasEleccion=BD.ObtenerPreguntas();
        return View("Registro");
    }
    public IActionResult GuardarDatos(string username, string password, string mail, int genero, int idPregunta, string respuesta)
    {
        Console.WriteLine(genero);
        Console.WriteLine(idPregunta);
        BD.AgregarUsuario(username,password,mail,genero,idPregunta,respuesta);
        return View("Login");
    }
    public IActionResult VerificarDatos(string username, string contrasena)
    {
        User datos = null;
        datos = BD.VerInfoUsuario(username);
        if (datos.Username==username && datos.Contrasena==contrasena)
        {
            return View("Bienvenida");
        }
        else
        {
            ViewBag.MensajeError = "Datos incorrectos, vuelva a intentar";
            return View("Login");
        }
    }
    public IActionResult OlvideMiContrasena()
    {
        ViewBag.PreguntasEleccion=BD.ObtenerPreguntas();
        return View();
    }
    //el form le manda el mail, la respuesta, y la nueva contraseña
    public IActionResult CambiarContrasena(string mail, string respuesta, string nuevaContrasena)
    {
        //pedir un bool del BD y que si este mal te salte error general
        bool correcto=false;
        correcto = BD.UpdatearContrasena(nuevaContrasena,mail,respuesta);
        if (correcto){
            ViewBag.CambioPosible = "El cambio de contraseña fue exitoso";
            return View("Login");
        }
        else{
            ViewBag.PreguntasEleccion = BD.ObtenerPreguntas();
            ViewBag.CambioPosible = "El cambio no fue posible. Intente nuevamente";
            return View("OlvideMiContrasena");
        }
    }
    //si el ingreso esta mal, que salte un alert-warning como el de bootstrap
    public IActionResult Bienvenida(){
        return View();
    }
}
