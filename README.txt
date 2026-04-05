# README - Demoblaze Automation API

## Requisitos previos

1. Tener instalado Java 17 o superior.
2. Tener Maven instalado y agregado al PATH.
3. IDE recomendado: IntelliJ IDEA o VS Code.
4. Conexión a Internet para descargar dependencias Maven.

## Instalación del proyecto

1. Clonar o copiar el proyecto en tu máquina local.
2. Abrir el proyecto con tu IDE preferido.
3. Verificar que el archivo `pom.xml` tenga todas las dependencias necesarias:
   - Serenity BDD
   - Cucumber
   - Selenium
   - Karate
   - JUnit 5
4. Ejecutar en la terminal del proyecto:
mvn clean install
Esto descargará todas las dependencias y compilará el proyecto.

## Estructura del proyecto

- `src/test/java` → Código Java de los runners y steps (Serenity + Cucumber)
- `src/test/resources/features` → Archivos `.feature` de Karate para las pruebas API
- `pom.xml` → Archivo de configuración Maven con dependencias y plugins

## Cómo ejecutar las pruebas

### 1. Ejecutar con Maven desde terminal:
mvn clean test


### 2. Ejecutar un feature específico:
mvn test -Dkarate.options="classpath:features/api/signup.feature"


### 3. Ver reportes de Serenity
1. Después de la ejecución, generar reportes:
mvn serenity:aggregate

2. Abrir en el navegador:
target/site/serenity/index.html


## Notas importantes

- Asegúrate de que el endpoint de la API (`https://api.demoblaze.com/signup`) esté disponible.
- En los tests de Karate, las validaciones condicionales se manejan con `if (<expectedError>)` para errores esperados.
- Para agregar nuevos usuarios, edita el archivo `signup.feature` en la sección `Examples`.