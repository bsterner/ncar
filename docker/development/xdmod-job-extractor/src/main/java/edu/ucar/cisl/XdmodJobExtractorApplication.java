package edu.ucar.cisl;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

@SpringBootApplication
public class XdmodJobExtractorApplication {

    public static void main(String[] args) throws Exception {
        ApplicationContext ctx = SpringApplication.run(XdmodJobExtractorApplication.class, args);
    }

}
