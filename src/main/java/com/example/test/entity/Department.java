package com.example.test.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.ToString;

@Entity
@Table(name = "department")
@Data
public class Department {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Department_ID")
    private String Department_ID;
    @Column(name = "Department_Name")
    private String Department_Name;

    // 與資料表CourseStructure有1對多關聯
    // mappedBy refers to 在CourseStructure裡的變數
    @OneToMany(mappedBy = "department")
    // 防止ToString無限循環
    @ToString.Exclude
    private List<CourseStructure> courseStructures;
}
