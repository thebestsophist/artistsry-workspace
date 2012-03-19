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
		<h1><xsl:value-of select="$page-title"/></h1>
	
		<form method="post" enctype="multipart/form-data" class="form-upload-avatar">
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="$root"/>
						<xsl:text>/image/1/250/0/</xsl:text>
						<xsl:choose>
							<xsl:when test="registry-edit-current-artist/entry/profile-image">
								<xsl:value-of select="registry-edit-current-artist/entry/profile-image/@path"/>
								<xsl:text>/</xsl:text>
								<xsl:value-of select="registry-edit-current-artist/entry/profile-image/filename"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>/images/avatar.png</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
							
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:text>Your current profile picture</xsl:text>
					</xsl:attribute>
				</img>
				<label for="registry-profile-settings-picture">Change your profile picture</label>
				<input id="registry-profile-settings-picture" type="file" name="fields[profile-image]" value="Choose an image"/>
				<input name="id" type="hidden" value="{$member-id}"/>
				<input class="go" type="submit" name="action[edit-account]">
					<xsl:attribute name="value">
						<xsl:choose>
							<xsl:when test="registry-edit-current-artist/entry/profile-image">
								<xsl:text>Change your profile picture</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>Upload a profile picture</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</input>
		</form>
	</xsl:otherwise>
</xsl:choose>
	</section>
	<section role="complimentary">
	</section>
</xsl:template>
</xsl:stylesheet>