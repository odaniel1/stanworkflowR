#' Defines the file path for a model object.
#' @param model_id A name for a model
#' @return The file path for the model
model_object_path <- function(model_id, object, ...){
  model_path <- model_path(model_id, path = ...)
  paste0(model_path,"/", model_id, object)
}

#' Defines the file path for a model in the model library.
#' @param model_id A name for a model
#' @return The file path for the model
model_path <- function(model_id, path = NULL){

  if(!is.null(path)){
    model_library_path <- path
  } else {
    model_library_path <- options()$model_library_path
  }

  if(is.null(model_library_path)){
    stop("Path to model library must either be set locally using the path argument,
         or set globally using the fix_model_library_path function")
  }

  paste0(model_library_path, model_id)
}

#' Fix a path in global options for stan models to be saved.
#' @param path A file path
#' @return Invisible
#' @export
set_model_library_path <- function(path){
  options(model_library_path = path)
  invisible(TRUE)
}
