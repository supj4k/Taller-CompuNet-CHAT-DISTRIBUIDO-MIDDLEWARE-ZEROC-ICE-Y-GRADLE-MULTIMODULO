# Chat Distribuido con ZeroC Ice

Sistema de chat multiusuario por consola, construido como proyecto Gradle multimódulo con el middleware **ZeroC Ice** (RPC). Computación en Internet I — Universidad Icesi.

## Módulos
- **common** — contrato Slice (`Chat.ice`) del que se genera el código Java compartido.
- **server** — el Servant concurrente (`ChatRoomI`) y el lanzador del servidor Ice (puerto 10000).
- **client** — cliente de consola con hilo receptor en segundo plano.

## Requisitos
- **JDK 17** o superior
- **ZeroC Ice 3.7.11** (el compilador `slice2java` debe estar en el PATH → `slice2java --version`)
- No necesitas instalar Gradle: se usa el wrapper (`gradlew`).

> El código generado por Slice no se sube al repo; se regenera en cada build, por eso Ice debe estar instalado en cada máquina.

## Compilar
Desde la raíz del proyecto:
```
.\gradlew build
```
Debe terminar en `BUILD SUCCESSFUL`.

## Ejecutar
Abre una terminal por proceso.

**1. Servidor:**
```
.\gradlew :server:run --console=plain --args="--Ice.ThreadPool.Server.Size=4"
```

**2. Cliente (uno por cada usuario):**
```
.\gradlew :client:run --console=plain
```
Ingresa un nickname y usa los comandos:
- escribir texto → envía mensaje a la sala
- `/users` → lista los usuarios conectados
- `/exit` → cierra la sesión

> En Windows usa `.\gradlew`; en Linux/Mac usa `./gradlew`.
