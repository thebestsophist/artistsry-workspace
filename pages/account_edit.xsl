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
	<form method="post" enctype="multipart/form-data" class="edit-account">
		<ul>
			<li><a href="#basics">The Basics</a></li>
			<li><a href="#change-password">Username &amp; Password</a></li>
			<li><a href="#biography">About Yourself</a></li>
			<li><a href="#social">Social Media</a></li>
		</ul>

			<fieldset id="basics" class="panel">
				<legend>The basics</legend>
				
				<label for="registry-profile-settings-email">Your email address</label>
				<input id="registry-profile-settings-email" name="fields[email]" type="email" placeholder="you@example.com">
					<xsl:attribute name="value">
						<xsl:value-of select="registry-edit-current-artist/entry/email"/>
					</xsl:attribute>
				</input>
				<label for="registry-profile-settings-phone">Your phone number</label>
				<input id="registry-profile-settings-phone" name="fields[phone]" type="phone" placeholder="123.456.7890">
					<xsl:if test="registry-edit-current-artist/entry/phone">
						<xsl:attribute name="value">
							<xsl:value-of select="registry-edit-current-artist/entry/phone"/>
						</xsl:attribute>
					</xsl:if>
				</input>
				
				
				<label for="registry-profile-settings-website">Your website</label>
				<input id="registry-profile-settings-website" name="fields[website]" type="url" placeholder="http://example.com">
					<xsl:if test="registry-edit-current-artist/entry/website">
						<xsl:attribute name="value">
							<xsl:value-of select="registry-edit-current-artist/entry/website"/>
						</xsl:attribute>
					</xsl:if>
				</input>
		
			</fieldset>
		
			<fieldset id="change-password" class="panel">
				<legend>Change your username &amp; password</legend>
				<label for="registry-profile-settings-username">Your username</label>
				<input id="registry-profile-settings-username" name="fields[username]" type="text">
					<xsl:attribute name="value">
						<xsl:value-of select="$ds-registry-logged-in-artist"/>
					</xsl:attribute>
				</input>
				<p>Your username is what you use to sign in to this site. It also determines the URL of your profile. You will need to sign out and back in if you change your username.</p>

				<label for="registry-profile-settings-password">Choose a new password</label>
				<input id="registry-profile-settings-password" name="fields[password][password]" type="password"/>
				
				<label for="registry-profile-settings-confirm">Confirm your new password</label>
				<input id="registry-profile-settings-confirm" name="fields[password][confirm]" type="password"/>
			</fieldset>
			
			<fieldset id="biography" class="panel">
				<legend>Tell us of yourself</legend>
		
				<label for="registry-profile-settings-name">Your name</label>
				<input id="registry-profile-settings-name" name="fields[name]" type="text">
					<xsl:attribute name="value">
						<xsl:value-of select="registry-edit-current-artist/entry/name"/>
					</xsl:attribute>
				</input>
		
				<label for="registry-profile-settings-biography">Biography</label>
				<textarea id="registry-profile-settings-biography" name="fields[biography]">
					<xsl:value-of select="registry-edit-current-artist/entry/biography"/>
				</textarea>
				
				<label for="registry-profile-settings-interests">How would like to contribute to the community?</label>
				<select id="registry-profile-settings-interests" name="fields[interests][]" multiple="yes">
					<xsl:apply-templates select="registry-interest-list/entry"/>				
				</select>
			</fieldset>
		
			<fieldset id="social" class="panel">
				<legend>Social Networks</legend>
				<label for="registry-profile-settings-etsy">Etsy</label>
				<input id="registry-profile-settings-etsy" name="fields[etsy]" type="text" placeholder="Username">
					<xsl:attribute name="value">
						<xsl:value-of select="registry-edit-current-artist/entry/etsy"/>
					</xsl:attribute>
				</input>


				<label for="registry-profile-settings-facebook">Facebook</label>
				<input id="registry-profile-settings-facebook" name="fields[facebook]" type="text" placeholder="http://facebook.com/xxxxxxxxx">
					<xsl:attribute name="value">
						<xsl:value-of select="registry-edit-current-artist/entry/facebook"/>
					</xsl:attribute>
				</input>			
		
				<label for="registry-profile-settings-flickr">Flickr</label>
				<input id="registry-profile-settings-flickr" name="fields[flickr]" type="text" placeholder="Username">
					<xsl:attribute name="value">
						<xsl:value-of select="registry-edit-current-artist/entry/flickr"/>
					</xsl:attribute>	
				</input>			
		
				<label for="registry-profile-settings-googleplus">Google Plus</label>
				<input id="registry-profile-settings-googleplus" name="fields[google-plus]" type="url" placeholder="http://plus.google.com/u/xxxxxxxxxx">
					<xsl:attribute name="value">
						<xsl:value-of select="registry-edit-current-artist/entry/google-plus"/>
					</xsl:attribute>	
				</input>			
		
				<label for="registry-profile-settings-twitter">Twitter</label>
				<input id="registry-profile-settings-twitter" name="fields[twitter]" type="text" placeholder="Username">
					<xsl:attribute name="value">
						<xsl:value-of select="registry-edit-current-artist/entry/twitter"/>
					</xsl:attribute>	
				</input>
		
				<label for="registry-profile-settings-vimeo">Vimeo</label>
				<input id="registry-profile-settings-" name="fields[vimeo]" type="text" placeholder="Username">
					<xsl:attribute name="value">
						<xsl:value-of select="registry-edit-current-artist/entry/vimeo"/>
					</xsl:attribute>
				</input>
		
				<label for="registry-profile-settings-youtube">Youtube</label>
				<input id="registry-profile-settings-youtube" name="fields[youtube]" type="text" placeholder="Username">
					<xsl:attribute name="value">
						<xsl:value-of select="registry-edit-current-artist/entry/youtube"/>
					</xsl:attribute>
				</input>
		
			</fieldset>

		<input name="id" type="hidden" value="{$member-id}" />
		<div class="choose">
			<input name="action[edit-account]" value="Update" class="go" type="submit"/>
		</div>
	</form>
</xsl:otherwise>
</xsl:choose>


	</section>
	<section role="complimentary">
	</section>
</xsl:template>
</xsl:stylesheet>