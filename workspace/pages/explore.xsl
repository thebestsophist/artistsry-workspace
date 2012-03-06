<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/registry-master.xsl"/>

<xsl:template match="/data">
<section role="main">
<xsl:choose>
	<xsl:when test="registry-recent-art/error">
		<div class="error">
			<p>I&#8217;m so sad, nobody has uploaded any art yet!</p>
		</div>
	</xsl:when>
	<xsl:otherwise>
		<div class="registry-gallery-full">
			<ul>
			<xsl:apply-templates select="registry-recent-art/entry"/>
			</ul>
			<xsl:apply-templates select="registry-recent-art/pagination"/>
		</div>
	</xsl:otherwise>

</xsl:choose>
</section>
</xsl:template>

<xsl:template match="registry-recent-art/pagination">
	<xsl:call-template name="registry-pagination"/>
</xsl:template>

<xsl:template match="registry-recent-art/entry">
		<xsl:call-template name="registry-gallery-list"/>
</xsl:template>
</xsl:stylesheet>