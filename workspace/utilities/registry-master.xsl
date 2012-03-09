<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="date-time.xsl"/>
<xsl:import href="page-title.xsl"/>
<xsl:import href="typography.xsl"/>
<xsl:import href="registry-settings.xsl"/>


<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" omit-xml-declaration="yes" encoding="UTF-8" indent="yes"/>
<xsl:variable name="is-logged-in" select="/data/events/member-login-info/@logged-in"/>
<xsl:template match="/">
	<xsl:comment><![CDATA[[if IE 6]><html lang="en" class="no-js ie6 lte-ie9 lte-ie8 lte-ie7 lte-ie6 gte-ie6"><![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 7]><html lang="en" class="no-js ie7 lte-ie9 lte-ie8 lte-ie7 gte-ie7 gte-ie6"><![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 8]><html lang="en" class="no-js ie8 lte-ie9 lte-ie8 gte-ie8 gte-ie7 gte-ie6"><![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 9]><html lang="en" class="no-js ie9 lte-ie9 gte-ie9 gte-ie8 gte-ie7 gte-ie6"><![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if !(lte IE 9)]><!]]></xsl:comment><html lang="en" class="no-js"><xsl:comment><![CDATA[<![endif]]]></xsl:comment>
		<head>
	<meta charset="utf-8"/>
	
	<xsl:text disable-output-escaping="yes">
	&lt;!--
	
	  (o_                    _o)
	  //\    Hello there!    /\\
	  V_/_                  _\_V
	==============================
	
	If you, like us, enjoy adding comments
	for those peeking under the hood, you
	can do it like this.
	
	--&gt;
	</xsl:text>
	
	<title><xsl:call-template name="registry-page-title"/></title>

	<!-- Use the .htaccess and remove these lines to avoid edge case issues.
 			More info: h5bp.com/i/378 -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<meta name="description" content=""/>

	<!-- Mobile viewport optimized: h5bp.com/viewport -->
	<meta name="viewport" content="width=device-width"/>

	<!-- Styles are generated using Compass and the html5-boilerplate gem in workspace/scss -->
	<link rel="stylesheet" href="{$workspace}/css/style.css"/>

	<!-- More ideas for your <head> here: h5bp.com/d/head-Tips -->

	<!-- Most JavaScript at the bottom, except Modernizr and google API (to deal with webfonts) -->
	<script src="{$workspace}/js/modernizr-2.5.2.min.js"></script>
</head>
<body>
	<xsl:attribute name="id">
		<xsl:value-of select="$current-page"/>
		<xsl:text>_page</xsl:text>
	</xsl:attribute>

	<!-- Prompt IE 6 users to install Chrome Frame. Remove this if you support IE 6.
 			chromium.org/developers/how-tos/chrome-frame-getting-started -->
	<xsl:comment>
		<!--[if lt IE 7]><p class=chromeframe>Your browser is <em>ancient!</em> <a href="http://browsehappy.com/">Upgrade to a different browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to experience this site.</p><![endif]-->	
	</xsl:comment>


	<header role="banner">
<!-- 
	Place your branded site masthead here.
-->


<!-- Registry Masthead and global navigation -->
		<div id="registry-masthead">
			<h1>
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
					</xsl:attribute>
					<xsl:value-of select="$website-name" disable-output-escaping="yes"/>
				</a>
			</h1>
			<nav id="banner-nav">
			    <div role="search">
			    	<form id="masthead-search" method="get">
			    		<xsl:attribute name="action">
							<xsl:choose>
								<xsl:when test="$ds-registry-url = ''">
									<xsl:value-of select="$root"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$ds-registry-url"/>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:text>/search/</xsl:text>
			    		</xsl:attribute>
			    		<input id="search" type="search" required='' name="keywords" placeholder="Search" />
					    <input type="hidden" name="sort" value="score-recency" />
					    <input type="hidden" name="per-page" value="12" />
					    <input type="hidden" name="sections" value="artists,artwork" />
			    		
			    		<input type="submit" title="Search the registry." value="Go" />
			    	</form>
				</div>
			    <ul id="user-nav">
					<xsl:call-template name="registry-user-nav"/>
			    </ul>
			</nav>
			<xsl:if test="not($root-page = 'back' or $root-page='new' or $root-page='account')">
				<nav id="registry-nav">
					<ul>
						<xsl:call-template name="registry-nav" />
					</ul>
				</nav>
			</xsl:if>
		</div>
	</header>
	
	<!-- Individual pages include role="main" and role="complimentary" -->
	<div>
		<xsl:apply-templates />
	</div>
<!-- 
	Your custom site footer should replace this footer, 
	you needn't attribute us, so feel free to replace 
	all of the copyright information with your own. 
-->

    <footer>
    	<div role="contentinfo">
    		<p>
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
						<xsl:text>/copyright</xsl:text>
    				</xsl:attribute>
    				Copyright
	    		</a>
				<xsl:text> and </xsl:text>
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
	    				<xsl:text>/privacy</xsl:text>
	    			</xsl:attribute>
	    			privacy
	    		</a>
	    		policies.
	    	</p>
    	</div>
		<div>
			<p>Artists&#8217;ry, the open-source artists&#8217; registry is designed by <a href="http://enguindesign.com">Enguin Design</a> and built with <a href="http://symphony-cms.com/">Symphony CMS</a>.</p>
		</div>
		
		
		<xsl:if test="//@result = 'error'">
			<h2>Debug</h2>
			<textarea readonly="readonly">
				<xsl:copy-of select="//events/*[@result='error']"/>
			</textarea>
		</xsl:if>
		
		<div class="feedback-button">
			<a href="#feedback">Feedback</a>
			
			<div id="feedback" style="display:none;">
				<h1>Hi!</h1>
				<p>I&#8217;m still under development so you may find a few bugs here and there. Did you find one? Help make me better by sending my developers a note! Try to be as descriptive as possible: Tell us what you were trying to do and what failed.</p>
				<form method="post" action="" enctype="multipart/form-data">
					<label for="comment">What is your comment?</label>
				    <textarea id="comment" name="fields[comment]" rows="15" cols="50"></textarea>

				<!-- Tasty Hidden Fields -->
					<div class="hidden">
						<textarea name="fields[browser]" id="hidden" class="browser">					
						</textarea>
						<textarea name="fields[xml]" class="hidden">
							<xsl:copy-of select="data"/>
						</textarea>
						<xsl:if test="$is-logged-in = 'yes'">
							<input name="fields[user]" type="hidden" value="{$member-id}" />
						</xsl:if>
						<input name="fields[date-submitted]" type="hidden" value="{$today}"/>
						<input name="fields[url]" type="hidden" value="{$current-url}"/>
						<input name="canofspam" value="{$canofspam}" type="hidden" />
					</div>
					<input name="action[send-feedback]" type="submit" value="Submit" />
				</form>
				<p><small>We collect some basic information about whether you are a logged-in artist and what web browser you&#8217;re using; but don&#8217;t worry we haven&#8217;t stored any of your private information.</small></p>
			</div>
		</div>
	</footer>


	<!-- Base scripts loaded via google loader

		 Grab Google API's jQuery fall back to local if offline 
		 Note: If you want to actually use webfonts, it's better
		 to move this back into <head> to deal with the flash of
		 unstyled text.

		 I prefer loading a newer version of jQuery than what
		 Symphony uses. Also, you'll notice that I pull jQueryUI
		 as a default, you don't need to, but I find it useful
		 the projects I work on.
	-->

	<script src="https://www.google.com/jsapi"></script>
	<script>
		google.load("jquery", "1.7.1");
		google.load("jqueryui", "1.8.17");

		google.load("webfont", "1");

		google.setOnLoadCallback(function() {
			WebFont.load({
				google: {
					families: [ 'Raleway' ]		
				}
			});
		});
	</script>
	<xsl:text disable-output-escaping="yes">
	&lt;script&gt;window.jQuery || document.write('&lt;script src="js/libs/jquery-1.7.1.min.js"&gt;&lt;\/script&gt;')&lt;/script&gt;
	</xsl:text>

	<!-- scripts concatenated and minified via build script -->
	<script src="{$workspace}/js/markitup/jquery.markitup.js"></script>
	<script src="{$workspace}/js/plugins.js"></script>
	<script src="{$workspace}/js/script.js"></script>
	<!-- end scripts -->

	<!-- Asynchronous Google Analytics snippet. Change UA-XXXXX-X to be your site's ID.
 			mathiasbynens.be/notes/async-analytics-snippet -->
	<script>
		var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
		(function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
		g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
		s.parentNode.insertBefore(g,s)}(document,'script'));
	</script>


</body>
</html>
</xsl:template>

</xsl:stylesheet>
