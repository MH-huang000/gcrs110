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
        @Column(name = "teach_required_credits")
        private float teachRequiredCredits;
        @Column(name = "non_tech_required_credits")
        private float nonTechRequiredCredits;
        @Column(name = "tech_elective_credits")
        private float techElectiveCredits;
        @Column(name = "non_tech_elective_credits")
        private float nonTechElectiveCredits;

        @ManyToMany(targetEntity = Subject.class, fetch = FetchType.EAGER)
        @JoinTable(name = "coursemodule_subject", joinColumns = {
                        @JoinColumn(name = "course_package_id", referencedColumnName = "course_package_id"),
                        @JoinColumn(name = "course_module_id", referencedColumnName = "course_module_id")
        }, inverseJoinColumns = {
                        @JoinColumn(name = "subject_id ", referencedColumnName = "subject_id "),
        })
        @JsonIgnoreProperties("courseModules")
        private List<Subject> subjects = new ArrayList<>();

        // Java的transient關鍵字用來表示欄位不被序列化，而JPA的@Transient註解則是用來表示欄位不會持久化到資料庫中
        @Transient
        private float requiredCredits = 0;
        @Transient
        private float electiveCredits = 0;
        @Transient
        private List<CourseData> courseDatas = new ArrayList<>();

        public boolean canMove(Subject subject) {
                for (Subject tempSubject : subjects) {
                        if (tempSubject.getSubjectCode().equals(subject.getSubjectCode())) {
                                if (nonTechRequiredCredits > requiredCredits && subject.getSel() == 1) {
                                        System.out.println("can Move is true");
                                        return true;

                                } else if (nonTechElectiveCredits > electiveCredits && subject.getSel() == 0) {
                                        System.out.println("can Move is true");
                                        return true;
                                }
                                System.out.println(moduleName + " is full");
                        }
                }
                System.out.println(subject.getCname() + " is not find in courseModule");
                return false;
        }

        public void addCourseData(CourseData courseData) {
                Subject subject = courseData.getSubject();
                if (this.subjects == null) {
                        this.subjects = new ArrayList<>();
                }
                if (subject.getSel() == 1) {
                        requiredCredits += subject.getCredit();
                } else if (subject.getSel() == 0) {
                        electiveCredits += subject.getCredit();
                }
                courseDatas.add(courseData);
                System.out.println(moduleName + " add subject " + subject.getCname());
        }

        public void deleteCourseData(CourseData courseData) {
                Subject subject = courseData.getSubject();
                if (subject.getSel() == 1) {
                        requiredCredits -= subject.getCredit();
                } else if (subject.getSel() == 0) {
                        electiveCredits -= subject.getCredit();
                }
                Iterator<CourseData> iterator = courseDatas.iterator();
                while (iterator.hasNext()) {
                        CourseData temp = iterator.next();
                        if (temp.getCourseDataId() == courseData.getCourseDataId()) {
                                iterator.remove();
                        }
                }
                System.out.println(moduleName + " delete subject " + subject.getCname());
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
