package com.example.test.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

import lombok.Data;
import lombok.ToString;

@Entity
@Table(name = "classmodule")
@Data
public class ClassModule {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Class_Module_ID")
    private int class_module_id;
    @Column(name = "Course_Class_ID")
    private int course_class_id;
    @Column(name = "Class_Module_Name")
    private String class_module_name;
    @Column(name = "Threshold")
    private int threshold;
    @Column(name = "Founding_Year")
    private int founding_year;

    @OneToMany(targetEntity = CourseModule.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "Class_Module_ID", referencedColumnName = "Class_Module_ID")
    private List<CourseModule> courseModules;

    @ManyToMany(mappedBy = "classModules", fetch = FetchType.LAZY)
    @ToString.Exclude
    private List<CourseStructure> courseStructures;

}
