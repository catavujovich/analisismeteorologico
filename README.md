
<figure>
<img src="man/figures/logo.jpeg" alt="Logo del paquete" />
<figcaption aria-hidden="true">Logo del paquete</figcaption>
</figure>

# analisismeteorologico

<!-- badges: start -->

<!-- badges: end -->

<figure>
<img src="man/figures/logo.jpeg" alt="Logo del paquete" />
<figcaption aria-hidden="true">Logo del paquete</figcaption>
</figure>

# Análisis Meteorológico

analisismeteorologico es un paquete diseñado para simplificar el trabajo
con datos de estaciones meteorológicas. Permite descargar, leer,
procesar y visualizar información sobre temperatura, humedad,
precipitaciones y viento de distintas estaciones.

Lo que hace único a este paquete: - Automatiza la descarga y lectura de
los datos de múltiples estaciones. - Genera gráficos de evolución
mensual de temperatura de forma sencilla. - Permite calcular tablas
resumen con estadísticas descriptivas de temperatura y precipitación. -
Incluye ejemplos y viñetas para aprender a usar las funciones paso a
paso.

------------------------------------------------------------------------

# Instalación

{r} install.packages(“devtools”) \# si no lo tenés instalado

{r} devtools::install_github(“catalinavujovich/analisismeteorologico”)

Esto descargará e instalará el paquete junto con sus dependencias.

# Uso básico

- leer_estacion() -\> Descarga (si es necesario) y lee los datos de una
  estación meteorológica específica. También los guarda dentro de una
  carpeta /datos y si no existe, la crea.

- tabla_resumen_temperatura() -\> Genera una tabla resumen con
  estadísticas básicas de temperatura para varias estaciones (mínimo,
  máximo, media, mediana y desviación estándar).

- grafico_temperatura_mensual() -\> Calcula la temperatura promedio por
  mes y genera un gráfico de línea que muestra la evolución a lo largo
  del tiempo. {r} \# Para cargar el paquete en R
  library(analisismeteorologico)

# Leer datos de una estación

NH0098 \<- leer_estacion(“NH0098”, “datos/NH0098.csv”)

# Generar tabla resumen de temperatura

resumen \<- tabla_resumen_temperatura(c(“NH0098”, “NH0437”)) resumen

# Graficar temperatura mensual

grafico \<- grafico_temperatura_mensual(NH0098) grafico

# Cómo contribuir

Abrir un *issue* en GitHub para que puedas reportar errores, un problema
con el paquete, o sugerir una mejora o nueva función. Podés hacer *Pull
requests* para agregar nuevas funciones, mejorar las existentes,
corregir errores o mejorar la documentación y ejemplos. También podés
contribuir con un *fork*, que es una copia del repositorio original en
tu propia cuenta de GitHub. Esto te permite trabajar de forma
independiente y probar cambios sin afectar el proyecto principal.

El flujo típico es:

Hacer un fork del repositorio a tu cuenta.

Clonar tu fork a tu computadora para trabajar localmente.

Crear una nueva rama (branch) para tus cambios.

Modificar funciones, mejorar la documentación o agregar ejemplos.

Hacer commit y push de tus cambios a tu fork.

Abrir un pull request (PR) desde tu fork hacia el repositorio original
para que tus mejoras puedan ser revisadas e integradas.

# Consultar la documentación interna de las funciones

Ejemplo de uso: {r} ?leer_estacion ?tabla_resumen_temperatura

Muestra cómo usar la función, sus argumentos, valores de retorno y
ejemplos para entender mejor su funcionamiento.
