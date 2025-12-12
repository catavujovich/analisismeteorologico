library(testthat)
library(analisismeteorologico)


test_that("grafico_temperatura_mensual genera un objeto ggplot correctamente", {
  todas_las_estaciones <- dplyr::bind_rows(
    analisismeteorologico::leer_estacion("NH0437", "datos/NH0437.csv"),
    analisismeteorologico::leer_estacion("NH0472", "datos/NH0472.csv")
  )

  g <- analisismeteorologico::grafico_temperatura_mensual(
    todas_las_estaciones,
    colores = c("tomato", "steelblue"),
    titulo = "Temperatura promedio mensual"
  )

  expect_s3_class(g, "ggplot")
  expect_true("Mes" %in% names(g$data))
  expect_true("Temperatura media (deg C)" %in% names(g$data))
  expect_true("Estacion" %in% names(g$data))
  expect_equal(g$labels$title, "Temperatura promedio mensual")
})
