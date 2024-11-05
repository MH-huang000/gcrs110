package com.example.test.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Data;

@Data
@Embeddable
// 要實作equals()跟hashcode()
public class CourseModuleID implements Serializable {
    @Column(name = "course_package_id")
    private int coursePackageId;
    @Column(name = "course_module_id")
    private String courseModuleId;
}
