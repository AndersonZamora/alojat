USE [AlquilerDB]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 11/06/2023 22:54:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[CategoriaID] [int] IDENTITY(1,1) NOT NULL,
	[NombreCategoria] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[CategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inmueble]    Script Date: 11/06/2023 22:54:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inmueble](
	[InmuebleID] [int] IDENTITY(1,1) NOT NULL,
	[ImagenInmueble] [nvarchar](max) NOT NULL,
	[LatitudInmueble] [nvarchar](max) NOT NULL,
	[LongitudInmueble] [nvarchar](max) NOT NULL,
	[DireccionInmueble] [nvarchar](max) NOT NULL,
	[NumCelular] [nvarchar](9) NOT NULL,
	[PuntoReferenciaID] [int] NOT NULL,
	[UsuarioID] [int] NOT NULL,
 CONSTRAINT [PK_Inmueble] PRIMARY KEY CLUSTERED 
(
	[InmuebleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PuntoReferencia]    Script Date: 11/06/2023 22:54:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PuntoReferencia](
	[PuntoReferenciaID] [int] IDENTITY(1,1) NOT NULL,
	[NombrePuntoReferencia] [nvarchar](max) NOT NULL,
	[DireccionReferencia] [nvarchar](max) NOT NULL,
	[Latitud] [nvarchar](max) NOT NULL,
	[Longitud] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PuntoReferencia] PRIMARY KEY CLUSTERED 
(
	[PuntoReferenciaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 11/06/2023 22:54:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[RolID] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionRol] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[RolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 11/06/2023 22:54:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[ServicioID] [int] IDENTITY(1,1) NOT NULL,
	[ImagenServicio] [varchar](200) NOT NULL,
	[UbicacionPiso] [varchar](25) NOT NULL,
	[DescripcionServicio] [nvarchar](max) NOT NULL,
	[TipoServicio] [varchar](20) NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[EstadoAlquilerServicio] [bit] NOT NULL,
	[CategoriaID] [int] NOT NULL,
	[InmuebleID] [int] NOT NULL,
 CONSTRAINT [PK_Servicio] PRIMARY KEY CLUSTERED 
(
	[ServicioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 11/06/2023 22:54:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[UsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](max) NOT NULL,
	[Apellidos] [nvarchar](max) NOT NULL,
	[FechaNacimiento] [datetime2](7) NOT NULL,
	[NumCelular] [nvarchar](9) NOT NULL,
	[DireccionDomicilio] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[RolID] [int] NOT NULL,
	[FechaRegistro] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inmueble] ADD  DEFAULT ((0)) FOR [UsuarioID]
GO
ALTER TABLE [dbo].[Servicio] ADD  DEFAULT ((0)) FOR [InmuebleID]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (N'') FOR [Password]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Inmueble]  WITH CHECK ADD  CONSTRAINT [FK_Inmueble_PuntoReferencia_PuntoReferenciaID] FOREIGN KEY([PuntoReferenciaID])
REFERENCES [dbo].[PuntoReferencia] ([PuntoReferenciaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inmueble] CHECK CONSTRAINT [FK_Inmueble_PuntoReferencia_PuntoReferenciaID]
GO
ALTER TABLE [dbo].[Inmueble]  WITH CHECK ADD  CONSTRAINT [FK_Inmueble_Usuario_UsuarioID] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuario] ([UsuarioID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inmueble] CHECK CONSTRAINT [FK_Inmueble_Usuario_UsuarioID]
GO
ALTER TABLE [dbo].[Servicio]  WITH CHECK ADD  CONSTRAINT [FK_Servicio_Categoria_CategoriaID] FOREIGN KEY([CategoriaID])
REFERENCES [dbo].[Categoria] ([CategoriaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Servicio] CHECK CONSTRAINT [FK_Servicio_Categoria_CategoriaID]
GO
ALTER TABLE [dbo].[Servicio]  WITH CHECK ADD  CONSTRAINT [FK_Servicio_Inmueble_InmuebleID] FOREIGN KEY([InmuebleID])
REFERENCES [dbo].[Inmueble] ([InmuebleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Servicio] CHECK CONSTRAINT [FK_Servicio_Inmueble_InmuebleID]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol_RolID] FOREIGN KEY([RolID])
REFERENCES [dbo].[Rol] ([RolID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Rol_RolID]
GO
/****** Object:  StoredProcedure [dbo].[busqueda_cat]    Script Date: 11/06/2023 22:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[busqueda_cat] @Id_Cat int,  @Id_Ref int
AS
select  s.ServicioID,
		s.CategoriaID,
		s.Precio,
		u.Nombres,
		u.Apellidos,
		i.InmuebleID,
		i.DireccionInmueble,
		i.PuntoReferenciaID,
		i.UsuarioID,
		i.ImagenInmueble,
		p.NombrePuntoReferencia
		from Servicio s
		inner join Inmueble i on (s.InmuebleID = i.InmuebleID)
		inner join PuntoReferencia p on (p.PuntoReferenciaID = i.PuntoReferenciaID)
		inner join Usuario u on (u.UsuarioID = i.UsuarioID)
where s.InmuebleID = i.InmuebleID and
	  s.CategoriaID = @Id_Cat and
	  p.PuntoReferenciaID = i.PuntoReferenciaID and
	  i.PuntoReferenciaID = @Id_Ref
GO
/****** Object:  StoredProcedure [dbo].[busqueda_servicioByIdInmuble]    Script Date: 11/06/2023 22:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[busqueda_servicioByIdInmuble] @Id_Inm int
AS
select  s.ServicioID, s.InmuebleID, s.ImagenServicio, s.EstadoAlquilerServicio, s.TipoServicio,
s.UbicacionPiso, s.DescripcionServicio, s.Precio, s.CategoriaID,
		i.LatitudInmueble Latitud, i.LongitudInmueble Longitud, i.DireccionInmueble Direc, i.NumCelular Celular,
		i.PuntoReferenciaID
		from Servicio s
		inner join Inmueble i on (s.InmuebleID = i.InmuebleID)
where s.ServicioID = @Id_Inm and
	s.InmuebleID = i.InmuebleID

GO
/****** Object:  StoredProcedure [dbo].[ProcedimientoFiltroInmueble]    Script Date: 11/06/2023 22:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcedimientoFiltroInmueble] 
	@PuntoReferenciaID int ,
	@CategoriaID int
AS
BEGIN
	SELECT        Inmueble.InmuebleID,Inmueble.ImagenInmueble,Inmueble.DireccionInmueble,Usuario.Nombres,Usuario.Apellidos
				
	FROM            dbo.Inmueble LEFT JOIN
                         dbo.PuntoReferencia ON dbo.Inmueble.PuntoReferenciaID <> dbo.PuntoReferencia.PuntoReferenciaID INNER JOIN
                         dbo.Usuario ON dbo.Inmueble.UsuarioID = dbo.Usuario.UsuarioID INNER JOIN
                         dbo.Servicio ON dbo.Inmueble.InmuebleID = dbo.Servicio.InmuebleID INNER JOIN
                         dbo.Categoria ON dbo.Servicio.CategoriaID = dbo.Categoria.CategoriaID 
	WHERE			PuntoReferencia.PuntoReferenciaID = 1 AND Categoria.CategoriaID = 2						
						GROUP BY Inmueble.InmuebleID, Inmueble.ImagenInmueble,Inmueble.DireccionInmueble,Usuario.Nombres,Usuario.Apellidos
END
GO
