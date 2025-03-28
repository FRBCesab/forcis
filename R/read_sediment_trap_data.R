#' @rdname read_data
#' @export

read_sediment_trap_data <- function(
  path = ".",
  version = options()$"forcis_version",
  check_for_update = options()$"forcis_check_for_update"
) {
  ## Check args ----

  check_if_character(path)
  check_version(version)

  ## Check/set version ----

  version <- set_version(version, ask = FALSE)

  ## Check local database ----

  path <- file.path(path, "forcis-db", paste0("version-", version))

  if (!dir.exists(path)) {
    stop(
      "The directory '",
      path,
      "' does not exist. Please check the ",
      "argument 'path' or use the function 'download_forcis_db()'.",
      call. = FALSE
    )
  }

  ## Check file ----

  file_name <- list.files(path, pattern = sediment_trap_filename())

  if (!length(file_name)) {
    stop(
      "The Sediment trap dataset does not exist. Please use the function ",
      "'download_forcis_db()'.",
      call. = FALSE
    )
  }

  ## Check for update ----

  if (is.null(check_for_update)) {
    check_for_update <- TRUE
  }

  if (check_for_update) {
    if (version != get_latest_version()) {
      message(
        "A newer version of the FORCIS database is available. Use ",
        "'download_forcis_db(version = NULL)' to download it."
      )
    }
  }

  ## Read data ----

  file_name <- list.files(path, pattern = sediment_trap_filename())

  data <- vroom::vroom(
    file.path(path, file_name),
    delim = ";",
    altrep = FALSE,
    show_col_types = FALSE
  )

  data <- as.data.frame(data)

  data <- add_data_type(data, "Sediment trap")

  ## Check and convert columns ----

  taxa_columns <- get_species_names(data)

  for (i in seq_len(length(taxa_columns))) {
    data[, taxa_columns[i]] <- as.numeric(data[, taxa_columns[i]])
  }

  tibble::as_tibble(data)
}
