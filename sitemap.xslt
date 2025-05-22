<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9">

<xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd" indent="yes"/>

<xsl:template match="/">
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <style>
        * {
            box-sizing: border-box;
        }

        html {
            font-size: 100%;
            -webkit-text-size-adjust: 100%;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
            max-width: 960px;
            margin: 0 auto;
            padding: 30px 20px;
            font-size: 19px;
            line-height: 1.5;
            color: #0b0c0c;
            -webkit-font-smoothing: antialiased;
            background-color: #fff;
        }

        h1 {
            font-size: 36px;
            font-size: 2.25rem;
            line-height: 1.11111;
            font-weight: 700;
            margin-top: 0;
            margin-bottom: 30px;
            color: #1d70b8;
        }

        h2 {
            font-size: 27px;
            font-size: 1.6875rem;
            line-height: 1.11111;
            font-weight: 700;
            margin-top: 45px;
            margin-bottom: 20px;
        }

        p {
            font-size: 19px;
            font-size: 1.1875rem;
            line-height: 1.5;
            margin-top: 0;
            margin-bottom: 20px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 30px;
            font-size: 19px;
            font-size: 1.1875rem;
            line-height: 1.5;
            background-color: #f8f8f8;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        thead {
            background-color: #1d70b8;
            color: white;
        }

        th {
            padding: 15px 20px;
            text-align: left;
            font-weight: 700;
            border: none;
        }

        td {
            padding: 12px 20px;
            border-bottom: 1px solid #e0e0e0;
            vertical-align: top;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f0f4f8;
        }

        a {
            color: #1d70b8;
            text-decoration: underline;
            text-decoration-thickness: 1px;
            text-underline-offset: 0.1em;
            word-break: break-all;
        }

        a:hover {
            color: #003078;
            text-decoration-thickness: 2px;
        }

        .priority {
            font-weight: bold;
            color: #0f7b0f;
        }

        .high-priority {
            background-color: #e8f5e8;
        }

        .changefreq {
            font-style: italic;
            color: #666;
        }

        .lastmod {
            color: #444;
        }

        .info-box {
            background-color: #f0f4f8;
            border-left: 5px solid #1d70b8;
            padding: 20px;
            margin-bottom: 30px;
            border-radius: 4px;
        }

        .count {
            font-weight: bold;
            color: #1d70b8;
        }

        @media (max-width: 768px) {
            body {
                font-size: 18px;
                line-height: 1.45;
                padding: 20px 15px;
            }
            
            h1 {
                font-size: 32px;
                font-size: 2rem;
                line-height: 1.09375;
            }
            
            table {
                font-size: 16px;
            }
            
            th, td {
                padding: 10px 12px;
            }
            
            a {
                word-break: break-word;
            }
        }

        @media (max-width: 480px) {
            body {
                font-size: 16px;
                line-height: 1.4;
                padding: 15px 10px;
            }
            
            h1 {
                font-size: 24px;
                font-size: 1.5rem;
                line-height: 1.04167;
            }
            
            table {
                font-size: 14px;
            }
            
            th, td {
                padding: 8px 10px;
            }
        }
    </style>
</head>
<body>
    
    <table>
        <thead>
            <tr>
                <th>URL</th>
                <th>Last Modified</th>
                <th>Change Frequency</th>
                <th>Priority</th>
            </tr>
        </thead>
        <tbody>
            <xsl:for-each select="sitemap:urlset/sitemap:url">
                <xsl:sort select="sitemap:priority" order="descending"/>
                <tr>
                    <xsl:if test="sitemap:priority = '1.0'">
                        <xsl:attribute name="class">high-priority</xsl:attribute>
                    </xsl:if>
                    <td>
                        <a href="{sitemap:loc}" target="_blank">
                            <xsl:value-of select="sitemap:loc"/>
                        </a>
                    </td>
                    <td class="lastmod">
                        <xsl:value-of select="sitemap:lastmod"/>
                    </td>
                    <td class="changefreq">
                        <xsl:value-of select="sitemap:changefreq"/>
                    </td>
                    <td class="priority">
                        <xsl:value-of select="sitemap:priority"/>
                    </td>
                </tr>
            </xsl:for-each>
        </tbody>
    </table>
</body>
</html>
</xsl:template>

</xsl:stylesheet>