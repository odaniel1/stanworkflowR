#' Adds a compiled stan model to project .gitignore
#' @param model_id A name for a model
#' @return Invisible
#' @export
git_ignore_compiled_model <- function(model_id,...){
  compiled_model <- model_object_path(model_id, ".rds", ...)

  system_cmd <- paste0("echo ", compiled_model, ">> .gitignore")

  system(system_cmd)
  invisible(TRUE)
}
