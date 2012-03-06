<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/registry-master.xsl"/>

<xsl:param name="url-step"/>

<xsl:template match="/data">
<section role="main">
	<xsl:if test="events/member-login-info/@logged-in = 'yes'">
		<xsl:apply-templates select="registry-edit-current-artist/entry"/>
	</xsl:if>



<xsl:if test="events/member-login-info/@logged-in = 'yes'">
	<nav class="registry-first-time-nav">
		<xsl:call-template name="registry-first-time-timeline"/>
	</nav>
</xsl:if>

<xsl:choose>

<!-- Test if logged in -->
	<xsl:when test="events/member-login-info/@logged-in = 'no'">
		<header class="text">
			<h1>Why, hello there!</h1>
			<p>Let&#8217;s sign you in and get started.</p>
		</header>
		<form method="post" action="" class="registry-log-in">
			<label for="login-username">Your Username</label>
			<input id="login-username" name="fields[username]" type="text" placeholder="Username" required=''/>
			<label for="login-password">Your Password</label>
			<input id="login-password" name="fields[password]" type="password" placeholder="Password" required='' />
		
			<input name="member-action[login]" type="submit" value="Party time!" />
		</form>
	</xsl:when>
	<xsl:otherwise>
		<xsl:choose>
		<!-- Step 2 (step 1 is at end to be default) -->
		    <xsl:when test="$url-step = 2">
		    	<header class="text">
			    	<h1>Tell us your story</h1>
			    	<p>Tell us what you do and what makes your work awesome.</p>
		    	</header>
		    	<form method="post" enctype="multipart/form-data">
		    		<label for="registry-first-time-biography">Biography</label>
		    		<textarea name="fields[biography]" placeholder="Tell us your story.">
		    			<xsl:value-of select="registry-edit-current-artist/entry/biography"/>
		    		</textarea>
		    		
		    		<label for="registry-first-time-interests">How would like to contribute to the community?</label>
		    		<select id="registry-first-time-interests" name="fields[interests][]" multiple="yes">
		    			<xsl:apply-templates select="registry-interest-list/entry"/>				
		    		</select>
		    	<input name="id" value="{$member-id}" type="hidden"/>
		    	<input name="redirect" type="hidden" value="?step=3"/>
		    	<input class="go" name="action[edit-account]" type="submit" value="Next: Contact information"/>
		    	</form>
		    </xsl:when>

		<!-- Step 3 -->
			<xsl:when test="$url-step = 3">
				<header class="text">
				    <h1>Contact Information</h1>
				    <p>How should people contact you?</p>			
			    </header>
			    <form method="post" enctype="multipart/form-data">
			    	<label for="registry-first-time-email">Your email address</label>
			    	<input id="registry-first-time-email" name="fields[email]" type="email">
			    		<xsl:attribute name="value">
			    			<xsl:value-of select="registry-edit-current-artist/entry/email"/>
			    		</xsl:attribute>
			    	</input>
			    	<label for="registry-first-time-phone">Your phone number</label>
			    	<input id="registry-first-time-phone" name="fields[phone]" type="phone">
			    		<xsl:attribute name="value">
			    			<xsl:value-of select="registry-edit-current-artist/entry/phone"/>
			    		</xsl:attribute>
			    	</input>
			    	
			    	<label for="registry-first-time-website">Your website</label>
			    	<input id="registry-first-time-website" name="fields[website]" type="url">
			    		<xsl:attribute name="value">
			    			<xsl:value-of select="registry-edit-current-artist/entry/website"/>
			    		</xsl:attribute>
			    	</input>
			    	
			    	<input name="id" value="{$member-id}" type="hidden"/>
			    <input name="redirect" type="hidden" value="?step=4"/>
			    	<input class="go" name="action[edit-account]" type="submit" value="Next: Social networks"/>
			    </form>
		
			</xsl:when>
				
		<!-- Step 4 -->
			<xsl:when test="$url-step = 4">
				<header class="text">
				    <h1>Social networks</h1>
				    <p>What social networks do you belong to? Only post the ones you wish people to find you on. (Please use the username only unless otherwise noted.)</p>
			    </header>
			    
			    <form method="post" enctype="multipart/form-data">
					<label for="registry-first-time-etsy">Etsy Username</label>
			    	<input id="registry-first-time-esty" name="fields[etsy]" placeholder="Username">
			    		<xsl:attribute name="value">
			    			<xsl:value-of select="registry-edit-current-artist/entry/etsy"/>
			    		</xsl:attribute>
			    	</input>
			    	<label for="registry-first-time-facebook">Facebook URL</label>
			    	<input id="registry-first-time-facebook" name="fields[facebook]" placeholder="http://facebook.com/xxxxxxxxx">
			    		<xsl:attribute name="value">
			    			<xsl:value-of select="registry-edit-current-artist/entry/facebook"/>
			    		</xsl:attribute>
			    	</input>
		
			    	<label for="registry-first-time-flickr">Flickr Username</label>
			    	<input id="registry-first-time-" name="fields[flickr]" placeholder="Username">
			    		<xsl:attribute name="value">
			    			<xsl:value-of select="registry-edit-current-artist/entry/flickr"/>
			    		</xsl:attribute>
			    	</input>
		
		
			    	<label for="registry-first-time-google-plus">Google+ URL</label>
			    	<input id="registry-first-time-" name="fields[google-plus]" placeholder="http://plus.google.com/u/xxxxxxxxxx">
			    		<xsl:attribute name="value">
			    			<xsl:value-of select="registry-edit-current-artist/entry/google-plus"/>
			    		</xsl:attribute>
			    	</input>
		
			    	<label for="registry-first-time-twitter">Twitter username</label>
			    	<input id="registry-first-time-" name="fields[twitter]" placeholder="Username">
			    		<xsl:attribute name="value">
			    			<xsl:value-of select="registry-edit-current-artist/entry/twitter"/>
			    		</xsl:attribute>
			    	</input>
		
			    	<label for="registry-first-time-vimeo">Vimeo username</label>
			    	<input id="registry-first-time-vimeo" name="fields[vimeo]" placeholder="Username">
			    		<xsl:attribute name="value">
			    			<xsl:value-of select="registry-edit-current-artist/entry/vimeo"/>
			    		</xsl:attribute>
			    	</input>
		
			    	<label for="registry-first-time-youtube">Youtube username</label>
			    	<input id="registry-first-time-youtube" name="fields[youtube]" placeholder="Username">
			    		<xsl:attribute name="value">
			    			<xsl:value-of select="registry-edit-current-artist/entry/youtube"/>
			    		</xsl:attribute>
			    	</input>
		
			    	<input name="id" value="{$member-id}" type="hidden"/>
			    <input name="redirect" type="hidden" value="?step=5"/>
			    	<input class="go" name="action[edit-account]" type="submit" value="Next: Almost there"/>
			    </form>
			</xsl:when>
			
		<!-- Step 5: Compete! -->
			<xsl:when test="$url-step = 5">
		    	<h1>All done!</h1>
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
		    			<xsl:text>/new</xsl:text>
		    		</xsl:attribute>
		    		<xsl:text>Upload your first piece of art!</xsl:text>
		    	</a>
		    </xsl:when>
		
		<!-- Step 1 -->
			<xsl:otherwise>
				<header class="text">
					<xsl:choose>
						<xsl:when test="$url-step = 1">
							<h1>Step 1: The Basics</h1>
							<p>Upload a new profile picture, tell us your name.</p>
						</xsl:when>
						<xsl:otherwise>
							<h1><xsl:value-of select="$ds-registry-logged-in-artist"/>, welcome!</h1>
							<p>Please spend a few moments to tell us more about yourself by filling 
							out your profile. You can start by uploading a profile picture and telling us your name. (You will be able to change your username after you have finished filling out your profile.)</p>
						</xsl:otherwise>
					</xsl:choose>
				</header>

				<xsl:choose>
					<xsl:when test="registry-edit-current-artist/entry/profile-image">
						<form method="post" enctype="multipart/form-data" class="form-upload-avatar">
    				    	<img>
    				    		<xsl:attribute name="title">
    					    		<xsl:choose>
    				    				<xsl:when test="$url-step">
    				    					<xsl:text>Your profile picture</xsl:text>
    				    				</xsl:when>
    				    				<xsl:otherwise>
    				    					<xsl:text>This is what people will see if you do not upload a profile picture.</xsl:text>
    				    				</xsl:otherwise>
    					    		</xsl:choose>
    					    	</xsl:attribute>
    				    		<xsl:attribute name="src">
    				    			<xsl:value-of select="$root"/>
    				    			<xsl:text>/image/1/300/0/</xsl:text>
    						    	<xsl:value-of select="registry-edit-current-artist/entry/profile-image/@path"/>
    						    	<xsl:text>/</xsl:text>
    						    	<xsl:value-of select="registry-edit-current-artist/entry/profile-image/filename"/>
    				    		</xsl:attribute>
					    	</img>
					    	<fieldset class="registry-upload">
								<label for="registry-first-time-profile-image">Upload a new profile picture</label>
								<input id="registry-first-time-profile-image" name="fields[profile-image]" type="file"/>
								<input name="id" type="hidden" value="{$member-id}"/>
								<input name="redirect" type="hidden" value="?step=1"/>
								<input type="submit" name="action[edit-account]" value="Upload"/>
							</fieldset>
						</form>
						<form method="post" enctype="multipart/form-data">
							<label for="registry-first-time-profile-name">Tell us your name</label>
							<input id="registry-first-time-profile-name" type="text" name="fields[name]">
							    <xsl:attribute name="value">
							    	<xsl:value-of select="registry-edit-current-artist/entry/name"/>
							    </xsl:attribute>
							</input>
							<input name="id" type="hidden" value="{$member-id}"/>
							<input name="redirect" type="hidden" value="?step=2"/>
							<input class="go" type="submit" name="action[edit-account]" value="Next: Your story"/>
						</form>
					</xsl:when>
					<xsl:otherwise>
						<form method="post" enctype="multipart/form-data" class="form-upload-avatar">
    				    	<img>
    				    		<xsl:attribute name="title">
    					    		<xsl:choose>
    				    				<xsl:when test="$url-step">
    				    					<xsl:text>Your profile picture</xsl:text>
    				    				</xsl:when>
    				    				<xsl:otherwise>
    				    					<xsl:text>This is what people will see if you do not upload a profile picture.</xsl:text>
    				    				</xsl:otherwise>
    					    		</xsl:choose>
    					    	</xsl:attribute>
    				    		<xsl:attribute name="src">
    				    			<xsl:value-of select="$root"/>
    				    			<xsl:text>/image/1/250/0/images/avatar.png</xsl:text>
    				    		</xsl:attribute>
					    	</img>
					    	<fieldset class="registry-upload">
								<label for="registry-first-time-profile-image">Upload a new profile picture</label>
								<input id="registry-first-time-profile-image" name="fields[profile-image]" type="file"/>
					
							</fieldset>
							<label for="registry-first-time-profile-name">Tell us your name</label>
							<input id="registry-first-time-profile-name" type="text" name="fields[name]">
							    <xsl:attribute name="value">
							    	<xsl:value-of select="registry-edit-current-artist/entry/name"/>
							    </xsl:attribute>
							</input>
							<input name="id" type="hidden" value="{$member-id}"/>
							<input name="redirect" type="hidden" value="?step=2"/>
							<input type="submit" name="action[edit-account]" value="Next: Your story" class="go"/>
						</form>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:otherwise>
</xsl:choose>
</section>
</xsl:template>

<xsl:template name="registry-first-time-timeline">
		<ol class="registry-first-time-steps">

			<!-- Step 1 -->
			<li>
				<xsl:if test="$url-step &gt; '1'">
					<xsl:attribute name="class">
						<xsl:text>registry-step-complete</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="$url-step &gt; 1">				
						<a href="?step=1">Step 1: The Basics</a>
					</xsl:when>
					<xsl:otherwise>
						<mark>Step 1: The Basics</mark>
					</xsl:otherwise>
				</xsl:choose>

			</li>
			
			<!-- Step 2 -->
			<li>
				<xsl:if test="$url-step &gt; 2">
					<xsl:attribute name="class">
						<xsl:text>registry-step-complete</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="$url-step = 2">
						<mark>Step 2: Your story</mark>
					</xsl:when>
					<xsl:otherwise>
						<a href="?step=2">Step 2: Your story</a>
					</xsl:otherwise>
				</xsl:choose>
			</li>

			<!-- Step 3 -->
			<li>
				<xsl:if test="$url-step &gt; 3">
					<xsl:attribute name="class">
						<xsl:text>registry-step-complete</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="$url-step = 3">
						<mark>Step 3: Contact information</mark>
					</xsl:when>
					<xsl:otherwise>
						<a href="?step=3">Step 3: Contact information</a>
					</xsl:otherwise>
				</xsl:choose>			
			</li>

			<!-- Step 4 -->
			<li>
				<xsl:if test="$url-step &gt; 4">
					<xsl:attribute name="class">
						<xsl:text>registry-step-complete</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="$url-step = 4">
						<mark>Step 4: Being social</mark>
					</xsl:when>
					<xsl:otherwise>
						<a href="?step=4">Step 4: Being social</a>
					</xsl:otherwise>
				</xsl:choose>
			</li>

			<!-- Step 5 -->
			<li>
				<xsl:choose>
					<xsl:when test="$url-step = 5">
						<mark>Step 5: Publish</mark>
					</xsl:when>
					<xsl:otherwise>
						<a href="?step=5">Step 5: Publish</a>
					</xsl:otherwise>
				</xsl:choose>
			</li>
		</ol>

</xsl:template>

<xsl:template match="registry-edit-current-artist/entry">
	<xsl:call-template name="edit-artist-header"/>
</xsl:template>
</xsl:stylesheet>