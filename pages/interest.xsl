<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/registry-master.xsl"/>

<xsl:template match="/data">
<section role="main">
	<h1>
		<a>
			<xsl:attribute name="href">
				<xsl:choose>
					<xsl:when test="$ds-registry-url">
						<xsl:value-of select="$root"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$ds-registry-url"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text>/interest</xsl:text>
			</xsl:attribute>
			<xsl:text>Interests</xsl:text>
		</a>
			<xsl:if test="$interest">
				<xsl:text> / </xsl:text>
				<xsl:value-of select="registry-current-interest/entry/title"/>
			</xsl:if>
	</h1>

<!-- Landing page or [Interest] page -->
<xsl:choose>
	<xsl:when test="$interest">
		<xsl:choose>
			<xsl:when test="registry-artist-by-interest/error">
				<p>Sorry, no artists have listed this in their interests yet.</p>
			</xsl:when>
			<xsl:otherwise>
				<div class="registry-gallery-full">
					<ul>
						<xsl:apply-templates select="registry-artist-by-interest/entry"/>
					</ul>
					
					<xsl:apply-templates select="registry-artist-by-interest/pagination"/>						
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:when>
	
	<!-- Default to landing page -->
	<xsl:otherwise>
		<ul>
			<xsl:apply-templates select="registry-interest-list/entry"/>
		</ul>
	</xsl:otherwise>
</xsl:choose>
</section>
</xsl:template>
<!-- Landing page -->
<xsl:template match="registry-interest-list/entry">
	<li>
		<a>
			<xsl:attribute name="href">
				<xsl:value-of select="title/@handle"/>
			</xsl:attribute>
			<xsl:value-of select="title"/>
		</a>
	</li>
</xsl:template>

<xsl:template match="registry-artist-by-interest/pagination">
	<xsl:call-template name="registry-pagination"/>
</xsl:template>
<!-- [Interest] page -->
<xsl:template match="registry-artist-by-interest/entry">
	<li>
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
				<xsl:text>/artist/</xsl:text>
				<xsl:value-of select="username/@handle"/>
			</xsl:attribute>
			<img>
				<xsl:attribute name="src">
					<xsl:value-of select="$root"/>
					<xsl:text>/image/2/174/144/5</xsl:text>
					<xsl:choose>
						<xsl:when test="profile-image">
							<xsl:value-of select="profile-image/@path"/>
							<xsl:text>/</xsl:text>
							<xsl:value-of select="profile-image/filename"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>/images/avatar.png</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="name"/>
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
    	    		<xsl:value-of select="username/@handle"/>
    	    	</xsl:attribute>
    			<h1>
    				<xsl:value-of select="name"/>
    			</h1>
    		</a>
		</div>
	</li>
</xsl:template>
</xsl:stylesheet>