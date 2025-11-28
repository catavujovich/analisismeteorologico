library(testthat)
library(analisismeteorologico)

test_that("leer_estacion devuelve data.frame con columnas correctas", {
  df <- analisismeteorologico::leer_estacion("NH0098", "datos/NH0098.csv")
  expect_s3_class(df, "data.frame")
  expect_true(all(c("fecha", "temperatura_abrigo_150cm") %in% colnames(df)))
  expect_false(any(is.na(df$fecha)))
})
