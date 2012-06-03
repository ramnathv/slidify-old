slidify2 <- function(config_file){
  config <- yaml::yaml.load_file(config_file)
  do.call('slidify', config)
}