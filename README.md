# Ejemplo de DevOps

Este es un ejemplo de un ciclo completo de DevOps.

# Detalles
Vamos a usar:
## Docker
Dockerizar una aplicacion Django con Python, los cuales constan de: 
- env vars.
- run user.
- port.
- healthcheck
- etc.

## GitActions
Vamos a generar un pipeline para CI/CD como codigo que incluya los siguientes pasos:
- Code Build
- Unit Test
- Static Code analysis
- Code coverage
- Contruir y subir la imagen (Docker build & push)

## Kubernetes
Desplegar la aplicacion dockerizada en Kubernetes, con al menos 2 replicas y escalamiento horizantal.
- Configmaps
- Secrets
- Ingress
- etc.

### Prerrequisitos
La aplicación esta construida con Django con Python

- Python 3.11.3

### Instalacion

Clone this repo.

```bash
git clone https://bitbucket.org/devsu/demo-devops-python.git
```

Instalar dependencias.

```bash
pip install -r requirements.txt
```

Migrar la BDD

```bash
py manage.py makemigrations
py manage.py migrate
```

### BDD

La base de datos se genera como un archivo en la ruta principal cuando el proyecto se ejecuta por primera vez y su nombre es `db.sqlite3`.

Considere otorgar permisos de acceso al archivo para su correcto funcionamiento.

## Uso

Para ejecutar pruebas puedes usar este comando.

```bash
py manage.py test
```

Para ejecutar localmente el proyecto puedes usar este comando.

```bash
py manage.py runserver
```

Abrir http://localhost:8000/api/ en cualquier browser.

### Funciones de la Aplicacion

Este microservicio puede:

#### Crear usuario

Para crear un usuario, el endpoint **/api/users/** se debe consumir con los siguientes parámetros:

```bash
  Method: POST
```

```json
{
    "dni": "dni",
    "name": "name"
}
```

Si la respuesta es exitosa, el servicio devolverá un Estado HTTP 200 y un mensaje con la siguiente estructura:

```json
{
    "id": 1,
    "dni": "dni",
    "name": "name"
}
```

Si la respuesta no tiene éxito, recibiremos el estado 400 y el siguiente mensaje:

```json
{
    "detail": "error"
}
```

#### Obtener Usuarios

Para obtener todos los usuarios, the endpoint **/api/users** se debe consumir con el siguiente parámetro:

```bash
  Method: GET
```

Si la respuesta es exitosa, el servicio devolverá un Estado HTTP 200 y un mensaje con la siguiente estructura:

```json
[
    {
        "id": 1,
        "dni": "dni",
        "name": "name"
    }
]
```

#### Obtener un usuario

Para obtener un usuario, el endpoint **/api/users/<id>** se debe consumir con el siguiente parámetro:

```bash
  Method: GET
```


Si la respuesta es exitosa, el servicio devolverá un estado HTTP 200 y un mensaje con la siguiente estructura:

```json
{
    "id": 1,
    "dni": "dni",
    "name": "name"
}
```

Si la identificación del usuario no existe, recibiremos el estado 404 y el siguiente mensaje:

```json
{
    "detail": "Not found."
}
```

## Licencia
La aplicacion para el ejemplo fue obtenida de un repositorio de Devsu, se puede poner cualquier repositorio  que sea una app Django con Python.
Copyright © 2023 Devsu. All rights reserved.
