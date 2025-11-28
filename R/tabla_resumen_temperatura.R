grafico_temperatura_mensual <- function(datos, colores = NULL, titulo = "Temperatura") {

  # Crear columna Mes (primer día de cada mes)
  datos <- datos %>%
    dplyr::mutate(
      Mes = lubridate::floor_date(as.Date(fecha), "month"),
      Estacion = id
    )

  # Calcular temperatura mensual por estación
  temp_mensual <- datos %>%
    dplyr::group_by(Estacion, Mes) %>%
    dplyr::summarise(
      `Temperatura media (deg C)` = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      .groups = "drop"
    )

  # Si no pasan colores, generar automáticamente
  if (is.null(colores)) {
    estaciones <- unique(temp_mensual$Estacion)
    colores <- grDevices::rainbow(length(estaciones))
  }

  # Crear gráfico
  g <- ggplot2::ggplot(temp_mensual,
                       ggplot2::aes(x = Mes,
                                    y = `Temperatura media (deg C)`,
                                    color = Estacion)) +
    ggplot2::geom_line(size = 1.1) +
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

