package com.lhw.k8s.serviceone.controller;

import com.lhw.k8s.servicetwo.client.ServiceTwoClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ServiceOneController {

    private final ServiceTwoClient serviceTwoClient;

    public ServiceOneController(ServiceTwoClient serviceTwoClient) {
        this.serviceTwoClient = serviceTwoClient;
    }

    @GetMapping("/hello")
    public String hello() {
        return "Hello ServiceOne From:" + System.getenv("HOSTNAME");
    }

    @GetMapping("/helloService")
    public String helloService() {
        return "HelloService ServiceOne From:" + System.getenv("HOSTNAME");
    }

    @GetMapping("/callServiceTwo")
    public String callServiceTwo() {
        return "ServiceOne " + System.getenv("HOSTNAME") + " callServiceTwo response is " + serviceTwoClient.helloService();
    }

}
