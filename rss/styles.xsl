<?xml version="1.0" encoding="utf-8"?>
<!-- Makes /rss.xml readable in a browser: explains what the feed is and lists the posts. Feed readers ignore this. -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="utf-8" />
  <xsl:template match="/rss/channel">
    <html lang="en">
      <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title><xsl:value-of select="title" /> · RSS feed</title>
        <style>
          :root { color-scheme: light dark; --bg:#F3F3F0; --panel:#fff; --text:#000; --soft:#2B2B2B; --muted:#5E615C; --line:#D9DAD5; --brand:#006B40; }
          @media (prefers-color-scheme: dark) { :root { --bg:#000; --panel:#121212; --text:#fff; --soft:#DADBD6; --muted:#9EA19A; --line:#2A2A2A; --brand:#3CCB86; } }
          body { margin:0; background:var(--bg); color:var(--soft); font:17px/1.6 system-ui, sans-serif; }
          main { max-width:46rem; margin:0 auto; padding:48px 16px; }
          h1 { color:var(--text); font-size:2.4rem; line-height:1; margin:0 0 12px; }
          .note { background:var(--panel); border:1px solid var(--line); border-left:6px solid var(--brand); border-radius:8px; padding:16px 20px; margin:24px 0 32px; }
          .note p { margin:0 0 8px; } code { background:var(--bg); padding:2px 6px; border-radius:4px; word-break:break-all; }
          ol { list-style:none; padding:0; margin:0; display:grid; gap:16px; }
          li { background:var(--panel); border:1px solid var(--line); border-radius:12px; padding:18px 20px; }
          li a { color:var(--text); font-weight:800; font-size:1.15rem; text-decoration:none; } li a:hover { text-decoration:underline; }
          .d { color:var(--muted); font-size:.85rem; margin:0 0 4px; } li p { margin:6px 0 0; }
          .back { display:inline-block; margin-top:32px; color:var(--brand); font-weight:700; }
        </style>
      </head>
      <body>
        <main>
          <h1><xsl:value-of select="title" /></h1>
          <div class="note">
            <p><strong>This is an RSS feed.</strong> It lets news-reader apps (Feedly, Inoreader, NetNewsWire) show you new posts automatically.</p>
            <p>To follow the blog, copy this page's address and paste it into your reader: <code><xsl:value-of select="link" />rss.xml</code></p>
            <p>Just want to read? Pick a post below.</p>
          </div>
          <ol>
            <xsl:for-each select="item">
              <li>
                <p class="d"><xsl:value-of select="substring(pubDate, 6, 11)" /></p>
                <a href="{link}"><xsl:value-of select="title" /></a>
                <p><xsl:value-of select="description" /></p>
              </li>
            </xsl:for-each>
          </ol>
          <a class="back" href="{link}blog/">Go to the blog</a>
        </main>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
