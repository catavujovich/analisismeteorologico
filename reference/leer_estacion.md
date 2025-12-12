# Leer y descargar datos de una estacion meteorologica

\`leer_estacion()\` permite cargar datos de estaciones meteorologicas
identificadas por su codigo (por ejemplo, \`"NH0098"\` o \`"NH0472"\`).
Si el archivo no existe en la ruta local indicada, la funcion lo
descarga automaticamente. Si la carpeta no existe, la crea.

## Usage

``` r
leer_estacion(id_estacion, ruta)
```

## Arguments

- id_estacion:

  Cadena de texto con el identificador de la estacion. Debe ser uno de:
  \`"NH0472"\`, \`"NH0910"\`, \`"NH0046"\`, \`"NH0098"\`, \`"NH0437"\`.

- ruta:

  Ruta local donde se guardara el archivo CSV descargado.

## Value

Un data frame con los datos de la estacion seleccionada.

## Details

Esta funcion descarga (si es necesario) y lee los datos correspondientes
a una estacion meteorologica determinada. Los datos provienen de un
repositorio publico y se guardan localmente en la ruta indicada.

## Examples

``` r
if (FALSE) { # \dontrun{
# Leer estacion NH0098 y guardar el archivo en la carpeta datos/
datos_NH0098 <- leer_estacion("NH0098", "datos/NH0098.csv")

# Otra estacion
datos_NH0472 <- leer_estacion("NH0472", "datos/NH0472.csv")
} # }
```
