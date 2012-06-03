## Separator ##


I need to decide between using `---` as slide separator vs. `!SLIDE`. The advantage of the latter is that it is easier to stick in slide classes by adding it to the `!SLIDE` line, whereas in the other case, I need to add it in a separate line. The `!SLIDE` separator is used by [`showoff`](https://github.com/schacon/showoff) and [`keydown`](https://github.com/infews/keydown)

## Highlighting ##

1. I can support syntax highlighting either using `highlight.js` or the `highlight` package in `R`. The advantage of using the `highlight` package in `R` is that it leads to much better syntax highlighting as it is able to recognize `R` specific constructs. The key is to set `out.format = "html"` so that `knitr` is fooled into highlighting syntax and use `render_html` so that code chunks and their outputs are wrapped in `html` tags. The key question is how to code this elegantly so that it is easy to add more syntax highlighters in the future.

2. I need to explicitly set `opts_knit$set(out.format = "html")` inside the `.Rmd` file in order to allow syntax highlighting by the `highlight` package in `R`. Ideally, I want this option to be automatically set if the highlighter is `R`. Maybe, if I 

## Consolidating

1. Figure out a way to define class synonyms so that slide classes can be used interchangeably across frameworks. For example `cover` and `fill` do the same thing and fill out the entire slide.
2. I need to figure out a way to consistently style source code across frameworks while using R to highlight it. The main issue is that `knitr` seems to wrap everything inside a maze of `divs` and I am really not sure how to style them. One option is to rewrite the default hooks so that things are consistent.

## Customization ##


1. Allow users to specify all options via a configuration file (either in `dcf` or `yaml` formats)
2. Allow users to specify metadata: `title`, `author`, `date`, `license` etc.
3. Allow separate `.Rmd` files to be combined while generating a slide deck. It should be relatively straightforward, since I am already splitting a document into slides. It would just require a minor modification inside `slidify`.

## Miscellaneous ##

1. Generate a nice logo for `slidify` and use it on the introductory slide deck. DONE
2. Think about minifying all CSS and JS so that presentations can load faster.
3. Host CSS and JS files on CDN so that users don't have to mess around with local files.


## Consolidate ##

I need to consolidate the best features across the different frameworks so that a user can concentrate just on the content. Here are some of the major elements that need to be consolidated

1. Animation of slides.
2. Full page image.
3. H1/H2/H3 styling.

## To Dos.

1. Consolidate 'build' specifications across frameworks.
2. Create modules/macros to process `..ul: incremental` tags appropriately.
3. Figure out a better way to create slide ids.
4. Consolidate full page image specifications across frameworks.
5. Redefine viewport in html5 template so that curves on slide border are visible.
6. Add `header` specification to title in `shower` so that it is appropriately styled.
7. Allow users to specify custom `css` and `js` files.
8. Allow users to specify a `config.R` file which specifies presentation specific settings.

