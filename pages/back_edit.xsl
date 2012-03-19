<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/registry-master.xsl"/>

<xsl:template match="/data">
<section role="main">
<xsl:choose>
	<xsl:when test="$ds-registry-logged-in-artist">
	    <xsl:choose>
	    	<xsl:when test="$ds-registry-logged-in-artist=$username">
				<xsl:choose>
	    			<xsl:when test="//registry-edit-current-artwork/error = 'No records found.'">
						<h1>Deleted!</h1>
						<p>Go back to <a href="../../">your profile</a> or <a href="../../../../account">your unpublished works</a>.</p>
			    	</xsl:when>
					<xsl:otherwise>
			    		<xsl:apply-templates select="registry-edit-current-artwork/entry"/>
			    	</xsl:otherwise>
			    </xsl:choose>
	    	</xsl:when>
	    	<xsl:otherwise>
	    		<p>Sorry, you are not allowed to edit this piece.</p>
	    	</xsl:otherwise>
		</xsl:choose>
	</xsl:when>
	<xsl:otherwise>
		<p>You need to 
			<a>
				<xsl:attribute name="href">
					<xsl:choose>
						<xsl:when test="$ds-registry-url">
							<xsl:value-of select="$ds-registry-url"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$root"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text>/sign-in</xsl:text>
				</xsl:attribute>
				<xsl:text>sign in</xsl:text>
			</a>
			first.</p>
	</xsl:otherwise>
</xsl:choose>
</section>
</xsl:template>

<xsl:template match="registry-edit-current-artwork/entry">
	<h1>Edit this piece</h1>
	<xsl:call-template name="registry-edit-artwork"/>
</xsl:template>
</xsl:stylesheet>