package com.example.test.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "version")
@Data
public class Version {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Version_ID")
    private int Version_ID;
    @Column(name = "Version_name")
    private String Version_name;
    @Column(name = "Student_ID")
    private String Student_ID;

    @OneToOne(targetEntity = CourseStructure.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "Major_Department_ID", referencedColumnName = "Course_Structure_ID")
    private CourseStructure major_Department;

    @OneToOne(targetEntity = CourseStructure.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "Auxiliary_Department_ID", referencedColumnName = "Course_Structure_ID", nullable = true)
    private CourseStructure auxiliary_Department;

    @OneToOne(targetEntity = CourseStructure.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "Double_Major_Department_ID", referencedColumnName = "Course_Structure_ID", nullable = true)
    private CourseStructure double_Major_Department;

    @OneToOne(targetEntity = CourseStructure.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "Teach_Class_ID", referencedColumnName = "Course_Structure_ID", nullable = true)

    private int Teach_Class_ID;
    @Column(name = "Total_Credit")
    private int Total_Credit;
    @Column(name = "classes_taken_Credit")
    private List<String> classes_taken_Credit;
    @Column(name = "classes_Passed")
    private List<Integer> classes_Passed;
    @Column(name = "Department_Passed")
    private Boolean Department_Passed;
    @Column(name = "Department_Chair_Passed")
    private Boolean Department_Chair_Passed;
    @Column(name = "General_Studies_Passed")
    private Boolean General_Studies_Passed;
    @Column(name = "Academic_Affairs_Office_Passed")
    private Boolean Academic_Affairs_Office_Passed;

}
