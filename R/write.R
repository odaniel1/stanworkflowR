#' Writes standard template files
#' @param model_id A name for a model
#' @return Invisible
write_model_templates <- function(model_id, ...){

  write_stan_template(model_id, ...)
  write_stan_data_template(model_id, ...)

  invisible(TRUE)
}

#' Writes a template stan file
#' @param model_id A name for a model
#' @return Invisible
write_stan_template <- function(model_id, ...){
  stan_txt <- stan_template(model_id)
  stan_path <- model_object_path(model_id, ".stan", ...)
  writeLines(stan_txt, stan_path)
}

#' Writes a template stan data file
#' @param model_id A name for a model
#' @return Invisible
write_stan_data_template <- function(model_id, ...){
  param_txt <- stan_data_template(model_id)
  param_path <- model_object_path(model_id, "-stan-data.R", ...)
  writeLines(param_txt, param_path)
}
