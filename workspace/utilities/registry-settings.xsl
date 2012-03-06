<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- 
	This utility serves as a compilation of all the XSL templates
	for the Artists' Registry's global settings.
	This includes the page title, page-specific DOM attributes, 
-->

<!-- Page title -->
<xsl:template name="registry-page-title">
	<xsl:value-of select="$website-name" disable-output-escaping="yes"/>
	<xsl:text> &#8212; </xsl:text>
	<xsl:value-of select="$page-title"/>
</xsl:template>


<!-- Page header -->
<xsl:template name="registry-page-header">

<h1>
	<xsl:choose>
		<!-- Artist Profile -->
		<xsl:when test="$page-title = 'Artist Profile'">
			<xsl:value-of select="//registry-current-artist/entry/name"/>
		</xsl:when>
		<!-- Artwork Page -->
		<xsl:when test="$page-title = 'Artwork Page'">
			<xsl:value-of select="//registry-current-artwork/entry/Title"/>
		</xsl:when>
		
		<xsl:otherwise>
			<xsl:value-of select="$page-title"/>
		</xsl:otherwise>
	</xsl:choose>
</h1>
</xsl:template>

<!--
	Checks if the visitor is signed in, if not offers sign in/registration 
	 (according to open registration settings).
-->
<xsl:template name="registry-user-nav">
		    	<xsl:choose>
		    		<xsl:when test="$is-logged-in = 'yes'">
		    			<xsl:choose>
						    <xsl:when test="$ds-registry-url">
						    	<li class="upload">
						    		<xsl:choose>
						    			<xsl:when test="$current-page = 'new'">
								    		<mark><a href="{$ds-registry-url}/new">Upload</a></mark>
								    	</xsl:when>
								    	<xsl:otherwise>
									    	<a href="{$ds-registry-url}/new">Upload</a>
									    </xsl:otherwise>
							    	</xsl:choose>
						    	</li>
						    	<li>
					    			<a href="{$ds-registry-url}/artist/{$ds-registry-logged-in-artist}">Your Profile</a>
							    </li>
						    	<li>
						    		<xsl:choose>
						    			<xsl:when test="$current-page = 'account'">
							    			<mark><a href="{$ds-registry-url}/account">Your Account</a></mark>
							    		</xsl:when>
							    		<xsl:otherwise>
							    			<a href="{$ds-registry-url}/account">Your Account</a>
							    		</xsl:otherwise>
							    	</xsl:choose>
						    	</li>
			    		    	<li><a href="{$ds-registry-url}?member-action=logout">Sign out</a></li>
			    		    </xsl:when>

			    		    <xsl:otherwise>
						    	<li class="upload">
						    		<xsl:choose>
						    			<xsl:when test="$current-page = 'new'">
								    		<mark><a href="{$root}/new">Upload</a></mark>
								    	</xsl:when>
								    	<xsl:otherwise>
									    	<a href="{$root}/new">Upload</a>
									    </xsl:otherwise>
							    	</xsl:choose>
						    	</li>
						    	<li>
					    			<a href="{$root}/artist/{$ds-registry-logged-in-artist}">Your Profile</a>
							    </li>
						    	<li>
						    		<xsl:choose>
						    			<xsl:when test="$current-page = 'account'">
							    			<mark><a href="{$root}/account">Account Settings</a></mark>
							    		</xsl:when>
							    		<xsl:otherwise>
							    			<a href="{$root}/account">Account Settings</a>
							    		</xsl:otherwise>
							    	</xsl:choose>
						    	</li>
			    		    	<li><a href="{$root}?member-action=logout">Sign out</a></li>
			    		    </xsl:otherwise>
		    			</xsl:choose>
		    		</xsl:when>
		    		<xsl:otherwise>
				    	<li>
				    		<xsl:choose>
				    			<xsl:when test="$ds-registry-open-registration = 'Yes'">
				    			
									<xsl:choose>
										<xsl:when test="$ds-registry-url = ''">
											<xsl:choose>
												<xsl:when test="$root-page = 'sign-in'">
													<mark>
														<a href="{$root}/sign-in">Log in/Register</a>
													</mark>
												</xsl:when>
												<xsl:otherwise>
													<a href="{$root}/sign-in">Sign in/Register</a>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>
											<xsl:choose>
												<xsl:when test="$root-page = 'sign-in'">
													<a href="{$ds-registry-url}/log-in">Sign in/Register</a>
												</xsl:when>
												<xsl:otherwise>
													<a href="{$ds-registry-url}/log-in">Sign in/Register</a>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
				    			</xsl:when>

				    			<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="$ds-registry-url = ''">
											<xsl:choose>
												<xsl:when test="$root-page = 'sign-in'">
													<mark>
														<a href="{$root}/sign-in">Sign in</a>
													</mark>
												</xsl:when>
												<xsl:otherwise>
													<a href="{$root}/sign-in">Sign in</a>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>
											<xsl:choose>
												<xsl:when test="$root-page = 'sign-in'">
													<mark>
														<a href="{$ds-registry-url}/sign-in">Sign in</a>
													</mark>
												</xsl:when>
												<xsl:otherwise>
													<a href="{$ds-registry-url}/sign-in">Sign in</a>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
				    			</xsl:otherwise>
				    		</xsl:choose>
				    	</li>
		    		</xsl:otherwise>
		    	</xsl:choose>
</xsl:template>

<!--
	Main navigation for the registry
-->
<xsl:template name="registry-nav">
	<xsl:choose>
		<xsl:when test="$ds-registry-url = ''">
			<li>
				<xsl:choose>
					<xsl:when test="$current-page = 'explore'">
						<mark><a href="{$root}">Explore</a></mark>
					</xsl:when>
					<xsl:otherwise>
						<a href="{$root}/">Explore</a>
					</xsl:otherwise>
				</xsl:choose>
			</li>
			<li>
				<xsl:choose>
					<xsl:when test="$root-page = 'tag'">
						<mark><a href="{$root}/tag">Tags</a></mark>
					</xsl:when>
					<xsl:otherwise>
						<a href="{$root}/tag">Tags</a>
					</xsl:otherwise>
				</xsl:choose>
			</li>
			<li>
				<xsl:choose>
					<xsl:when test="$root-page = 'interest'">
						<mark><a href="{$root}/interest">Interests</a></mark>
					</xsl:when>
					<xsl:otherwise>
						<a href="{$root}/interest">Interests</a>
					</xsl:otherwise>
				</xsl:choose>
			</li>
			<li>
				<xsl:choose>
					<xsl:when test="$root-page = 'artist'">
						<mark><a href="{$root}/artist">Artists</a></mark>
					</xsl:when>
					<xsl:otherwise>
						<a href="{$root}/artist">Artists</a>
					</xsl:otherwise>
				</xsl:choose>
			</li>
    		<xsl:if test="$is-logged-in = 'yes'">
    			<li>
    				<xsl:choose>
    					<xsl:when test="$root-page = 'announcements'">
    						<mark><a href="{$root}/announcements">Announcements</a></mark>
    					</xsl:when>
    					<xsl:otherwise>
    						<a href="{$root}/announcements">Announcements</a>
    					</xsl:otherwise>
    				</xsl:choose>
    			</li>
    		</xsl:if>
			
    	</xsl:when>
		<xsl:otherwise>
			<li>
				<xsl:choose>
					<xsl:when test="$root-page = 'explore'">
						<mark><a href="{$ds-registry-url}">Explore</a></mark>
					</xsl:when>
					<xsl:otherwise>
						<a href="{$ds-registry-url}/">Explore</a>
					</xsl:otherwise>
				</xsl:choose>
			</li>
			<li>
				<xsl:choose>
					<xsl:when test="$root-page = 'tag'">
						<mark><a href="{$ds-registry-url}/tag">Tags</a></mark>
					</xsl:when>
					<xsl:otherwise>
						<a href="{$ds-registry-url}/tag">Tags</a>
					</xsl:otherwise>
				</xsl:choose>
			</li>
			<li>
				<xsl:choose>
					<xsl:when test="$root-page = 'interest'">
						<mark><a href="{$ds-registry-url}/interest">Interests</a></mark>
					</xsl:when>
					<xsl:otherwise>
						<a href="{$ds-registry-url}/interest">Interests</a>
					</xsl:otherwise>
				</xsl:choose>
			</li>
			<li>
				<xsl:choose>
					<xsl:when test="$root-page = 'artist'">
						<mark><a href="{$ds-registry-url}/artist">Artists</a></mark>
					</xsl:when>
					<xsl:otherwise>
						<a href="{$ds-registry-url}/artist">Artists</a>
					</xsl:otherwise>
				</xsl:choose>
			</li>
			
    		<xsl:if test="$is-logged-in = 'yes'">
    			<li>
    				<xsl:choose>
    					<xsl:when test="$root-page = 'announcements'">
    						<mark><a href="{$ds-registry-url}/announcements">Announcements</a></mark>
    					</xsl:when>
    					<xsl:otherwise>
    						<a href="{$ds-registry-url}/announcements">Announcements</a>
    					</xsl:otherwise>
    				</xsl:choose>
    			</li>
    		</xsl:if>

		</xsl:otherwise>
	</xsl:choose>
	
</xsl:template>

<!--
	Form for editing artwork
-->
<xsl:template name="registry-edit-artwork">
<section>
	<div>
		<img>
			<xsl:attribute name="title">
				<xsl:choose>
					<xsl:when test="$current-page = 'new'">
						<xsl:choose>
							<xsl:when test="//upload-art/@type='created'">
								<xsl:text>I need a title!</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="//upload-art/post-values/title"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="title"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="src">
				<xsl:value-of select="$root"/>
				<xsl:text>/image/2/700/0/5</xsl:text>
				<xsl:value-of select="artwork/@path"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="artwork/filename"/>
			</xsl:attribute>
		</img>
 	</div>
 	
		<form method="post" enctype="multipart/form-data" autocomplete="off" class="edit-artwork">
		
		<!-- Title -->
			<label for="registry-upload-title">Title this beauty</label>
			<input id="registry-upload-title" name="fields[title]" type="text" placeholder="What is the title for this piece?" required=''>
				<xsl:attribute name="value">
				    <xsl:choose>
				    	<xsl:when test="$current-page = 'new'">
				    		<xsl:choose>
				    			<xsl:when test="//upload-art/@type = 'created'">
				    				<xsl:value-of select="//upload-art/post-values/artwork/name"/>
				    			</xsl:when>
				    			<xsl:otherwise>
				    				<xsl:value-of select="title"/>
				    			</xsl:otherwise>
				    		</xsl:choose>
				    	</xsl:when>
				    	<xsl:otherwise>
				    		<xsl:value-of select="title"/>
				    	</xsl:otherwise>
				    </xsl:choose>
				</xsl:attribute>
			</input>
		<!-- Description -->
			<label for="registry-upload-description">Add a description</label>
			<textarea id="registry-upload-description" name="fields[description]" placeholder="Tell us about this piece.">
				<xsl:value-of select="description"/>
			</textarea>
		<!-- Tags -->
			<label for="registry-upload-tags">Add tags (Separate tags with commas)</label>
			<input id="registry-upload-tags" name="fields[artwork-tags]" type="text" placeholder="(e.g. oil on canvas, sculpture, painting, Impressionist)">
			    <xsl:attribute name="value">
			    	<xsl:choose>
			    		<xsl:when test="$current-page = 'new'">
							<xsl:value-of select="$ds-registry-edit-new-upload"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$ds-registry-edit-current-artwork"/>
						</xsl:otherwise>
					</xsl:choose>
			    </xsl:attribute>
			</input>

		<!-- Publish? -->
			<xsl:choose>
				<xsl:when test="$current-page = 'new'">
					<input type="hidden" name="fields[publish]" value="yes"/>
				</xsl:when>
				<xsl:otherwise>
					<label for="registry-publish" class="checkbox">
						<xsl:text>Would you like to publish this picture immediately?</xsl:text>
					</label>
					<input id="registry-publish" type="checkbox" name="fields[publish]"/>
				</xsl:otherwise>
			</xsl:choose>
		<!-- Tasty hidden fields -->
			<input name="id" type="hidden">
				<xsl:attribute name="value">
					<xsl:value-of select="@id"/>
				</xsl:attribute>
			</input>
			<input name="fields[artist]" type="hidden" value="{$member-id}"/>
			
			<div class="choose">
			<!-- Submit -->
				<input class="go" type="submit">
				    <xsl:attribute name="name">
		    			<xsl:text>action[upload-art]</xsl:text>
				    </xsl:attribute>
				    <xsl:attribute name="value">
				    	<xsl:choose>
					    	<xsl:when test="$current-page = 'new'">
					    		<xsl:text>Publish</xsl:text>
					    	</xsl:when>
					    	<xsl:otherwise>
					    		<xsl:text>Save</xsl:text>
					    	</xsl:otherwise>
				    	</xsl:choose>
				    </xsl:attribute>
				</input>
	
			<!-- Cancel -->
	    		<input class="kill" name="action[cancel-upload]" type="submit">
	    			<xsl:attribute name="value">
	    				<xsl:choose>
	    					<xsl:when test="$current-page = 'new'">
	    						<xsl:text>Reset</xsl:text>
	    					</xsl:when>
	    					<xsl:otherwise>
	    						<xsl:text>Delete</xsl:text>
	    					</xsl:otherwise>
	    				</xsl:choose>
	    			</xsl:attribute>
				</input>
			</div>
		</form>		
</section>
</xsl:template>

<!--
	Banner for artists' profiles
-->
<xsl:template name="registry-artist-banner">
	<header class="current-artist">
		<img>
			<xsl:attribute name="src">
				<xsl:value-of select="$root"/>
				<xsl:text>/image/2/174/144/5</xsl:text>
				<xsl:choose>
					<xsl:when test="//registry-current-artist/entry/profile-image">
						<xsl:value-of select="//registry-current-artist/entry/profile-image/@path"/>
						<xsl:text>/</xsl:text>
						<xsl:value-of select="//registry-current-artist/entry/profile-image/filename"/>
					</xsl:when>
					<!-- Choose the default avatar when no profile image -->
					<xsl:otherwise>
						<xsl:text>/images/avatar.png</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:text>Picture of </xsl:text>
				<xsl:value-of select="//registry-current-artist/entry/name"/>
			</xsl:attribute>
		</img>
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
					<xsl:text>/artist/</xsl:text>
					<xsl:value-of select="//registry-current-artist/entry/username/@handle"/>
				</xsl:attribute>
				<xsl:value-of select="//registry-current-artist/entry/name"/>
			</a>
		</h1>
		<ul class="registry-contact">
			<xsl:if test="//registry-current-artist/entry/website">
				<li class="website">
					<a>
						<xsl:attribute name="href">
							<xsl:choose>
								<xsl:when test="starts-with(//registry-current-artist/entry/website, 'http://') or starts-with(current-public-note/entry/url, 'https://')">
									<xsl:value-of select="//registry-current-artist/entry/website"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>http://</xsl:text>
									<xsl:value-of select="//registry-current-artist/entry/website"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						<xsl:choose>
							<xsl:when test="string-length(//registry-current-artist/entry/website) &gt; 50">
								<xsl:value-of select="substring(//registry-current-artist/entry/website, 1, 50)"/>
								<xsl:text>…</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="//registry-current-artist/entry/website"/>
							</xsl:otherwise>
						</xsl:choose>
					</a>
				</li>
			</xsl:if>
			<xsl:if test="//registry-current-artist/entry/phone">
				<li class="phone"><xsl:value-of select="//registry-current-artist/entry/phone"/></li>
			</xsl:if>
		</ul>

		<!-- Social media bits -->
		<ul class="registry-artist-social">
			<!-- Etsy -->
			<xsl:if test="//registry-current-artist/entry/etsy">
				<li>
					<a>
						<xsl:attribute name="href">
							<xsl:text>http://www.etsy.com/shop/</xsl:text>
							<xsl:value-of select="//registry-current-artist/entry/etsy"/>
						</xsl:attribute>
						<img src="{$workspace}/images/social/etsy.png" title="Buy my stuff on Etsy"/>
					</a>
				</li>
			</xsl:if>

			<!-- Facebook -->
			<xsl:if test="//registry-current-artist/entry/facebook">
				<li>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="//registry-current-artist/entry/facebook"/>
						</xsl:attribute>
						<img src="{$workspace}/images/social/facebook.png" title="Find me on Facebook"/>
					</a>
				</li>
			</xsl:if>

			<!-- Flickr -->
			<xsl:if test="//registry-current-artist/entry/flickr">
				<li>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="//registry-current-artist/entry/flickr"/>
						</xsl:attribute>
						<img src="{$workspace}/images/social/flickr.png" title="See my photos on Flickr"/>
					</a>
				</li>
			</xsl:if>
			
			<!-- Google + -->
			<xsl:if test="//registry-current-artist/entry/google-plus">
				<li>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="//registry-current-artist/entry/google-plus"/>
						</xsl:attribute>
						<img src="{$workspace}/images/social/gplus.png" title="Circle me on Google Plus"/>
					</a>
				</li>
			</xsl:if>
			
			<!-- Twitter -->
			<xsl:if test="//registry-current-artist/entry/twitter">
				<li>
					<a>
						<xsl:attribute name="href">
							<xsl:text>http://twitter.com/</xsl:text>
							<xsl:value-of select="//registry-current-artist/entry/twitter"/>
						</xsl:attribute>
						<img src="{$workspace}/images/social/twitter.png" title="Follow me on Twitter"/>
					</a>
				</li>
			</xsl:if>

			<!-- Vimeo -->
			<xsl:if test="//registry-current-artist/entry/vimeo">
				<li>
					<a>
						<xsl:attribute name="href">
							<xsl:text>http://vimeo.com/</xsl:text>
							<xsl:value-of select="//registry-current-artist/entry/vimeo"/>
						</xsl:attribute>
						<img src="{$workspace}/images/social/vimeo.png" title="Find my videos on Vimeo"/>
					</a>
				</li>
			</xsl:if>

			<!-- Youtube -->
			<xsl:if test="//registry-current-artist/entry/youtube">
				<li>
					<a>
						<xsl:attribute name="href">
							<xsl:text>http://youtube.com/uer/</xsl:text>
							<xsl:value-of select="//registry-current-artist/entry/youtube"/>
						</xsl:attribute>
						<img src="{$workspace}/images/social/youtube.png" title="Find my videos Youtube"/>
					</a>
				</li>
			</xsl:if>
		</ul>
	</header>
</xsl:template>

<!-- Banner when editing artist information -->
<xsl:template name="edit-artist-header">
	<header class="current-artist">
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
					<!-- Choose the default avatar when no profile image -->
					<xsl:otherwise>
						<xsl:text>/images/avatar.png</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:text>Picture of </xsl:text>
				<xsl:value-of select="name"/>
			</xsl:attribute>
		</img>
		<h1>
			<xsl:choose>
				<xsl:when test="name">
					<xsl:value-of select="name"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>Your name will appear here</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</h1>
		<ul class="registry-contact">
			<xsl:choose>
				<xsl:when test="website">
					<li class="website">
						<a>
							<xsl:attribute name="href">
								<xsl:choose>
									<xsl:when test="string-length(website) &gt; 50">
										<xsl:value-of select="substring(website, 1, 50)"/>
										<xsl:text>…</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="website"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
							<xsl:value-of select="website" />
						</a>
					</li>
				</xsl:when>
				<xsl:otherwise>
					<li class="website">
						<xsl:text>Your website will appear here (if you enter one)</xsl:text>
					</li>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="phone">
					<li class="phone"><xsl:value-of select="phone"/></li>
				</xsl:when>
				<xsl:otherwise>
					<li class="phone">123.555.1212</li>
				</xsl:otherwise>
			</xsl:choose>
		</ul>

		<!-- Social media bits -->
		<ul class="registry-artist-social">
			<!-- Facebook -->
			<xsl:if test="facebook">
				<li>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="facebook"/>
						</xsl:attribute>
						<img src="{$workspace}/images/social/facebook.png" title="Find me on Facebook"/>
					</a>
				</li>
			</xsl:if>

			<!-- Flickr -->
			<xsl:if test="flickr">
				<li>
					<a>
						<xsl:attribute name="href">
							<xsl:text>http://flickr.com/</xsl:text>
							<xsl:value-of select="flickr"/>
						</xsl:attribute>
						<img src="{$workspace}/images/social/flickr.png" title="See my photos on Flickr"/>
					</a>
				</li>
			</xsl:if>
			
			<!-- Google + -->
			<xsl:if test="google-plus">
				<li>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="google-plus"/>
						</xsl:attribute>
						<img src="{$workspace}/images/social/gplus.png" title="Circle me on Google Plus"/>
					</a>
				</li>
			</xsl:if>
			
			<!-- Twitter -->
			<xsl:if test="twitter">
				<li>
					<a>
						<xsl:attribute name="href">
							<xsl:text>http://twitter.com/</xsl:text>
							<xsl:value-of select="twitter"/>
						</xsl:attribute>
						<img src="{$workspace}/images/social/twitter.png" title="Follow me on Twitter"/>
					</a>
				</li>
			</xsl:if>

			<!-- Vimeo -->
			<xsl:if test="vimeo">
				<li>
					<a>
						<xsl:attribute name="href">
							<xsl:text>http://vimeo.com/</xsl:text>
							<xsl:value-of select="vimeo"/>
						</xsl:attribute>
						<img src="{$workspace}/images/social/vimeo.png" title="Find my videos on Vimeo"/>
					</a>
				</li>
			</xsl:if>

			<!-- Youtube -->
			<xsl:if test="youtube">
				<li>
					<a>
						<xsl:attribute name="href">
							<xsl:text>http://youtube.com/user/</xsl:text>
							<xsl:value-of select="youtube"/>
						</xsl:attribute>
						<img src="{$workspace}/images/social/youtube.png" title="Find my videos Youtube"/>
					</a>
				</li>
			</xsl:if>
		</ul>
	</header>
</xsl:template>

<!-- Gallery list -->
<xsl:template name="registry-gallery-list">
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
					<xsl:value-of select="artist/item/@handle"/>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="@id"/>
				</xsl:attribute>
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="$root"/>
						<xsl:text>/image/2/174/144/5</xsl:text>
						<xsl:value-of select="artwork/@path"/>
						<xsl:text>/</xsl:text>
						<xsl:value-of select="artwork/filename"/>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="title"/>
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
			    		<xsl:value-of select="artist/item/@handle"/>
			    		<xsl:text>/</xsl:text>
			    		<xsl:value-of select="@id"/>
			    	</xsl:attribute>
					<h1>
						<xsl:value-of select="title"/>
					</h1>
				</a>

			</div>
		</li>

</xsl:template>

<!-- Artist List -->
<xsl:template name="registry-artist-list">
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
						<xsl:value-of select="profile-image/@path"/>
						<xsl:text>/</xsl:text>
						<xsl:value-of select="filename"/>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="name"/>
					</xsl:attribute>
				</img>
			</a>
		</li>

</xsl:template>

<!-- List of interests for fields -->
<xsl:template match="registry-interest-list/entry">
	<option>
		<xsl:attribute name="value">
			<xsl:value-of select="@id"/>
		</xsl:attribute>
		<xsl:if test="//item[@id=current()/@id]">
			<xsl:attribute name="selected">
				<xsl:text>selected</xsl:text>
			</xsl:attribute>
		</xsl:if>
		<xsl:value-of select="current()"/>
	</option>

</xsl:template>

<!-- Gallery pagination -->
<xsl:template name="registry-pagination">
	<xsl:if test="@total-pages > 1">
		<nav class="pagination">
			<ul>
				<xsl:if test="@current-page &lt; @total-pages">
					<li class="older">
						<a>
							<xsl:attribute name="href">
								<xsl:text>?page=</xsl:text>
								<xsl:value-of select="@current-page + 1"/>
							</xsl:attribute>
							Older
						</a>
					</li>
				</xsl:if>
				
				<xsl:if test="@current-page &gt; 1">
					<li class="newer">
						<a>
							<xsl:attribute name="href">
								<xsl:text>?page=</xsl:text>
								<xsl:value-of select="@current-page - 1"/>
							</xsl:attribute>
							Newer
						</a>
					</li>
				</xsl:if>
			</ul>
		</nav>
	</xsl:if>
</xsl:template>

<xsl:template name="registry-edit-account-nav">
<nav class="registry-edit-account-nav">
<ul>
	<li>
		<xsl:choose>
			<xsl:when test="$current-page = 'account'">
				<mark>Unpublished art</mark>
			</xsl:when>
			<xsl:otherwise>
				<a href="../">Unpublished art</a>
			</xsl:otherwise>
		</xsl:choose>
	</li>
	<li class="hidden">
		<xsl:choose>
			<xsl:when test="$current-page = 'messages'">
				<mark>Your Messages</mark>
			</xsl:when>
			<xsl:when test="$current-page ='account'">
				<a href="messages">Your Messages</a>
			</xsl:when>
			<xsl:otherwise>
				<a href="../messages">Your Messages</a>
			</xsl:otherwise>
		</xsl:choose>
	</li>
	<li>
		<xsl:choose>
			<xsl:when test="$current-page = 'photo'">
				<mark>Change your profile picture</mark>
			</xsl:when>
			<xsl:when test="$current-page = 'account'">
				<a href="photo">Change your profile picture</a>
			</xsl:when>
			<xsl:otherwise>
				<a href="../photo">Change your profile picture</a>
			</xsl:otherwise>
		</xsl:choose>
	</li>
	<li>
		<xsl:choose>
			<xsl:when test="$current-page ='edit'">
				<mark>Edit your settings</mark>
			</xsl:when>
			<xsl:when test="$current-page = 'account'">
				<a href="edit">Edit your settings</a>
			</xsl:when>
			<xsl:otherwise>
				<a href="../edit">Edit your settings</a>
			</xsl:otherwise>
		</xsl:choose>
	</li>
</ul>
</nav>
</xsl:template>
</xsl:stylesheet>