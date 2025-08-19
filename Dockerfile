# Usage:
#
# Construir la imagen
# docker build -t springboot-two-java21:1.0 .
#
# Ejecutar el contenedor
# docker run -d -p 8080:8080 --name WebmainApplication springboot-two-java21
#
# Verificar que funciona
# curl http://localhost:8080/two
#
# push to docker
# docker tag springboot-two-java21 luissanzaguilar/springboot-two-java21:1.0
#
# docker push luissanzaguilar/springboot-two-java21:1.0
#



# --- Fase de construcción (Build Stage) ---
# Usamos una imagen con Maven y JDK 21 para compilar
FROM maven:3.9.6-eclipse-temurin-21 AS builder

WORKDIR /app
COPY pom.xml .
# Descarga dependencias primero (para aprovechar la caché de Docker)
RUN mvn dependency:go-offline -B

COPY src ./src
# Empaqueta la aplicación y omite los tests (opcional)
RUN mvn package -DskipTests

# --- Fase de ejecución (Runtime Stage) ---
# Imagen ligera con solo el JRE de Java 21
FROM eclipse-temurin:21-jre-jammy

WORKDIR /app
# Copia el JAR desde la fase de construcción
COPY --from=builder /app/target/*.jar app.jar

# Puerto que expone la aplicación (ajusta si tu app usa otro)
EXPOSE 8080

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]