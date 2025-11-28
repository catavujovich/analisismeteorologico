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
