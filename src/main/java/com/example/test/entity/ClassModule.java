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
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Data;

@Entity
@Table(name = "class_module")
@Data
@JsonIgnoreProperties(ignoreUnknown = true, value = { "hibernateLazyInitializer", "handler", "fieldHandler" })
public class ClassModule {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "class_module_id")
    private int classModuleId;
    @Column(name = "course_class_id")
    private int courseClassId;
    @Column(name = "class_module_name")
    private String classModuleName;
    @Column(name = "threshold")
    private int threshold;
    @Column(name = "founding_year")
    private int foundingYear;

    @OneToMany(targetEntity = CourseModule.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "class_module_id", referencedColumnName = "class_module_id")
    @JsonIgnoreProperties("classModule")
    private List<CourseModule> courseModules;
    /*
     * @ManyToMany(mappedBy = "classModules", fetch = FetchType.LAZY)
     * 
     * @ToString.Exclude
     * 
     * @JsonIgnoreProperties(ignoreUnknown = true, value = "classModules")
     * private List<CourseStructure> courseStructures;
     */

    @Transient
    private float totalCredit = 0;
    @Transient
    private float obtainedCredit = 0;

    public void init() {
        calculaTetotalCredit();
    }

    // type 0:add 1:delete
    public void updateCourseData(CourseModuleID courseModuleID, CourseData courseData, int type) {
        for (CourseModule courseModule : courseModules) {
            if (courseModule.getId().equals(courseModuleID)) {
                System.out.println(classModuleName + " update courseData name: " + courseData.getSubject().getCname());
                if (type == 0) {
                    courseModule.addCourseData(courseData);
                } else {
                    courseModule.deleteCourseData(courseData);
                }
                updateObtainedCredit();
                break;
            }
        }
    }

    public void updateObtainedCredit() {
        obtainedCredit = 0;
        for (CourseModule courseModule : courseModules) {
            obtainedCredit += courseModule.getRequiredCredits() + courseModule.getElectiveCredits();
        }
    }

    public void calculaTetotalCredit() {
        totalCredit = 0;
        for (CourseModule courseModule : courseModules) {
            totalCredit += courseModule.getTeachRequiredCredits() + courseModule.getTechElectiveCredits()
                    + courseModule.getNonTechRequiredCredits() + courseModule.getNonTechElectiveCredits();
        }
    }

    public boolean canMove(CourseModuleID courseModuleID, Subject subject) {
        for (CourseModule courseModule : courseModules) {
            if (courseModule.getId().equals(courseModuleID)) {
                return courseModule.canMove(subject);
            }
        }
        System.out.println("courseModule is not find in classModule");
        return false;
    }
}
