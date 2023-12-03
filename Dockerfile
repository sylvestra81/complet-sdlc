FROM openjdk:17
EXPOSE 8080
ADD target/complet-sdlc.jar complet-sdlc.jar
ENTRYPOINT ["java","-jar"."/complet-sdlc.jar"]