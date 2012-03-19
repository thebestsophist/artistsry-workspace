<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/registry-master.xsl"/>

<xsl:template match="/data">
	<section role="main">
	<h1><xsl:value-of select="$page-title"/></h1>
	</section>
	<section role="complimentary">
	</section>
</xsl:template>
</xsl:stylesheet>