package com.example.test.entity;

import java.util.List;

import java.util.ArrayList;
import java.util.Iterator;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Data;

@Entity
@Table(name = "student")
@Data
@JsonIgnoreProperties(ignoreUnknown = true, value = { "hibernateLazyInitializer", "handler", "fieldHandler" })
public class Student {
    @Id
    @Column(name = "student_id")
    private String studentId;
    @Column(name = "student_name")
    private String studentName;

    @OneToOne(targetEntity = CourseStructure.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "major_department_id", referencedColumnName = "course_structure_id")
    private CourseStructure majorDepartment;

    @OneToOne(targetEntity = CourseStructure.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "auxiliary_department_id", referencedColumnName = "course_structure_id", nullable = true)
    private CourseStructure auxiliaryDepartment;

    @OneToOne(targetEntity = CourseStructure.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "double_major_department_id", referencedColumnName = "course_structure_id", nullable = true)
    private CourseStructure doubleMajorDepartment;

    @OneToOne(targetEntity = CourseStructure.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "teach_class_id", referencedColumnName = "course_structure_id", nullable = true)
    private ClassModule teachClass;

    @OneToOne(targetEntity = Version.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "official_review_version_id", referencedColumnName = "version_id", nullable = true)
    private Version version;

    @OneToMany(targetEntity = CourseData.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "student_id", referencedColumnName = "student_id")
    private List<CourseData> courseDatas;
    @Transient
    private List<CourseData> fails = new ArrayList<>();
    @Transient
    private List<CourseData> onGoings = new ArrayList<>();

    // 把修課資料分成 1.通過 2.不通過 3.正在修
    public void init() {
        Iterator<CourseData> data = courseDatas.iterator();
        while (data.hasNext()) {
            CourseData courseData = data.next();
            switch (courseData.getStatus()) {
                case 2:
                    fails.add(courseData);
                    data.remove();
                    break;
                case 3:
                    onGoings.add(courseData);
                    data.remove();
                    ;
                    break;
            }
        }
    }

    // 把courseData移出
    public void moveOut(CourseData courseData) {
        Iterator<CourseData> iterator;
        if (courseData.getStatus() == 1) {
            iterator = courseDatas.iterator();
        } else {
            iterator = onGoings.iterator();
        }
        while (iterator.hasNext()) {
            CourseData temp = iterator.next();
            if (temp.getCourseDataId() == courseData.getCourseDataId()) {
                iterator.remove();
                System.out.println("Student's courseDate: " + courseData.getSubject().getCname() + " move out");
                break;
            }
        }
    }

    // 把courseData移入
    public void moveIn(CourseData courseData) {
        if (this.courseDatas == null) {
            this.courseDatas = new ArrayList<>();

        }
        if (courseData.getStatus() == 1) {
            courseDatas.add(courseData);
            System.out.println(courseData.getSubject().getCname() + " move in Student's courseDates");
        } else {
            onGoings.add(courseData);
            System.out.println(courseData.getSubject().getCname() + " move in Student's onGoings");
        }

    }

    public ArrayList<CourseData> courseDataClone() throws CloneNotSupportedException {
        ArrayList<CourseData> copyCourseDatas = new ArrayList<>();
        for (CourseData courseData : courseDatas) {
            copyCourseDatas.add((CourseData) courseData.clone());
        }
        return copyCourseDatas;
    }

}
