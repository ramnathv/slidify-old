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


## References ##

### HTML5 Slides and R ###


1. [An Introduction to R](http://goo.gl/L79xW)
2. [How to Make HTML Slides with knitr](http://goo.gl/7C907)
3. [Fancy HTML5 Slides with knitr and Pandoc](http://goo.gl/Uqnq3)
4. [Visualize World Bank Data](http://goo.gl/QlTA4)
5. [Interactive Presentations with deck.js](http://goo.gl/kdhBO)

### R Markdown and knitr ###

1. [Interactive Reports in R with knitr and RStudio](http://goo.gl/oTeV5)
2. [Getting Started with R Markdown, knitr and RStudio](http://goo.gl/ALjtQ)
3. [Dynamic Content RStudio, Markdown and Marked](http://goo.gl/84D5E)
4. [Using Markdown with RStudio](http://goo.gl/KKdaf)
5. [Example Reproducible Report using R Markdown](http://goo.gl/ZQF1u)
6. [Interactive Slides with R, googleVis and knitR](http://goo.gl/cVS9W)
 