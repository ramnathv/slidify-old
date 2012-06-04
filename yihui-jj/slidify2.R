slidify2 <- function(config_file){
  require(yaml)
  config <- yaml.load_file(config_file)
  do.call('slidify', config)
}