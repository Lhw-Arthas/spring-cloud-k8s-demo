#!/bin/sh
mvn clean package -pl service-one -am -f ../pom.xml
docker build -t lhwarthas/spring-cloud-k8s-service-one .
docker push lhwarthas/spring-cloud-k8s-service-one
