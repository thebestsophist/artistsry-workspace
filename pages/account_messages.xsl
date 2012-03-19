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
					<xsl:text> before you can view your messages</xsl:text>.</h1>
			</xsl:when>
			<xsl:otherwise>
				
				<xsl:call-template name="registry-edit-account-nav"/>
			
				<xsl:choose>
					<xsl:when test="not($message-id)">

						<h1><xsl:value-of select="$page-title"/></h1>
						<xsl:choose>
							<xsl:when test="registry-logged-in-artist-messages/error">
								<p>You haven&#8217;t received any messages yet.</p>
							</xsl:when>
							<xsl:otherwise>
								<div>
									<table class="registry-artist-messages">
										<thead>
											<tr>
												<th>Name</th>
												<th>Date Sent</th>
											</tr>				
										</thead>
										<tbody>
											<xsl:apply-templates select="registry-logged-in-artist-messages/entry"/>
										</tbody>
									</table>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>

					<xsl:otherwise>
						<header>
							<p>Message sent by</p>
							<h1><xsl:value-of select="from"/></h1>
							<p>Sent on
								<xsl:call-template name="format-time">
									<xsl:with-param name="date" value="time-sent"/>
									<xsl:with-param name="time" value="'M d, Y, t'"/>
								</xsl:call-template>
							</p>
						</header>
						<div>
							<value-of select="message"/>
						</div>
						<footer>
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="email"/>
								</xsl:attribute>
								Reply
							</a>
						</footer>
					</xsl:otherwise>
				</xsl:choose>
				
				

			</xsl:otherwise>
		</xsl:choose>

	</section>
	<section role="complimentary">
	</section>
</xsl:template>

<xsl:template match="registry-logged-in-artist-messages/entry">
	<tr>
		<td>
			<a>
				<xsl:attribute name="href">
					<xsl:value-of select="@id"/>
				</xsl:attribute>
				<xsl:value-of select="from"/>
			</a>
		</td>
		<td>
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" value="time-sent"/>
				<xsl:with-param name="format" value="'M d, Y, t'"/>
			</xsl:call-template>
		</td>
	</tr>
</xsl:template>
</xsl:stylesheet>