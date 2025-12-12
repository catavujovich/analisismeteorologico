#' Generar una tabla resumen de temperatura para varias estaciones
#'
#' Esta funcion descarga (si es necesario), lee y combina los datos
#' de temperatura de multiples estaciones meteorologicas. Para cada estacion,
#' se calcula un conjunto de estadísticas descriptivas (mínimo, máximo,
#' media, mediana, desvio estandar, etc.).
#'
#' @description
#' `tabla_resumen_temperatura()` permite obtener una tabla resumen
#' con estadisticas descriptivas basicas de temperatura para una lista
#' de estaciones.
#'
#' Si la carpeta indicada en `carpeta` no existe, la funcion `leer_estacion()`
#' la crea automaticamente antes de guardar los archivos descargados,
#' por lo que **no es necesario crear las carpetas manualmente**.
#'
#' @param estaciones Vector de caracteres con los IDs de estaciones a procesar
#' (por ejemplo: `c("NH0098", "NH0437")`).
#'
#' @param carpeta Carpeta donde se guardan los archivos descargados.
#' Por defecto `"datos"`.
#' Si la carpeta no existe, se crea automaticamente.
#'
#' @returns
#' Un data frame con una fila por estacion y las siguientes columnas:
#' - `estacion`: ID de la estacion
#' - `n`: cantidad de observaciones validas
#' - `minimo`: valor minimo registrado
#' - `maximo`: valor maximo registrado
#' - `media`: promedio de temperatura
#' - `mediana`: mediana de temperatura
#' - `sd`: desvio estandar
#'
#' @examples
#' \dontrun{
#' # Ejemplo 1: Generar tabla resumen para una sola estacion
#' resumen_una <- tabla_resumen_temperatura(
#'   estaciones = c("NH0098"),
#'   carpeta = "datos"
#' )
#'
#' # Ejemplo 2: Generar tabla resumen para dos estaciones
#' resumen_dos <- tabla_resumen_temperatura(
#'   estaciones = c("NH0098", "NH0437"),
#'   carpeta = "datos"
#' )
#' # Ejemplo 3: Generar tabla resumen para TODAS las estaciones
#' resumen <- tabla_resumen_temperatura(
#'   estaciones = c("NH0472", "NH0910", "NH0046", "NH0098", "NH0437")
#' )
#' }
#'
#' @export
tabla_resumen_temperatura <- function(estaciones, carpeta = "datos") {

  # Lista donde guardar los datos
  datos_lista <- list()

  for (id in estaciones) {

    ruta_archivo <- file.path(carpeta, paste0(id, ".csv"))
    datos <- leer_estacion(id, ruta_archivo)

    # Agrego columna con nombre de estacion
    datos$estacion <- id

    datos_lista[[id]] <- datos
  }

  # Combinar datos
  datos_combinados <- dplyr::bind_rows(datos_lista)

  # Transformar a formato largo
  datos_largos <- tidyr::pivot_longer(
    datos_combinados,
    cols = temperatura_abrigo_150cm,
    names_to = "variable",
    values_to = "valor"
  )

  # Crear tabla resumen por estacion
  resumen <- datos_largos %>%
    dplyr::group_by(estacion) %>%
    dplyr::summarise(
      n = sum(!is.na(valor)),
      minimo = min(valor, na.rm = TRUE),
      maximo = max(valor, na.rm = TRUE),
      media = mean(valor, na.rm = TRUE),
      mediana = median(valor, na.rm = TRUE),
      sd = sd(valor, na.rm = TRUE),
      .groups = "drop"
    )

  return(resumen)
}
