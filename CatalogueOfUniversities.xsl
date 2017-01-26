<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/">
    <fo:root>
      <fo:layout-master-set>
        <fo:simple-page-master master-name="A4-portrait" page-height="29.7cm" page-width="21.0cm" margin="2cm">
          <fo:region-body/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="A4-portrait">
        <fo:flow flow-name="xsl-region-body">
          <fo:block font-family="Calibri" linefeed-treatment="preserve">
             <xsl:value-of select="catalogue/university/name"/>
            <xsl:apply-templates select="catalogue/university"/>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
  
  <xsl:template match="catalogue/university">
  <xsl:apply-templates select="name"/>
  <xsl:apply-templates select="abreviation"/>
  <xsl:apply-templates select="location"/>
  <xsl:apply-templates select="faculties"/>
  ************************************
  </xsl:template>

  <xsl:template match="name">
    <fo:inline font-weight="bold"><xsl:text> Име на университета: </xsl:text></fo:inline><xsl:value-of select="."/><xsl:text>
</xsl:text>
  </xsl:template>
  
  <xsl:template match="abreviation">
    <fo:inline font-weight="bold"><xsl:text> Абревиатура: </xsl:text></fo:inline><xsl:value-of select="."/><xsl:text>
</xsl:text>
  </xsl:template>

  <xsl:template match="location">
    <fo:inline font-weight="bold"><xsl:text> Къде се намира?- </xsl:text></fo:inline><xsl:value-of select="."/><xsl:text>
</xsl:text>
  </xsl:template>
  
    <xsl:template match="/catalogue/university/faculties">
    Специалности: <xsl:for-each select="./faculty/specialities/speciality">
        <fo:inline font-style="italic"><xsl:text> Специалност: </xsl:text></fo:inline><xsl:value-of select="@name"/><xsl:text>
</xsl:text>
        <fo:inline font-weight="bold"><xsl:text> Курс: </xsl:text></fo:inline><xsl:value-of select="@course"/><xsl:text>
</xsl:text>
      </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
