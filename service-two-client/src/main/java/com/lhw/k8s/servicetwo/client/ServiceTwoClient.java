package com.lhw.k8s.servicetwo.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient("cloud-service-two")
public interface ServiceTwoClient {

    @GetMapping("/helloService")
    String helloService();

}
