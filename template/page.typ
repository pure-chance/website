// Reads a non-deployable CSS fragment and emits it as a <style> element.
// Fragments live in template/fragments/ and are intentionally not bundled as files.
#let inline-css(name) = html.elem("style")[#read("fragments/" + name + ".css")]

#let head(uri, title, description, extra: none) = html.head[
  #html.meta(charset: "utf-8")
  #html.meta(name: "viewport", content: "width=device-width")
  #html.title[#title]

  #html.meta(name: "description", content: description)
  #html.link(rel: "canonical", href: "https://pure-chance.xyz/" + uri)
  #html.link(rel: "icon", type: "image/svg+xml", href: "/favicon.svg")

  #html.link(rel: "stylesheet", href: "/styles.css")

  #html.meta(name: "color-scheme", content: "light")

  #if extra != none { extra }
]

#let footer(label, refs) = html.footer(id: "running-footer")[
  #html.span(id: "label")[#label]
  #for (i, ref) in refs.enumerate() {
    html.a(href: ref.href, class: "ref")[#html.sup[#ref.symbol]#ref.name]
  }
]

#let page(
  uri: "",
  title: "",
  description: "",
  extra-head: none,
  label: "",
  refs: ((href: "/", name: "index", symbol: "*"),),
  content,
) = {
  document(
    uri + "/index.html",
    format: "html",
    title: title,
    description: description
  )[
    #html.html(lang: "en-US")[
      #head(uri, title, description, extra: extra-head)
      #html.body[
        #html.main[#content]
        #footer(label, refs)
      ]
    ]
  ]
}
