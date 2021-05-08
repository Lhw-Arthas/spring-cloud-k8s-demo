#!/bin/sh
mvn clean package
docker build -t lhwarthas/spring-cloud-k8s-service-one .
docker push lhwarthas/spring-cloud-k8s-service-one
