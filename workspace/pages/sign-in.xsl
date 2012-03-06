<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/registry-master.xsl"/>

<xsl:template match="/data">
<section role="main">
<xsl:choose>
    <xsl:when test="$is-logged-in = 'yes'">
		<h1>Silly pants, you're already logged in!</h1>
		<p><a href='?member-action=logout'>Log out</a> if you'd like to log in as someone else.</p>
    </xsl:when>
    <xsl:otherwise>
		<div class="registry-sign-in">
			<h1>Returning artists</h1>
			<form method="post">
				<label for="login-username">Your Username</label>
				<input id="login-username" name="fields[username]" type="text" placeholder="Username" />
				<label for="login-password">Your Password</label>
				<input id="login-password" name="fields[password]" type="password" placeholder="Password" />
			
				<input name="redirect" type="hidden">
					<xsl:attribute name="value">
						<xsl:choose>
							<xsl:when test="$ds-registry-url = ''">
									<xsl:value-of select="$root"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$ds-registry-url"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</input>
			
				<input name="member-action[login]" type="submit" value="I'm back!" class="go"/>
			</form>
		</div>
		
		<div class="registry-sign-up">
			<xsl:choose>
		
				<xsl:when test="$ds-registry-open-registration = 'Yes'">
					<h1>New artists</h1>
					<form method="post">
						<xsl:attribute name="action">
							<xsl:choose>
								<xsl:when test="$ds-registry-url = ''">
									<xsl:value-of select="$root"/>
									<xsl:text>/register</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$ds-registry-url"/>
									<xsl:text>/register</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
						
						<label for="register-username">Choose a username</label>
						<input id="register-username" name="fields[username]" type="text" placeholder="Username" required='' />
						
						<label for="register-email">What is your email address?</label>
						<input id="register-email" name="fields[email]" type="email" placeholder="Email" required='' />
						<fieldset>
							<label for="register-password">Choose a password</label>
							<input id="register-password" name="fields[password][password]" type="password" placeholder="Password" required='' />
							<label for="register-confirm">Confirm your password</label>
							<input id="register-confirm" name="fields[password][confirm]" type="password" placeholder="Confirm password" required='' /> 
						</fieldset>
						<input name="action[new-registration]" type="submit" value="Let's get this party started!" />
					</form>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
					
						<xsl:when test="events/sign-ups/@result = 'success'">
							<h1>Thank you!</h1>
							<p>We&#8217;ll let you know when we open up for more artists.</p>
						</xsl:when>
						<xsl:when test="events/sign-ups/@result = 'error'">
							<h1>Uh oh!</h1>
							<p>Something went wrong, please make sure to fill out your name and make sure your email address is correct.</p>
							<form action="" method="post">
								<label for="signups-name">Your Name</label>
								<input id="signups-name" name="fields[name]" type="text" placeholder="Tell us your name.">
									<xsl:if test="events/sign-ups/post-values/name">
										<xsl:attribute name="value">
											<xsl:value-of select="events/sign-ups/post-values/name"/>
										</xsl:attribute>
									</xsl:if>
								</input>
								<label for="signups-email">Email</label>
								<input id="signups-email" name="fields[email]" type="email" placeholder="How should we contact you?">
									<xsl:if test="events/sign-ups/post-values/email">
										<xsl:attribute name="value">
											<xsl:value-of select="events/sign-ups/post-values/email"/>
										</xsl:attribute>
									</xsl:if>
									
								</input>
								<input name="canofspam" value="{$canofspam}" type="hidden" />
								<input name="action[sign-ups]" type="submit" value="Sign up" class="go" />
							</form>

						</xsl:when>
						<xsl:otherwise>
							<h1>Sorry!</h1>
							<p>We are currently in a closed testing phase, and registration is not open at this time. Leave your name and email address if you would like to me to tell you when we have more spaces open up.</p>
							<form action="" method="post">
								<label for="signups-name">Your Name</label>
								<input id="signups-name" name="fields[name]" type="text" placeholder="Tell us your name."/>
								<label for="signups-email">Email</label>
								<input id="signups-email" name="fields[email]" type="email" placeholder="How should we contact you?" />
								<input name="canofspam" value="{$canofspam}" type="hidden" />
								<input name="action[sign-ups]" type="submit" value="Sign up" class="go" />
							</form>


						</xsl:otherwise>
					
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</div>
    </xsl:otherwise>
</xsl:choose>
</section>
</xsl:template>
</xsl:stylesheet>