<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>CVE List</title>
        <style>
          table { width: 100%; border-collapse: collapse; }
          table, th, td { border: 1px solid black; }
          th, td { padding: 10px; text-align: left; }
          th { background-color: #f2f2f2; }
        </style>
      </head>
      <body>
        <h2>CVE List</h2>
        <table>
          <tr>
            <th>CVE ID</th>
            <th>Name</th>
            <th>Severity</th>
            <th>Description</th>
            <th>Publish Date</th>
          </tr>
          <xsl:for-each select="cve_catalog/cve">
            <tr>
              <td><xsl:value-of select="@id"/></td>
              <td><xsl:value-of select="name"/></td>
              <td><xsl:value-of select="severity"/></td>
              <td><xsl:value-of select="description"/></td>
              <td><xsl:value-of select="publish_date"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
