<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>

    <xsl:variable name='newline'><xsl:text>
</xsl:text></xsl:variable>

    <xsl:template match="/osm_result">
        <xsl:value-of select="concat('Name,Category Type, Category Subtype,Phone,Website,Email,Geographic Location',$newline)"/>
        <xsl:for-each select="//node">
            <xsl:value-of select="concat(./name, ',',./category/type , ',',./category/subtype, ',', ./phone, ',',./website,',', ./email, ',' , ./location/city, '-',./location/postcode, '-', ./location/street ,$newline)"/>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
