<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/registry-master.xsl"/>

<xsl:template match="/data">

<xsl:call-template name="registry-artist-banner"/>

<section role="main">


	<section>
		<header>
			<h1><xsl:value-of select="//registry-current-artwork/entry/title"/></h1>
			<div>
				<xsl:if test="$is-logged-in = 'yes'">
					<xsl:if test="$ds-registry-current-artist = $member-id">
						<a href="edit">Edit this piece</a>
					</xsl:if>
				</xsl:if>
			</div>
		</header>
		<section class="text">
			<xsl:choose>
				<xsl:when test="//registry-current-artwork/entry/external-media">
				</xsl:when>
				<xsl:otherwise>
					<img>
						<xsl:attribute name="src">
							<xsl:value-of select="$root"/>
							<xsl:text>/image/1/700/0/</xsl:text>
							<xsl:value-of select="//registry-current-artwork/entry/artwork/@path"/>
							<xsl:text>/</xsl:text>
							<xsl:value-of select="//registry-current-artwork/entry/artwork/filename"/>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="//registry-current-artwork/entry/title"/>
						</xsl:attribute>
					</img>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:value-of select="//registry-current-artwork/entry/description"/>
		</section>
		<div role="complimentary">
			<dl>
				<dt>Posted on:</dt>
				<dd><time>
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" select="//registry-current-artwork/entry/upload-time"/>
						<xsl:with-param name="format" select="'m x, Y'"/>
					</xsl:call-template>
				</time></dd>
				<dt>Views:</dt>
				<dd><xsl:value-of select="//registry-current-artwork/entry/views"/></dd>
				<dt>Tags:</dt>
				<xsl:apply-templates select="/data/registry-current-artwork/entry/artwork-tags/item"/>
			</dl>
		</div>
	</section>
</section>
</xsl:template>

<xsl:template match="/data/registry-current-artwork/entry/artwork-tags/item">
	<dd>
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
				<xsl:text>/tags/</xsl:text>
				<xsl:value-of select="@handle"/>
			</xsl:attribute>
			<xsl:value-of select="current()"/>
		</a>
	</dd>
</xsl:template>
</xsl:stylesheet>