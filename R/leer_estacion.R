#' Leer y descargar datos de una estación meteorológica
#'
#' Esta función descarga (si es necesario) y lee los datos correspondientes
#' a una estación meteorológica determinada. Los datos provienen de un
#' repositorio público y se guardan localmente en la ruta indicada.
#'
#' @description
#' `leer_estacion()` permite cargar datos de estaciones meteorológicas
#' identificadas por su código (por ejemplo, `"NH0098"` o `"NH0472"`).
#' Si el archivo no existe en la ruta local indicada, la función lo descarga
#' automáticamente. Si la carpeta no existe, la crea.
#'
#' @param id_estacion Cadena de texto con el identificador de la estación.
#' Debe ser uno de: `"NH0472"`, `"NH0910"`, `"NH0046"`, `"NH0098"`, `"NH0437"`.
#'
#' @param ruta Ruta local donde se guardará el archivo CSV descargado.
#'
#' @return Un data frame con los datos de la estación seleccionada.
#'
#' @examples
#' \dontrun{
#' # Leer estación NH0098 y guardar el archivo en la carpeta datos/
#' datos_NH0098 <- leer_estacion("NH0098", "datos/NH0098.csv")
#'
#' # Otra estación
#' datos_NH0472 <- leer_estacion("NH0472", "datos/NH0472.csv")
#' }
#'
#' @export
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

