package com.wildjs;

import io.micronaut.runtime.Micronaut;
import org.springframework.boot.SpringApplication;

import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application {

    public static void main(String[] args) {
        Micronaut.run(Application.class, args); // doesn't work
        // SpringApplication.run(Application.class, args); // works
    }
}
