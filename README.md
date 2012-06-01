## Overview ##

The objective of `Rslides` is to make it easy to create reproducible HTML5 presentations from `.Rmd` files. The guiding philosophy is to completely separate writing of content from its rendering, so that users can write content once in `R Markdown`, and render it as an `HTML5` presentation using any of the `HTML5` slide frameworks supported.

## Installation ##

This package is not available on `CRAN` as yet. A development version can be installed from `github` using the `devtools` package. In addition to `slidify`, you would also need to install development versions of `knitr`, `whisker` and `markdown`. 

    library(devtools)
    install_github('knitr', 'yihui')
    install_github('whisker', 'edwindj')
    install_github('markdown', 'rstudio)
    install_github('slidify', 'ramnathv')

    
## Motivation ##


## Usage ##

The objective of `slidify` is to make it super easy for a HTML novice to generate crisp looking `HTML5` presentations, while at the same time providing options for the power user to customize the look and feel of the slides.

The source file is written in `R Markdown`. It is transformed into an `HTML5` slide deck using a set of `mustache` templates and `R` packages `whisker` and `markdown`. 


At the heart of it is the function `slidify`. The arguments accepted by `Rmd2html` are:

* `input` Source file in R markdown
* `framework` Slide framework to use. The `HTML5` frameworks currently supported by `Rslides` are [`deck.js`][1], [`dzslides`][2], [`html5slides`][3] and [`shower`][4]. The plan is to add more frameworks over time to create a richer set of options for users.
* `highlight` Syntax highlighter to use. Currently supports using `highlight` package from `R` or [`highlight.js`][5]
* `histyle` Highlighting style to use.
* `theme` Theme to be used for the presentation. Currently this option is only supported for `deck.js`. 
* `transition` Transition to use between slides. Currently this option is only supported for `deck.js`.

Please consult [`deck.js`][1] documentation for further details on supported `themes` and `transitions`

## Usage ##

`slidify` is designed to make it very easy for a HTML novice to generate a crisp, visually appealing `HTML5` slide deck. You can do it in just three steps!

1. Write your source file in [R Markdown](http://goo.gl/KKdaf)
2. Separate your slides using a horizontal rule `---`
3. Run `slidify("slides.Rmd")` to generate your slide deck.


[1]: http://imakewebthings.com/deck.js/
[2]: http://paulrouget.com/dzslides/
[3]: http://html5slides.googlecode.com/
[4]: http://pepelsbey.github.com/shower/en.htm
[5]: http://softwaremaniacs.org/soft/highlight/en/

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

---

## License ##

`slidify` is made available under the MIT License

**MIT License**

Copyright (C) 2012 Ramnath Vaidyanathan

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


