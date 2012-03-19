<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/registry-master.xsl"/>

<xsl:template match="/data">
<section role="main">
	<!-- Tests if it is landing page or not -->
	<xsl:choose>
		<!-- When there is a url param -->
		<xsl:when test="$tag">
			<h1><a href="../">Tags</a> / <xsl:value-of select="//tag[@handle=$tag]"/></h1>
			<div class="registry-gallery-full">
				<ul>
					<xsl:apply-templates select="registry-current-tag/entry"/>
				</ul>
				<xsl:apply-templates select="registry-current-tag/pagination"/>
			</div>
		</xsl:when>
		
		<!-- Landing Page -->
		<xsl:otherwise>
			<ul>
				<xsl:apply-templates select="tag-cloud/tag"/>
			</ul>
		</xsl:otherwise>
	</xsl:choose>
</section>
</xsl:template>

<!-- Tag list on main page -->
<xsl:template match="tag-cloud/tag">
	<li>
		<a>
			<xsl:attribute name="href">
				<xsl:value-of select="@handle"/>
			</xsl:attribute>
			<xsl:value-of select="current()"/>
		</a>
	</li>
</xsl:template>

<!-- Pagination -->
<xsl:template match="registry-current-tag/pagination">
	<xsl:call-template name="registry-pagination"/>
</xsl:template>
<!-- Specific tag page -->
<xsl:template match="registry-current-tag/entry">
	<xsl:call-template name="registry-gallery-list"/>
</xsl:template>
</xsl:stylesheet>