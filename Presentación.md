# Guion para presentación: DBAs en la Era Cloud - Construyendo Infraestructura como Código en OCI

## Diapositiva 1: Portada
**Puntos clave:**
- Presentarse: Kevin Alexander García Jachac de Datum, S.A.
- Tema: Transformación del rol del DBA en la era cloud
- Duración: 40 minutos
- Enfoque principal: OCI y Terraform para automatizar bases de datos

**Guion:**
Buenas tardes a todos. Mi nombre es Kevin Alexander García Jachac de Datum, S.A. Hoy les voy a hablar sobre un tema que está transformando radicalmente el rol del DBA: "DBAs en la Era Cloud: Construyendo Infraestructura como Código en OCI". Durante los próximos 40 minutos, exploraremos cómo la nube está cambiando nuestras responsabilidades tradicionales y cómo podemos aprovechar la infraestructura como código para ser más eficientes en este nuevo entorno. Específicamente, nos centraremos en Oracle Cloud Infrastructure (OCI) y cómo utilizar Terraform para automatizar el despliegue y gestión de bases de datos Oracle en la nube.

## Diapositiva 2: Agenda - El Nuevo Rol del DBA en la Nube
**Puntos clave:**
- Primera sección: Evolución del rol del DBA → Cloud DBA/DevOps
- Importancia de la Infraestructura como Código para DBAs
- Beneficios de la automatización en trabajo cotidiano

**Guion:**
Comencemos revisando la agenda de hoy. En la primera parte, analizaremos cómo está evolucionando el rol del DBA, pasando del enfoque tradicional al modelo de Cloud DBA o DBA DevOps. Discutiremos por qué es fundamental para nosotros como DBAs familiarizarnos con la Infraestructura como Código y los beneficios tangibles que obtenemos al adoptar la automatización en nuestro trabajo diario.

## Diapositiva 3: Agenda - Introducción a OCI para DBAs
**Puntos clave:**
- Segunda sección: OCI desde perspectiva del DBA
- Componentes esenciales: Compute, Block Volumes, VCN, Compartments
- Servicios específicos para bases de datos en OCI
- Seguridad y control de costos

**Guion:**
En la segunda sección, nos sumergiremos en Oracle Cloud Infrastructure desde la perspectiva de un DBA. Analizaremos los componentes clave que debemos conocer, como Compute, Block Volumes, VCN y Compartments. También revisaremos los servicios específicos para bases de datos que ofrece OCI y aspectos importantes sobre seguridad y control de costos.

## Diapositiva 4: Agenda - Fundamentos de Terraform en OCI
**Puntos clave:**
- Tercera sección: Introducción a Terraform
- Explicar qué es Terraform y por qué usarlo en OCI
- Conceptos clave: Providers, Resources, Variables, State Files
- Comparación con OCI CLI y Console

**Guion:**
La tercera parte estará dedicada a Terraform, una herramienta fundamental para implementar Infraestructura como Código. Veremos qué es Terraform y por qué es particularmente útil en el contexto de OCI. Exploraremos conceptos clave como Providers, Resources, Variables y State Files, y haremos una comparación entre Terraform y otras formas de gestionar recursos en OCI.

## Diapositiva 5: Agenda - Aprovisionando Bases de Datos con IaC
**Puntos clave:**
- Cuarta sección: Aspectos prácticos de aprovisionamiento
- Arquitectura típica para bases de datos en OCI
- Automatización post-instalación (TDE, parámetros, etc.)
- Plantillas reutilizables y buenas prácticas

**Guion:**
En la cuarta sección, profundizaremos en aspectos prácticos de cómo aprovisionar bases de datos con Infraestructura como Código. Analizaremos una arquitectura típica, veremos opciones de automatización post-instalación, y discutiremos plantillas reutilizables y buenas prácticas que pueden implementar en sus organizaciones.

## Diapositiva 6: Agenda - Demo
**Puntos clave:**
- Demostración práctica de todo lo aprendido
- Flujo lógico: VCN → DB System → Autonomous DB
- Explicación paso a paso del archivo main.tf
- Cómo reproducir la demo posteriormente

**Guion:**
Finalmente, realizaremos una demostración práctica donde veremos todo lo aprendido en acción. Seguiremos un flujo lógico de despliegue que incluirá la creación de una VCN y subredes, el despliegue de un DB System y el despliegue de una Autonomous Database. Les explicaré paso a paso el código de Terraform en un archivo main.tf para que puedan reproducirlo después en sus propios entornos.

## Diapositiva 7: Objetivos
**Puntos clave:**
- Comprender la evolución del rol del DBA
- Proporcionar conocimiento práctico sobre IaC en OCI
- Demostrar cómo Terraform mejora eficiencia y reduce errores
- Capacitar para automatizar entornos de bases de datos

**Guion:**
Los objetivos de esta presentación son varios. Primero, quiero que comprendan la evolución que está experimentando el rol del DBA y cómo prepararse para este cambio. Segundo, busco proporcionar un conocimiento práctico sobre cómo implementar Infraestructura como Código en Oracle Cloud. Tercero, quiero demostrar con ejemplos concretos cómo Terraform puede hacer su trabajo más eficiente, consistente y menos propenso a errores. Al finalizar, espero que se sientan capacitados para comenzar a automatizar sus propios entornos de bases de datos en OCI.

## Diapositiva 8: El Nuevo Rol del DBA en la Nube - De DBA tradicional a Cloud DBA / DBA DevOps
**Puntos clave:**
- DBA tradicional: instalación manual, backups, monitoreo reactivo
- DBA tradicional: administración de recursos físicos
- Cloud DBA: automatización de infraestructura y despliegue
- Cloud DBA: observabilidad, integración continua, seguridad cloud
- Nueva dinámica: colaboración con equipos de desarrollo y ops

**Guion:**
Entremos en materia. El rol del DBA ha evolucionado significativamente en los últimos años. Tradicionalmente, el DBA se centraba en tareas como la instalación manual de software, realización de respaldos, recuperación de datos y monitoreo reactivo. Dedicábamos gran parte de nuestro tiempo a administrar recursos físicos como servidores, almacenamiento y redes.

Hoy, como Cloud DBAs o DBAs DevOps, nuestro enfoque ha cambiado radicalmente. Ahora nos concentramos en la automatización de infraestructura y despliegue de bases de datos. La observabilidad ha reemplazado al simple monitoreo, permitiéndonos ser proactivos en lugar de reactivos. Además, trabajamos con integración continua y estamos mucho más inmersos en aspectos de seguridad nativos de la nube.

Quizás el cambio más significativo es que ya no trabajamos aislados; ahora colaboramos estrechamente con equipos de desarrollo y operaciones en entornos ágiles, donde la velocidad y la consistencia son prioritarias. Esto requiere un conjunto de habilidades diferentes y un cambio de mentalidad importante.

## Diapositiva 9: ¿Por qué los DBAs necesitan conocer Infraestructura como Código (IaC)?
Una pregunta válida es: ¿por qué deberíamos como DBAs preocuparnos por la Infraestructura como Código? La respuesta es simple: la infraestructura ya no se configura manualmente. En lugar de clics en consolas o comandos ad-hoc, ahora definimos nuestra infraestructura como código versionado y reproducible.

La IaC nos permite como DBAs desplegar entornos consistentes en cuestión de minutos, no días o semanas como antes. Podemos auditar cada cambio y aplicar controles de calidad a nuestra infraestructura, exactamente como lo haríamos con el código de aplicación. Esto elimina la fricción entre equipos y permite trabajar de manera más integrada con DevOps.

En OCI específicamente, Terraform se ha convertido en la herramienta estándar para IaC. Con Terraform, podemos automatizar todo el stack, desde redes hasta bases de datos y permisos, creando un flujo reproducible y consistente. Esto reduce drásticamente el tiempo de aprovisionamiento y minimiza los errores humanos.

## Diapositiva 10: Beneficios de adoptar automatización: rapidez, consistencia y reducción de errores humanos
Los beneficios de adoptar la automatización son múltiples y tangibles. Primero, la rapidez: lo que antes tomaba horas o incluso días para aprovisionar, ahora puede hacerse en minutos con un simple comando. Esta velocidad es crucial en entornos ágiles donde los equipos de desarrollo necesitan entornos rápidamente.

La consistencia es otro beneficio fundamental. Al eliminar la configuración manual, evitamos errores de configuración y aseguramos que todos los entornos sean idénticos, desde desarrollo hasta producción. Esto reduce significativamente los problemas del tipo "funciona en mi máquina".

La trazabilidad que ofrece la automatización es invaluable. Cada cambio queda documentado en un repositorio de código, facilitando auditorías y permitiendo entender quién hizo qué cambio y cuándo.

En términos de escalabilidad, podemos crear decenas de entornos simultáneamente si es necesario, algo imposible con métodos manuales. Y quizás lo más importante: reducimos dramáticamente los errores humanos al eliminar tareas repetitivas y tediosas, minimizando los fallos operativos que tantos problemas nos han causado históricamente.

## Diapositiva 11: Introducción a Oracle Cloud Infrastructure (OCI) para DBAs - Componentes clave que un DBA debe dominar
Pasemos a Oracle Cloud Infrastructure. Como DBAs, hay varios componentes de OCI que debemos dominar. El primero es Compute, las instancias que usamos para correr software adicional como scripts, agentes, utilidades o GoldenGate. En OCI, podemos controlar el tipo, tamaño y autoescalado de estas instancias según la carga de trabajo.

Los Block Volumes son otro componente esencial, proporcionando almacenamiento para nuestras bases de datos, respaldos y archivos de configuración. Una ventaja significativa es que se pueden expandir, clonar y mover entre instancias sin necesidad de reiniciar sistemas, minimizando el tiempo de inactividad.

Estos componentes forman la base de nuestra infraestructura en la nube y entender cómo funcionan y cómo configurarlos correctamente es esencial para cualquier DBA que trabaje en OCI.

## Diapositiva 12: Componentes clave que un DBA debe dominar (continuación)
Continuando con los componentes clave, tenemos la Virtual Cloud Network (VCN), que es equivalente a una red física privada pero en la nube. Como DBAs, necesitamos entender cómo configurar subnets, establecer reglas de seguridad o Network Security Groups (NSGs) para habilitar conexiones seguras a nuestras bases de datos.

Los Compartments son otro concepto fundamental en OCI, ya que nos ayudan a segmentar recursos por ambientes como Desarrollo, QA y Producción. Son particularmente útiles para aplicar control de acceso y políticas de seguridad o grupo por proyecto o equipo. Esta segmentación es crucial para mantener entornos aislados y controlar quién tiene acceso a qué recursos.

Comprender estos componentes nos permite diseñar arquitecturas seguras y bien organizadas en OCI, facilitando la administración y el cumplimiento de políticas de seguridad.

## Diapositiva 13: Servicios específicos para DBAs en OCI
OCI ofrece varios servicios específicos para bases de datos que debemos conocer. El Base Database Service proporciona instancias gestionadas de Oracle Database, con o sin Real Application Clusters (RAC). Como DBAs, mantenemos control sobre parámetros, aplicación de parches, configuración de backups y otras tareas administrativas.



Para cargas de trabajo críticas, Exadata Cloud Service o Exadata Cloud@Customer ofrecen alto rendimiento y son ideales para consolidación de múltiples bases de datos o entornos que requieren alta disponibilidad.

Oracle instala físicamente un Exadata en tu data center (no tú; Oracle lo entrega, instala y mantiene).
Tú creas y administras las bases de datos Exadata desde la consola de OCI, como si estuvieran en la nube.
Los datos nunca salen de tu data center, pero el control es en la nube (OCI).



Autonomous Database (ADB) representa un cambio de paradigma, ofreciendo una base de datos autogestionada para cargas OLTP o analíticas. Se encarga automáticamente de patching, tuning, backups y seguridad, permitiéndonos centrarnos en tareas de mayor valor como la optimización de aplicaciones y el análisis de datos.

Cada servicio tiene sus propias ventajas y casos de uso, y la elección dependerá de los requerimientos específicos de cada proyecto.

## Diapositiva 14: Seguridad y control de costos desde la perspectiva del DBA
La seguridad en OCI es robusta por diseño. Oracle cifra datos en reposo mediante Transparent Data Encryption (TDE) y en tránsito mediante TLS por defecto. Como DBAs, podemos aplicar reglas de acceso adicionales, políticas de Identity and Access Management (IAM) y configurar firewalls por recurso para proteger nuestras bases de datos.

El control de costos es igualmente importante en la nube. Se recomienda usar etiquetas o tags para asignar costos por proyecto, lo que facilita el seguimiento y la facturación interna. La automatización puede ayudarnos a apagar instancias en horarios no laborales, reduciendo significativamente costos en entornos de desarrollo o pruebas.

El monitoreo y las alertas con OCI Monitoring son herramientas valiosas para prevenir gastos innecesarios, permitiéndonos detectar y responder rápidamente a anomalías en el uso de recursos. Como DBAs, debemos estar atentos a estos aspectos financieros, que tradicionalmente no formaban parte de nuestras responsabilidades.

## Diapositiva 15: Fundamentos de Terraform en OCI - ¿Qué es Terraform y por qué usarlo con OCI?
Ahora entremos en Terraform. Terraform es una herramienta de Infraestructura como Código que permite definir, desplegar y gestionar infraestructura usando archivos de configuración. Con Terraform, podemos crear todo un entorno de OCI ejecutando simples comandos como "terraform apply".

Es particularmente idóneo para DBAs en la nube porque elimina configuraciones manuales y permite reproducibilidad en segundos. Imaginen poder recrear exactamente el mismo entorno de base de datos, con la misma configuración de red, seguridad y parámetros, con solo ejecutar un comando. Esto no solo ahorra tiempo, sino que reduce significativamente la posibilidad de errores humanos.

Terraform utiliza un lenguaje declarativo llamado HCL (HashiCorp Configuration Language) que es relativamente fácil de aprender, incluso para aquellos sin experiencia previa en programación. Es un lenguaje declarativo que nos permite indicar qué queremos desplegar.


Compuesto por
resource (tipo_bloque) "local_file" (local es el provider, file es el tipo de recurso) "nombre del recurso" 
{
    content = "Recurso"
    filename = "archivo.txt" (Todo esto son los argumentos)
}

## Diapositiva 16: Conceptos clave de Terraform en contexto de OCI
Para trabajar con Terraform en OCI, hay varios conceptos clave que debemos entender. El primero es el Provider, que es el plugin que conecta Terraform con OCI. En nuestro caso, utilizamos el "oci provider" para interactuar con los servicios de Oracle Cloud.

Los Resources son los objetos que definimos y gestionamos, como instancias de compute (oci_core_instance) o sistemas de bases de datos (oci_database_db_system). Cada recurso tiene sus propios parámetros y propiedades que configuramos en nuestro código.

Las Variables en Terraform nos permiten parametrizar nuestras configuraciones, facilitando la reutilización y flexibilidad. Podemos tener diferentes valores para entornos de desarrollo, prueba y producción, mientras mantenemos el mismo código base.

Los State Files son quizás el concepto más crítico: estos archivos llevan el control de lo que Terraform ha creado y su estado actual. Mantener estos archivos seguros y sincronizados es fundamental para el correcto funcionamiento de Terraform en equipos distribuidos.

Con este archivo terraform sabe que infraestructura y que recursos fue desplegando a lo largo de toda su ejecución, de manera tal que cuando ustedes vuelven a ejecutar un plan o un apply, si los recursos ya están desplegados, Terra FUM les dice lógicamente que no tiene nada que desplegar.


## Diapositiva 17: Terraform vs OCI CLI / Console
Comparemos Terraform con otras formas de gestionar OCI. En términos de automatización, Terraform ofrece código versionable, mientras que OCI CLI o la Console requieren intervención manual o scripts que pueden ser difíciles de mantener.

La reusabilidad en Terraform es altísima gracias a módulos y variables, mientras que en CLI o Console es limitada. Terraform es ideal para equipos DevOps y DBAs cloud que necesitan desplegar infraestructura consistentemente, mientras que CLI o Console son más adecuados para configuraciones puntuales o exploratorias.

En cuanto a auditoría, Terraform permite mantener un historial completo en Git, facilitando el seguimiento de cambios y cumplimiento regulatorio. En contraste, los cambios realizados mediante CLI o Console son menos controlados y más difíciles de auditar.

Esta comparación ilustra por qué Terraform se ha convertido en la herramienta preferida para gestionar infraestructura en OCI a escala, especialmente en entornos empresariales.

## Diapositiva 18: Aprovisionando Bases de Datos con IaC - Arquitectura típica
Pasemos a aspectos más prácticos. Una implementación estándar de Terraform para bases de datos en OCI incluye varios componentes. Primero, necesitamos una Virtual Cloud Network (VCN) que actúa como la red donde residirá nuestra base de datos.

Dentro de esta VCN, configuramos subnets: típicamente una pública para acceso remoto, si es necesario, y una privada donde realmente ubicamos nuestra base de datos para mayor seguridad. Además, establecemos reglas de seguridad mediante Network Security Groups (NSGs) o Security Lists para permitir tráfico solo en los puertos necesarios, como 1521 para Oracle Database o 443 para conexiones seguras.

Esta arquitectura proporciona la base para nuestros despliegues de bases de datos, asegurando que estén correctamente aisladas y protegidas según las mejores prácticas de seguridad.

## Diapositiva 19: Automatización post-instalación
Una vez desplegada la infraestructura básica, podemos automatizar varias tareas post-instalación. Por ejemplo, podemos habilitar automáticamente Transparent Data Encryption (TDE) para cifrar nuestros datos en reposo, ajustar parámetros de SGA/PGA para optimizar el rendimiento, o configurar procesos según las necesidades específicas de nuestras aplicaciones.

También podemos automatizar la creación de usuarios iniciales, esquemas, y aplicar parches desde scripts, todo como parte del mismo flujo de Terraform. Esto garantiza que nuestras bases de datos no solo se desplieguen rápidamente, sino que también estén correctamente configuradas y listas para usar.

Para quienes quieran profundizar en estas opciones, les recomiendo consultar la documentación oficial de DB System Terraform que se muestra en la diapositiva, donde encontrarán ejemplos detallados y opciones adicionales.

## Diapositiva 20: Plantillas reutilizables y buenas prácticas
Para maximizar los beneficios de la Infraestructura como Código, es esencial adoptar buenas prácticas. Una de ellas es el uso de módulos para encapsular lógica repetida, como configuraciones de red o bases de datos. Esto no solo reduce la duplicación de código, sino que también facilita la aplicación de cambios consistentes.

Definir variables para cambiar entornos sin modificar el código base es otra práctica fundamental. Esto nos permite mantener configuraciones específicas para desarrollo, QA y producción mientras reutilizamos la misma base de código.

Controlar todo desde Git nos proporciona versiones, revisión de cambios y facilita la colaboración en equipo. Se recomienda también el uso de archivos como terraform.tfvars y backend.tf para separar claramente configuraciones por entorno.

Estas prácticas mejoran significativamente la mantenibilidad de nuestro código y facilitan la colaboración en equipos grandes.

## Diapositiva 21: Demo - Flujo lógico del despliegue
Ahora pasemos a la demostración práctica. El flujo lógico que seguiremos incluye tres pasos principales. Primero, crearemos una VCN y las subredes necesarias que servirán como la base de nuestra infraestructura de red.

Segundo, desplegaremos un DB System dentro de esta red, configurando aspectos como almacenamiento, CPU, memoria y otros parámetros relevantes para nuestra base de datos.

Tercero, como alternativa, también veremos cómo desplegar una Autonomous Database, que ofrece un enfoque diferente con menos configuración manual pero menos flexibilidad en ciertos aspectos.

Durante esta demostración, explicaremos el archivo main.tf paso a paso, analizando cada sección del código y cómo los diferentes recursos se relacionan entre sí. Esto les dará una visión clara de cómo implementar estos conceptos en sus propios proyectos.

## Diapositiva 22: ¿DUDAS?
Hemos llegado al final de nuestra presentación. Espero que esta información les haya proporcionado una comprensión clara de cómo el rol del DBA está evolucionando en la era cloud y cómo la Infraestructura como Código, específicamente Terraform en OCI, puede ayudarles a ser más eficientes y efectivos.

Ahora me gustaría abrir el espacio para preguntas. ¿Hay alguna duda sobre los temas que hemos cubierto? ¿Algún aspecto específico sobre la implementación de Terraform con bases de datos Oracle en OCI que les gustaría profundizar? Estoy aquí para ayudarles a aclarar cualquier punto y compartir experiencias adicionales que puedan serles útiles en su transición hacia el modelo de Cloud DBA.

Agradezco su atención y participación en esta presentación, y espero que puedan aplicar estos conocimientos en sus propios entornos para mejorar sus procesos y resultados.

## Diapositiva 23: Gracias
Muchas gracias por su tiempo y atención. Ha sido un placer compartir estos conocimientos con ustedes. Si desean contactarme para consultas adicionales o para discutir más a fondo alguno de los temas presentados, pueden hacerlo a través de mi correo electrónico: agarcia@datum.com.gt.

También quiero agradecer a Datum, S.A. por el apoyo en la preparación de esta presentación y por impulsar la adopción de estas tecnologías en nuestra región.

Les deseo mucho éxito en su viaje hacia la nube y espero que las herramientas y conceptos que hemos discutido hoy les ayuden a transformar su forma de trabajar como DBAs en este nuevo entorno. ¡Gracias nuevamente y que tengan un excelente día!