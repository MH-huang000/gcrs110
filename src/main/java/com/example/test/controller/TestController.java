package com.example.test.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;

@RestController
@RequestMapping("/test")
public class TestController {

    @GetMapping("/hi")
    @Operation(summary = "測試")
    public String hi() {
        System.out.println("hi Peter");
        return "<h1>Hi Peter<h1>";
    }

}
// @RestController 用來回傳data
// @Controller 用來回傳html
