package com.example.test;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RestController;

import com.example.test.service.StudentService;
import com.example.test.service.VersionService;

@RestController
@RequestMapping("/test")
public class TestController {
    // @Autowired注入以創建的Bean
    @Autowired
    VersionService versionService;
    @Autowired
    StudentService studentService;

    @GetMapping("/hi")
    public String hi() {
        System.out.println("hi Peter");
        return "<h1>Hi Peter<h1>";
    }

}
// @RestController 用來回傳data
// @Controller 用來回傳html
