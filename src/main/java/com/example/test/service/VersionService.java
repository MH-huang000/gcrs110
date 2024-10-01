package com.example.test.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test.dao.VersionDao;
import com.example.test.entity.CourseData;
import com.example.test.entity.CourseModuleID;
import com.example.test.entity.CourseStructure;
import com.example.test.entity.Sgdc;
import com.example.test.entity.Student;
import com.example.test.entity.Subject;
import com.example.test.entity.Version;

@Service
public class VersionService {
    @Autowired
    private VersionDao versionDao;

    private Map<String, Version> versions = new HashMap<>();

    // 從資料庫放到伺服器
    public void setVersion(String studentId, int versionId) {
        Version version = versionDao.findById(versionId).orElse(null);
        version.init();
        versions.put(studentId, version);
    }

    // 拿版本
    public Version getVersion(String studentId) {
        Version version = versions.get(studentId);
        return version;
    }

    // 該版本是否有輔系、雙主修或教程
    public List<Boolean> getAisle(String studentId) {
        List<Boolean> temp = new ArrayList<>();
        Version version = versions.get(studentId);
        if (version.getAuxiliaryDepartment() != null) {
            temp.add(true);
        } else {
            temp.add(false);
        }
        if (version.getDoubleMajorDepartment() != null) {
            temp.add(true);
        } else {
            temp.add(false);
        }
        if (version.getTeachClass() != null) {
            temp.add(true);
        } else {
            temp.add(false);
        }
        return temp;
    }

    // 獲得某學生所有版本
    public List<Version> getVersions(String StudentID) {
        List<Version> versions = versionDao.findByStudent_StudentId(StudentID);
        // 把版本補到三個
        for (int i = versions.size(); i < 3; i++) {
            Version version = new Version();
            version.setVersionId(0);
            String name = "New Version";
            version.setVersionName(name);
            versions.add(version);
        }
        return versions;
    }

    // 創造新版本
    public void createVersion(String studentId, String name, CourseStructure majorDepartment,
            CourseStructure auxiliaryDepartment,
            CourseStructure doubleMajorDepartment, CourseStructure teachClass, CourseStructure general) {
        Student student = new Student();
        Version version = new Version();
        student.setStudentId(studentId);
        version.setStudent(student);
        version.setVersionName(name);
        version.setMajorDepartment(majorDepartment);
        version.setAuxiliaryDepartment(auxiliaryDepartment);
        version.setDoubleMajorDepartment(doubleMajorDepartment);
        version.setTeachClass(teachClass);
        version.setGeneral(general);
        versionDao.save(version);
        System.out.println(version);
    }

    // 判斷是否移動
    public boolean canMove(String studentId, Sgdc sgdc) {
        Version version = versions.get(studentId);
        CourseModuleID id = new CourseModuleID();
        id.setCoursePackageId(sgdc.getCoursePackageId());
        id.setCourseModuleId(sgdc.getCourseModuleId());
        Subject subject = sgdc.getCourseData().getSubject();
        boolean canMove = false;
        if (sgdc.getCourseStructureId() == version.getMajorDepartment().getCourseStructureId()) {
            canMove = version.getMajorDepartment().canMove(sgdc.getClassModuleId(), id, subject);
        } else if (sgdc.getCourseStructureId() == version.getGeneral().getCourseStructureId()) {
            canMove = version.getGeneral().canMove(sgdc.getClassModuleId(), id, subject);
        } else if (version.getAuxiliaryDepartment() != null) {
            if (sgdc.getCourseStructureId() == version.getAuxiliaryDepartment().getCourseStructureId()) {
                canMove = version.getAuxiliaryDepartment().canMove(sgdc.getClassModuleId(), id, subject);
            }
        } else if (version.getDoubleMajorDepartment() != null) {
            if (sgdc.getCourseStructureId() == version.getDoubleMajorDepartment().getCourseStructureId()) {
                canMove = version.getDoubleMajorDepartment().canMove(sgdc.getClassModuleId(), id, subject);
            }
        } else if (version.getTeachClass() != null) {
            if (sgdc.getCourseStructureId() == version.getTeachClass().getCourseStructureId()) {
                canMove = version.getTeachClass().canMove(sgdc.getClassModuleId(), id, subject);
            }
        }
        if (canMove) {
            moveIn(1, studentId, sgdc);
        }
        return canMove;
    }

    // 移入
    public int moveIn(int i, String studentId, Sgdc sgdc) {
        Version version = versions.get(studentId);
        switch (i) {
            case 1: // in 移入課架
                System.out.println("Execution move in");
                return version.moveIn(sgdc);
            default:// 移動放置位置
                version.moveOut(sgdc.getCourseData());
                return version.moveIn(sgdc);
        }
    }

    // 移出
    public void moveOut(String studentId, CourseData courseData) {
        Version version = versions.get(studentId);
        System.out.println("Execution move out");
        version.moveOut(courseData);
    }

    // 保存
    public void save(String studentId) {
        Version version = versions.get(studentId);
        versionDao.save(version);
    }

    // 用來更新左畫面
    public CourseStructure getVersionCourseStructure(String studentId, int courseStructureId) {
        Version version = versions.get(studentId);
        CourseStructure courseStructure = new CourseStructure();
        if (courseStructureId == version.getMajorDepartment().getCourseStructureId()) {
            courseStructure = version.getMajorDepartment();
        } else if (courseStructureId == version.getGeneral().getCourseStructureId()) {
            courseStructure = version.getGeneral();
        } else if (version.getAuxiliaryDepartment() != null) {
            if (courseStructureId == version.getAuxiliaryDepartment().getCourseStructureId()) {
                courseStructure = version.getAuxiliaryDepartment();
            }
        } else if (version.getDoubleMajorDepartment() != null) {
            if (courseStructureId == version.getDoubleMajorDepartment().getCourseStructureId()) {
                courseStructure = version.getDoubleMajorDepartment();
            }
        } else if (version.getTeachClass() != null) {
            if (courseStructureId == version.getTeachClass().getCourseStructureId()) {
                courseStructure = version.getTeachClass();
            }
        }
        return courseStructure;
    }

    // 登出
    public void logout(String studentId) {
        versions.remove(studentId);
    }

}
/*
 * List<Sgdc> temp = version.save();
 * for (Sgdc sgdc : temp) {
 * sgdcDao.deleteSgdcById(sgdc.getSgdcId());
 * if (sgdcDao.existsById(sgdc.getSgdcId())) {
 * System.out.print(sgdc);
 * } else {
 * System.out.print("xxxxx");
 * }
 * }
 */