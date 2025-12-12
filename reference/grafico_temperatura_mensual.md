# Grafico de temperatura mensual promedio por estacion

Esta funcion calcula la temperatura promedio mensual a partir de los
datos de una o mas estaciones meteorologicas y genera un grafico con la
evolucion de la temperatura abrigo a 150cm a lo largo del tiempo. En
caso de existir valores faltantes (NA), estos se reemplazan por la media
mensual correspondiente a cada estacion.

## Usage

``` r
grafico_temperatura_mensual(datos, colores = NULL, titulo = "Temperatura")
```

## Arguments

- datos:

  Data frame que contiene los datos de una o mas estaciones. Debe
  incluir las columnas:

  fecha

  :   Fecha de la medicion (caracter o Date).

  id

  :   Identificador de la estacion.

  temperatura_abrigo_150cm

  :   Temperatura registrada (numerico).

- colores:

  Vector opcional de colores para cada estacion. Vector opcional de
  colores para asignar a cada estacion en el grafico. Si no se
  especifica, se asignan colores automaticamente.

- titulo:

  Titulo del grafico. Por defecto asigna el titulo Temperatura.

## Value

Un objeto ggplot2 con el grafico generado que muestra la evolucion
mensual de la temperatura promedio para cada estacion presente en los
datos.

## Examples

``` r
if (FALSE) { # \dontrun{
# Cargar una estacion
datos_NH0098 <- leer_estacion("NH0098", "datos/NH0098.csv")

# Generar el grafico de temperatura mensual
grafico_temperatura_mensual(datos_NH0098,
                            colores = "darkgreen",
                            titulo = "Temperatura mensual NH0098")



# Cargar dos estaciones en un mismo data frame
dos_estaciones <- dplyr::bind_rows(
  leer_estacion("NH0437", "datos/NH0437.csv"),
  leer_estacion("NH0472", "datos/NH0472.csv")
)

# Generar el grafico con colores definidos
grafico_temperatura_mensual(
  dos_estaciones,
  colores = c("tomato", "steelblue"),
  titulo = "Promedio mensual de temperatura"
)

# Ejemplo con todas las estaciones disponibles
todas <- dplyr::bind_rows(
  leer_estacion("NH0437", "datos/NH0437.csv"),
  leer_estacion("NH0472", "datos/NH0472.csv"),
  leer_estacion("NH0910", "datos/NH0910.csv"),
  leer_estacion("NH0046", "datos/NH0046.csv"),
  leer_estacion("NH0098", "datos/NH0098.csv")
)

grafico_temperatura_mensual(
  todas,
  colores = c("red", "blue", "green", "purple", "orange"),
  titulo = "Temperatura mensual de todas las estaciones"
)
} # }
```
