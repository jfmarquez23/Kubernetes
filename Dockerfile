# Uso imagen Python oficial Docker Hub
FROM python:3

# Crear un usuario no privilegiado para ejecutar la aplicación
RUN useradd -ms /bin/bash usuario

# Crear un directorio para la aplicación
RUN mkdir /app

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copie el archivo de requisitos en el contenedor en la ruta /app
COPY requirements.txt .

# Instalar dependencias 
RUN pip install --no-cache-dir -r requirements.txt

#Variables externas
COPY .env .

# Copie el contenido del directorio actual en el contenedor en /app
COPY . .

# Exponga el puerto 8000 para permitir la comunicación con el servidor
EXPOSE 8000

# Ejecuta las migraciones de la base de datos
RUN python manage.py migrate

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s CMD curl -f http://localhost:8000/api/ || exit 1

# Cambiar al usuario no privilegiado
USER usuario

#  Comando para ejecutar la aplicación cuando se inicie el contenedor
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# Metadatos - Info
LABEL version="1.0" \
      description="Imagen Python" \
      author="Fernando Marquez"