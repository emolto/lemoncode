# imagen a utilizar para el backend
FROM node:26-alpine3.23

# ruta de trabajo donde desplegar la aplicación nodejs
WORKDIR /app/node

# Copiamos los archivos package.json y package-lock.json(el asterisco si exsite) en el raíz del directorio de trabajo, /app/node.
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]

# indicamos que estamos en un entorno de producción para eliminar paquetes innecesarios
ENV NODE_ENV=production

# variable de entorno donde encontrar la API del backend (se puede sobreescribir en el docker run)
ENV API_URL=http://backend:5000/api/classes

#Instalo las dependencias de la aplicación
RUN npm install 

# copiamos el resto de archivos de la aplicación, ignorando los archivos declarados en .dockerignore
COPY . .

# publicamos el puerto por donde comunicarnos con la aplicación nodejs
EXPOSE 3000

# indicamos el comando para iniciar la aplicación nodejs
CMD ["npm", "start"]