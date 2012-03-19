<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/registry-master.xsl"/>

<xsl:template match="/data">
<section role="main">
	<xsl:choose>
		<xsl:when test="$ds-search = ''">
			<p>Curses, I didn&#8217;t find anything.</p>
		</xsl:when>
		<xsl:otherwise>
			<div class="registry-gallery-full">
				<ul>
					<xsl:apply-templates select="search/entry"/>
				</ul>
				<xsl:apply-templates select="search/pagination"/>
			</div>
		</xsl:otherwise>
	</xsl:choose>
</section>
</xsl:template>

<xsl:template match="search/entry">
	<xsl:choose>
		<xsl:when test="@section = 'artists'">

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
							<xsl:value-of select="//entry[@id=current()/@id]/username/@handle"/>
					</xsl:attribute>
					<img>
						<xsl:attribute name="src">
							<xsl:value-of select="$root"/>
							<xsl:text>/image/2/174/144/5</xsl:text>
							<xsl:value-of select="//entry[@id=current()/@id]/profile-image/@path"/>
							<xsl:text>/</xsl:text>
							<xsl:value-of select="//entry[@id=current()/@id]/profile-image/filename"/>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="//entry[@id=current()/@id]/name"/>
						</xsl:attribute>
					</img>
				</a>
			</li>
		</xsl:when>
		
		<xsl:when test="@section = 'artwork'">
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
						<xsl:value-of select="//entry[@id=current()/@id]/artist/item"/>
						<xsl:text>/</xsl:text>
						<xsl:value-of select="@id"/>
					</xsl:attribute>
					<img>
						<xsl:attribute name="src">
							<xsl:value-of select="$root"/>
							<xsl:text>/image/2/174/144/5</xsl:text>
							<xsl:value-of select="//entry[@id=current()/@id]/artwork/@path"/>
							<xsl:text>/</xsl:text>
							<xsl:value-of select="//entry[@id=current()/@id]/artwork/filename"/>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="//entry[@id=current()/@id]/title"/>
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
				    		<xsl:value-of select="//entry[@id=current()/@id]/artist/item"/>
				    		<xsl:text>/</xsl:text>
				    		<xsl:value-of select="@id"/>
				    	</xsl:attribute>
						<h1>
							<xsl:value-of select="//entry[@id=current()/@id]/title"/>
						</h1>
					</a>
		
				</div>
			</li>
		</xsl:when>
		<xsl:otherwise>
			<p>What the what? This isn't supposed to be here!</p>
			<textarea>
				<copy-of name="current()"/>
			</textarea>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="search/pagination">
	<xsl:call-template name="registry-pagination"/>
</xsl:template>
</xsl:stylesheet>