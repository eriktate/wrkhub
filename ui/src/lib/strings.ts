const articles = ["a", "an", "the", "for", "and", "nor", "but", "or", "in"];

// capitalize the first letter of a string
export function capitalize(str: string) {
  return str.charAt(0).toUpperCase() + str.slice(1);
}

// title-case a string of words
export function title(str: string, omitArticles: boolean = true) {
  const words = str.split(" ");
  const capitalized = words.map((word, idx, words) => {
    // don't capitalize articles unless they are the first or last word
    if (articles.includes(word) && idx !== 0 && idx !== words.length - 1) {
      return word;
    }

    return capitalize(word);
  });
  return capitalized.join(" ");
}
