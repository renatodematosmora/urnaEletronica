USE [master]
GO
/****** Object:  Database [eleicoes]    Script Date: 07/11/2018 14:34:37 ******/
CREATE DATABASE [eleicoes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eleicoes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\eleicoes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'eleicoes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\eleicoes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [eleicoes] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eleicoes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eleicoes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eleicoes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eleicoes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eleicoes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eleicoes] SET ARITHABORT OFF 
GO
ALTER DATABASE [eleicoes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eleicoes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eleicoes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eleicoes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eleicoes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eleicoes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eleicoes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eleicoes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eleicoes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eleicoes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [eleicoes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eleicoes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eleicoes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eleicoes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eleicoes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eleicoes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eleicoes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eleicoes] SET RECOVERY FULL 
GO
ALTER DATABASE [eleicoes] SET  MULTI_USER 
GO
ALTER DATABASE [eleicoes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eleicoes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eleicoes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eleicoes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [eleicoes] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'eleicoes', N'ON'
GO
ALTER DATABASE [eleicoes] SET QUERY_STORE = OFF
GO
USE [eleicoes]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [eleicoes]
GO
/****** Object:  Table [dbo].[cargo]    Script Date: 07/11/2018 14:34:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cargo](
	[codigo_cargo] [int] IDENTITY(1,1) NOT NULL,
	[nome_cargo] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_cargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[partido]    Script Date: 07/11/2018 14:34:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[partido](
	[codigo_partido] [int] IDENTITY(1,1) NOT NULL,
	[numero_partido] [int] NULL,
	[nome_partido] [varchar](100) NULL,
	[sigla_partido] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_partido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[candidato]    Script Date: 07/11/2018 14:34:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[candidato](
	[codigo_candidato] [int] IDENTITY(1,1) NOT NULL,
	[nome_candidato] [varchar](100) NULL,
	[numeroeleitoral_candidato] [varchar](5) NULL,
	[codigo_partido] [int] NULL,
	[codigo_cargo] [int] NULL,
 CONSTRAINT [PK__candidat__5629D71BF2FC700C] PRIMARY KEY CLUSTERED 
(
	[codigo_candidato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_candidatos]    Script Date: 07/11/2018 14:34:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_candidatos]
AS
SELECT        dbo.candidato.codigo_candidato, dbo.candidato.nome_candidato, dbo.candidato.numeroeleitoral_candidato, dbo.cargo.nome_cargo, dbo.partido.nome_partido, dbo.partido.sigla_partido
FROM            dbo.candidato INNER JOIN
                         dbo.cargo ON dbo.candidato.codigo_cargo = dbo.cargo.codigo_cargo INNER JOIN
                         dbo.partido ON dbo.candidato.codigo_partido = dbo.partido.codigo_partido
GO
/****** Object:  Table [dbo].[eleitor]    Script Date: 07/11/2018 14:34:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eleitor](
	[codigo_eleitor] [int] IDENTITY(1,1) NOT NULL,
	[nome_eleitor] [varchar](100) NULL,
	[titulo_eleitor] [varchar](20) NULL,
	[datanascimento_eleitor] [date] NULL,
	[codigo_secao] [int] NULL,
	[presenca_eleitor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_eleitor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[secao]    Script Date: 07/11/2018 14:34:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[secao](
	[codigo_secao] [int] IDENTITY(1,1) NOT NULL,
	[numero_secao] [int] NULL,
	[codigo_zona] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_secao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[urna]    Script Date: 07/11/2018 14:34:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[urna](
	[codigo_urna] [int] IDENTITY(1,1) NOT NULL,
	[identificador_urna] [varchar](20) NULL,
	[dataabertura_urna] [date] NULL,
	[datafechamento_urna] [date] NULL,
	[horaabertura_urna] [time](7) NULL,
	[horafechamento_urna] [time](7) NULL,
	[codigo_secao] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_urna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[votos]    Script Date: 07/11/2018 14:34:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[votos](
	[codigo_voto] [int] IDENTITY(1,1) NOT NULL,
	[data_voto] [date] NULL,
	[codigo_candidato] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_voto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zona]    Script Date: 07/11/2018 14:34:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zona](
	[codigo_zona] [int] IDENTITY(1,1) NOT NULL,
	[numero_zona] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_zona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[candidato] ON 

INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (1, N'Basquete', N'91001', 1, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (2, N'Hipismo', N'91002', 1, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (3, N'Patinação', N'91003', 1, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (4, N'Beisebol', N'91004', 1, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (5, N'Polo Aquático', N'91005', 1, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (6, N'Atletismo', N'9101', 1, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (7, N'Ginástica Artística', N'9102', 1, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (8, N'Boxe', N'9103', 1, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (9, N'Halterofilismo', N'9104', 1, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (10, N'Golfe', N'9105', 1, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (11, N'Natação', N'911', 1, 3)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (12, N'Esgrima', N'911', 1, 6)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (13, N'Rúgbi', N'911', 1, 7)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (14, N'Vôlei', N'91', 1, 4)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (15, N'Tênis', N'91', 1, 8)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (16, N'Futebol', N'91', 1, 5)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (17, N'Judô', N'91', 1, 9)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (18, N'Frevo', N'92001', 2, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (19, N'Jazz', N'92002', 2, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (20, N'Música Eletrônica', N'92003', 2, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (21, N'Heavy Metal', N'92004', 2, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (22, N'Salsa', N'92005', 2, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (23, N'Sertanejo', N'9201', 2, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (24, N'Reggae', N'9202', 2, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (25, N'Música Clássica', N'9203', 2, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (26, N'Ópera', N'9204', 2, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (27, N'Mariachi', N'9205', 2, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (28, N'Samba', N'921', 2, 3)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (29, N'Tango', N'921', 2, 6)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (30, N'Música Disco', N'921', 2, 7)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (31, N'Forró', N'92', 2, 4)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (32, N'Pagode', N'92', 2, 8)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (33, N'Rock', N'92', 2, 5)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (34, N'Música Popular Brasileira', N'92', 2, 9)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (35, N'Garçom', N'93001', 3, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (36, N'Motorista', N'93002', 3, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (37, N'Bombeira', N'93003', 3, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (38, N'Pintor', N'93004', 3, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (39, N'Gari', N'93005', 3, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (40, N'Artista', N'9301', 3, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (41, N'Operário', N'9302', 3, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (42, N'Astronauta', N'9303', 3, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (43, N'Cozinheira', N'9304', 3, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (44, N'Fotógrafo', N'9305', 3, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (45, N'Enfermeira', N'931', 3, 3)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (46, N'Aeromoça', N'931', 3, 6)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (47, N'Detetive', N'931', 3, 7)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (48, N'Médica', N'93', 3, 4)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (49, N'Bibliotecária', N'93', 3, 8)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (50, N'Professora', N'93', 3, 5)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (51, N'Mágico', N'93', 3, 9)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (52, N'Páscoa', N'94001', 4, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (53, N'Réveillon', N'94002', 4, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (54, N'Festa da Uva', N'94003', 4, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (55, N'Folia de Reis', N'94004', 4, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (56, N'Festa do Milho', N'94005', 4, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (57, N'Boi-Bumbá', N'9401', 4, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (58, N'Peão de Boiadeiro', N'9402', 4, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (59, N'Oktoberfest', N'9403', 4, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (60, N'Semana Farroupilha', N'9404', 4, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (61, N'Cavalhadas', N'9405', 4, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (62, N'Festa Junina', N'941', 4, 3)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (63, N'Lavagem do Bonfim', N'941', 4, 6)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (64, N'Dia das Bruxas', N'941', 4, 7)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (65, N'Dia da Independência do Brasil', N'94', 4, 4)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (66, N'Natal', N'94', 4, 8)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (67, N'Copa do Mundo', N'94', 4, 5)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (68, N'Carnaval', N'94', 4, 9)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (69, N'Iara', N'95001', 5, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (70, N'Barba-Ruiva', N'95002', 5, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (71, N'Bicho-Papão', N'95003', 5, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (72, N'Matintapereira', N'95004', 5, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (73, N'Pisadeira', N'95005', 5, 1)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (74, N'Lobisomem', N'9501', 5, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (75, N'Cuca', N'9502', 5, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (76, N'Negrinho do Pastoreiro', N'9503', 5, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (77, N'Mapinguari', N'9504', 5, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (78, N'Cabra-Cabriola', N'9505', 5, 2)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (79, N'Saci-Pererê', N'951', 5, 3)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (80, N'Caipora', N'951', 5, 6)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (81, N'Mãe do Ouro', N'951', 5, 7)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (82, N'Boto Cor-de-Rosa', N'95', 5, 4)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (83, N'Boitatá', N'95', 5, 8)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (84, N'Vitória-Régia', N'95', 5, 5)
INSERT [dbo].[candidato] ([codigo_candidato], [nome_candidato], [numeroeleitoral_candidato], [codigo_partido], [codigo_cargo]) VALUES (85, N'Curupira', N'95', 5, 9)
SET IDENTITY_INSERT [dbo].[candidato] OFF
SET IDENTITY_INSERT [dbo].[cargo] ON 

INSERT [dbo].[cargo] ([codigo_cargo], [nome_cargo]) VALUES (1, N'Deputado Estadual')
INSERT [dbo].[cargo] ([codigo_cargo], [nome_cargo]) VALUES (2, N'Deputado Federal')
INSERT [dbo].[cargo] ([codigo_cargo], [nome_cargo]) VALUES (3, N'Senador')
INSERT [dbo].[cargo] ([codigo_cargo], [nome_cargo]) VALUES (4, N'Governador')
INSERT [dbo].[cargo] ([codigo_cargo], [nome_cargo]) VALUES (5, N'Presidente')
INSERT [dbo].[cargo] ([codigo_cargo], [nome_cargo]) VALUES (6, N'Primeiro Suplente')
INSERT [dbo].[cargo] ([codigo_cargo], [nome_cargo]) VALUES (7, N'Segundo Suplente')
INSERT [dbo].[cargo] ([codigo_cargo], [nome_cargo]) VALUES (8, N'Vice Governador')
INSERT [dbo].[cargo] ([codigo_cargo], [nome_cargo]) VALUES (9, N'Vice Presidente')
SET IDENTITY_INSERT [dbo].[cargo] OFF
SET IDENTITY_INSERT [dbo].[eleitor] ON 

INSERT [dbo].[eleitor] ([codigo_eleitor], [nome_eleitor], [titulo_eleitor], [datanascimento_eleitor], [codigo_secao], [presenca_eleitor]) VALUES (1, N'Renato de Matos Mora', N'123456789', CAST(N'1988-10-06' AS Date), 1, 0)
INSERT [dbo].[eleitor] ([codigo_eleitor], [nome_eleitor], [titulo_eleitor], [datanascimento_eleitor], [codigo_secao], [presenca_eleitor]) VALUES (2, N'Iuri Sanches Volnistem', N'234521457', CAST(N'1999-04-09' AS Date), 1, 0)
INSERT [dbo].[eleitor] ([codigo_eleitor], [nome_eleitor], [titulo_eleitor], [datanascimento_eleitor], [codigo_secao], [presenca_eleitor]) VALUES (3, N'José da Silva Junior', N'457861587', CAST(N'2000-01-31' AS Date), 1, 0)
INSERT [dbo].[eleitor] ([codigo_eleitor], [nome_eleitor], [titulo_eleitor], [datanascimento_eleitor], [codigo_secao], [presenca_eleitor]) VALUES (4, N'Maria José Souza e Silva', N'124578985', CAST(N'1967-12-15' AS Date), 1, 0)
INSERT [dbo].[eleitor] ([codigo_eleitor], [nome_eleitor], [titulo_eleitor], [datanascimento_eleitor], [codigo_secao], [presenca_eleitor]) VALUES (5, N'Joana D''Arc', N'321654879', CAST(N'1911-02-28' AS Date), 1, 0)
INSERT [dbo].[eleitor] ([codigo_eleitor], [nome_eleitor], [titulo_eleitor], [datanascimento_eleitor], [codigo_secao], [presenca_eleitor]) VALUES (6, N'Guilhermino José Firmino', N'258746983', CAST(N'2002-01-01' AS Date), 1, 0)
INSERT [dbo].[eleitor] ([codigo_eleitor], [nome_eleitor], [titulo_eleitor], [datanascimento_eleitor], [codigo_secao], [presenca_eleitor]) VALUES (7, N'Natalino da Silva', N'325468597', CAST(N'1950-12-25' AS Date), 1, 0)
SET IDENTITY_INSERT [dbo].[eleitor] OFF
SET IDENTITY_INSERT [dbo].[partido] ON 

INSERT [dbo].[partido] ([codigo_partido], [numero_partido], [nome_partido], [sigla_partido]) VALUES (1, 91, N'Partido dos Esportes', N'PEsp')
INSERT [dbo].[partido] ([codigo_partido], [numero_partido], [nome_partido], [sigla_partido]) VALUES (2, 92, N'Partido dos Ritmos Musicais', N'PMus')
INSERT [dbo].[partido] ([codigo_partido], [numero_partido], [nome_partido], [sigla_partido]) VALUES (3, 93, N'Partido das Profissões', N'PProf')
INSERT [dbo].[partido] ([codigo_partido], [numero_partido], [nome_partido], [sigla_partido]) VALUES (4, 94, N'Partido das Festas', N'PFest')
INSERT [dbo].[partido] ([codigo_partido], [numero_partido], [nome_partido], [sigla_partido]) VALUES (5, 95, N'Partido do Folclore', N'PFolc')
SET IDENTITY_INSERT [dbo].[partido] OFF
SET IDENTITY_INSERT [dbo].[secao] ON 

INSERT [dbo].[secao] ([codigo_secao], [numero_secao], [codigo_zona]) VALUES (1, 115, 1)
SET IDENTITY_INSERT [dbo].[secao] OFF
SET IDENTITY_INSERT [dbo].[votos] ON 

INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (1, CAST(N'2018-11-03' AS Date), 9)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (2, CAST(N'2018-11-03' AS Date), 21)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (3, CAST(N'2018-11-03' AS Date), 11)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (4, CAST(N'2018-11-03' AS Date), 28)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (5, CAST(N'2018-11-03' AS Date), 31)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (6, CAST(N'2018-11-03' AS Date), 33)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (7, CAST(N'2018-11-05' AS Date), 26)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (8, CAST(N'2018-11-05' AS Date), 18)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (9, CAST(N'2018-11-05' AS Date), 28)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (10, CAST(N'2018-11-05' AS Date), 45)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (11, CAST(N'2018-11-05' AS Date), 31)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (12, CAST(N'2018-11-05' AS Date), 33)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (13, CAST(N'2018-11-05' AS Date), 40)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (14, CAST(N'2018-11-05' AS Date), 35)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (15, CAST(N'2018-11-05' AS Date), 45)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (16, CAST(N'2018-11-05' AS Date), 45)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (17, CAST(N'2018-11-05' AS Date), 48)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (18, CAST(N'2018-11-05' AS Date), 50)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (19, CAST(N'2018-11-05' AS Date), 57)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (20, CAST(N'2018-11-05' AS Date), 52)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (21, CAST(N'2018-11-05' AS Date), 62)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (22, CAST(N'2018-11-05' AS Date), 79)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (23, CAST(N'2018-11-05' AS Date), 65)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (24, CAST(N'2018-11-05' AS Date), 84)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (25, CAST(N'2018-11-05' AS Date), 74)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (26, CAST(N'2018-11-05' AS Date), 70)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (27, CAST(N'2018-11-05' AS Date), 11)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (28, CAST(N'2018-11-05' AS Date), 45)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (29, CAST(N'2018-11-05' AS Date), 65)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (30, CAST(N'2018-11-05' AS Date), 67)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (31, CAST(N'2018-11-05' AS Date), 57)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (32, CAST(N'2018-11-05' AS Date), 1)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (33, CAST(N'2018-11-05' AS Date), 45)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (34, CAST(N'2018-11-05' AS Date), 28)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (35, CAST(N'2018-11-05' AS Date), 14)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (36, CAST(N'2018-11-05' AS Date), 67)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (37, CAST(N'2018-11-05' AS Date), 57)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (38, CAST(N'2018-11-05' AS Date), 19)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (39, CAST(N'2018-11-05' AS Date), 11)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (40, CAST(N'2018-11-05' AS Date), 28)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (41, CAST(N'2018-11-05' AS Date), 65)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (42, CAST(N'2018-11-05' AS Date), 67)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (43, CAST(N'2018-11-05' AS Date), 6)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (44, CAST(N'2018-11-05' AS Date), 1)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (45, CAST(N'2018-11-05' AS Date), 11)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (46, CAST(N'2018-11-05' AS Date), 28)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (47, CAST(N'2018-11-05' AS Date), 14)
INSERT [dbo].[votos] ([codigo_voto], [data_voto], [codigo_candidato]) VALUES (48, CAST(N'2018-11-05' AS Date), 16)
SET IDENTITY_INSERT [dbo].[votos] OFF
SET IDENTITY_INSERT [dbo].[zona] ON 

INSERT [dbo].[zona] ([codigo_zona], [numero_zona]) VALUES (1, 101)
SET IDENTITY_INSERT [dbo].[zona] OFF
ALTER TABLE [dbo].[candidato]  WITH CHECK ADD  CONSTRAINT [FK__candidato__codig__3B75D760] FOREIGN KEY([codigo_partido])
REFERENCES [dbo].[partido] ([codigo_partido])
GO
ALTER TABLE [dbo].[candidato] CHECK CONSTRAINT [FK__candidato__codig__3B75D760]
GO
ALTER TABLE [dbo].[candidato]  WITH CHECK ADD  CONSTRAINT [FK__candidato__codig__3C69FB99] FOREIGN KEY([codigo_cargo])
REFERENCES [dbo].[cargo] ([codigo_cargo])
GO
ALTER TABLE [dbo].[candidato] CHECK CONSTRAINT [FK__candidato__codig__3C69FB99]
GO
ALTER TABLE [dbo].[eleitor]  WITH CHECK ADD FOREIGN KEY([codigo_secao])
REFERENCES [dbo].[secao] ([codigo_secao])
GO
ALTER TABLE [dbo].[secao]  WITH CHECK ADD FOREIGN KEY([codigo_zona])
REFERENCES [dbo].[zona] ([codigo_zona])
GO
ALTER TABLE [dbo].[urna]  WITH CHECK ADD FOREIGN KEY([codigo_secao])
REFERENCES [dbo].[secao] ([codigo_secao])
GO
ALTER TABLE [dbo].[votos]  WITH CHECK ADD  CONSTRAINT [FK__votos__codigo_ca__3F466844] FOREIGN KEY([codigo_candidato])
REFERENCES [dbo].[candidato] ([codigo_candidato])
GO
ALTER TABLE [dbo].[votos] CHECK CONSTRAINT [FK__votos__codigo_ca__3F466844]
GO
/****** Object:  StoredProcedure [dbo].[spBoletimUrna]    Script Date: 07/11/2018 14:34:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spBoletimUrna]
as
begin
	select count(vot.codigo_candidato) as votos, cand.nome_candidato as Candidato,
	cand.numeroeleitoral_candidato as [Número do Candidato], car.nome_cargo as Cargo
	from votos as vot
	inner join candidato as cand
	on vot.codigo_candidato = cand.codigo_candidato
	inner join cargo as car
	on cand.codigo_cargo = car.codigo_cargo
	group by vot.codigo_candidato, cand.nome_candidato, cand.numeroeleitoral_candidato, car.nome_cargo
	order by car.nome_cargo, votos desc;
end
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "candidato"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 163
               Right = 269
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cargo"
            Begin Extent = 
               Top = 6
               Left = 307
               Bottom = 102
               Right = 504
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "partido"
            Begin Extent = 
               Top = 6
               Left = 777
               Bottom = 136
               Right = 974
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1620
         Width = 2550
         Width = 2325
         Width = 1605
         Width = 2355
         Width = 1200
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_candidatos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_candidatos'
GO
USE [master]
GO
ALTER DATABASE [eleicoes] SET  READ_WRITE 
GO
