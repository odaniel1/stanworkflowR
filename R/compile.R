#' Compiles a stan model
#' @param model_id A name for a model
#' @return A compiled stan model
#' @export
compile_model <- function(model_id,auto_write = TRUE,...){

  rstan::rstan_options(auto_write = auto_write)

  stan_path <- model_object_path(model_id, ".stan", ...)
  compiled_model <- rstan::stan_model(stan_path)
  return(compiled_model)
}
