<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0" >
<xsl:output method="html" indent="yes" encoding="utf-8" />
<xsl:strip-space elements="*" />

<xsl:template match="/">
  <html>
    <head>
      <link rel="stylesheet"  href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" />
      <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap-theme.min.css" />
      <script src="http://code.jquery.com/jquery.min.js" />
      <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js" />
      <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css" />
    </head>

    <body>
      <h2>Movie Collection</h2>
      <table class="Table">
        <tr>
          <th>Title</th>
          <th>Actors</th>
          <th>Genre</th>
          <th>Duration</th>
          <th>Description</th>
        </tr>
        <xsl:for-each select="movie-list/movie">
        <tr>
          <td><xsl:value-of select="title"/></td>
          <td><xsl:value-of select="actors"/></td>
          <xsl:choose>
            <xsl:when test="genre = 'adventure'">
               <td class="btn-primary">
                 <xsl:value-of select="genre"/>
               </td>
            </xsl:when>
            <xsl:when test="genre = 'horror'">
               <td class="btn-danger">
                 <xsl:value-of select="genre"/>
               </td>
            </xsl:when>
            <xsl:when test="genre = 'drama'">
               <td class="btn-info">
                 <xsl:value-of select="genre"/>
               </td>
            </xsl:when>
            <xsl:when test="genre = 'western'">
               <td class="btn-warning">
                 <xsl:value-of select="genre"/>
               </td>
            </xsl:when>
            <xsl:otherwise>
              <td><xsl:value-of select="genre"/></td>
            </xsl:otherwise>
          </xsl:choose>
          <td><xsl:value-of select="duration"/></td>
          <td><xsl:value-of select="description"/></td>
        </tr>
        </xsl:for-each>
      </table>
    </body>
 </html>
</xsl:template>

</xsl:stylesheet>
