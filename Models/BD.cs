using System.Data.SqlClient;
using Dapper;

public class BD
{
    private static string _connectionString = @"Server = .;DataBase=TpLogin;Trusted_Connection=True;";
    public static void AgregarUsuario(string username, string password, string mail, int genero, int idPregunta, string respuesta){
        Console.WriteLine(username);
        Console.WriteLine(password);
        Console.WriteLine(mail);
        Console.WriteLine(genero);
        Console.WriteLine(idPregunta);
        Console.WriteLine(respuesta);
        using (SqlConnection db = new SqlConnection(_connectionString)){
            string sql ="INSERT INTO [User](Username,Contrasena,Mail,idGenero,idPregunta,Respuesta) VALUES (@pUsername,@pContrasena,@pMail,@pidGenero,@pidPregunta,@pRespuesta)";
            db.Execute(sql, new {pUsername = username, pContrasena = password, pMail = mail, pidGenero = genero, pidPregunta = idPregunta, pRespuesta = respuesta});
        }
    }
    public static User VerInfoUsuario(string username){
        User infoUsuario = null;
        using (SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM [User] WHERE Username = @username";
            infoUsuario = db.QueryFirstOrDefault<User>(sql, new{Username=username});
        }
        return infoUsuario;
    }
    public static bool UpdatearContrasena(string nuevaContrasena,string mail,string respuesta){
        bool correcto = false;
        int algo;
        using (SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "UPDATE [User] SET Contrasena = @nuevaContrasena WHERE Mail = @mail AND Respuesta = @respuesta";
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
    public static List<Genero> ObtenerGeneros(){
        List<Genero> generos = null;
        using (SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Genero";
            generos = db.Query<Genero>(sql).ToList();
        }
        return generos;
    }
}