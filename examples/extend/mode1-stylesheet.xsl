<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="ISO-8859-1" indent="yes"/>
	<!-- Universelles XSL um alle Datensaetze einer mit NTE_CONV konvertierten
Datei in Tabellenform auszugeben / 29.09.2002 von Jens Goedeke -->
	<!-- Wurzelknoten abarbeiten : HTML Grundlagen in Zieldatei schreiben -->
	<xsl:template match="/">
		<html>
			<head>
			</head>
			<body>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>
	<!-- fileExport Knoten : Tabellenrahmen schreiben -->
	<xsl:template match="csv_data_records">
		<table border="1" width="100%" cellspacing="2" cellpadding="2">
			<xsl:apply-templates/>
		</table>
	</xsl:template>
	<!-- erstes verfuegbares "Record" auslesen ... -->
	<xsl:template match="record[position() = 1]">
		<!-- Erst die Parameterbezeichner (Elementnamen) in die Zieltabelle schreiben
-->
		<tr>
			<xsl:for-each select="*">
				<td>
					<b>
						<xsl:value-of select="local-name(.)"/>
					</b>
				</td>
			</xsl:for-each>
		</tr>
		<!-- Dann die Werte (Kontext) des ersten Record in die Zieltabelle schreiben
Hinweis:
Nachfolgende Abarbeitung des Knotens "record" wuerde wegen niedriger
Prioritaet den ersten Datensatz auslassen, da dieser schon hier
behandelt wird.
-->
		<tr>
			<xsl:for-each select="*">
				<td>
					<xsl:value-of select="."/>
					<!-- noch einen Zeilenabschluss ( <br> ) einfuegen, sonst werden
leere Elemente nicht in die Tabelle geschrieben -->
					<xsl:element name="br"/>
				</td>
			</xsl:for-each>
		</tr>
	</xsl:template>
	<!-- Alle weiteren Datensaetze auslesen und deren Werte in die Tabelle schreiben
-->
	<xsl:template match="record">
		<tr>
			<xsl:for-each select="*">
				<td>
					<xsl:value-of select="."/>
					<!-- noch einen Zeilenabschluss ( <br> ) einfuegen, sonst werden
leere Elemente nicht in die Tabelle geschrieben -->
					<xsl:element name="br"/>
				</td>
			</xsl:for-each>
		</tr>
	</xsl:template>
</xsl:stylesheet>
