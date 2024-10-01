package com.example.test.entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

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
import jakarta.persistence.Transient;
import lombok.Data;

@Entity
@Table(name = "course_structure")
@Data
@JsonIgnoreProperties(ignoreUnknown = true, value = { "hibernateLazyInitializer", "handler", "fieldHandler" })
public class CourseStructure {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "course_structure_id")
    private int courseStructureId;
    @Column(name = "course_structure_name")
    private String courseStructureName;
    @Column(name = "academic_year")
    private int academicYear;
    // 0通識 1主修 2輔系 3雙主修 4 教程
    @Column(name = "type")
    private int type;
    // 與資料表Department有多對1關聯
    @ManyToOne(targetEntity = Department.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "department_id", referencedColumnName = "department_id")
    @JsonIgnoreProperties(ignoreUnknown = true, value = "courseStructures")
    private Department department;

    @ManyToMany(targetEntity = ClassModule.class, fetch = FetchType.EAGER)
    @JoinTable(name = "cscm_table", joinColumns = @JoinColumn(name = "course_structure_id", referencedColumnName = "course_structure_id"), inverseJoinColumns = @JoinColumn(name = "class_module_id", referencedColumnName = "class_module_id"))
    @JsonIgnoreProperties("courseStructures")
    private List<ClassModule> classModules;
    // 總學分
    @Transient
    private float totalCredit = 0;

    // 已獲得學分
    @Transient
    private float obtainedCredit = 0;

    public void init() {
        for (ClassModule classModule : classModules) {
            classModule.init();
        }
        calculaTetotalCredit();
    }

    // type 0:add 1:delete
    public void updateCourseData(int classModuleId, CourseModuleID courseModuleID, CourseData courseData, int type) {
        for (ClassModule classModule : classModules) {
            if (classModule.getClassModuleId() == classModuleId) {
                System.out.println(
                        courseStructureName + " update courseData name: " + courseData.getSubject().getCname());
                classModule.updateCourseData(courseModuleID, courseData, type);
                updateObtainedCredit();
                break;
            }
        }
    }

    public boolean canMove(int classModuleId, CourseModuleID courseModuleID, Subject subject) {
        for (ClassModule classModule : classModules) {
            if (classModule.getClassModuleId() == classModuleId) {
                return classModule.canMove(courseModuleID, subject);
            }
        }
        System.out.println(" classModule is not find in CourseStructure ");
        return false;
    }

    public void calculaTetotalCredit() {
        totalCredit = 0;
        for (ClassModule classModule : classModules) {
            totalCredit += classModule.getTotalCredit();
        }
    }

    public void updateObtainedCredit() {
        obtainedCredit = 0;
        for (ClassModule classModule : classModules) {
            obtainedCredit += classModule.getObtainedCredit();
        }
    }
}
