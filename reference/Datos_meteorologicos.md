# Datos meteorológicos diarios de estaciones

Estos datasets contienen mediciones diarias registradas por estaciones
meteorológicas. Incluyen información sobre temperatura del aire y del
suelo, humedad, precipitaciones, radiación, viento y otras variables
agrometeorológicas relevantes.

## Usage

``` r
NH0472

NH0437

NH0046

NH0098

NH0910
```

## Format

Un data frame con las siguientes columnas:

- id:

  Identificador de la estación

- fecha:

  Fecha de registro (Date)

- temperatura_abrigo_150cm:

  Temperatura del aire a 150 cm

- temperatura_abrigo_150cm_maxima:

  Temperatura máxima a 150 cm

- temperatura_abrigo_150cm_minima:

  Temperatura mínima a 150 cm

- temperatura_intemperie_5cm_minima:

  Temperatura mínima a 5 cm intemperie

- temperatura_intemperie_50cm_minima:

  Temperatura mínima a 50 cm intemperie

- temperatura_suelo_5cm_media:

  Temperatura media del suelo a 5 cm

- temperatura_suelo_10cm_media:

  Temperatura media del suelo a 10 cm

- temperatura_inte_5cm:

  Temperatura a 5 cm (variable duplicada según fuente)

- temperatura_intemperie_150cm_minima:

  Temperatura mínima a 150 cm intemperie

- humedad_suelo:

  Humedad del suelo

- precipitacion_pluviometrica:

  Precipitación medida (mm)

- granizo:

  Presencia de granizo (0/1)

- nieve:

  Presencia de nieve (0/1)

- heliofania_efectiva:

  Horas de sol (heliofanía efectiva)

- heliofania_relativa:

  Porcentaje de heliofanía relativa

- tesion_vapor_media:

  Tensión de vapor media

- humedad_media:

  Humedad relativa media

- humedad_media_8_14_20:

  Promedio de humedad a las 08, 14 y 20 h

- rocio_medio:

  Punto de rocío medio

- duracion_follaje_mojado:

  Horas de follaje mojado

- velocidad_viento_200cm_media:

  Velocidad media del viento a 200 cm

- direccion_viento_200cm:

  Dirección del viento a 200 cm

- velocidad_viento_1000cm_media:

  Velocidad media del viento a 10 m

- direccion_viento_1000cm:

  Dirección del viento a 10 m

- velocidad_viento_maxima:

  Velocidad máxima del viento registrada

- presion_media:

  Presión atmosférica media

- radiacion_global:

  Radiación global diaria

- radiacion_neta:

  Radiación neta diaria

- evaporacion_tanque:

  Evaporación en tanque (mm)

- evapotranspiracion_potencial:

  Evapotranspiración potencial (mm)

- profundidad_napa:

  Profundidad de la napa freática

- horas_frio:

  Horas de frío acumuladas

- unidad_frio:

  Unidades de frío

An object of class `spec_tbl_df` (inherits from `tbl_df`, `tbl`,
`data.frame`) with 18929 rows and 35 columns.

An object of class `spec_tbl_df` (inherits from `tbl_df`, `tbl`,
`data.frame`) with 17041 rows and 35 columns.

An object of class `spec_tbl_df` (inherits from `tbl_df`, `tbl`,
`data.frame`) with 23733 rows and 35 columns.

An object of class `spec_tbl_df` (inherits from `tbl_df`, `tbl`,
`data.frame`) with 15553 rows and 35 columns.

## Source

Repositorio de GitHub
