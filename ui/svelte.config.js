import sveltePreprocess from 'svelte-preprocess';
import tailwindcss from 'tailwindcss';
import autoprefixer from 'autoprefixer';
import tailwindConfig from './tailwind.config.js';

const production = process.env === "production";
export default {
  // Consult https://github.com/sveltejs/svelte-preprocess
  // for more information about preprocessors
  // preprocess: sveltePreprocess({
  //   sourceMap: !production,
  //   postcss: {
  //     plugins: [
  //       tailwindcss(tailwindConfig),
  //       autoprefixer,
  //     ]
  //   }
  // })
  preprocess: sveltePreprocess()
}
