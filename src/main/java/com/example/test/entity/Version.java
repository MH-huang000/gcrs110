package com.example.test.entity;

import java.util.Iterator;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "version")
@Data
@JsonIgnoreProperties(ignoreUnknown = true, value = { "hibernateLazyInitializer", "handler", "fieldHandler" })
public class Version {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "version_id")
    private int versionId;
    @Column(name = "version_name", nullable = true)
    private String versionName;

    @ManyToOne(targetEntity = Student.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "student_id", referencedColumnName = "student_id")
    private Student student;

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
    @JoinColumn(name = "general_id", referencedColumnName = "course_structure_id")
    private CourseStructure general;

    @OneToOne(targetEntity = CourseStructure.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "teach_class_id", referencedColumnName = "course_structure_id", nullable = true)
    private CourseStructure teachClass;

    @Column(name = "classes_taken_credit", nullable = true)
    private List<String> classesTakenCredit;
    @Column(name = "classes_passed", nullable = true)
    private List<Integer> classesPassed;
    @Column(name = "total_credit")
    private int totalCredit;
    @Column(name = "department_passed")
    private Boolean departmentPassed;
    @Column(name = "department_chair_passed")
    private Boolean departmentChairPassed;
    @Column(name = "general_studies_passed")
    private Boolean generalStudiesPassed;
    @Column(name = "academic_affairs_office_passed")
    private Boolean academicAffairsOfficePassed;
    @Column(name = "remark", nullable = true)
    private String remark;

    @OneToMany(targetEntity = Sgdc.class, fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "version_id", referencedColumnName = "version_id")
    @JsonIgnoreProperties(ignoreUnknown = true, value = "version")
    private List<Sgdc> sgdcs;

    public Version() {
        versionId = 0;
        versionName = "";
        totalCredit = 0;
        departmentPassed = false;
        departmentChairPassed = false;
        generalStudiesPassed = false;
        academicAffairsOfficePassed = false;
    }

    public void init() {
        majorDepartment.init();
        general.init();
        student.init();
        if (auxiliaryDepartment == null) {
            System.out.println("auxiliaryDepartment is null");
        } else {
            auxiliaryDepartment.init();

        }
        if (doubleMajorDepartment == null) {
            System.out.println("doubleMajorDepartment is null");
        } else {
            doubleMajorDepartment.init();

        }
        if (teachClass == null) {
            System.out.println("teachClass is null");
        } else {
            teachClass.init();
        }

        for (Sgdc sgdc : sgdcs) {
            if (sgdc.getType() != 1) {
                updateCourseStructure(sgdc, 0);
                student.moveOut(sgdc.getCourseData());
            }
            System.out.println("Initialization successful");
        }
    }

    public int updateCourseStructure(Sgdc sgdc, int type) {
        CourseModuleID id = new CourseModuleID();
        id.setCoursePackageId(sgdc.getCoursePackageId());
        id.setCourseModuleId(sgdc.getCourseModuleId());
        CourseData courseData = sgdc.getCourseData();
        int courseStructuretype = 999;
        if (sgdc.getCourseStructureId() == majorDepartment.getCourseStructureId()) {
            majorDepartment.updateCourseData(sgdc.getClassModuleId(), id, courseData, type);
            courseStructuretype = 1;
        } else if (auxiliaryDepartment != null) {
            if (sgdc.getCourseStructureId() == auxiliaryDepartment.getCourseStructureId()) {
                auxiliaryDepartment.updateCourseData(sgdc.getClassModuleId(), id, courseData, type);
                courseStructuretype = 2;
            }
        } else if (doubleMajorDepartment != null) {
            if (sgdc.getCourseStructureId() == doubleMajorDepartment.getCourseStructureId()) {
                doubleMajorDepartment.updateCourseData(sgdc.getClassModuleId(), id, courseData, type);
                courseStructuretype = 3;
            }
        } else if (teachClass != null) {
            if (sgdc.getCourseStructureId() == teachClass.getCourseStructureId()) {
                teachClass.updateCourseData(sgdc.getClassModuleId(), id, courseData, type);
                courseStructuretype = 4;
            }
        } else if (sgdc.getCourseStructureId() == general.getCourseStructureId()) {
            general.updateCourseData(sgdc.getClassModuleId(), id, courseData, type);
            courseStructuretype = 5;
        }
        return courseStructuretype;
    }

    // 科目移入課架 courseStructuretype跳網頁用的
    public int moveIn(Sgdc sgdc) {
        int courseStructuretype = updateCourseStructure(sgdc, 0);
        student.moveOut(sgdc.getCourseData());
        sgdc.setVersionId(versionId);
        Iterator<Sgdc> iterator = sgdcs.iterator();
        while (iterator.hasNext()) {
            Sgdc temp = iterator.next();
            if (temp.getCourseData().equals(sgdc.getCourseData())) {
                sgdc.setType(0);
                sgdc.setSgdcId(temp.getSgdcId());
                sgdcs.remove(temp);
                break;
            }
        }
        sgdcs.add(sgdc);
        System.out.println("move in finish");
        return courseStructuretype;
    }

    // 科目移出課架
    public int moveOut(CourseData courseData) {
        Sgdc oldSgdc = new Sgdc();

        for (Sgdc sgdc : sgdcs) {
            if (sgdc.getCourseData().getCourseDataId() == courseData.getCourseDataId()) {
                oldSgdc = sgdc;
                sgdc.setType(1);
                break;
            }
        }
        int courseStructuretype = updateCourseStructure(oldSgdc, 1);
        student.moveIn(courseData);
        System.out.println("move out finish");
        return courseStructuretype;
    }

}