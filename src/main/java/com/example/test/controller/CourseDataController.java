package com.example.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.test.service.CourseDataService;

@RestController
@RequestMapping("/courseDatas")
public class CourseDataController {

    @Autowired
    CourseDataService courseDataService;

}
