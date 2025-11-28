#' Gráfico de temperatura mensual promedio por estación
#'
#' Esta función calcula la temperatura promedio mensual a partir de los datos
#' de una o más estaciones meteorológicas y genera un gráfico con la evolución
#' de la temperatura a lo largo del tiempo. La temperatura utilizada es
#' `temperatura_abrigo_150cm`. En caso de existir valores faltantes (NA),
#' estos se reemplazan por la media mensual correspondiente a cada estación.
#'
#' @param datos Data frame que contiene los datos de una o más estaciones.
#' Debe incluir las columnas:
#' \describe{
#'   \item{fecha}{Fecha de la medición (carácter o Date).}
#'   \item{id}{Identificador de la estación.}
#'   \item{temperatura_abrigo_150cm}{Temperatura registrada (numérico).}
#' }
#'
#' @param colores Vector opcional de colores para cada estación. Vector opcional de colores para asignar a cada estación en el
#' gráfico. Si no se especifica, se asignan colores automáticamente.
#'
#' @param titulo Título del gráfico. Por defecto: `"Temperatura"`.
#'
#' @return Un objeto ggplot2 con el gráfico generado que muestra la evolución mensual de la temperatura
#' promedio para cada estación presente en los datos.
#'
#' @examples
#' \dontrun{
#' # Cargar una estación
#' datos_NH0098 <- leer_estacion("NH0098", "datos/NH0098.csv")
#'
#' # Generar el gráfico de temperatura mensual
#' grafico_temperatura_mensual(datos_NH0098,
#'                             colores = "darkgreen",
#'                             titulo = "Temperatura mensual NH0098")
#'
#'
#'
#' # Cargar dos estaciones en un mismo data frame
#' dos_estaciones <- dplyr::bind_rows(
#'   leer_estacion("NH0437", "datos/NH0437.csv"),
#'   leer_estacion("NH0472", "datos/NH0472.csv")
#' )
#'
#' # Generar el gráfico con colores definidos
#' grafico_temperatura_mensual(
#'   dos_estaciones,
#'   colores = c("tomato", "steelblue"),
#'   titulo = "Promedio mensual de temperatura"
#' )
#'
#' # Ejemplo con todas las estaciones disponibles
#' todas <- dplyr::bind_rows(
#'   leer_estacion("NH0437", "datos/NH0437.csv"),
#'   leer_estacion("NH0472", "datos/NH0472.csv"),
#'   leer_estacion("NH0910", "datos/NH0910.csv"),
#'   leer_estacion("NH0046", "datos/NH0046.csv"),
#'   leer_estacion("NH0098", "datos/NH0098.csv")
#' )
#'
#' grafico_temperatura_mensual(
#'   todas,
#'   colores = c("red", "blue", "green", "purple", "orange"),
#'   titulo = "Temperatura mensual – todas las estaciones"
#' )
#' }
#' @export
grafico_temperatura_mensual <- function(datos, colores = NULL, titulo = "Temperatura") {

  # Asegurar formato correcto de fecha y crear Mes y Estación
  datos <- datos %>%
    dplyr::mutate(
      fecha = as.Date(fecha),
      Mes = lubridate::floor_date(fecha, "month"),
      Estacion = id
    )

  # Reemplazar NA por la media mensual de la estación
  datos <- datos %>%
    dplyr::group_by(Estacion, Mes) %>%
    dplyr::mutate(
      temperatura_abrigo_150cm = ifelse(
        is.na(temperatura_abrigo_150cm),
        mean(temperatura_abrigo_150cm, na.rm = TRUE),
        temperatura_abrigo_150cm
      )
    ) %>%
    dplyr::ungroup()

  # Calcular temperatura media mensual por estación
  temp_mensual <- datos %>%
    dplyr::group_by(Estacion, Mes) %>%
    dplyr::summarise(
      `Temperatura media (deg C)` = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      .groups = "drop"
    )

  # Si no pasan colores, generar uno por estación
  if (is.null(colores)) {
    estaciones <- unique(temp_mensual$Estacion)
    colores <- grDevices::rainbow(length(estaciones))
  }

  # Crear gráfico
  g <- ggplot2::ggplot(
    temp_mensual,
    ggplot2::aes(
      x = Mes,
      y = `Temperatura media (deg C)`,
      color = Estacion
    )
  ) +
    ggplot2::geom_line(linewidth = 1.1) +
    ggplot2::geom_point(size = 2) +
    ggplot2::scale_color_manual(values = colores) +
    ggplot2::labs(
      x = "Mes",
      y = "Temperatura media (deg C)",
      title = titulo,
      color = "Estación"
    ) +
    ggplot2::theme_minimal(base_size = 12) +
    ggplot2::theme(
      plot.title = ggplot2::element_text(hjust = 0.5, face = "bold"),
      legend.position = "bottom"
    )

  cli::cli_inform("Gráfico generado correctamente.")
  return(g)
}
