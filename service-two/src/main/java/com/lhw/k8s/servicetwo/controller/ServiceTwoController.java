package com.lhw.k8s.servicetwo.controller;

import com.lhw.k8s.serviceone.client.ServiceOneClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ServiceTwoController {

    private final ServiceOneClient serviceOneClient;

    public ServiceTwoController(ServiceOneClient serviceOneClient) {
        this.serviceOneClient = serviceOneClient;
    }


    @GetMapping("/hello")
    public String hello() {
        return "Hello ServiceTwo From:" + System.getenv("HOSTNAME");
    }

    @GetMapping("/helloService")
    public String helloService() {
        return "HelloService ServiceTwo From:" + System.getenv("HOSTNAME");
    }

    @GetMapping("/callServiceOne")
    public String callServiceOne() {
        return "ServiceTwo " + System.getenv("HOSTNAME") + " callServiceOne response is " + serviceOneClient.helloService();
    }

}
