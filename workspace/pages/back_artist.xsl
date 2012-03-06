<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/registry-master.xsl"/>

<xsl:template match="/data">

<xsl:call-template name="registry-artist-banner"/>

<!--
	<div class="contact-artist">
		<a class="go" href="#contact">Contact this artist</a>
	</div>
-->
<section role="main">
	<xsl:choose>
		<!-- Not actually built for now -->
	    <xsl:when test="registry-current-artist/entry/profile-type/item/@handle = 'full-page-photo'">
			<div class="registry-artist-full-page-gallery">
				<ul>
					<xsl:apply-templates select="test"/>
				</ul>
				<div class="panels">
					<xsl:apply-templates select="test"/>
				</div>
			</div>
	    </xsl:when>
	    
	    <xsl:otherwise>
			<div class="registry-gallery">
				<xsl:choose>
					<xsl:when test="registry-current-artist-artwork-list/error">
						<p class="registry-empty">
							<em>Sadness</em>.
							<xsl:value-of select="registry-current-artist/entry/name"/>
							<xsl:text> has not uploaded any artwork yet.</xsl:text>
						</p>
					</xsl:when>
					<xsl:otherwise>
						<ul>
							<xsl:apply-templates select="registry-current-artist-artwork-list/entry"/>
						</ul>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:apply-templates select="registry-current-artist-artwork-list/pagination"/>

			</div>
	    </xsl:otherwise>
	</xsl:choose>

	<section class="text">
		<xsl:copy-of select="registry-current-artist/entry/biography"/>
	</section>
</section>
<section role="complimentary">
    <h1>Interests</h1>
    <ul>
    	<xsl:apply-templates select="registry-current-artist/entry/interests/item"/>
    </ul>
</section>
</xsl:template>

<!-- Gallery -->
<xsl:template match="registry-current-artist-artwork-list/entry">
	<xsl:call-template name="registry-gallery-list"/>
</xsl:template>

<!-- Gallery pagination -->
<xsl:template match="registry-current-artist-artwork-list/pagination">
	<xsl:call-template name="registry-pagination"/>
</xsl:template>
<!-- Interests -->
<xsl:template match="registry-current-artist/entry/interests/item">
	<li>
		<a>
			<xsl:attribute name="href">
				<xsl:choose>
					<xsl:when test="$ds-registry-url = ''">
						<xsl:value-of select="$root"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$ds-registry-url"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text>/interest/</xsl:text>
				<xsl:value-of select="handle"/>
			</xsl:attribute>
			<xsl:value-of select="current()"/>
		</a>
	</li>
</xsl:template>
</xsl:stylesheet>