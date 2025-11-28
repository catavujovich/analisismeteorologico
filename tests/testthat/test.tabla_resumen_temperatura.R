library(testthat)
library(analisismeteorologico)

test_that("tabla_resumen_temperatura devuelve resumen correcto", {
  resumen <- analisismeteorologico::tabla_resumen_temperatura(
    estaciones = c("NH0098","NH0437"),
    carpeta = "datos"
  )
  expect_s3_class(resumen, "data.frame")
  expect_true(all(c("n","minimo","maximo","media","mediana","sd") %in% colnames(resumen)))
  expect_equal(nrow(resumen), 2)
})
