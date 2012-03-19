<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/registry-master.xsl"/>

<xsl:template match="/data">

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
			<xsl:text> before you can view this page</xsl:text>.</p>
	</xsl:when>
	<xsl:otherwise>
		<section role="main" class="announcements">
				<ul>
					<li><a href="#announcements-list">Announcements</a></li>
					<li><a href="#new-announcement">Post a new announcement</a></li>
				</ul>
				<div id="announcements-list">
					<xsl:choose>
						<xsl:when test="registry-announcements/entry">
							<xsl:apply-templates select="registry-announcements/entry"/>
						</xsl:when>
						<xsl:otherwise>
							<p>No announcements have been made yet.</p>
						</xsl:otherwise>
					</xsl:choose>
				</div>
	
				<div id="new-announcement">
					<form action="" method="post">
						<label for="message-title">Title</label>
						<input type="text" id="message-title" name="fields[title]"/>
						<label for="message-message">Announcement</label>
						
						<textarea id="message-message" name="fields[message]">
						</textarea>
						
						<input type="hidden" name="fields[author]" value="{$member-id}"/>
						<input type="submit" name="action[new-announcement]" value="Submit" class="go"/>
					</form>
			
				</div>
	
		</section>
	</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="registry-announcements/entry">
	<section class="announcement">
		<header>
			<img>
				<xsl:attribute name="title">
					<xsl:text>Posted by </xsl:text>
					<xsl:value-of select="/data/registry-announcements-authors/entry[@id=current()/author/item/@id]/name"/>
				</xsl:attribute>
				<xsl:attribute name="src">
					<xsl:choose>
						<xsl:when test="$ds-registry-url">
							<xsl:value-of select="$ds-registry-url"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$root"/>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="/data/registry-announcements-authors/entry[@id=current()/author/item/@id]/profile-image">
							<xsl:text>/image/1/250/0/</xsl:text>
							<xsl:value-of select="/data/registry-announcements-authors/entry[@id=current()/author/item/@id]/profile-image/@path"/>
							<xsl:text>/</xsl:text>
							<xsl:value-of select="/data/registry-announcements-authors/entry[@id=current()/author/item/@id]/profile-image/filename"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>/image/1/250/0/images/avatar.png</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</img>
			<p>Posted by</p>
			<h1><a>
				<xsl:attribute name="href">
					<xsl:text>../artist/</xsl:text>
					<xsl:value-of select="/data/registry-announcements-authors/entry[@id=current()/author/item/@id]/username/@handle"/>
				</xsl:attribute>
				<xsl:value-of select="/data/registry-announcements-authors/entry[@id=current()/author/item/@id]/name"/>
			</a></h1>
			<p>
				<xsl:text>on </xsl:text>
				<xsl:call-template name="format-date">
	   				<xsl:with-param name="date" select="published"/>
	   				<xsl:with-param name="format" select="'M d, t'"/>
	   			</xsl:call-template>
			</p>
		</header>
		<div>
			<h1><xsl:value-of select="title"/></h1>
			<xsl:copy-of select="message/*"/>
		</div>
	</section>

</xsl:template>
</xsl:stylesheet>