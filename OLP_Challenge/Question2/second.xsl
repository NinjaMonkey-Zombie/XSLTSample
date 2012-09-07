<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:func="http://exslt.org/functions" xmlns:str="http://exslt.org/strings" extension-element-prefixes="func str">

<xsl:output method="xml" indent="yes"/>

<func:function name="func:parser">

		<xsl:variable name="Type">
			<xsl:choose>
				<xsl:when test="type = 'WEEKLY'">W</xsl:when>
				<xsl:when test="type = 'MONTHLY'">M</xsl:when>
				<xsl:otherwise>N</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
	
	<func:result>
		<xsl:value-of select="$Type"/>
	</func:result>

</func:function>


<xsl:template match="customer">
	<application>
		<xsl:text>&#10;</xsl:text>

		<first_name><xsl:value-of select="fname"/></first_name>
				<xsl:text>&#10;</xsl:text>

		<last_name><xsl:value-of select="lname"/></last_name>
				<xsl:text>&#10;</xsl:text>

		<xsl:variable name="PhNum" as="element()*" select="str:tokenize(phone,'-')"/>

		<phone1><xsl:value-of select="$PhNum[1]"/></phone1>
			<xsl:text>&#10;</xsl:text>

		<phone2><xsl:value-of select="$PhNum[2]"/></phone2>
			<xsl:text>&#10;</xsl:text>

		<phone3><xsl:value-of select="$PhNum[3]"/></phone3>
			<xsl:text>&#10;</xsl:text>


		<dob><xsl:value-of select="dob_m"/>/<xsl:value-of select="dob_d"/>/<xsl:value-of select="dob_y"/></dob>
				<xsl:text>&#10;</xsl:text>

		<xsl:variable name="EmailDomain" as="element()*" select="str:tokenize(email,'@')"/>
		<email_domain><xsl:value-of select="$EmailDomain[2]"/></email_domain>		
				<xsl:text>&#10;</xsl:text>


		<xsl:call-template name="_Status"/>

		<repeat><xsl:value-of select="func:parser()"/></repeat>
				<xsl:text>&#10;</xsl:text>

	</application>

</xsl:template>


<xsl:template name="_Status">

		<xsl:choose>
			<xsl:when test="active = 'TRUE'">
				<status>Active</status>
				<xsl:text>&#10;</xsl:text>
			</xsl:when>
			<xsl:when test="active = 'FALSE'">
				<status>Inactive</status>
				<xsl:text>&#10;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<status></status>
				<xsl:text>&#10;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>

</xsl:template>

</xsl:stylesheet>
