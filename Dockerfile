# Используйте образ Maven для сборки
FROM maven:3.8.4-jdk-8 AS builder

# Копируйте файлы проекта в рабочую директорию образа
WORKDIR /app
COPY pom.xml .
COPY src/ ./src/

# Выполните сборку проекта
RUN mvn package

# Используйте образ Tomcat в качестве базового образа, но с явным указанием JDK 8
FROM tomcat:9.0-jdk8

# Очистите директорию с веб-приложениями Tomcat от старых .war файлов
RUN rm -rf /usr/local/tomcat/webapps/*

# Копируйте скомпилированный WAR файл из образа сборки в директорию веб-приложений Tomcat
COPY --from=builder /app/target/web-app-docker.war /usr/local/tomcat/webapps/

# Откройте порт, который будет использоваться при запуске контейнера
EXPOSE 8080

# Команда, которая будет выполнена при запуске контейнера
CMD ["catalina.sh", "run"]
