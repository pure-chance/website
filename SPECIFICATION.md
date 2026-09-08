# Specification

## Head

Each page should have at least the following `<head>`, though you may add additional `<style>`s, `<script>`s, `<link>`s, etc.

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>...</title>
    <meta name="author" content="Chance Addis" />
    <meta name="description" content="..." />
    <link rel="icon" type="image/svg+xml" href="/public/favicon.svg" />
    <link rel="stylesheet" href="/styles.css" />
  </head>
  <body>
    ...
  </body>
</html>
```

# Articles

Articles are structured as follows:

```html
<body>
    <main>
      <article>
        <header id="headline">
          <h1 id="title">...</h1>
          <p id="subtitle">...</p>
        </header>
        ...
      </article>
    </main>
</body>
```

# Accessibility

Use semantic HTML as much as possible, avoiding unncessary complexity that would hinder assistive technologies. Every image must have alt text.

# Headline and Headings

Each article must have a headline, which includes a title (`h1`) and a subtitle. An article is made of sections which may be marked with a `h2`, which themselves may have subsections `h3`. Any further nesting of headings is disallowed, so no `h4`, `h5`, `h6` and so on.

In articles, don't add `<section>` or other wrappers around sections. Just have a stream of headings, paragraphs, and other elements.

# Footer

Each page has a footer, which contains a `#label`, describing the page, and a set of `.ref`s, which link to other pages on the site. Each footer has only these 2 elements, aligned left and right respectively, with a rule above.

# Code 

Code comes in 2 forms, inline, and block. For all block code, wrap the code in a `<pre>`. For inline content, use `<code>`, `<samp>`, or `<kbd>` depending on which is most appropriate. 

All `<code>` should be manually wrapped at 72 characters. Do not manually wrap `<samp>` or `<kbd>` as that should be presented as-is.

Do not use monospace font for emphasis or writing. Monospace is exclusively for computer input and output.

# Figures

A figure is "...self-contained content, potentially with an optional caption, which is specified using the <figcaption> element. The figure, its caption, and its contents are referenced as a single unit." 

A figure must contain one of the following: a "Fig." (`img`, `svg`, `video`), a Lst. (`pre`), a "Tbl." (`table`), or a "Eq." (`math`).

A figure should have a caption, and that caption should start with a single "explanatory" sentence, that is `<strong>`. Then it can proceed with a more detailed explanation.

Figures behave like a "frame" around their internal content. The internal content fills the content width, with the frame overhanging the content, with a little margin between the frame and inner content.

This frame must be filled if the content can fill it. For figures, the image's width is 100%, for listings, the background must be 100%. For tables, it's not possible to fill the frame, so the table is centered instead.

# Tables

Tables must be wrapped in either a `figure` or a `.table-wrapper` so that they will not overflow the content width.

Tables must not use `<caption>`. If the table deserves a caption, then it should be wrapped in a figure. 

Generally, all tables should be figures unless there is a strong motivation otherwise.

# Math

All math should use `mathML Core`. Math can be inline, or block. Math can scroll, but should ideally be broken into lines that fit within the content width if possible.
