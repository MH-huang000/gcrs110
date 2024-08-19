package com.example.test.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Data;

@Data
@Embeddable
// 要實作equals()跟hashcode()
public class CourseModuleID implements Serializable {
    @Column(name = "Course_Package_ID")
    private int Course_package_ID;
    @Column(name = "Course_Module_ID")
    private String Course_module_ID;
}
