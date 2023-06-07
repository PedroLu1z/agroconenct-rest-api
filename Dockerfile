# Imagem base do Java
FROM maven:3.8.3-openjdk-17

ENV PROJECT_HOME /usr/src/agroconnect-api
ENV JAR_NAME api.agroconnect-0.0.1-SNAPSHOT.jar 

# Criando destino do diretório
RUN mkdir -p ${PROJECT_HOME}
WORKDIR ${PROJECT_HOME}

# fonte de aplicativo do pacote
COPY . .

RUN mvn clean package -DskipTests

RUN mv ${PROJECT_HOME}/target/${JAR_NAME} ${PROJECT_HOME}/

ENTRYPOINT [ "java", "-jar", "api.agroconnect-0.0.1-SNAPSHOT.jar"]