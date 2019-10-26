#' Creates a new model workflow
#' @param model_id A name for a model
#' @return Invisible
#' @export
create_rstan_workflow <- function(model_id, ...){

  create_model_directory(model_id, ...)

  create_model_files(model_id, ...)

  invisible(TRUE)
}

#' Creates a model entry in the library
#' @param model_id A name for a model
#' @return Invisible
create_model_directory <- function(model_id, ...){

  model_path <- create_model_path(model_id, ...)

  if(fs::dir_exists(model_path)){
    stop("Stan model directory already exists.")
  }

  fs::dir_create(model_path)
  invisible(TRUE)
}

#' Adds standard model files to the model entry.
#' @param model_id A name for a model
#' @return Invisible
create_model_files <- function(model_id, ...){

  model_path <- create_model_path(model_id, ...)

  model_files <- paste0(model_path, "/", model_id, c(".stan", "-parameters.R"))

  purrr::map(model_files, fs::file_create)
  invisible(TRUE)
}

#' Defines the file path for a model in the model library.
#' @param model_id A name for a model
#' @return The file path for the model
create_model_path <- function(model_id, path = NULL){

  if(!is.null(path)){
    model_library_path <- path
  } else {
    model_library_path <- options()$model_library_path
  }

  if(is.null(model_library_path)){
    stop("Path to model library must either be set locally using the path argument,
         or set globally using the fix_model_library_path function")
  }

  paste0(model_library_path, "/", model_id)
}

#' Fix a path in global options for stan models to be saved.
#' @param path A file path
#' @return Invisible
#' @export
fix_model_library_path <- function(path){
  options(model_library_path = path)
  invisible(TRUE)
}
