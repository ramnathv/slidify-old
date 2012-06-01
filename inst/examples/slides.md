


..article: fill

<h1>
  <span class = 'yellow'>Slidify</font><br/>
  <span class = 'white' style = 'font-size: 0.7em;'>
    Reproducible HTML5 Slides
  </span><br/>
  <span class = 'white' style = 'font-size: 0.5em;'>
    by Ramnath Vaidyanathan
  </span>
</h1>

![slides](http://goo.gl/EpXln)

---

..article: file

# Slidify #

### Reproducible HTML Slides ###

---

### Overview ###

The objective of `slidify` is to make it easy to create reproducible HTML5 presentations from `.Rmd` files. 

The guiding philosophy of `slidify` is to completely separate writing of content from its rendering, so that content can be written once in `R Markdown`, and rendered as an `HTML5` presentation using any of the `HTML5` slide frameworks supported.

---

# Motivation #

---

# Several HTML5 slide frameworks exist... #

---

### deck.js ###


..article: fill

![deck.js](_images/deck.js.png)

---

### slidy ###

..article: fill

![slidy](_images/slidy.png)

---

### html5slides ###

..article: fill

![slidy](_images/html5slides.png)

---

### ... but it is a pain to write HTML ###

---



### Installation ###

This package is not available on `CRAN` as yet. A development version can be installed from `github` using the `devtools` package. 



    library(devtools)
    install_github('slidify', 'ramnathv')




In addition to `slidify`, you would also need to install development versions of `knitr`, `whisker` and `markdown`.



    install_github('knitr', 'yihui')
    install_github('whisker', 'edwindj')
    install_github('markdown', 'rstudio')



 
---

    
### Motivation ###


---

### Usage ###

`slidify` is designed to make it very easy for a HTML novice to generate a crisp, visually appealing `HTML5` slide deck. You can do it in just three steps!

..ul: build

* Write your source file in [R Markdown](http://goo.gl/KKdaf)
* Separate your slides using a horizontal rule `---`
* Run `slidify("slides.Rmd")` to generate your slide deck.


---

### Framework ###

`slidify` allows you to render your slides using several HTML5 slide frameworks. Currently supported frameworks are:

* [deck.js][1]
* [dzslides][2]
* [html5slides][3]
* [shower][4]
* [slidy][5]

Extending `slidify` to accommodate other frameworks is pretty straightforward. The plan is to support more frameworks over time.

[1]: http://imakewebthings.com/deck.js/
[2]: http://paulrouget.com/dzslides/
[3]: http://html5slides.googlecode.com/
[4]: http://pepelsbey.github.com/shower/en.htm
[5]: http://www.w3.org/Talks/Tools/Slidy2/Overview.html#(1)

---

### Theme ###

The `theme` option lets you style your slides. Currently, this option is available only for `deck.js` which allows the following themes

* web-2.0
* swiss
* neon

Themes are just `css` files. So it is easy to extend this option to the other frameworks if you can write css. 

---

### Transition ###

The `transition` option allows you to define the transition between slides. Currently, this option is available only for `deck.js` which allows the following transitions

* horizontal-slide [default]
* vertical-slide
* fade

Please consult [deck.js](http://goo.gl/UFthM) documentation for more information on `themes` and `transitions`


---

### Highlighter ###

`slidify` is designed to be modular and syntax highlighting is one module. Currently two options are supported

* `js` 
* `R`

The `js` option does client side highlighting using the javascript library [highlight.js][5], while the `R` option generates a static page, highlighted using the R package [highlight][6]. 

You will notice that the quality of highlighting for `R` code is better when done with the `R` package, rather than `highlight.js`.


[5]: http://softwaremaniacs.org/soft/highlight/en/
[6]: http://goo.gl/uy8Ww

---

### Highlight Style ###

`slidify` allows you complete control over how you want to style your source code using `css`. The styles currently supported depend on the `highlighter` chosen.

* `js` see documentation for [highlight.js](http://goo.gl/uEJj)
* `R`  type `knit_theme[['get']]()` to see available styles


In order to use the `R` option, you need to include the line `opts_knit$set(out.format = 'html')` inside your `.Rmd` file. This is required to fool `knitr` into highlighting source code. Specifying it outside the document does not work as `knitr` resets it to `md` as soon as it sees the `.Rmd` extension.

---

### Math ###

This option allows you to write math in your presentations. `slidify` automatically adds a link to the `js` files from Mathjax CDN. Here are Maxwell's Equations from the Mathjax website.

$$
\begin{aligned}
\nabla \times \vec{\mathbf{B}} -\, \frac1c\, \frac{\partial\vec{\mathbf{E}}}{\partial t} & = \frac{4\pi}{c}\vec{\mathbf{j}} \\   \nabla \cdot \vec{\mathbf{E}} & = 4 \pi \rho \\
\nabla \times \vec{\mathbf{E}}\, +\, \frac1c\, \frac{\partial\vec{\mathbf{B}}}{\partial t} & = \vec{\mathbf{0}} \\
\nabla \cdot \vec{\mathbf{B}} & = 0 \end{aligned}
$$

A cross-product formula, again from the Mathjax website

$$
\mathbf{V}_1 \times \mathbf{V}_2 =  \begin{vmatrix}
\mathbf{i} & \mathbf{j} & \mathbf{k} \\
\frac{\partial X}{\partial u} &  \frac{\partial Y}{\partial u} & 0 \\
\frac{\partial X}{\partial v} &  \frac{\partial Y}{\partial v} & 0
\end{vmatrix}
$$

---

### Animated Lists ###

It is easy to animate a list by adding the class specified `build`. For example, consider the `markdown` source below

    ..ul: build

    * Point 1
    * Point 2
    * Point 3

It produces the slide

..ul: build

* Point 1
* Point 2
* Point 3
    
---

### Issues ###

Different `HTML5` slide generation frameworks style the same elements differently. Moreover, they use different classes to define incremental builds, full page images etc.

As a result, a slide deck that looks visually appealing in one framework, may not look as nice in another. It will require carefully overriding the `css` definitions across frameworks so as to reach some kind of consistency.

The long-term goal of `slidify` is to be able to truly stand by the "write once, style as you like" idea. 

---


### License ###

..article: smaller

`slidify` is made available under the MIT License. The `slidify` logo was created using [supalogo](http://goo.gl/zmJHP). All included `css` and `javascript` are licensed under the terms specified by the respective slide generation frameworks.

**Copyright (C) 2012 Ramnath Vaidyanathan**

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

---

# References #

---

### HTML5 Slides and R ###


1. [An Introduction to R](http://goo.gl/L79xW)
2. [How to Make HTML Slides with knitr](http://goo.gl/7C907)
3. [Fancy HTML5 Slides with knitr and Pandoc](http://goo.gl/Uqnq3)
4. [Visualize World Bank Data](http://goo.gl/QlTA4)
5. [Interactive Presentations with deck.js](http://goo.gl/kdhBO)

---

### R Markdown and knitr ###

1. [Interactive Reports in R with knitr and RStudio](http://goo.gl/oTeV5)
2. [Getting Started with R Markdown, knitr and RStudio](http://goo.gl/ALjtQ)
3. [Dynamic Content RStudio, Markdown and Marked](http://goo.gl/84D5E)
4. [Using Markdown with RStudio](http://goo.gl/KKdaf)
5. [Example Reproducible Report using R Markdown](http://goo.gl/ZQF1u)
6. [Interactive Slides with R, googleVis and knitR](http://goo.gl/cVS9W)
7. [knitr, Slideshows and Dropbox](http://goo.gl/ZTSD7)

---

### Check Python Code Highlighting ###

```python
import landslide
class MyMacro(Macro):
   def process(self, content, source=None):
     return content + '<p>plop</p>', ['plopped_slide'] 
 g = generator.Generator(source='toto.md')
g.register_macro(MyMacro)
print g.render()
```

---

# Interpret the Histogram #


---

..article: fill




![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.svg) 


---

..article: fill

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.svg) 


---

### Google Charts ###

<!-- PieChart generated in R 2.15.0 by googleVis 0.2.15 package -->
<!-- Fri Jun  1 10:05:11 2012 -->


<!-- jsHeader -->
<script type="text/javascript" src="http://www.google.com/jsapi">
</script>
<script type="text/javascript">
 
// jsData 
function gvisDataPieChartID1652d105c2164 ()
{
  var data = new google.visualization.DataTable();
  var datajson =
[
 [
 "New York",
        200 
],
[
 "Boston",
        300 
],
[
 "Miami",
        400 
],
[
 "Chicago",
        500 
],
[
 "Los Angeles",
        600 
],
[
 "Houston",
        700 
] 
];
data.addColumn('string','City');
data.addColumn('number','Popularity');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartPieChartID1652d105c2164() {
  var data = gvisDataPieChartID1652d105c2164();
  var options = {};
options["allowHtml"] = true;

     var chart = new google.visualization.PieChart(
       document.getElementById('PieChartID1652d105c2164')
     );
     chart.draw(data,options);
    

}
  
 
// jsDisplayChart 
function displayChartPieChartID1652d105c2164()
{
  google.load("visualization", "1", { packages:["corechart"] }); 
  google.setOnLoadCallback(drawChartPieChartID1652d105c2164);
}
 
// jsChart 
displayChartPieChartID1652d105c2164()
 
<!-- jsFooter -->  
//-->
</script>
 
<!-- divChart -->
  
<div id="PieChartID1652d105c2164"
  style="width: 600px; height: 500px;">
</div>



---

<iframe width="960" height="720" src="http://www.youtube.com/embed/RA1ZVuJsmOI?rel=0" frameborder="0" allowfullscreen></iframe>

---

### Vimeo ###

<iframe src="http://player.vimeo.com/video/40491703" width="500" height="281" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>

---

# Why Should You Learn R? #

---

<iframe width="960" height="720" src="http://www.youtube.com/embed/W2GZFeYGU3s?rel=0" frameborder="0" allowfullscreen></iframe>

---

### Use RStudio ###

..article: fill

<img class = 'centered' src = "http://rstudio.org/images/screenshots/rstudio-windows.png" 
  height = 90%>
</img>
