// Semantic HTML components shared by site pages.
// Import only the components a page needs, for example:
//   #import "../../template/components.typ": figure, caption, image, image-compare

// A figure caption always starts with a strong explanatory sentence.
#let caption(lead, details: none) = html.elem("figcaption")[
  #html.elem("strong")[#lead]
  #if details != none { [ #details] }
]

// A generic figure frame. Its content must be an image, listing, table, video,
// SVG, or display equation as required by the site specification.
#let figure(id: none, class: none, caption: none, content) = {
  let attrs = if id != none and class != none {
    ("id": id, "class": class)
  } else if id != none {
    ("id": id)
  } else if class != none {
    ("class": class)
  } else {
    (:)
  }

  html.elem("figure", attrs: attrs)[
    #content
    #if caption != none { caption }
  ]
}

// An accessible image. `alt` is required; use alt: "" only for decorative art.
// `attrs` is available for intrinsic dimensions or component-specific styling.
#let image(src, alt, attrs: ()) = {
  if type(src) != str { panic("image src must be a string") }
  if type(alt) != str { panic("image alt text must be a string") }

  html.elem("img", attrs: attrs + ("src": src, "alt": alt))
}

#let image-compare(..images) = html.elem("div", attrs: ("class": "image-compare"))[
  #for img in images.pos() {
    let ratio = img.width / img.height
    html.elem("img", attrs: (
      "style": "flex: " + str(ratio),
      "src": img.src,
      "alt": img.alt,
    ))
  }
]

// A code listing inside a numbered `Lst.` figure.
#let listing(source, caption: none, lang: none, id: none) = {
  let code = if lang == none {
    raw(source, block: true)
  } else {
    raw(source, block: true, lang: lang)
  }

  figure(id: id, class: "code", caption: caption)[#code]
}

// Semantic inline computer input and output.
#let kbd(text) = html.kbd[#text]
#let samp(text) = html.elem("samp")[#text]

// A simple, accessible two-dimensional data table. Header cells are emitted as
// <th scope="col">. Use table-figure() whenever the table needs a caption.
#let data-table(headers, rows) = html.elem("table")[
  #html.elem("thead")[
    #html.elem("tr")[
      #for header in headers {
        html.elem("th", attrs: ("scope": "col"))[#header]
      }
    ]
  ]
  #html.elem("tbody")[
    #for row in rows {
      html.elem("tr")[
        #for cell in row {
          html.elem("td")[#cell]
        }
      ]
    }
  ]
]

// A numbered `Tbl.` figure around a simple data table.
#let table-figure(headers, rows, caption, id: none) = {
  figure(id: id, class: "table", caption: caption)[
    #data-table(headers, rows)
  ]
}

// Use this only for an uncaptioned table with a clear equivalent nearby label.
#let table-wrapper(content) = html.elem("div", attrs: ("class": "table-wrapper"))[#content]
