package com.example.test;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.example.test.entity.CourseStructure;
import com.example.test.entity.Student;
import com.example.test.entity.Version;
import com.example.test.service.CourseDataService;
import com.example.test.service.CourseStructureService;
import com.example.test.service.StudentService;
import com.example.test.service.VersionService;
import org.springframework.web.bind.annotation.PutMapping;

@Controller
@RequestMapping("/versions")
public class VersionController {
    @Autowired
    private VersionService versionService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private CourseStructureService courseStructureService;
    @Autowired
    private CourseDataService courseDataService;

    // 查某學生所有版本
    @GetMapping("")
    public String getVersions(Model model) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        System.out.println("get versions by " + studentId);
        List<Version> versions = versionService.getVersions(studentId);
        Student student = studentService.getStudent(studentId);
        model.addAttribute("studentId", student.getStudentId());
        model.addAttribute("studentName", student.getStudentName());
        model.addAttribute("versions", versions);
        return "chooseVersion";
    }

    // 版本總攬
    @GetMapping("/totalView")
    public String getTotalView(Model model) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        List<Boolean> aisle = versionService.getAisle(studentId);
        Version version = versionService.getVersion(studentId);
        model.addAttribute("student", version.getStudent());
        model.addAttribute("aisle", aisle);
        return "totalView";
    }

    // 版本主修
    @GetMapping("/majorDepartment")
    public String getMajorDepartmentById(Model model) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        Version version = versionService.getVersion(studentId);
        List<Boolean> aisle = versionService.getAisle(studentId);
        model.addAttribute("versionId", version.getVersionId());
        model.addAttribute("courseStructure", version.getMajorDepartment());
        model.addAttribute("student", version.getStudent());
        model.addAttribute("aisle", aisle);
        return "chooseClass";

    }

    // 版本輔系
    @GetMapping("/auxiliaryDepartment")
    public String getAuxiliaryDepartmentById(Model model) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        Version version = versionService.getVersion(studentId);
        List<Boolean> aisle = versionService.getAisle(studentId);
        model.addAttribute("versionId", version.getVersionId());
        model.addAttribute("courseStructure", version.getAuxiliaryDepartment());
        model.addAttribute("student", version.getStudent());
        model.addAttribute("aisle", aisle);
        return "chooseClass";

    }

    // 版本雙主修
    @GetMapping("/doubleMajorDepartment")
    public String getDoubleMajorDepartmentById(Model model) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        Version version = versionService.getVersion(studentId);
        List<Boolean> aisle = versionService.getAisle(studentId);
        model.addAttribute("versionId", version.getVersionId());
        model.addAttribute("courseStructure", version.getDoubleMajorDepartment());
        model.addAttribute("student", version.getStudent());
        model.addAttribute("aisle", aisle);
        return "chooseClass";

    }

    // 版本通識
    @GetMapping("/general")
    public String getGeneralById(Model model) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        Version version = versionService.getVersion(studentId);
        List<Boolean> aisle = versionService.getAisle(studentId);
        model.addAttribute("versionId", version.getVersionId());
        model.addAttribute("courseStructure", version.getGeneral());
        model.addAttribute("student", version.getStudent());
        model.addAttribute("aisle", aisle);
        return "chooseClass";

    }

    // 版本教程
    @GetMapping("/teachClass")
    public String getTeachClassById(Model model) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        Version version = versionService.getVersion(studentId);
        List<Boolean> aisle = versionService.getAisle(studentId);
        model.addAttribute("versionId", version.getVersionId());
        model.addAttribute("classModule", version.getTeachClass());
        model.addAttribute("student", version.getStudent());
        model.addAttribute("aisle", aisle);
        return "chooseClass";

    }

    // 設定選擇版本
    @GetMapping("/choose/{versionId}")
    public RedirectView getAll(Model model, @PathVariable Integer versionId) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        versionService.setVersion(studentId, versionId);
        String url = "http://localhost:8080/versions/totalView";
        RedirectView redirectView = new RedirectView(url);
        return redirectView;
    }

    // 創造新版本頁面
    @GetMapping("/choose/0")
    public String newVersion(Model model) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        int year = studentService.getStudentYear(studentId);
        model.addAttribute("majorDepartments", courseStructureService.getCourseStructures(year, 1));
        model.addAttribute("auxiliaryDepartments", courseStructureService.getCourseStructures(year, 2));
        model.addAttribute("doubleMajorDepartments", courseStructureService.getCourseStructures(year, 3));
        model.addAttribute("teachClass", courseStructureService.getCourseStructures(year, 4));
        return "new-version";
    }

    // 創造新版本
    @PostMapping("/create")
    public RedirectView createVersion(@RequestParam String name, int majorDepartmentId, int auxiliaryDepartmentId,
            int doubleMajorDepartmentId, int teachClassId) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        int year = studentService.getStudentYear(studentId);
        CourseStructure majorDepartment = courseStructureService.getCourseStructureById(majorDepartmentId);
        CourseStructure auxiliaryDepartment = courseStructureService.getCourseStructureById(auxiliaryDepartmentId);
        CourseStructure doubleMajorDepartment = courseStructureService.getCourseStructureById(doubleMajorDepartmentId);
        CourseStructure teachClass = courseStructureService.getCourseStructureById(teachClassId);
        CourseStructure general = courseStructureService.getCourseStructureId(year, 0);

        versionService.createVersion(studentId, name, majorDepartment, auxiliaryDepartment, doubleMajorDepartment,
                teachClass, general);
        // 重新導向
        String url = "http://localhost:8080/versions";
        RedirectView redirectView = new RedirectView(url);
        return redirectView;
    }

    // 更新版本設定
    @PutMapping("update")
    public String updateVersion(@PathVariable String versionId, @RequestBody Version version) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        return version.toString();
    }

    // 更新左畫面
    @GetMapping("/leftPlane")
    public String updateLeft(Model model, @RequestParam int courseStructureId) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        model.addAttribute("courseStructure", versionService.getVersionCourseStructure(studentId, courseStructureId));
        return "left-panel :: left-panel";
    }

    // 更新右畫面
    @GetMapping("/rightPlane")
    public String updateRight(Model model) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        Version version = versionService.getVersion(studentId);
        model.addAttribute("student", version.getStudent());
        return "right-panel :: right-panel";
    }

    // 登出
    @GetMapping("logout")
    public void getMethodName() {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        versionService.logout(studentId);
    }
}
