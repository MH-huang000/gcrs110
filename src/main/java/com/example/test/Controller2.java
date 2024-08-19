package com.example.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.test.entity.CourseStructure;
import com.example.test.service.CourseStructureService;
import com.example.test.service.MemberService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RestController
@RequestMapping("/test")
public class Controller2 {
    // @Autowired注入以創建的Bean

    @Autowired
    private MemberService service;
    @Autowired
    private CourseStructureService service2;

    @GetMapping("/getuser")
    public String getUser(@RequestParam("id") String id) {
        return service.getByID(id).toString();
    }

    @GetMapping("/getAll")
    public String getAll(@RequestParam("number") int number) {
        switch (number) {
            case 1:
                return service.getAll().toString();
            case 2:
                for (CourseStructure cs : service2.getAll()) {
                    System.out.println(cs.getCourse_Structure_ID() + "\n");
                    System.out.println(cs.getCourse_Structure_Name() + "\n");
                    System.out.println(cs.getAcademic_Year() + "\n");
                    System.out.println(cs.getDepartment().getDepartment_Name() + "\n");
                    System.out.println("---------------------------\n");
                }
                return service2.getAll().toString();
            case 3:
                return service2.getAll2().toString();
            default:
                return "nothing";
        }
    }

    @GetMapping("/hi")
    public String test() {
        System.out.println("hi Peter");
        return "<h1>Hi Peter<h1>";
    }
}
