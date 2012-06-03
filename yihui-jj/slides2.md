# New Tools for Reproducible Research with R #

### JJ Allaire and Yihui Xie, 2012/06/05 ###




---

### Reproducible Research with R ###

- Single document containing analysis, code, and results

- Sweave (included in R)

    - Inspired by Donald Kunth’s Literate Programming
    - Enables embedding R code into LaTeX documents

- New tools

    - Add powerful new capabilities to Sweave
    - Make authoring easier and more productive
    - Support publishing to the web

---

# Prime Directive #

### Trustworthy Software ###

---

..article: smaller

<q>Those who receive the results of modern data analysis have limited opportunity to verify the results by direct observation. Users of the analysis have no option but to trust the analysis, and by extension the software that produced it. This places an obligation on all creators of software to program in such a way that the computations can be understood and trusted. This obligation I label the __Prime Directive__.</q>

<div class = 'author'>Chambers, Software for Data Analysis: Programming with R</div>

---

### Challenges

- Extending Sweave with new features and new formats

- Tools that support both content authoring and coding

- Authoring documents with multiple representations

- LaTeX is not easy to learn and use for everyone

- Publishing to the web

---

### R Markdown

- Markdown is an easy to write plain text format for web authoring:
    - Formatting akin to plain-text email
    - Allows arbitrary HTML for complex formatting
    - Many open-source implementations available

- R Markdown is like Sweave for web pages rather than PDFs

- Web improves accessibility, interactivity, and collaboration

- Also possible to create standalone HTML files

---

### The markdown Package

This code produces an identical result to Knit HTML in RStudio (with no runtime dependency on RStudio):



       knit("foo.Rmd")
       markdownToHTML("foo.md")
       browseURL("foo.html")   




- Enables use of R Markdown with any editor or IDE

- Wikis, blogs, and other content management systems

- Scheduled batch generation of reports on a server

---

### The knitr Package

- Next-generation re-implementation of Sweave

- Adds many features to Sweave including caching, syntax highlighting, code externalization, and new graphics capabilities

- Very extensible design

- Supports publishing to the web (R HTML and R Markdown)

---

### Motivation (as a student and TA)

I do homework, I grade homework, and I saw this:

![](http://i.imgur.com/ce1BT.png)

# Principle 1 #

### Beautiful output by default ###

---

- code highlighting (package **highlight**)
    - hundreds of themes
- reformat code for lazy users (package **formatR**)

---

### Code highlighting

![](http://i.imgur.com/Tk0OF.png)

---

### Code reformatting



    ## option tidy=FALSE
    for(k in 1:10){j=cos(sin(k)*k^2)+3;print(j-5)}




Same code, reformatted:



    ## option tidy=TRUE
    for (k in 1:10) {
      j = cos(sin(k) * k^2) + 3
      print(j - 5)
    }




---

# Principle 2 #

### What you imagined is what you get ###

---

- running **knitr** gives you whatever you see in a normal R session
- `qplot(carat, price, data = diamonds)` just works; no need `print()`
- if your code produces two plots, you get two in the output
    - Sweave gives you one unless you use dark voodoo
- what if you have 50 plots? (demo)

---

# Principle 3 #

### Focus on R programming ###

---

### Focus on R Programming ###

- you `plot()` only; `cat('\\includegraphics{}')` or `dev.off()` is not your job
    - **knitr** has all common graphical devices to save your plots into many formats; you should not manipulate a device in R code
- LaTeX tricks should be avoided unless they are really smart
    - `\setkeys{Gin}` is a terrible trick; you have `out.width` in **knitr** (e.g. `out.width = '.8\\textwidth'`)

---

# Principle 4 #

### Be sustainable ###

---

Compare



    > (x = 0)



    [1] 0



    > x = x + 1




to (default):



    (x = 0)



    ## [1] 0



    x = x + 1




You do not appreciate this unless you have been a homework grader.

---

# Principle 5 #

### I write the core, you can define the decoration ###

---

- I parse/evaluate the code and give you the raw results, then you have control of everything
- for example
    - source code `1 + 1`
    - output `[1] 2`
    - _`\begin{verbatim}`_ `[1] 2` _`\end{verbatim}`_
    - or _`<div class="output">`_ `[1] 2` _`</div>`_
    - or ```` ```[1] 2``` ````

---

### Output hooks

You can control how the source code, normal output, warnings, messages, errors and plots are written in the output document.



    knit_hooks$set(source = function(x, options) {
        paste("\\begin{DearSource}", x, 
              "\\end{DearSource}", sep = "")
    })




LaTeX, HTML, Markdown and reStructuredText have been supported, and it is straightforward to support other formats.

---

# Principle 6 #

### All your base are belong to us ###

---

- the `tikz()` device supported by **pgfSweave**
- cache in **cacheSweave**
- automatic detection of chunk dependencies in **weaver**
- animations in my **animation** package
- **knitr** &asymp; Sweave + cacheSweave + pgfSweave + weaver + `animation::saveLatex` + `R2HTML::RweaveHTML` + `highlight::HighlightWeaveLatex` + 0.2 \* brew + 0.1 \* SweaveListingUtils + more
- without copying 700 lines of code

---

# Principle 7 #

### Do not scare beginners ###

---

- you get reasonable output even if you do not set any options; just `knit()` it (convention over configuration)
- if you only have an R script, you can still do a report: `stitch()`
- if clicking a button works, click it
    - RStudio
    - LyX (demo)

---

# Principle 8 #

### Open source is open ###

---

In theory you can use any language with **knitr**, e.g.

    <<test-python, engine='python'>>=
    x = 'hello, python world!'
    print x
    print x.split(' ')
    @

Contributions needed!

---

# Principle 9 #

### Literate programming is programming ###

---

- we can go beyond the model of `Code + Documentation`
- a LP document can be programmable

---

### Programmable reports: Example 1

    <<setup>>=
    library(gridExtra)
    g = tableGrob(head(iris, 4))
    @
    
    <<draw-table, dev='png', dpi=150, fig.width=convertWidth(grobWidth(g), "in", value=TRUE), fig.height=convertHeight(grobHeight(g), "in", value=TRUE)>>=
    grid.draw(g)
    @

---

### Programmable reports: Example 2

Chunk hooks are functions associated with code chunks.



    knit_hooks$set(tweet = function(before, options, envir) {
      library(twitteR)
      # Authentication with OAuth here, then
      if (!before) {
        msg = paste('I have finished the chunk',
                    options$label, ', my Lord!')
        tweet(msg)
      }
    })
    # enable the chunk hook
    opts_chunk$set(tweet = TRUE)




---

### Conclusions

- make reproducible research enjoyable first (new tools to hide gory details)
- all people do homework assignments before they do research, so make your homework reproducible first
- build extensible tools to satisfy both beginners and advanced users
- **knitr** allows any input languages and any output formats; attention to details
- reproducible blogging, exams/solutions, books, web tutorials, ...

---

### IN CODE WE TRUST

Questions and comments?
