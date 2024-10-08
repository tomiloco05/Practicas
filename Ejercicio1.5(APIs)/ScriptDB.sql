USE [master]
GO
/****** Object:  Database [Actividad1_5]    Script Date: 17/9/2024 16:23:06 ******/
CREATE DATABASE [Actividad1_5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Actividad1_5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Actividad1_5.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Actividad1_5_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Actividad1_5_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Actividad1_5] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Actividad1_5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Actividad1_5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Actividad1_5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Actividad1_5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Actividad1_5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Actividad1_5] SET ARITHABORT OFF 
GO
ALTER DATABASE [Actividad1_5] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Actividad1_5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Actividad1_5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Actividad1_5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Actividad1_5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Actividad1_5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Actividad1_5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Actividad1_5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Actividad1_5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Actividad1_5] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Actividad1_5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Actividad1_5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Actividad1_5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Actividad1_5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Actividad1_5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Actividad1_5] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Actividad1_5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Actividad1_5] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Actividad1_5] SET  MULTI_USER 
GO
ALTER DATABASE [Actividad1_5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Actividad1_5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Actividad1_5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Actividad1_5] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Actividad1_5] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Actividad1_5] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Actividad1_5] SET QUERY_STORE = ON
GO
ALTER DATABASE [Actividad1_5] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Actividad1_5]
GO
/****** Object:  Table [dbo].[T_DetallesFacturas]    Script Date: 17/9/2024 16:23:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_DetallesFacturas](
	[ID_Detalle] [int] NOT NULL,
	[ID_Factura] [int] NOT NULL,
	[ID_Producto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [int] NOT NULL,
 CONSTRAINT [PK_Detalles] PRIMARY KEY CLUSTERED 
(
	[ID_Factura] ASC,
	[ID_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Facturas]    Script Date: 17/9/2024 16:23:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Facturas](
	[ID_Factura] [int] IDENTITY(1,1) NOT NULL,
	[ID_MetodoPago] [int] NOT NULL,
	[Cliente] [varchar](50) NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Facturas] PRIMARY KEY CLUSTERED 
(
	[ID_Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_MetodosPago]    Script Date: 17/9/2024 16:23:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_MetodosPago](
	[ID_MetodoPago] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MetodosPago] PRIMARY KEY CLUSTERED 
(
	[ID_MetodoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Productos]    Script Date: 17/9/2024 16:23:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Productos](
	[ID_Producto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[ID_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[T_MetodosPago] ([ID_MetodoPago], [Nombre]) VALUES (0, N'Efectivo')
INSERT [dbo].[T_MetodosPago] ([ID_MetodoPago], [Nombre]) VALUES (1, N'Tarjeta')
GO
SET IDENTITY_INSERT [dbo].[T_Productos] ON 

INSERT [dbo].[T_Productos] ([ID_Producto], [Nombre], [Precio], [Stock], [Activo]) VALUES (1, N'patata de 59 kg', CAST(22.00 AS Decimal(10, 2)), 18, 1)
INSERT [dbo].[T_Productos] ([ID_Producto], [Nombre], [Precio], [Stock], [Activo]) VALUES (2, N'patata de 16 kg', CAST(40.00 AS Decimal(10, 2)), 16, 1)
INSERT [dbo].[T_Productos] ([ID_Producto], [Nombre], [Precio], [Stock], [Activo]) VALUES (3, N'patata de 76 kg', CAST(64.00 AS Decimal(10, 2)), 32, 1)
INSERT [dbo].[T_Productos] ([ID_Producto], [Nombre], [Precio], [Stock], [Activo]) VALUES (4, N'marmota', CAST(22.00 AS Decimal(10, 2)), 21, 1)
INSERT [dbo].[T_Productos] ([ID_Producto], [Nombre], [Precio], [Stock], [Activo]) VALUES (5, N'patata de 69 kg', CAST(52.00 AS Decimal(10, 2)), 33, 1)
INSERT [dbo].[T_Productos] ([ID_Producto], [Nombre], [Precio], [Stock], [Activo]) VALUES (6, N'camello', CAST(43.00 AS Decimal(10, 2)), 2, 1)
SET IDENTITY_INSERT [dbo].[T_Productos] OFF
GO
ALTER TABLE [dbo].[T_DetallesFacturas]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_Facturas] FOREIGN KEY([ID_Factura])
REFERENCES [dbo].[T_Facturas] ([ID_Factura])
GO
ALTER TABLE [dbo].[T_DetallesFacturas] CHECK CONSTRAINT [FK_Detalles_Facturas]
GO
ALTER TABLE [dbo].[T_DetallesFacturas]  WITH CHECK ADD  CONSTRAINT [FK_Detalles_Productos] FOREIGN KEY([ID_Producto])
REFERENCES [dbo].[T_Productos] ([ID_Producto])
GO
ALTER TABLE [dbo].[T_DetallesFacturas] CHECK CONSTRAINT [FK_Detalles_Productos]
GO
ALTER TABLE [dbo].[T_Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_MetodosPago] FOREIGN KEY([ID_MetodoPago])
REFERENCES [dbo].[T_MetodosPago] ([ID_MetodoPago])
GO
ALTER TABLE [dbo].[T_Facturas] CHECK CONSTRAINT [FK_Facturas_MetodosPago]
GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizarProducto]    Script Date: 17/9/2024 16:23:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_ActualizarProducto]
@codigo int,
@nombre varchar(50) = null,
@precio dec(10,2) = null,
@stock int = null,
@activo bit = null
AS
BEGIN
	update T_Productos
	set
		Nombre = ISNULL(@nombre,Nombre),
		Precio = ISNULL(@precio,Precio),
		Stock = ISNULL(@stock,Stock),
		Activo = ISNULL(@activo,Activo)
	where ID_Producto = @codigo	
end
GO
/****** Object:  StoredProcedure [dbo].[SP_BorrarProducto]    Script Date: 17/9/2024 16:23:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_BorrarProducto]
(
@codigo int
)
as
begin
update T_Productos set Activo=0 where ID_Producto = @codigo
end
GO
/****** Object:  StoredProcedure [dbo].[SP_GuardarDetalle]    Script Date: 17/9/2024 16:23:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_GuardarDetalle]
(
@detalle int,
@factura int,
@producto int,
@cantidad int,
@precio decimal(10,2)
)
as
begin
INSERT INTO T_DetallesFacturas(ID_Detalle, ID_Factura, ID_Producto,Cantidad,Precio) VALUES (@detalle, @factura, @producto,@cantidad,@precio);
end
GO
/****** Object:  StoredProcedure [dbo].[SP_GuardarFactura]    Script Date: 17/9/2024 16:23:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GuardarFactura]
	@cliente varchar(50),
	@metodopago int,
	@id int output
AS
BEGIN
	INSERT INTO T_Facturas(cliente, fecha, ID_MetodoPago) VALUES (@cliente, GETDATE(), @metodopago);
	SET @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GuardarProducto]    Script Date: 17/9/2024 16:23:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_GuardarProducto]
@nombre varchar(50),
@precio decimal(10,2),
@stock int,
@activo bit
as
begin
insert into T_Productos (Nombre,Precio,Stock,Activo) values(@nombre,@precio,@stock,@activo) 
end
GO
/****** Object:  StoredProcedure [dbo].[SP_RecuperarFacturas]    Script Date: 17/9/2024 16:23:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_RecuperarFacturas]
	
AS
BEGIN
	Select F.*,D.ID_Detalle,D.ID_Producto,D.Cantidad,D.Precio,P.Nombre,P.Precio as PrecioProducto,P.Activo from T_Facturas as F
	inner join T_DetallesFacturas as D on F.ID_Factura = D.ID_Factura
	inner join T_Productos as P on P.ID_Producto = D.ID_Producto
	order by F.ID_Factura
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RecuperarFacturas_Codigo]    Script Date: 17/9/2024 16:23:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_RecuperarFacturas_Codigo]
@codigo	int
AS
BEGIN
	Select F.*,D.ID_Detalle,D.ID_Producto,D.Cantidad,D.Precio,P.Nombre,P.Precio as PrecioProducto,P.Activo from T_Facturas as F
	inner join T_DetallesFacturas as D on F.ID_Factura = D.ID_Factura
	inner join T_Productos as P on P.ID_Producto = D.ID_Producto
	where F.ID_Factura = @codigo
	order by F.ID_Factura
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RecuperarProducto_Codigo]    Script Date: 17/9/2024 16:23:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_RecuperarProducto_Codigo]
@codigo int
as
begin
select * from T_Productos where ID_Producto = @codigo
end
GO
/****** Object:  StoredProcedure [dbo].[SP_RecuperarProductos]    Script Date: 17/9/2024 16:23:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_RecuperarProductos]
as
begin
select * from T_Productos
end
GO
USE [master]
GO
ALTER DATABASE [Actividad1_5] SET  READ_WRITE 
GO
