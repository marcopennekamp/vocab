FROM java:8-alpine
MAINTAINER Your Name <you@example.com>

ADD target/uberjar/vocab.jar /vocab/app.jar

EXPOSE 3000

CMD ["java", "-jar", "/vocab/app.jar"]
