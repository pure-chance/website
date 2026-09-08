#import "page.typ": inline-css, page
#import "manifest.typ": manifest

// create index.html
#page(
  title: "pure-chance",
  description: "A record of thoughts by @pure-chance.",
  extra-head: inline-css("index"),
  label: "@pure-chance",
  refs: (
    (href: "/about", name: "about", symbol: "†"),
    (href: "/resources", name: "resources", symbol: "‡"),
  ),
)[
  #for article in manifest {
    html.article[
      #html.a(href: "/" + article.uri + "/")[
        #html.h2[#article.title]
        #html.span(class: "leader")
        #html.elem(
          "time",
          attrs: ("datetime": article.created.display("[year]-[month]-[day]"))
        )[#article.created.display("[year].[month].[day]")]
      ]
    ]
  }
  #html.p(id: "line")[Down the rabbit hole.]
]

// load home pages
#include "../pages/about/index.typ"
#include "../pages/resources/index.typ"

// load articles
#include "../pages/ao3-formatting-is-a-nightmare/index.typ"
#include "../pages/optimally-wrong-wordle/index.typ"
#include "../pages/iconography-of-an-apocalpse/index.typ"
#include "../pages/youtube-metacommentary-and-authetenticity/index.typ"

// per-article assets
#for article in manifest {
  for file in article.assets {
    asset(
      article.uri + "/assets/" + file,
      read("../pages/" + article.uri + "/assets/" + file, encoding: none),
    )
  }
}

// public assets
#asset("favicon.svg", read("../public/favicon.svg"))
#asset("styles.css", read("../public/styles.css"))
#asset(
  "fonts/EBGaramond/EBGaramond-Regular.woff2",
  read("../public/fonts/EBGaramond/EBGaramond-Regular.woff2", encoding: none)
)
#asset(
  "fonts/EBGaramond/EBGaramond-Bold.woff2",
  read("../public/fonts/EBGaramond/EBGaramond-Bold.woff2", encoding: none)
)
#asset(
  "fonts/EBGaramond/EBGaramond-Italic.woff2",
  read("../public/fonts/EBGaramond/EBGaramond-Italic.woff2", encoding: none)
)
#asset(
  "fonts/MapleMono/MapleMono-Regular.woff2",
  read("../public/fonts/MapleMono/MapleMono-Regular.woff2", encoding: none)
)
#asset(
  "fonts/Garamond-Math/Garamond-Math.woff2",
  read("../public/fonts/Garamond-Math/Garamond-Math.woff2", encoding: none)
)
