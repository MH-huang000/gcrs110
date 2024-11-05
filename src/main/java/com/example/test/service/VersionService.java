package com.example.test.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test.dao.VersionDao;
import com.example.test.entity.CourseData;
import com.example.test.entity.CourseModule;
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

    // 當前版本資訊
    public List<String> getVersionInfo(String studentId) {
        Version version = versions.get(studentId);
        List<String> courseStructureNames = new ArrayList<>();
        courseStructureNames.add("主修: " + version.getMajorDepartment().getCourseStructureName());
        if (version.getAuxiliaryDepartment() != null) {
            courseStructureNames.add("輔系: " + version.getAuxiliaryDepartment().getCourseStructureName());
        } else {
            courseStructureNames.add("輔系: ");
        }
        if (version.getDoubleMajorDepartment() != null) {
            courseStructureNames.add("雙主修: " + version.getDoubleMajorDepartment().getCourseStructureName());
        } else {
            courseStructureNames.add("雙主修: ");
        }
        if (version.getTeachClass() != null) {
            courseStructureNames.add("教程: " + version.getTeachClass().getCourseStructureName());
        } else {
            courseStructureNames.add("教程: ");
        }
        return courseStructureNames;
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
    public List<Version> getVersions(String studentId) {
        List<Version> versions = versionDao.findByStudent_StudentId(studentId);
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

    // 獲得某學生所有版本名稱
    public List<String> getVersionNames(String studentId) {
        List<Version> versions = versionDao.findByStudent_StudentId(studentId);
        // 把版本補到三個
        List<String> names = new ArrayList<>();
        for (Version version : versions) {
            names.add(version.getVersionName());
        }
        return names;
    }

    // 創造新版本
    public void createVersion(String studentId, String name, CourseStructure majorDepartment,
            CourseStructure auxiliaryDepartment, CourseStructure doubleMajorDepartment, CourseStructure teachClass,
            CourseStructure general) {
        List<Version> versions = versionDao.findByStudent_StudentId(studentId);
        if (versions.size() < 3) {
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
            System.out.println("create new version:" + version.getVersionName() + "by user:" + studentId);
        } else {
            System.out.println("version is full by user:" + studentId);
        }
    }

    // 更新版本
    public void updateVersion(String studentId, String name, CourseStructure majorDepartment,
            CourseStructure auxiliaryDepartment, CourseStructure doubleMajorDepartment, CourseStructure teachClass) {
        System.out.println("Execute update version by user:" + studentId);
        Version version = versions.get(studentId);
        version.setVersionName(name);
        if (version.getMajorDepartment().getCourseStructureId() != majorDepartment.getCourseStructureId()) {
            reset(studentId, version.getMajorDepartment().getCourseStructureId());
            version.setMajorDepartment(majorDepartment);
        }
        // 無無 =>nothing
        // 有無 =>呼叫reset set課架=null
        // 無有 =>set課架
        // 有有 =>確認課架 不一樣>呼叫reset set課架
        if (version.getAuxiliaryDepartment() == null && auxiliaryDepartment == null) {
        } else if (version.getAuxiliaryDepartment() != null && auxiliaryDepartment == null) {
            reset(studentId, version.getAuxiliaryDepartment().getCourseStructureId());
            version.setAuxiliaryDepartment(null);
        } else if (version.getAuxiliaryDepartment() == null && auxiliaryDepartment != null) {
            version.setAuxiliaryDepartment(auxiliaryDepartment);
        } else if (version.getAuxiliaryDepartment().getCourseStructureId() != auxiliaryDepartment
                .getCourseStructureId()) {
            reset(studentId, version.getAuxiliaryDepartment().getCourseStructureId());
            version.setAuxiliaryDepartment(auxiliaryDepartment);
        }
        if (version.getDoubleMajorDepartment() == null && doubleMajorDepartment == null) {
        } else if (version.getDoubleMajorDepartment() != null && doubleMajorDepartment == null) {
            reset(studentId, version.getDoubleMajorDepartment().getCourseStructureId());
            version.setDoubleMajorDepartment(null);
        } else if (version.getDoubleMajorDepartment() == null && doubleMajorDepartment != null) {
            version.setDoubleMajorDepartment(doubleMajorDepartment);
        } else if (version.getDoubleMajorDepartment().getCourseStructureId() != doubleMajorDepartment
                .getCourseStructureId()) {
            reset(studentId, version.getDoubleMajorDepartment().getCourseStructureId());
            version.setDoubleMajorDepartment(doubleMajorDepartment);
        }
        if (version.getTeachClass() == null && teachClass == null) {
        } else if (version.getTeachClass() != null && teachClass == null) {
            reset(studentId, version.getTeachClass().getCourseStructureId());
            version.setTeachClass(null);
        } else if (version.getTeachClass() == null && teachClass != null) {
            version.setTeachClass(teachClass);
        } else if (version.getTeachClass().getCourseStructureId() != teachClass.getCourseStructureId()) {
            reset(studentId, version.getTeachClass().getCourseStructureId());
            version.setTeachClass(teachClass);
        }
        System.out.println(" Finsh update version:" + name + "by user:" + studentId);
        save(studentId);
    }

    // 刪除版本
    public String deleteVersion(String studentId) {
        Version version = versions.get(studentId);
        System.out.println("Execute delete version:" + version.getVersionName() + "by user:" + studentId);
        versionDao.deleteById(version.getVersionId());
        System.out.println("Finsh delete version");
        return version.getVersionName();

    }

    // 判斷是否能移入課架
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
            moveIn(studentId, sgdc);
        }
        return canMove;
    }

    // 移入
    public void moveIn(String studentId, Sgdc sgdc) {
        Version version = versions.get(studentId);
        System.out.println("Execution move in");
        version.moveIn(sgdc);
    }

    // 移出
    public void moveOut(String studentId, CourseData courseData) {
        Version version = versions.get(studentId);
        System.out.println("Execution move out");
        version.moveOut(courseData);
    }

    // 自動放入
    public void autoFill(String studentId) throws CloneNotSupportedException {
        Version version = versions.get(studentId);
        ArrayList<CourseData> copyCourseDatas = version.getStudent().courseDataClone();
        for (CourseData courseData : copyCourseDatas) {
            HashMap<String, String> temp = new HashMap<>();
            if (!version.getMajorDepartment().isPass()) {
                temp = autoCheck(version.getMajorDepartment(), courseData);
            }
            if (version.getAuxiliaryDepartment() != null) {
                if (!version.getAuxiliaryDepartment().isPass() && temp.get("canMove").equals("false")) {
                    temp = autoCheck(version.getAuxiliaryDepartment(), courseData);
                }
            }
            if (version.getDoubleMajorDepartment() != null) {
                if (!version.getDoubleMajorDepartment().isPass() && temp.get("canMove").equals("false")) {
                    temp = autoCheck(version.getDoubleMajorDepartment(), courseData);
                }
            }
            if (version.getTeachClass() != null) {
                if (!version.getTeachClass().isPass() && temp.get("canMove").equals("false")) {
                    temp = autoCheck(version.getTeachClass(), courseData);
                }
            }
            if (!version.getGeneral().isPass() && temp.get("canMove").equals("false")) {
                temp = autoCheck(version.getGeneral(), courseData);
            }
            if (temp.get("canMove").equals("true")) {
                Sgdc sgdc = new Sgdc();
                sgdc.setCourseData(courseData);
                sgdc.setCourseStructureId(Integer.parseInt(temp.get("courseStructureId")));
                sgdc.setClassModuleId(Integer.parseInt(temp.get("classModuleId")));
                sgdc.setCoursePackageId(Integer.parseInt(temp.get("coursePackageId")));
                sgdc.setCourseModuleId(temp.get("courseModuleId"));
                moveIn(studentId, sgdc);
            }
        }
    }

    public HashMap<String, String> autoCheck(CourseStructure courseStructure, CourseData courseData) {
        HashMap<String, String> temp = new HashMap<>();
        temp = courseStructure.auto(courseData.getSubject());
        if (temp.get("canMove").equals("true")) {
            System.out.println("find canMove in " + courseStructure.getCourseStructureName());
            temp.put("courseStructureId", Integer.toString(courseStructure.getCourseStructureId()));
        }
        return temp;
    }

    // 重設
    public void reset(String studentId, int courseStructureId) {
        System.out.println("執行重設課架:");
        Version version = versions.get(studentId);
        for (Sgdc sgdc : version.getSgdcs()) {
            if (sgdc.getCourseStructureId() == courseStructureId) {
                version.moveOut(sgdc.getCourseData());
            }
        }
        System.out.println("重設結束");
    }

    // 保存
    public void save(String studentId) {
        Version version = versions.get(studentId);
        System.out.println("執行保存:" + version.getVersionName());
        versionDao.save(version);
        setVersion(studentId, version.getVersionId());
        System.out.println("保存執行");
    }

    // 查詢修課資訊
    public Set<CourseData> search(String studentId, String keyword) {
        keyword = keyword.toUpperCase();
        keyword = keyword.trim();
        Version temp = versions.get(studentId);
        Set<CourseData> courseDatas = new HashSet<>();
        if (keyword.length() == 0) {
            System.out.println("keyword is null");
            return courseDatas;
        }
        for (CourseData courseData : temp.getStudent().getCourseDatas()) {
            Subject subject = courseData.getSubject();
            if (subject.getSubjectCode().contains(keyword)) {
                courseDatas.add(courseData);
            } else if (subject.getCname().contains(keyword)) {
                courseDatas.add(courseData);
            } else if (subject.getEname().contains(keyword)) {
                courseDatas.add(courseData);
            } else {
                for (CourseModule courseModule : subject.getCourseModules()) {
                    if (courseModule.getModuleName().contains(keyword)) {
                        courseDatas.add(courseData);
                        break;
                    }
                }
            }
        }
        return courseDatas;
    }

    // 用來更新左畫面
    public CourseStructure getLeftPanelInfo(String studentId, int courseStructureId) {
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

    // 用來更新TotalView畫面
    public List<CourseStructure> getTotalViewInfo(String studentId) {
        List<CourseStructure> courseStructures = new ArrayList<>();
        Version version = versions.get(studentId);
        courseStructures.add(version.getGeneral());
        courseStructures.add(version.getMajorDepartment());
        if (version.getAuxiliaryDepartment() != null) {
            courseStructures.add(version.getAuxiliaryDepartment());
        }
        if (version.getDoubleMajorDepartment() != null) {
            courseStructures.add(version.getDoubleMajorDepartment());
        }
        if (version.getTeachClass() != null) {
            courseStructures.add(version.getTeachClass());
        }
        return courseStructures;
    }

    // 登出
    public void logout(String studentId) {
        versions.remove(studentId);
        System.out.println("user ID: " + studentId + " logout");
    }

}