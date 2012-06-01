copy_framework <- function(framework){
  if (!file.exists(framework)) dir.create(framework)
  file.copy(system.file('frameworks', framework, package = 'slidify'), ".", recursive = TRUE)
}

copy_highlighter <- function(highlighter, histyle, framework){
  if (highlighter == "js"){
   js_file  <- system.file('highlighters', 'highlight.js', 'highlight.pack.js', package = 'slidify')
   css_file <- system.file('highlighters', 'highlight.js', 'styles', sprintf('%s.css', histyle), package = 'slidify')
   file.copy(js_file,  "highlight")
   file.copy(css_file, "highlight")
  } else {
   css_file <- system.file('highlighters', 'highlight', 'styles', sprintf('%s.css', histyle), package = 'slidify')
   file.copy(css_file, 'highlight')
  }
}

create_skeleton <- function(){
  create_dir <- function(x){
    if (!file.exists(x)) dir.create(x)
  }
  create_dir('js')
  create_dir('css')
  create_dir('highlight')
}

add_theme <- function(theme){
  css_file <- system.file('themes', sprintf('%s.css', theme), package = 'knitr')
  css_doc  <- highlight::css.parser(css_file)
  bgcol    <- css_doc$background$color
  fgcol    <- css_doc$prompt$color
  tem_file <- 'inst/templates/highlight.css'
  template <- readLines(tem_file)
  theme_file <- sprintf("inst/highlighters/highlight/styles/%s.css", theme)
  file.copy(css_file, theme_file)
  cat(whisker.render(template), file = theme_file, append = TRUE)
}