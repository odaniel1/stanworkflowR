#' Creates a template stan file.
#' @param model_id A name for a model
#' @return Invisible
stan_template <- function(model_id){

  model_id %>%
    paste0("// ", ., ".stan\ndata { }\nparameters { }\ntransformed parameters { }\nmodel { }")
}

#' Creates a stan data template file.
#' @param model_id A name for a model
#' @return Invisible
stan_data_template <- function(model_id){

  model_id %>%
    paste0("# ", ., "-stan-data.stan")
}
