package com.example.test.entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.ToString;

@Entity
@Table(name = "department")
@Data
@JsonIgnoreProperties(ignoreUnknown = true, value = { "hibernateLazyInitializer", "handler", "fieldHandler" })
public class Department {
    @Id
    @Column(name = "department_id")
    private String departmentId;
    @Column(name = "department_name")
    private String departmentName;

    // 與資料表CourseStructure有1對多關聯
    // mappedBy refers to 在CourseStructure裡的變數
    @OneToMany(mappedBy = "department")
    // 防止ToString無限循環
    @ToString.Exclude
    // 防止JSON數據無限循環
    @JsonIgnoreProperties("department")
    private List<CourseStructure> courseStructures;
}
// { "hibernateLazyInitializer", "handler", "fieldHandler" }这些属性是由 Hibernate
// 引入的，用于处理懒加载和代理对象的问题，但通常不需要被序列化到 JSON 中。