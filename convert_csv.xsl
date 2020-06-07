<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:csv="csv:csv">
    <xsl:output method="text" encoding="utf-8"/>
    <xsl:strip-space elements="*"/>
    <xsl:variable name="delimiter" select="','"/>
    <csv:columns>
        <column>Name</column>
        <column>Category Type</column>
        <column>Category Subtype</column>
        <column>Phone</column>
        <column>Website</column>
        <column>Email</column>
        <column>Geographic</column>
    </csv:columns>

    <xsl:template match="/osm_result">
        <!-- Output the CSV header -->
        <xsl:for-each select="document('')/*/csv:columns/*">
            <xsl:value-of select="upper-case(.)"/>
            <xsl:if test="position() != last()">
                <xsl:value-of select="$delimiter"/>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>
</xsl:text>
        <!-- Output rows for each matched node -->
        <xsl:apply-templates select="*"/>
    </xsl:template>
    <xsl:template match="/osm_result/node">
        <xsl:variable name="node" select="."/>
        <!-- Loop through the columns in order -->
        <xsl:for-each select="document('')/*/csv:columns/*">
            <!-- Extract the column name and value -->
            <xsl:variable name="column" select="."/>
            <xsl:variable name="value" select="$node/*[name() = $column]"/>
            <xsl:value-of select="$value"/>
            <xsl:if test="$column = 'Name'">
                <xsl:value-of select="$node/@name"/>
            </xsl:if>

            <xsl:if test="position() != last()">
                <xsl:value-of select="$delimiter"/>
            </xsl:if>

            <xsl:if test="$column = 'Category Type'">
              <xsl:value-of select="$node/@type/string()"/>
            </xsl:if>

            <xsl:if test="position() != last()">
                <xsl:value-of select="$delimiter"/>
            </xsl:if>

            <xsl:if test="$column = 'Category Type'">
              <xsl:value-of select="$node/@type"/>
            </xsl:if>
        </xsl:for-each>
        <!-- Add a newline at the end of the record -->
        <xsl:text>ss
        </xsl:text>
    </xsl:template>
</xsl:stylesheet>
