# Gráfico de temperatura mensual promedio por estación

Esta función calcula la temperatura promedio mensual a partir de los
datos de una o más estaciones meteorológicas y genera un gráfico con la
evolución de la temperatura a lo largo del tiempo. La temperatura
utilizada es \`temperatura_abrigo_150cm\`. En caso de existir valores
faltantes (NA), estos se reemplazan por la media mensual correspondiente
a cada estación.

## Usage

``` r
grafico_temperatura_mensual(datos, colores = NULL, titulo = "Temperatura")
```

## Arguments

- datos:

  Data frame que contiene los datos de una o más estaciones. Debe
  incluir las columnas:

  fecha

  :   Fecha de la medición (carácter o Date).

  id

  :   Identificador de la estación.

  temperatura_abrigo_150cm

  :   Temperatura registrada (numérico).

- colores:

  Vector opcional de colores para cada estación. Vector opcional de
  colores para asignar a cada estación en el gráfico. Si no se
  especifica, se asignan colores automáticamente.

- titulo:

  Título del gráfico. Por defecto: \`"Temperatura"\`.

## Value

Un objeto ggplot2 con el gráfico generado que muestra la evolución
mensual de la temperatura promedio para cada estación presente en los
datos.

## Examples

``` r
if (FALSE) { # \dontrun{
# Cargar una estación
datos_NH0098 <- leer_estacion("NH0098", "datos/NH0098.csv")

# Generar el gráfico de temperatura mensual
grafico_temperatura_mensual(datos_NH0098,
                            colores = "darkgreen",
                            titulo = "Temperatura mensual NH0098")



# Cargar dos estaciones en un mismo data frame
dos_estaciones <- dplyr::bind_rows(
  leer_estacion("NH0437", "datos/NH0437.csv"),
  leer_estacion("NH0472", "datos/NH0472.csv")
)

# Generar el gráfico con colores definidos
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
  titulo = "Temperatura mensual – todas las estaciones"
)
} # }
```
