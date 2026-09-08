#let xml-escape(text) = {
  let escaped = text.replace("&", "&amp;")
  escaped = escaped.replace("<", "&lt;")
  escaped = escaped.replace(">", "&gt;")
  escaped.replace("\"", "&quot;")
}

#let fmt-atom(d) = fmt-iso(d) + "T00:00:00Z"
#let rss-updated = effective-updated(manifest.sorted(key: update-order).last())
#let site-url = "https://pure-chance.xyz"

#let rss-entry(article) = {
  let url = site-url + "/" + article.uri + "/"
  let created = fmt-atom(article.created)
  let updated = fmt-atom(effective-updated(article))

  (
    "    <entry>",
    "        <title>" + xml-escape(article.title) + "</title>",
    "        <link href=\"" + url + "\" />",
    "        <id>" + url + "</id>",
    "        <summary>" + xml-escape(article.summary) + "</summary>",
    "        <published>" + created + "</published>",
    "        <updated>" + updated + "</updated>",
    "    </entry>",
  ).join("\n")
}

#let rss = (
  "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>",
  "<feed xmlns=\"http://www.w3.org/2005/Atom\">",
  "    <title>@pure-chance</title>",
  "    <link href=\"" + site-url + "\" rel=\"alternate\" />",
  "    <link href=\"" + site-url + "/rss.xml\" rel=\"self\" />",
  "    <id>" + site-url + "</id>",
  "    <subtitle>A record of thoughts by @pure-chance.</subtitle>",
  "    <updated>" + fmt-atom(rss-updated) + "</updated>",
  articles.map(rss-entry).join("\n"),
  "</feed>",
).join("\n") + "\n"
