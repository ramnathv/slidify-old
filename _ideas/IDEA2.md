## Rewrite Templates Using Mustache Partials ##

This would significantly reduce code duplication. Here is the basic idea illustrated for `mathjax` in the template. 

<!-- LOAD MATHJAX JS -->
{{#mathjax}}
<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}
  });
</script>
<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
{{/mathjax}}
<!-- DONE LOADING MATHJAX  -->

I can define this as a `partial` and then use it inside any of the main templates by invoking it as

{{> mathjax}}


A major advantage of this approach is that if I were to update code involving `mathjax`, I would only have to update the `partial`.

Here is a list of partials that I might want to use

* mathjax
* highlighter
* custom

I can pretty much define even the main themes as partials. I need to think this idea through in detail before I implement it. Maybe for starters, just implement one partial and see how it works.

I need to remember to create a list of partials to be passed to `whisker.render`


## Highlighter Paritals ##


The `highlight.js` partial would be

<link rel="stylesheet" href="highlight/{{histyle}}.css">
<script src="highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>

I can read the correct partial to use by setting `syntax = readLines(highlighter)` and passing it to `whisker.render` as `partials = list(syntax = syntax)`
