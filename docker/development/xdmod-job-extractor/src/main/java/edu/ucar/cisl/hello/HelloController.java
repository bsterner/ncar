package edu.ucar.cisl.hello;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {

    private String greeting;

    @RequestMapping("/")
    @ResponseBody
    public String home() {
        return greeting;
    }

    @RequestMapping("/hello")
    @ResponseBody
    public String hello() {
        return greeting;
    }

    @Value("${application.greeting}")
    public void setGreeting(String greeting) {
        this.greeting = greeting;
    }
}