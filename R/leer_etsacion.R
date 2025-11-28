leer_estacion <- function(id_estacion, ruta) {

  # Lista de URLs disponibles
  urls <- list(
    NH0472 = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0472.csv",
    NH0910 = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0910.csv",
    NH0046 = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0046.csv",
    NH0098 = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0098.csv",
    NH0437 = "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/NH0437.csv"
  )

  # Validación del ID
  if (!id_estacion %in% names(urls)) {
    cli::cli_abort("El id de estación '{id_estacion}' no es válido. Usá uno de: {toString(names(urls))}")
  }

  # URL correspondiente a la estación
  url <- urls[[id_estacion]]

  # Carpeta donde se guardará
  directorio <- dirname(ruta)

  # Crear carpeta si no existe
  if (!dir.exists(directorio)) {
    cli::cli_inform("La carpeta '{directorio}' no existe. Creándola…")
    dir.create(directorio, recursive = TRUE)
    cli::cli_inform("Carpeta '{directorio}' creada.")
  }

  # Descarga del archivo si no existe
  if (!file.exists(ruta)) {
    cli::cli_inform("El archivo no existe en la ruta indicada. Descargando datos de la estación {id_estacion}…")
    utils::download.file(url, ruta, mode = "wb")
    cli::cli_inform("Descarga completada en '{ruta}'.")
  } else {
    cli::cli_inform("El archivo ya existe en la ruta indicada. Leyendo archivo '{ruta}'…")
  }

  # Lectura del archivo (sin mostrar mensajes molestos)
  datos <- suppressWarnings(
    suppressMessages(
      readr::read_csv(
        ruta,
        show_col_types = FALSE,
        progress = FALSE
      )
    )
  )

  cli::cli_inform(
    "Lectura completada. El dataset de la estación {id_estacion} tiene {nrow(datos)} filas y {ncol(datos)} columnas."
  )

  return(datos)
}

