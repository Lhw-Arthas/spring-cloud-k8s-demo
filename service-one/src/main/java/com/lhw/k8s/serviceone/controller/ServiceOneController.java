package com.lhw.k8s.serviceone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ServiceOneController {

    @GetMapping("/hello")
    public String hello() {
        return "Hello ServiceOne From:" + System.getenv("HOSTNAME");
    }

    @GetMapping("/helloService")
    public String helloService() {
        return "HelloService ServiceOne From:" + System.getenv("HOSTNAME");
    }

}
