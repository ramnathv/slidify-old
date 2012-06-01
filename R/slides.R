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

# slidify <- function(input, framework = 'shower', highlighter = 'R', histyle = 'acid', theme = 'web-2.0', transition = 'horizontal-slide', mathjax = TRUE){
#   require(plyr); require(whisker); require(knitr)
#   
#   if (highlighter == 'js'){
#     js = TRUE
#     if (!file.exists('highlight.js')) {
#       h_file <- system.file('frameworks', 'highlight.js', package = 'slidify')
#       file.copy(h_file, ".", recursive = T)
#     }
#     render_markdown(strict = TRUE)
#   } else {
#     js = FALSE
#     if (!file.exists('highlight')) {
#       h_file <- system.file('frameworks', 'highlight', package = 'slidify')
#       file.copy(h_file, ".", recursive = T)
#     }
#     render_html()
#   }
#   
#   if (!file.exists(framework)) {
#     file.copy(system.file('frameworks', framework, package = 'slidify'), ".", recursive = T)
#   }
#   
#   # @TODO: replace path after installing as library
#   frameworks = "."
#   
#   md_file <- gsub("\\.Rmd", "\\.md", input)
#   html_file <- gsub("\\.Rmd", "\\.html", input)
#   
#   knit(input, md_file)
#   
#   doc <- paste(readLines(md_file), collapse = "\n")
#   doc <- unlist(strsplit(doc, "\n---\n"))
#   slides <- llply(doc, slide2list)
#   
#   template <- system.file('templates', sprintf("%s.html", framework), package = 'slidify')
#   template <- readLines(template)
#   writeLines(whisker.render(template), html_file)
# }

# @TODO: Add attribution to original author.
make_id <- function(n = 1, length = 4){
	randomString <- c(1:n)            
	for (i in 1:n){
		randomString[i] <- paste(sample(c(0:9, letters, LETTERS),
			length, replace=TRUE), collapse="")
	}
	return(randomString)
}
