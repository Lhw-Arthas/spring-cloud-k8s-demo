#!/bin/sh
mvn clean package -pl service-two -am -f ../pom.xml
docker build -t lhwarthas/spring-cloud-k8s-service-two .
docker push lhwarthas/spring-cloud-k8s-service-two
