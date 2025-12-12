# Generar una tabla resumen de temperatura para varias estaciones

\`tabla_resumen_temperatura()\` permite obtener una tabla resumen con
estadísticas descriptivas básicas de temperatura para una lista de
estaciones.

Si la carpeta indicada en \`carpeta\` no existe, la función
\`leer_estacion()\` la crea automáticamente antes de guardar los
archivos descargados, por lo que \*\*no es necesario crear las carpetas
manualmente\*\*.

## Usage

``` r
tabla_resumen_temperatura(estaciones, carpeta = "datos")
```

## Arguments

- estaciones:

  Vector de caracteres con los IDs de estaciones a procesar (por
  ejemplo: \`c("NH0098", "NH0437")\`).

- carpeta:

  Carpeta donde se guardarán los archivos descargados. Por defecto
  \`"datos"\`. Si la carpeta no existe, se crea automáticamente.

## Value

Un data frame con una fila por estación y las siguientes columnas: -
\`estacion\`: ID de la estación - \`n\`: cantidad de observaciones
válidas - \`minimo\`: valor mínimo registrado - \`maximo\`: valor máximo
registrado - \`media\`: promedio de temperatura - \`mediana\`: mediana
de temperatura - \`sd\`: desvío estándar

## Details

Esta función descarga (si es necesario), lee y combina los datos de
temperatura de múltiples estaciones meteorológicas. Para cada estación,
se calcula un conjunto de estadísticas descriptivas (mínimo, máximo,
media, mediana, desvío estándar, etc.).

## Examples

``` r
if (FALSE) { # \dontrun{
# Ejemplo 1: Generar tabla resumen para una sola estación
resumen_una <- tabla_resumen_temperatura(
  estaciones = c("NH0098"),
  carpeta = "datos"
)

# Ejemplo 2: Generar tabla resumen para dos estaciones
resumen_dos <- tabla_resumen_temperatura(
  estaciones = c("NH0098", "NH0437"),
  carpeta = "datos"
)
# Ejemplo 3: Generar tabla resumen para TODAS las estaciones
resumen <- tabla_resumen_temperatura(
  estaciones = c("NH0472", "NH0910", "NH0046", "NH0098", "NH0437")
)
} # }
```
