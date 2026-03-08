import { readFile, writeFile } from "fs/promises";
import { transform } from "lightningcss";

const src = await readFile("src/main.css", "utf8");

const { code } = transform({
  filename: "main.css",
  code: Buffer.from(src),
  minify: true,
  sourceMap: false,
  targets: {
    chrome: 112 << 16,
    firefox: 117 << 16,
    safari: 17 << 16,
  },
});

await writeFile("dist/main.css", code, "utf8");

const savings = ((1 - code.length / src.length) * 100).toFixed(1);
console.log(`Built main.css (${savings}% smaller)`);
