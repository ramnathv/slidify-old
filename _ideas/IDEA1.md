# Simplifying Function Arguments #

I want to keep the user interface part of `slidify` reasonably simple. One way to do this is to redefine `slidify` to

    slidify = function(source, options = getOptions(slidify.options)){
      ...
    }
    
And then use the trick from the `markdown` package

    slidifyOptions <- function(){
      c(framework = 'html5slides', highlighter = 'R', theme = 'web-2.0', 
        transition = 'horizontal-slide', histyle = 'acid')
    }


    .onLoad <- function(libname, pkgname){
      if (is.null(getOption('slidify.options'))){
        options(slidify.options = slidifyOptions())
      }
    }

I can rewrite the code such that if there is a `slidify.yml` file in the working directory, then the options are read from it, instead of using the defaults. 

