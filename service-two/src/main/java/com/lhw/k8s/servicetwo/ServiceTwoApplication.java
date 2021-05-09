package com.lhw.k8s.servicetwo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableEurekaClient
@EnableFeignClients(basePackages = "com.lhw.k8s")
public class ServiceTwoApplication {

	public static void main(String[] args) {
		SpringApplication.run(ServiceTwoApplication.class, args);
	}

}
