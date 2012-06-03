## META DATA FOR MUSTACHE TEMPLATES ##

I like the approach taken by `ruhoh` to create payload object of variables that can be used by the `templates`. I can think of doing the same with `slidify`. 

### Presentation ###

    presentation:
      title:
      author:
      date:
      framework:
      theme:
      transition:
      highlighter:
      histyle:


### Slides

* `slide.class`
* `slide.title`
* `slide.id`
* `slide.content`
* `slide.layout`
* `slide.source`

### Paths ###

I can use `list.files` to automatically detect all `css` and `js` files in the `theme` directory and add them to the template header. This might also simplify things considerably by being able to define a single template across slide decks.


* `paths.theme`
* `paths.syntax`
* `paths.media`

