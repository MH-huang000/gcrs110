package com.example.test.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "student")
@Data
public class Student {
    @Id
    @Column(name = "Student_ID")
    private String Student_ID;
    @Column(name = "name")
    private String name;

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
    private CourseStructure teach_Class;

    @Column(name = "Official_Review_Version_ID")
    private int Official_Review_Version_ID;

    @OneToMany(targetEntity = CourseData.class)
    @JoinColumn(name = "Student_ID", referencedColumnName = "Student_ID")
    private List<CourseData> course_datas;

}
