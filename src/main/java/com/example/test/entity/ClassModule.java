package com.example.test.entity;

import java.util.*;

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
    // 1共同、2通識、3專門、4自由、5學分學程、6師資培育
    @Column(name = "type")
    private int type;
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
    private boolean pass = false;
    @Transient
    private float totalCredit = 0;
    @Transient
    private float obtainedCredit = 0;
    @Transient
    private float OnGoingCredit = 0;

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
                updateCredit();
                break;
            }
        }
    }

    // 更新學分
    public void updateCredit() {
        obtainedCredit = 0;
        OnGoingCredit = 0;
        for (CourseModule courseModule : courseModules) {
            obtainedCredit += courseModule.getObtainedRequiredCredits() + courseModule.getObtainedElectiveCredits();
            OnGoingCredit += courseModule.getOnGoingRequiredCredits() + courseModule.getOnGoingElectiveCredits();
        }
        passcheck();
    }

    // 檢查有無通過
    public void passcheck() {
        Set<Integer> temp = new LinkedHashSet<>();
        for (CourseModule courseModule : courseModules) {
            if (courseModule.getPassType() == 1) {
                temp.add(courseModule.getId().getCoursePackageId());
            }
        }
        if (temp.size() >= threshold) {
            pass = true;
        } else {
            pass = false;
        }
        System.out.println(classModuleName + " pass " + temp.size() + '/' + threshold);
    }

    public void calculaTetotalCredit() {
        totalCredit = 0;
        Set<Integer> temp = new LinkedHashSet<>();
        for (CourseModule courseModule : courseModules) {
            if (!temp.contains(courseModule.getId().getCoursePackageId())) {
                if (temp.size() < threshold) {
                    totalCredit += courseModule.getRequiredCredits() + courseModule.getElectiveCredits();
                    temp.add(courseModule.getId().getCoursePackageId());
                }
            }
            courseModule.calculateHole();
        }
    }

    public boolean canMove(CourseModuleID courseModuleID, Subject subject) {
        for (CourseModule courseModule : courseModules) {
            if (courseModule.getId().equals(courseModuleID)) {
                switch (type) {
                    case 4:
                        switch (courseModule.getDepartment().getDepartmentId()) {
                            case "ACS":
                                if (subject.getSubjectCode().contains("AGE")) {
                                    return false;
                                } else if (subject.getSubjectCode().contains("ACS")) {
                                    return true;
                                }
                                return courseModule.canMove(subject);
                            case "ASC":
                                if (subject.getSubjectCode().contains("AGE")) {
                                    int tempCredit = 0;
                                    for (Subject s : courseModule.getSubjects()) {
                                        if (s.getSubjectCode().contains("AGE")) {
                                            tempCredit += s.getCredit();
                                        }
                                    }
                                    if (tempCredit >= 4) {
                                        return false;
                                    }
                                }
                                return true;
                            default:
                                if (subject.getSubjectCode().contains("AGE")) {
                                    return false;
                                }
                                return true;
                        }
                    default:
                        return courseModule.canMove(subject);
                }
            }
        }
        System.out.println("courseModule is not find in classModule");
        return false;
    }

    public HashMap<String, String> auto(Subject subject) {
        HashMap<String, String> temp = new HashMap<>();
        for (CourseModule courseModule : courseModules) {

            if (courseModule.getPassType() != 1 && canMove(courseModule.getId(), subject)) {
                System.out.println("find canMove:" + courseModule.getModuleName());
                temp.put("canMove", "true");
                temp.put("coursePackageId", Integer.toString(courseModule.getId().getCoursePackageId()));
                temp.put("courseModuleId", courseModule.getId().getCourseModuleId());
                return temp;
            }

        }
        temp.put("canMove", "false");
        return temp;
    }
}
