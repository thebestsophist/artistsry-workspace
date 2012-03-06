<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/registry-master.xsl"/>

<xsl:template match="/data">
<section role="main">

<xsl:choose>

	<xsl:when test="$is-logged-in = 'no'">
		<h1>Naughty! You need to 
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
					<xsl:text>/sign-in</xsl:text>
				</xsl:attribute>
				<xsl:text>sign in</xsl:text>
			</a>
			<xsl:text> before you can edit your account information</xsl:text>.</h1>
	</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="registry-edit-account-nav"/>
		<h1>Unpublished artwork</h1>

		<xsl:choose>
			<xsl:when test="registry-unpublished-artwork-list/error">
				<p>
					<xsl:text>You don&#8217;t have any unpublished artwork. Why not </xsl:text>
					<a href="../new">upload one now</a>
					<xsl:text>?</xsl:text>
				</p>
			</xsl:when>
			<xsl:otherwise>
				<div class="registry-gallery">
					<ul>
					<xsl:apply-templates select="registry-unpublished-artwork-list/entry"/>
					</ul>
					<xsl:apply-templates select="registry-unpublished-artwork-list/pagination"/>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:otherwise>
</xsl:choose>
</section>
</xsl:template>
<xsl:template match="registry-unpublished-artwork-list/entry">
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
					<xsl:text>/artist/</xsl:text>
					<xsl:value-of select="artist/item"/>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="@id"/>
			    		<xsl:text>/</xsl:text>
			    		<xsl:value-of select="@id"/>
			    		<xsl:text>/edit</xsl:text>
				</xsl:attribute>
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="$root"/>
						<xsl:text>/image/2/174/144/5</xsl:text>
						<xsl:value-of select="artwork/@path"/>
						<xsl:text>/</xsl:text>
						<xsl:value-of select="artwork/filename"/>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="title"/>
					</xsl:attribute>
				</img>
			</a>
			<div>

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
			    		<xsl:text>/artist/</xsl:text>
			    		<xsl:value-of select="artist/item"/>
			    		<xsl:text>/</xsl:text>
			    		<xsl:value-of select="@id"/>
			    		<xsl:text>/edit</xsl:text>
			    	</xsl:attribute>
					<h1>
						<xsl:value-of select="title"/>
					</h1>
				</a>

			</div>
		</li>

</xsl:template>

<xsl:template match="registry-unpublished-artwork-list/pagination">
	<xsl:call-template name="registry-pagination"/>
</xsl:template>
</xsl:stylesheet>