#!/bin/sh
curl -X POST http://localhost:$SERVER_PORT/service-actuator/serviceregistry?status=DOWN -H 'Content-Type: application/vnd.spring-boot.actuator.v2+json;charset=UTF-8'
sleep 60