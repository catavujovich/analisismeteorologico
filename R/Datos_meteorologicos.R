#' Datos meteorológicos diarios de estaciones
#'
#' Estos datasets contienen mediciones diarias registradas por estaciones
#' meteorológicas.
#' Incluyen información sobre temperatura del aire y del suelo, humedad, precipitaciones,
#' radiación, viento y otras variables agrometeorológicas relevantes.
#'
#'
#' @format Un data frame con las siguientes columnas:
#' \describe{
#'   \item{id}{Identificador de la estación}
#'   \item{fecha}{Fecha de registro (Date)}
#'   \item{temperatura_abrigo_150cm}{Temperatura del aire a 150 cm}
#'   \item{temperatura_abrigo_150cm_maxima}{Temperatura máxima a 150 cm}
#'   \item{temperatura_abrigo_150cm_minima}{Temperatura mínima a 150 cm}
#'   \item{temperatura_intemperie_5cm_minima}{Temperatura mínima a 5 cm intemperie}
#'   \item{temperatura_intemperie_50cm_minima}{Temperatura mínima a 50 cm intemperie}
#'   \item{temperatura_suelo_5cm_media}{Temperatura media del suelo a 5 cm}
#'   \item{temperatura_suelo_10cm_media}{Temperatura media del suelo a 10 cm}
#'   \item{temperatura_inte_5cm}{Temperatura a 5 cm (variable duplicada según fuente)}
#'   \item{temperatura_intemperie_150cm_minima}{Temperatura mínima a 150 cm intemperie}
#'   \item{humedad_suelo}{Humedad del suelo}
#'   \item{precipitacion_pluviometrica}{Precipitación medida (mm)}
#'   \item{granizo}{Presencia de granizo (0/1)}
#'   \item{nieve}{Presencia de nieve (0/1)}
#'   \item{heliofania_efectiva}{Horas de sol (heliofanía efectiva)}
#'   \item{heliofania_relativa}{Porcentaje de heliofanía relativa}
#'   \item{tesion_vapor_media}{Tensión de vapor media}
#'   \item{humedad_media}{Humedad relativa media}
#'   \item{humedad_media_8_14_20}{Promedio de humedad a las 08, 14 y 20 h}
#'   \item{rocio_medio}{Punto de rocío medio}
#'   \item{duracion_follaje_mojado}{Horas de follaje mojado}
#'   \item{velocidad_viento_200cm_media}{Velocidad media del viento a 200 cm}
#'   \item{direccion_viento_200cm}{Dirección del viento a 200 cm}
#'   \item{velocidad_viento_1000cm_media}{Velocidad media del viento a 10 m}
#'   \item{direccion_viento_1000cm}{Dirección del viento a 10 m}
#'   \item{velocidad_viento_maxima}{Velocidad máxima del viento registrada}
#'   \item{presion_media}{Presión atmosférica media}
#'   \item{radiacion_global}{Radiación global diaria}
#'   \item{radiacion_neta}{Radiación neta diaria}
#'   \item{evaporacion_tanque}{Evaporación en tanque (mm)}
#'   \item{evapotranspiracion_potencial}{Evapotranspiración potencial (mm)}
#'   \item{profundidad_napa}{Profundidad de la napa freática}
#'   \item{horas_frio}{Horas de frío acumuladas}
#'   \item{unidad_frio}{Unidades de frío}
#' }
#'
#' @source Repositorio de GitHub
#'



#' @rdname Datos_meteorologicos
"NH0472"

#' @rdname Datos_meteorologicos
"NH0437"

#' @rdname Datos_meteorologicos
"NH0046"

#' @rdname Datos_meteorologicos
"NH0098"

#' @rdname Datos_meteorologicos
"NH0910"
