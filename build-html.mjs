import { glob } from "fs/promises";
import { readFile, writeFile, mkdir } from "fs/promises";
import { dirname, relative, join } from "path";
import { minify } from "html-minifier-terser";
import { transform } from "lightningcss";

const SRC = "src";
const DIST = "dist";

const htmlOptions = {
  collapseWhitespace: true,
  removeComments: true,
  minifyJS: true,
  minifyCSS: false, // We handle CSS ourselves
};

function minifyInlineCSS(html) {
  return html.replace(/<style>([\s\S]*?)<\/style>/gi, (match, css) => {
    const { code } = transform({
      filename: "inline.css",
      code: Buffer.from(css),
      minify: true,
    });
    return `<style>${code}</style>`;
  });
}

const files = await Array.fromAsync(glob(`${SRC}/**/*.html`));

await Promise.all(
  files.map(async (srcPath) => {
    const relPath = relative(SRC, srcPath);
    const distPath = join(DIST, relPath);

    await mkdir(dirname(distPath), { recursive: true });

    const html = await readFile(srcPath, "utf8");
    const minified = await minify(html, htmlOptions);
    const final = minifyInlineCSS(minified);
    await writeFile(distPath, final, "utf8");

    console.log(`  ${relPath}`);
  }),
);

console.log(`\nBuilt ${files.length} HTML files.`);
