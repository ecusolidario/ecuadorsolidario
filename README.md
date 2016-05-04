# EcuadorSolidario

La plataforma de co-financiamiento de Ecuador para la reconstrucción

## Una plataforma open-source para el financiamiento de proyectos de reconstrucción.

Bienvenidos al repositorio de EcuadorSolidario.
Nuestro objetivo es estimular a la comunidad de emprendedores tecnológicos para unir esfuerzos solidarios para así crear una plataforma global que permita la organización de las tentativas de ayuda y solidaridad en las necesidades creadas en las zonas afectadas por el Terremoto de Ecuador en el 2016. Creando una plataforma de alta calidad para obtener bienes y servicios que satisfagan las necesidades de la comunidad.

Usted puede ver el software en acción en http://ecuadorsolidario.org.
The official repo is https://github.com/ecuadorsolidario/ecuadorsolidario

## Cómo empezar

### Dependencias

Para ejecutar este proyecto se necesita:

* Ruby 2.2.3

* Rails 4.1

* [postgREST 0.3](https://github.com/begriffs/postgrest/releases/tag/v0.3.0.3)

* [PostgreSQL 9.4](http://www.postgresql.org/)
  * OSX - [Postgres.app](http://postgresapp.com/)
  * Linux - `$ sudo apt-get install postgresql`
  * Windows - [PostgreSQL for Windows](http://www.postgresql.org/download/windows/)

  **IMPORTANTE**: Asegurarse de tener postgresql-contrib ([Aditional Modules](http://www.postgresql.org/docs/9.3/static/contrib.html)) instalado en el sistema.

### Setup the project

* Clonar el proyecto

        $ git clone https://github.com/ecuadorsolidario/ecuadorsolidario.git

* Entrar al directorio del proyecto.

        $ cd ecuadorsolidario

* Crear el archivo de configuración `database.yml`

        $ cp config/database.sample.yml config/database.yml

    Se debe hacer para configurar la base de datos local!
    Adicione su usuario y contraseña de base de datos (a menos que no tenga ninguna).

* Instalar las gems

        $ bundle install

* Instalar las dependencias de front-end

        $ bower install

    Requiere [bower](http://bower.io/#install-bower), el cual requiere [Node.js](https://nodejs.org/download/) y su package manager, *npm*. Siga las instrucciones en el sitio web bower.io.

* Crear, migrar y agregar los datos básicos dentro de la base de datos

        $ rake db:create db:migrate db:seed

* Configure el API server

	Se provee autenticación a través de JWT ([JSON Web Tokens](http://jwt.io/)) y ésta puede ser configurada a través de `CatarseSettings` dentro de la consola de rails.

		$ bundle exec rails console
		> CatarseSettings[:api_host] = "http://localhost:3004" # postgREST server url
		> CatarseSettings[:jwt_secret] = "gZH75aKtMN3Yj0iPS4hcgUuTwjAzZr9C" # this token is just a valid example

Si todo está OK, ahora se puede ejecutar el proyecto!

### Ejecutando el proyecto

* Ejecutar el API server

	Después de descargar PostgREST 0.3.x desempacar y ejecutar el archivo ejecutable como se explica:.

		$ ./postgrest postgres://usuario_db:password@localhost/hack4ec_development -a anonymous --jwt-secret gZH75aKtMN3Yj0iPS4hcgUuTwjAzZr9C -s 1 -p 3004

* Ejecutar el servidor Rails
```bash
$ rails server
```

Abrir [http://localhost:3000](http://localhost:3000)

## Cómo contribuir con código

Los planes de esta aplicación se discuten en Slack (http://hack4ec.slack.com).

Despues de eso, solamente haga un fork del proyecto, realice los cambios necesarios, y envíenos un pull request.

### Mejores prácticas (o cómo hacer que su pull request sea aceptado rápidamente)

* Seguir esta guía de estilo de desarrollo: https://github.com/bbatsov/ruby-style-guide
* Crear una prueba de aceptación por cada escenario de la característica que está tratando de implementar.
* Crear pruebas del modelo y del controlador para mantener un 100% de cobertura de código en las nuevas partes que se están escribiendo.
* Estar en la libertad de agregar specs a código existente y que tenga deficiencia de cobertura ;)
* Let our tests serve as a style guide: we try to use implicit spec subjects and lazy evaluation wherever we can.

## Créditos

Código Base: Catarse (https://github.com/catarse/catarse). Se utiliza esta plataforma para el crecimiento de la aplicación

Contribuciones: Sabemos quienes participamos en el código ;) La historia de commits puede ayudar, pero la lista está creciendo por lo que podría resultar poco práctico incluir a cada uno en el README.

## Licencia

Copyright (c) 2016 EcuadorSolidario

Licensed under the MIT license (see MIT-LICENSE file)
