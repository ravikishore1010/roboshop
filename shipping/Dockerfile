FROM debian:10 AS build

# Install required tools
RUN apt-get update && apt-get install -y wget

# Download and install Maven
RUN wget -q "https://apache.osuosl.org/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz" -O /tmp/apache-maven.tar.gz \
    && tar xzf /tmp/apache-maven.tar.gz -C /opt \
    && rm /tmp/apache-maven.tar.gz

WORKDIR /opt/shipping
COPY pom.xml /opt/shipping/
RUN /opt/apache-maven-3.8.4/bin/mvn dependency:resolve && /opt/apache-maven-3.8.4/bin/mvn package
COPY src /opt/shipping/src/

FROM openjdk:8-jre-alpine
EXPOSE 8080
WORKDIR /opt/shipping
ENV CART_ENDPOINT=cart:8080
ENV DB_HOST=mysql
COPY --from=build /opt/shipping/target/shipping-1.0.jar shipping.jar
CMD [ "java", "-Xmn256m", "-Xmx768m", "-jar", "shipping.jar" ]