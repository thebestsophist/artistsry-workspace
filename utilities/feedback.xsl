<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="feedback">

	<form method="post" enctype="multipart/form-data">
		<label for="feedback-message">Tell us what you were doing and what went wrong.</label>
		<textarea id="feedback-message" name="fields[comment]" placeholder="Please be as descriptive as possible.">
		
		</textarea>
		
		<label for="feedback-xml">Server information (for us)</label>
		<textarea id="feedback-xml" name="fields[xml]" readonly="readonly">
			<xsl:copy-of select="/data"/>
		</texarea>
		
		<p>We collect some data the browser you use, what page you're on, and your username so we can best respond to your issue.</p>
	<!-- Tasty hidden fields -->
		<input type="hidden" name="fields[url]" value="$current-path"/>
		<xsl:if test="$member-id">
			<input type="hidden" name="fields[user]" value="member-id"/>
		</xsl:if>
		<input type="hidden" name="fields[date-submitted]" value="{$today}-{$current-time}"/>
		<input type="submit" name="action[submit-feedback]" value="Submit"/>
	</form>
</xsl:template>

</xsl:stylesheet>