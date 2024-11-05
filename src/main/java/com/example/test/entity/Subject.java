package com.example.test.entity;

import java.util.*;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Data;
import lombok.ToString;

@Entity
@Table(name = "subject")
@Data
@JsonIgnoreProperties(ignoreUnknown = true, value = { "hibernateLazyInitializer", "handler", "fieldHandler" })
public class Subject {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "subject_id ")
    private int subjectId;
    @Column(name = "subject_code ")
    private String subjectCode;
    @Column(name = "academic_year")
    private int academicYear;
    @Column(name = "cname")
    private String cname;
    @Column(name = "ename")
    private String ename;
    @Column(name = "credit")
    private float credit;
    // 1必 0選
    @Column(name = "sel")
    private int sel;
    @Transient // 用在左畫面顯示
    private boolean status = true;

    @ManyToMany(mappedBy = "subjects", fetch = FetchType.EAGER)
    @ToString.Exclude
    @JsonIgnoreProperties(ignoreUnknown = true, value = "subjects")
    private List<CourseModule> courseModules;

}
