USE [master]
GO
/****** Object:  Database [TpLogin]    Script Date: 11/10/2023 09:07:20 ******/
CREATE DATABASE [TpLogin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TpLogin', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TpLogin.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TpLogin_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TpLogin_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TpLogin] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TpLogin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TpLogin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TpLogin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TpLogin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TpLogin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TpLogin] SET ARITHABORT OFF 
GO
ALTER DATABASE [TpLogin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TpLogin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TpLogin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TpLogin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TpLogin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TpLogin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TpLogin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TpLogin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TpLogin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TpLogin] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TpLogin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TpLogin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TpLogin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TpLogin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TpLogin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TpLogin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TpLogin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TpLogin] SET RECOVERY FULL 
GO
ALTER DATABASE [TpLogin] SET  MULTI_USER 
GO
ALTER DATABASE [TpLogin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TpLogin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TpLogin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TpLogin] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TpLogin] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TpLogin', N'ON'
GO
ALTER DATABASE [TpLogin] SET QUERY_STORE = OFF
GO
USE [TpLogin]
GO
/****** Object:  User [alumno]    Script Date: 11/10/2023 09:07:20 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 11/10/2023 09:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero](
	[idGenero] [int] IDENTITY(1,1) NOT NULL,
	[Contenido] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Genero] PRIMARY KEY CLUSTERED 
(
	[idGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pregunta]    Script Date: 11/10/2023 09:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pregunta](
	[idPregunta] [int] IDENTITY(1,1) NOT NULL,
	[contenido] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Pregunta] PRIMARY KEY CLUSTERED 
(
	[idPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/10/2023 09:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Contrasena] [varchar](50) NOT NULL,
	[Mail] [varchar](50) NOT NULL,
	[idGenero] [int] NOT NULL,
	[Respuesta] [varchar](50) NOT NULL,
	[idPregunta] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Genero] ON 

INSERT [dbo].[Genero] ([idGenero], [Contenido]) VALUES (1, N'F cis')
INSERT [dbo].[Genero] ([idGenero], [Contenido]) VALUES (2, N'M cis')
INSERT [dbo].[Genero] ([idGenero], [Contenido]) VALUES (3, N'F trans')
INSERT [dbo].[Genero] ([idGenero], [Contenido]) VALUES (4, N'M trans')
SET IDENTITY_INSERT [dbo].[Genero] OFF
GO
SET IDENTITY_INSERT [dbo].[Pregunta] ON 

INSERT [dbo].[Pregunta] ([idPregunta], [contenido]) VALUES (1, N'¿Cómo se llamaba tu escuela primaria?')
INSERT [dbo].[Pregunta] ([idPregunta], [contenido]) VALUES (2, N'¿Cómo se llamaba tu mascota de la infancia?')
INSERT [dbo].[Pregunta] ([idPregunta], [contenido]) VALUES (3, N'¿Qué querías ser cuando seas grande?')
INSERT [dbo].[Pregunta] ([idPregunta], [contenido]) VALUES (4, N'¿Cuál es tu jugador favorito?')
SET IDENTITY_INSERT [dbo].[Pregunta] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([idUsuario], [Username], [Contrasena], [Mail], [idGenero], [Respuesta], [idPregunta]) VALUES (1, N'aa', N'a', N'a@gmail.com', 1, N'aa', 3)
INSERT [dbo].[User] ([idUsuario], [Username], [Contrasena], [Mail], [idGenero], [Respuesta], [idPregunta]) VALUES (2, N'aa', N'a', N'a@gmail.com', 1, N'aa', 3)
INSERT [dbo].[User] ([idUsuario], [Username], [Contrasena], [Mail], [idGenero], [Respuesta], [idPregunta]) VALUES (3, N'aa', N'a', N'a@gmail.com', 1, N'aa', 3)
INSERT [dbo].[User] ([idUsuario], [Username], [Contrasena], [Mail], [idGenero], [Respuesta], [idPregunta]) VALUES (4, N'aa', N'a', N'a@gmail.com', 1, N'aa', 3)
INSERT [dbo].[User] ([idUsuario], [Username], [Contrasena], [Mail], [idGenero], [Respuesta], [idPregunta]) VALUES (5, N'aa', N'a', N'a@gmail.com', 1, N'aa', 3)
INSERT [dbo].[User] ([idUsuario], [Username], [Contrasena], [Mail], [idGenero], [Respuesta], [idPregunta]) VALUES (6, N'aa', N'a', N'a@gmail.cpm', 1, N'a', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Genero] FOREIGN KEY([idGenero])
REFERENCES [dbo].[Genero] ([idGenero])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Genero]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Pregunta] FOREIGN KEY([idPregunta])
REFERENCES [dbo].[Pregunta] ([idPregunta])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Pregunta]
GO
USE [master]
GO
ALTER DATABASE [TpLogin] SET  READ_WRITE 
GO
