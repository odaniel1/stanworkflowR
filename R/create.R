#' Creates a new model workflow
#' @param model_id A name for a model
#' @return Invisible
#' @export
create_rstan_workflow <- function(model_id, ...){

  create_model_directory(model_id, ...)

  write_model_templates(model_id, ...)

  invisible(TRUE)
}

#' Creates a model entry in the library
#' @param model_id A name for a model
#' @return Invisible
create_model_directory <- function(model_id, ...){

  model_path <- model_path(model_id, ...)

  if(fs::dir_exists(model_path)){
    stop("Stan model directory already exists.")
  }

  fs::dir_create(model_path)
  invisible(TRUE)
}
