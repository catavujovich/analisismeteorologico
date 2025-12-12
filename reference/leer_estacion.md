# Leer y descargar datos de una estación meteorológica

\`leer_estacion()\` permite cargar datos de estaciones meteorológicas
identificadas por su código (por ejemplo, \`"NH0098"\` o \`"NH0472"\`).
Si el archivo no existe en la ruta local indicada, la función lo
descarga automáticamente. Si la carpeta no existe, la crea.

## Usage

``` r
leer_estacion(id_estacion, ruta)
```

## Arguments

- id_estacion:

  Cadena de texto con el identificador de la estación. Debe ser uno de:
  \`"NH0472"\`, \`"NH0910"\`, \`"NH0046"\`, \`"NH0098"\`, \`"NH0437"\`.

- ruta:

  Ruta local donde se guardará el archivo CSV descargado.

## Value

Un data frame con los datos de la estación seleccionada.

## Details

Esta función descarga (si es necesario) y lee los datos correspondientes
a una estación meteorológica determinada. Los datos provienen de un
repositorio público y se guardan localmente en la ruta indicada.

## Examples

``` r
if (FALSE) { # \dontrun{
# Leer estación NH0098 y guardar el archivo en la carpeta datos/
datos_NH0098 <- leer_estacion("NH0098", "datos/NH0098.csv")

# Otra estación
datos_NH0472 <- leer_estacion("NH0472", "datos/NH0472.csv")
} # }
```
