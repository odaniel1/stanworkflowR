create_rstan_workflow <- function(path){

  if(fs::dir_exists(path)){
    stop("File path already exists.")
  }

  fs::dir_create(path)
  invisible(TRUE)
}
