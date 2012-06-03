slidify <- function(input, framework = 'html5slides', highlighter = 'R', histyle = 'acid', theme = 'web-2.0', transition = 'horizontal-slide', mathjax = TRUE){
  
  create_skeleton()
  copy_framework(framework)
  copy_highlighter(highlighter, histyle, framework)
	
	if (highlighter == 'js'){
	  js = TRUE
  	render_markdown(strict = TRUE)
	} else {
	  js = FALSE
	  render_html()
	}
	
	custom_css <- list.files('css', full = T)
	custom_js  <- list.files('js', full = T)
	
	md_file <- gsub("\\.Rmd", "\\.md", input)
	html_file <- gsub("\\.Rmd", "\\.html", input)
	
	knit(input, md_file)
	
	doc <- paste(readLines(md_file), collapse = "\n")
	doc <- unlist(strsplit(doc, "\n---\n"))
	slides <- llply(doc, slide2list)
	
	template <- system.file('templates', sprintf("%s.html", framework), package = 'slidify')
	template <- readLines(template)
	writeLines(whisker.render(template), html_file)
}

#' @importFrom yaml yaml.load_file
slidify2 <- function(config_file){
  config <- yaml.load_file(config_file)
  do.call('slidify', config)
}

