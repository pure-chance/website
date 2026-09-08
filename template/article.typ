#import "page.typ": page

#let article(
  uri: none,
  title: none,
  subtitle: none,
  extra-head: none,
  content,
) = {
  if type(uri) != str { panic("there must be a valid uri") }
  if type(title) != str { panic("there must be a title") }
  if type(subtitle) != str { panic("there must be a subtitle") }

  page(
    uri: uri,
    title: title,
    description: subtitle,
    extra-head: extra-head,
    label: title,
  )[
    #html.header(id: "headline")[
      #html.h1(id: "title")[#title]
      #html.p(id: "subtitle")[#subtitle]
    ]
    #html.article[#content]
  ]
}
