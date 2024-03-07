<?xml version="1.0" encoding='utf-8'?>
<!--
	Nombre: Aitor Uriarte Rodriguez
	Módulo: LMSGI.
	UD04 - Transformación de datos
	Tarea: Tarea Evaluativa 2. XSLT.
	Fecha: 07/03/2024
	Autoevaluación: https://docs.google.com/document/d/18Wm_oMEnxf5dDxYNWU2E1eL9UXS4KDw0/edit?usp=sharing&ouid=103292299957249991516&rtpof=true&sd=true
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="legacy-compat" encoding="utf-8"/>
<xsl:template match='/club_voleibol'>
<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8"/>
		<meta name="description" content="Página principal" />
		<title>titulo de la web</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Reservas" />
			<a href="tienda.xml">Tienda</a>
			<a href="equipos.xml">Equipos</a>
			<a href="partidos.xml">Partidos</a>
		</header>
		
		<main>
		<xsl:apply-templates select="equipo[entrenador/nombre='Julio Velasco']"/>
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>

<xsl:template match="equipo">
	<xsl:variable name="mister" select="'Julio Velasco'"/>
		<h1><a href="{//entrenador[nombre=$mister]/url}"><xsl:value-of select="$mister"/></a></h1>
		<article class="equipos">
			<h4><xsl:value-of select="//entrenador[nombre=$mister]/../nombre"/></h4>
			<xsl:apply-templates select="//entrenador[nombre=$mister]/../jugadores/jugador"/>
		</article>
</xsl:template>

<xsl:template match="jugador">
	<xsl:choose>
		<xsl:when test="@titular='si'">
			<p><xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/></p> 
		</xsl:when>
	</xsl:choose>
</xsl:template>
</xsl:stylesheet>