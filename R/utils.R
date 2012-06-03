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

slide2list <- function(slide){
	require(markdown); 
	content  <- markdownToHTML(text = slide, options = c('fragment_only'))
	content  <- readLines(textConnection(content))
	article  <- NULL
	fx_regex <- '^<p>(..article:\\s?)(.*?)</p>\n?$'
	fx_match <- grep(fx_regex, content)
	if (length(fx_match) == 1) {
		article  <- gsub(fx_regex, '\\2', content[fx_match])
		content  <- content[-fx_match]
	}
	
	# CHECK FOR INCREMENTAL LISTS 
	ul_regex <- '^<p>(..ul:\\s?)(.*?)</p>\n?$'
	ul_match <- grep(ul_regex, content)
	if (length(ul_match) >= 1) {
		ul_loc   <- grep('^<ul>', content)
		ul_class <- gsub(ul_regex, "\\2", content[ul_match])
		content[ul_loc]  <- sprintf('<ul class= "%s">', ul_class)
		content <- content[-ul_match]
	}
	
	# CHECK FOR INCREMENTAL LISTS IN  DECK.JS
	li_regex <- '^<p>(..li:\\s?)(.*?)</p>\n?$'
	li_match <- grep(li_regex, content)
	if (length(li_match) >= 1) {
		li_loc   <- grep('^<li>', content)
		li_class <- gsub(li_regex, "\\2", content[li_match])
		content[li_loc]  <- gsub("^<li>", sprintf('<li class= "%s">', li_class), content[li_loc])
		content <- content[-li_match]
	}
	
	content  <- paste(content, collapse = '\n')
	id <- make_id(length = 4)
	list(content = content, article = article, id = id)
}