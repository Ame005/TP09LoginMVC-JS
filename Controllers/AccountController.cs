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
        if (datos == null)
        {
            ViewBag.MensajeError = true;
            return RedirectToAction("Login");
        }
        else
        {
            if (datos.Username==username && datos.Contrasena==contrasena)
            {
                ViewBag.MensajeError = false;
                ViewBag.Usuario=datos;
                return RedirectToAction("Bienvenida");
            }
            else
            {
                ViewBag.MensajeError = true;
                return RedirectToAction("Login");
            }
        }
    }
    public IActionResult OlvideMiContrasena()
    {
        ViewBag.PreguntasEleccion=BD.ObtenerPreguntas();
        ViewBag.CambioPosible="";
        return View();
    }
    //el form le manda el mail, la respuesta, y la nueva contraseña
    public IActionResult CambiarContrasena(string mail, int idPregunta, string respuesta, string password)
    {
        //pedir un bool del BD y que si este mal te salte error general
        bool correcto=false;
        correcto = BD.UpdatearContrasena(mail, idPregunta, respuesta, password);
        if (correcto==true){
            ViewBag.CambioPosible = "El cambio de contraseña fue exitoso";
            return View("OlvideMiContraseña");
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
