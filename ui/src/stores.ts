import { readable } from "svelte/store";

import type { State } from "./lib/issue";
import { getStates } from "./lib/api";

const defaultVal: State[] = [];
export const issueStates = readable(defaultVal, (set) => {
  getStates()
    .then((res) => {
      set(res);
      console.log(res);
    })
    .catch((err) => console.log("Failed to fetch issue states"));
  return () => null;
});
