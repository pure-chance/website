default:
  just watch

build:
  typst compile template/bundle.typ dist --root . --features bundle,html --format bundle

watch:
  typst watch template/bundle.typ dist --root . --features bundle,html --format bundle
