# Comprobaciones del Despliegue de la Aplicación Flask con Gunicorn y Nginx

Este documento detalla las comprobaciones realizadas para verificar el funcionamiento correcto de una aplicación Flask desplegada utilizando **Gunicorn** como servidor WSGI y **Nginx** como proxy inverso. A continuación, se presentan las capturas de pantalla correspondientes a cada verificación.

## Tabla de Contenidos

1. [Introducción](#introducción)
2. [Comprobaciones](#comprobaciones)
   - [Verificación de la Aplicación Flask](#verificación-de-la-aplicación-flask)
   - [Comprobación de Tarea de ampliación](#comprobación-de-Tarea-de-ampliación)

## Introducción

Este documento describe el proceso de verificación del despliegue de una aplicación Flask utilizando Gunicorn y Nginx, garantizando que cada componente esté configurado y funcionando correctamente.

En el repositorio se encuentran todos los archivos de configuración para ambas aplicaciones y además un provision.sh en el que están todos los comando y pasos explicados, por lo que aquí solo se muestran las comprobaciones finales de que las apps funcionan.

## Comprobaciones

### Verificación de la Aplicación Flask

Para verificar que la aplicación Flask está en funcionamiento, accedemos a la URL `http://app.izv`. A continuación se muestra una captura que muestra que la aplicación se carga correctamente.

![app-desplegada](https://github.com/user-attachments/assets/4c8483e3-e59f-4fdd-aa67-7b8fa0822cde)


### Comprobación de Tarea de ampliación

A continuación, se muestra la captura de la ejecución de la tarea de ampliación


![ampliacion-desplegada](https://github.com/user-attachments/assets/11a74fd3-b9a6-4297-a6be-b775badd4f21)
