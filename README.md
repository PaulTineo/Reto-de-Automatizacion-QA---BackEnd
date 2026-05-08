# Reto-de-Automatizacion-QA---BackEnd
Reto de Automatizacion QA BackEnd

1. Descargar las dependencias en el POM.XML
2. El proyecto se uso MAVEN y JAVA 17
3. Para la ejecucion del proyecto se debera hacer por consola: mvn clean test "-Dkarate.env=dev" "-Demail-User=fulano@qa.com" "-Dpassword-User=teste" "-Dkarate.options=--tags @buscarUsuario"


   Observacion: -Dkarate.env es el ambiente donde se ejecutara (dev,cert), -Demail-User y -Dpassword-User son el correo y contra para el login, -Dkarate.options= es el tag del caso de prueba que se desea ejecutar
