using System.Data.SqlClient;
using Dapper;

public class BD
{
    private static string _connectionString = @"Server = .";
    public static void AgregarUsuario(User usuario){
        using (SqlConnection db = new SqlConnection(_connectionString)){
            string sql ="INSERT INTO User(Username,Contrasena,Respuesta,Mail,FechaNacimiento,idPregunta) VALUES (@pUsername,@pContrasena,@pRespuesta,@pMail,@pFechaNacimiento,@pidPregunta)";
            db.Execute(sql, new {pUsername = usuario.Username, pContrasena = usuario.Contrasena, pRespuesta = usuario.Respuesta, pMail = usuario.Mail, pFechaNacimiento = usuario.FechaNacimiento, pidPregunta = usuario.Pregunta});
        }
    }
    public static User VerInfoUsuario(string username){
        User infoUsuario = null;
        using (SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM User WHERE Username = @username";
            infoUsuario = db.QueryFirstOrDefault<User>(sql, new{Username=username});
        }
        return infoUsuario;
    }
    public static bool UpdatearContrasena(string nuevaContrasena,string mail,string respuesta){
        bool correcto = false;
        int algo;
        using (SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "UPDATE User SET Contrasena = @nuevaContrasena WHERE Mail = @mail AND Respuesta = @respuesta";
            algo = db.Execute(sql, new {Contrasena = nuevaContrasena, Mail = mail, Respuesta = respuesta});
        }
        if (algo>0){
            correcto=true;
        }
        return correcto;
    }
    public static List<Pregunta> ObtenerPreguntas(){
        List<Pregunta> preguntas = null;
        using (SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Pregunta";
            preguntas = db.Query<Pregunta>(sql).ToList();
        }
        return preguntas;
    }
}