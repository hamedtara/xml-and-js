<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <!-- Table 1 : shippable items -->
                <h2>Shippable Items : </h2>
                <table border="1">
                    <tr bgcolor="#9acd32">
                        <!-- Product name, Manufacturer id, Description, USD price-->
                        <th>Product Name</th>
                        <th>Manufacturer ID</th>
                        <th>Description</th>
                        <th>USD price</th>
                    </tr>

                    <!-- Checking shippable items -->
                    <xsl:for-each select="//product[@shippable='true']">
                        <tr>
                            <td>
                                <xsl:value-of select="productName" />
                            </td>
                            <td>
                                <xsl:value-of select="manufacturer-id" />
                            </td>
                            <td>
                                <xsl:value-of select="description" />
                            </td>
                            <td>
                                <xsl:value-of select="prices/price[1]" />
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>

                <!-- Table 2 : manufacturer id is "acme"-->
                <h2>Manufacturer Id Is "acme" :</h2>
                <table border="1">
                    <tr bgcolor="#9acd32">
                        <!-- Product name, Description, USD price, Euro price-->
                        <th>Product Name</th>
                        <th>Description</th>
                        <th>USD price</th>
                        <th>Euro price</th>
                    </tr>
                    <!-- Checking shippable Manufacturer Id Is "acme" -->
                    <xsl:for-each select="//product/manufacturer[@id='acme']/..">
                        <tr>
                            <td>
                                <xsl:value-of select="productName" />
                            </td>
                            <td>
                                <xsl:value-of select="description" />
                            </td>
                            <td>
                                <xsl:value-of select="prices/price[1]" />
                            </td>
                            <td>
                                <xsl:value-of select="prices/price[last()]" />
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>