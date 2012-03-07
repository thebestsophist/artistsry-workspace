<!--
	None of this does anything. Just code bits often used in the registry.

	DS parameters from the registry preferences:

		$ds-registry-open-registration
		$ds-registry-media-queries
		$ds-registry-counter
		$ds-registry-url

-->

<!-- Checks for registry URL -->
<xsl:choose>
	<xsl:when test="$ds-registry-url = ''">
		<a href="{$root}">Stuff</a>
	</xsl:when>
	<xsl:otherwise>
		<a href="{$ds-registry-url}">stuff</a>
	</xsl:otherwise>
</xsl:choose>



<!-- Checks if logged in to registry -->
<xsl:choose>
    <xsl:when test="$is-logged-in = 'yes'">

    </xsl:when>
    <xsl:otherwise>

    </xsl:otherwise>
</xsl:choose>

<!-- Breadcrumbs, customized because they don't follow url structure -->
<nav class="breadcrumb">
<ul>
	<li>
		<xsl:choose>
		<xsl:when test="$current-page = 'explore'">
			<mark>
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
					</xsl:attribute>
					<xsl:text>Explore</xsl:/text>
				</a>
			</mark>
		</xsl:when>
		<xsl:otherwise>
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
    			</xsl:attribute>
    			<xsl:text>Explore</xsl:/text>
			</a>
		</xsl:otherwise>
	</li>

	<xsl:choose>
		<!-- Explore page number -->
		
		<!-- Interests -->
		
		<!-- [Interest] -->
		
		<!-- [Interest] page number -->
		
		<!-- Media -->
		
		<!-- [Medium] -->
		
		<!-- [Medium] page number -->
		
		<!-- Artists -->
		
		<!-- Artists page number -->
		
		<!-- [Artist] -->
		
		<!-- [Artist] page number>
		
		<!-- Artwork -->
		
		<!-- Sign in/Register -->
		
		<!-- First time -->

		<!-- New artwork -->
		<xsl:when test="$current-page = 'new'">
			
		</xsl:when>
		


</ul>
</nav>
	

</xsl:choose>
</ul>

<!-- 
	Gallery code
-->
<div class="registry-gallery">
	<ul>
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
					<xsl:text>/artwork/<xsl:text>
					<xsl:xsl:value-of select="@id"/>
				</xsl:attribute>
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="$root"/>
						<xsl:text>/image/1/150/150/</xsl:text>
						<xsl:value-of select="artwork/@path"/>
						<xsl:value-of select="artwork/filename"/>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="artwork/title"/>
					</xsl:attribute>
				</img>
			</a>
			<div>
				<h1>
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
						</xsl:attribute>
						<xsl:value-of select="artwork/title"/>
				
				</h1>
			</div>
		<li>
	</ul>
</div>

<!-- Server side optimization for responsive images -->
		<img>
			<xsl:attribute name="title">
				<xsl:text>Don't forget the title!</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="src">
				<xsl:value-of select="$root"/>
				<xsl:text>/image/x/</xsl:text> <!-- Don't forget to choose what mode you want. -->
				<xsl:choose>
					<xsl:when test="$screen-width &gt; 959">	<!-- Modern desktop -->
						<xsl:text>960</xsl:text>	<!-- Set this to the maximum size of your element at this media query-->
					</xsl:when>
					<xsl:when test="$screen-width &lt; 960 and $screen-width &gt; 480">	<!-- small desktop/handheld -->
						<xsl:text>768</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>480</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text>/0/5</xsl:text>
				<xsl:value-of select="/@path"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="/filename"/>
			</xsl:attribute>
		</img>
