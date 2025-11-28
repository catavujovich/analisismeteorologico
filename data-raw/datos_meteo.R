# IDs de las estaciones
ids_estaciones <- c("NH0046", "NH0098", "NH0437", "NH0472", "NH0910")

lista_datos <- lapply(ids_estaciones, function(id) {
  cli::cli_inform("Procesando datos de la estación: {id}")
  archivo <- file.path("data-raw", paste0(id, ".csv"))
  readr::read_csv(archivo, show_col_types = FALSE)
})

datos_meteorologicos <- dplyr::bind_rows(lista_datos, .id = "id_estacion")

usethis::use_data(datos_meteorologicos, overwrite = TRUE)
