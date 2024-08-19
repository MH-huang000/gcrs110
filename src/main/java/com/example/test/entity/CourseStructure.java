package com.example.test.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "coursestructure")
@Data
public class CourseStructure {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Course_Structure_ID")
    private int Course_Structure_ID;
    @Column(name = "Course_Structure_Name")
    private String Course_Structure_Name;
    @Column(name = "Academic_Year")
    private int Academic_Year;

    // 與資料表Department有多對1關聯
    @ManyToOne(targetEntity = Department.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "Department_ID", referencedColumnName = "Department_ID")
    private Department department;

    @ManyToMany(targetEntity = ClassModule.class, fetch = FetchType.EAGER)
    @JoinTable(name = "cscm_table", joinColumns = @JoinColumn(name = "Course_Structure_ID", referencedColumnName = "Course_Structure_ID"), inverseJoinColumns = @JoinColumn(name = "Class_Module_ID", referencedColumnName = "Class_Module_ID"))
    private List<ClassModule> classModules;
}
