package com.example.test.entity;

import java.util.*;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Data;

@Entity
@Table(name = "course_module")
@Data
@JsonIgnoreProperties(ignoreUnknown = true, value = { "hibernateLazyInitializer", "handler", "fieldHandler" })
public class CourseModule {
        @EmbeddedId
        private CourseModuleID id;

        @Column(name = "module_name")
        private String moduleName;

        @Column(name = "required_credits")
        private float requiredCredits;

        @Column(name = "elective_credits")
        private float electiveCredits;

        @ManyToOne(targetEntity = Department.class, fetch = FetchType.EAGER)
        @JoinColumn(name = "department_id", referencedColumnName = "department_id")
        private Department department;

        @ManyToMany(targetEntity = Subject.class, fetch = FetchType.EAGER)
        @JoinTable(name = "coursemodule_subject", joinColumns = {
                        @JoinColumn(name = "course_package_id", referencedColumnName = "course_package_id"),
                        @JoinColumn(name = "course_module_id", referencedColumnName = "course_module_id")
        }, inverseJoinColumns = {
                        @JoinColumn(name = "subject_id ", referencedColumnName = "subject_id "),
        })
        @JsonIgnoreProperties("courseModules")
        private List<Subject> subjects;

        // Java的transient關鍵字用來表示欄位不被序列化，而JPA的@Transient註解則是用來表示欄位不會持久化到資料庫中
        @Transient
        private float obtainedRequiredCredits = 0;
        @Transient
        private float obtainedElectiveCredits = 0;
        @Transient
        private float onGoingRequiredCredits = 0;
        @Transient
        private float onGoingElectiveCredits = 0;
        @Transient
        private int holes = 0;
        @Transient
        private int passType = 0;

        @Transient
        private List<CourseData> courseDatas = new ArrayList<>();

        public boolean canMove(Subject subject) {
                for (Subject tempSubject : subjects) {
                        if (tempSubject.getSubjectCode().equals(subject.getSubjectCode())) {
                                System.out.println("can Move is true");
                                return true;
                        }
                }

                if (department.checkAdoptSubject(subject) != null) {
                        for (Subject tempSubject : subjects) {
                                if (tempSubject.getSubjectCode().equals(subject.getSubjectCode())) {
                                        System.out.println("can Move is true");
                                        return true;
                                }
                        }
                }
                System.out.println(subject.getCname() + " is not find in courseModule");
                passcheck();
                return false;
        }

        public void addCourseData(CourseData courseData) {
                Subject subject = courseData.getSubject();
                if (subject.getSel() == 1) {
                        onGoingRequiredCredits += subject.getCredit();
                        if (courseData.getStatus() != 3) {
                                obtainedRequiredCredits += subject.getCredit();
                        }
                } else {
                        onGoingElectiveCredits += subject.getCredit();
                        if (courseData.getStatus() != 3) {
                                obtainedElectiveCredits += subject.getCredit();
                        }
                }
                for (Subject temp : subjects) {
                        if (temp.getSubjectId() == subject.getSubjectId()) {
                                temp.setStatus(false);
                        }
                }
                courseDatas.add(courseData);
                holes--;
                passcheck();
                System.out.println(moduleName + ": " + holes);
                System.out.println(moduleName + " add subject " + subject.getCname());
        }

        public void deleteCourseData(CourseData courseData) {
                Subject subject = courseData.getSubject();
                if (subject.getSel() == 1) {
                        onGoingRequiredCredits -= subject.getCredit();
                        if (courseData.getStatus() != 3) {
                                obtainedRequiredCredits -= subject.getCredit();
                        }
                } else {
                        onGoingElectiveCredits -= subject.getCredit();
                        if (courseData.getStatus() != 3) {
                                obtainedElectiveCredits -= subject.getCredit();
                        }
                }
                for (Subject temp : subjects) {
                        if (temp.getSubjectId() == subject.getSubjectId()) {
                                temp.setStatus(true);
                        }
                }
                Iterator<CourseData> iterator = courseDatas.iterator();
                while (iterator.hasNext()) {
                        CourseData temp = iterator.next();
                        if (temp.getCourseDataId() == courseData.getCourseDataId()) {
                                iterator.remove();
                                holes++;
                        }
                }
                passcheck();
                System.out.println(moduleName + " delete subject " + subject.getCname());
        }

        // 確認CourseModule有沒有通過
        public void passcheck() {
                if (obtainedRequiredCredits >= requiredCredits && obtainedElectiveCredits >= electiveCredits) {
                        passType = 1;
                } else if (onGoingRequiredCredits >= requiredCredits && onGoingElectiveCredits >= electiveCredits) {
                        passType = 2;
                } else {
                        passType = 0;
                }
                if (holes == 0 && passType == 0) {
                        holes++;
                } else if (holes > 0 && passType != 0) {
                        holes = 0;
                }
        }

        // 計算動的數量
        public void calculateHole() {
                holes = 0;
                switch (department.getDepartmentId()) {
                        case "ACS":
                                holes = (int) electiveCredits / 3;
                                break;
                        case "AGE":
                                holes = (int) electiveCredits / 2;
                                break;
                        default:
                                holes = (int) electiveCredits / 2;
                                break;
                }

        }
}
/*
 * // FetchType.EAGER直接查回來 FetchType.LAZY需要才查
 * 
 * @ManyToOne(targetEntity = ClassModule.class, fetch = FetchType.LAZY)
 * // name放FK欄位名稱 referencedColumnName放FK指向PK的欄位名稱
 * 
 * @JoinColumn(name = "class_module_id", referencedColumnName =
 * "class_module_id")
 * 
 * @ToString.Exclude
 * 
 * @JsonIgnoreProperties(ignoreUnknown = true, value = "courseModules")
 * private ClassModule classModule;
 */
