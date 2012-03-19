<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/registry-master.xsl"/>

<xsl:template match="/data">
<section role="main">
	<div class="registry-gallery">
		<ul>
			<xsl:apply-templates select="registry-all-artists/entry" />
		</ul>
	<xsl:if test="registry-all-artists/pagination/@total-pages > '1'">
		<nav class="pagination">
			<ul>
				<xsl:if test="registry-all-artists/pagination/@current-page &lt; registry-all-artists/pagination/@total-pages">
					<li class="older"><a>
						<xsl:attribute name="href">
							<xsl:text>?page=</xsl:text>
							<xsl:value-of select="registry-all-artists/pagination/@current-page + 1"/>
						</xsl:attribute>
						Older
					</a></li>
				</xsl:if>
				<xsl:if test="registry-all-artists/pagination/@current-page &gt; 1">
					<li class="newer"><a>
						<xsl:attribute name="href">
						<xsl:text>?page=</xsl:text>
						<xsl:value-of select="registry-all-artists/pagination/@current-page - 1"/>
						</xsl:attribute>
						Newer
					</a></li>
				</xsl:if>
				
			</ul>
		</nav>
	</xsl:if>

	</div>
</section>
</xsl:template>

<xsl:template match="registry-all-artists/entry">

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
					<xsl:value-of select="username/@handle"/>
				</xsl:attribute>
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="$root"/>
						<xsl:text>/image/2/174/144/5</xsl:text>
						<xsl:choose>
							<xsl:when test="profile-image/@path">
								<xsl:value-of select="profile-image/@path"/>
								<xsl:text>/</xsl:text>
								<xsl:value-of select="profile-image/filename"/>
							</xsl:when>
							<!-- Choose the default avatar when no profile image -->
							<xsl:otherwise>
								<xsl:text>/images/avatar.png</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
						
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:text>Go to </xsl:text>
						<xsl:value-of select="name"/>
						<xsl:text>'s profile</xsl:text>
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