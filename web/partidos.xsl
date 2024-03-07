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
			<h1>PARTIDOS</h1>
			<table>
				<tr>
					<th>PARTIDO</th><th>FECHA</th><th>RESULTADO</th>
				</tr>
				
				<xsl:for-each select="partido">
				<xsl:sort select="fecha" order="descending"></xsl:sort>
				<xsl:if test="lugar/@ciudad='Lima'">
					<tr>
						<td><xsl:value-of select="equipos/local"/> - <xsl:value-of select="equipos/visitante"/></td>
						<td><xsl:value-of select="fecha"/></td>
						<td>
						<xsl:choose>
							<xsl:when test="equipos/visitante/@puntuacion>equipos/local/@puntuacion">
								<span class="azul"><xsl:value-of select="equipos/local/@puntuacion"/> - <xsl:value-of select="equipos/visitante/@puntuacion"/></span>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="equipos/local/@puntuacion"/> - <xsl:value-of select="equipos/visitante/@puntuacion"/>
							</xsl:otherwise>
						</xsl:choose>
						</td>
					</tr>
				</xsl:if>
				</xsl:for-each>
			</table>			
		</main>
		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>
</xsl:stylesheet>