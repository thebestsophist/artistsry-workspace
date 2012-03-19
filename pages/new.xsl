<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/registry-master.xsl"/>

<xsl:template match="/data">
<section role="main">

<xsl:choose>
	<xsl:when test="$is-logged-in = 'no'">
		<h1>Oops!</h1>
		<p>You need to 
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
			<xsl:text> before you can upload new artwork.</xsl:text></p>
	</xsl:when>

	<xsl:otherwise>
		<xsl:choose>
			<xsl:when test="//events/upload-art/@type = 'created'">
				<h1>Add a description</h1>
				<xsl:apply-templates select="registry-edit-new-upload/entry"/>
			</xsl:when>
			<xsl:when test="//events/upload-art/@type = 'edited'">
				<xsl:choose>
					<xsl:when test="//events/upload-art/post-values/publish = 'on'">
						<h1>Done!</h1>
					    <p>Woohoo! Your art has been posted, you can 
					    	<a>
					    		<xsl:attribute name="href">
					    			<xsl:choose>
					    				<xsl:when test="$ds-registry-url = ''">
					    					<xsl:value-of select="root"/>
					    				</xsl:when>
					    				<xsl:otherwise>
					    					<xsl:value-of select="$ds-registry-url"/>
					    				</xsl:otherwise>
					    			</xsl:choose>
					    			<xsl:text>/artist/</xsl:text>
					    			<xsl:value-of select="$ds-registry-logged-in-artist"/>
					    			<xsl:text>/</xsl:text>
					    			<xsl:value-of select="registry-edit-new-upload/entry/@id"/>
					    		</xsl:attribute>
					    		<xsl:text>view it now</xsl:text>
					    	</a>, 
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
					    			<xsl:text>/new/</xsl:text>
					    		</xsl:attribute>
					    		<xsl:text>upload another</xsl:text>
					    	</a>,
					    	 or make more edits below.
					    </p>
						<xsl:apply-templates select="registry-edit-new-upload/entry"/>
					</xsl:when>
					<xsl:otherwise>
						<h1>Updates saved</h1>
						<p>Your updates have been saved. You can make edits below, publish your artwork, or return later to publish the piece.</p>
						<xsl:apply-templates select="registry-edit-new-upload/entry"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			
			<!-- Defaults to basic upload field -->
			<xsl:otherwise>
				<h1>Upload new artwork</h1>
				<xsl:call-template name="registry-upload"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:otherwise>
</xsl:choose>


</section>
</xsl:template>

<!-- First upload -->
<xsl:template name="registry-upload">

		<p>
			<xsl:choose>
				<xsl:when test="events/upload-art/artwork/@type = 'invalid'">
					
					<xsl:attribute name="class">
						<xsl:text>error</xsl:text>
					</xsl:attribute>
						<xsl:text>Oops, you can only upload JPG, PNG, or GIF files larger than 800&#215;600 pixels. I&#8217;ll resize it for you if it is too big.</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>JPG, PNG, or GIF. At least 800&#215;600 pixels. I&#8217;ll resize it for you if it is too big.</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</p>

	<form method="post" action="" enctype="multipart/form-data" class="registry-upload">

	    <label for="registry-upload">Choose a picture to upload</label>
	    <input id="registry-upload" name="fields[artwork]" type="file" accept="image/*" />
	
	    <input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
	    <input name="fields[title]" type="hidden" value="Untitled" />
	    <input name="fields[artist]" type="hidden" value="{$member-id}" />
	    <input name="action[upload-art]" type="submit" value="Go!" />
	</form>

</xsl:template>

<!-- Edit upload -->
<xsl:template match="registry-edit-new-upload/entry">
	<xsl:call-template name="registry-edit-artwork"/>
</xsl:template>

</xsl:stylesheet>