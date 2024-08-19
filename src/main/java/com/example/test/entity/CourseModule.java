package com.example.test.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.ToString;

@Entity
@Table(name = "coursemodule")
@Data
public class CourseModule {
        @EmbeddedId
        private CourseModuleID id;

        @Column(name = "Module_Name")
        private String module_name;
        @Column(name = "Tech_Required_Credits")
        private float tech_required_credits;
        @Column(name = "Non_Tech_required_credits")
        private float non_Tech_required_credits;
        @Column(name = "Tech_elective_credits")
        private float Tech_elective_credits;
        @Column(name = "Non_Tech_elective_credits")
        private float non_Tech_elective_credits;

        // FetchType.EAGER一起查回來 FetchType.LAZY需要才查
        @ManyToOne(targetEntity = ClassModule.class, fetch = FetchType.LAZY)
        // name放FK欄位名稱 referencedColumnName放FK指向PK的欄位名稱
        @JoinColumn(name = "Class_Module_ID", referencedColumnName = "Class_Module_ID")
        @ToString.Exclude
        private ClassModule classModule;

        @ManyToMany(targetEntity = Subject.class, fetch = FetchType.EAGER)
        @JoinTable(name = "coursemodule_subject", joinColumns = {
                        @JoinColumn(name = "Course_Package_ID", referencedColumnName = "Course_Package_ID"),
                        @JoinColumn(name = "Course_Module_ID", referencedColumnName = "Course_Module_ID")
        }, inverseJoinColumns = {
                        @JoinColumn(name = "Subject_ID", referencedColumnName = "Subject_ID"),
                        @JoinColumn(name = "Academic_Year", referencedColumnName = "Academic_Year")
        })
        private List<Subject> subjects;
}
