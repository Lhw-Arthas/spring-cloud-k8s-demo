package com.lhw.k8s.serviceone.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient("cloud-service-one")
public interface ServiceOneClient {

    @GetMapping("/helloService")
    String helloService();

}
