#' Compiles a stan model
#' @param model_id A name for a model
#' @param auto_write Logical, defaulting to TRUE, indicating whether to save compiled model
#' @param git_ignore Logical, defaulting to TRUE, indicating whether the compiled model should be added to the projects .gitignore
#' @return A compiled stan model
#' @export
compile_model <- function(model_id,auto_write = TRUE, git_ignore = TRUE, ...){

  rstan::rstan_options(auto_write = auto_write)

  stan_path <- model_object_path(model_id, ".stan", ...)
  compiled_model <- rstan::stan_model(stan_path)

  if(auto_write == TRUE & git_ignore == TRUE){
    git_ignore_compiled_model(model_id,...)
  }

  return(compiled_model)
}
