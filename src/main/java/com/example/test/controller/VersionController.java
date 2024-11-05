package com.example.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.example.test.entity.CourseStructure;
import com.example.test.entity.Student;
import com.example.test.entity.Version;

import com.example.test.service.CourseStructureService;
import com.example.test.service.StudentService;
import com.example.test.service.VersionService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;

@Controller
@RequestMapping("/versions")
public class VersionController {
    @Autowired
    private VersionService versionService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private CourseStructureService courseStructureService;

    @GetMapping("")
    @Operation(summary = "查某學生所有版本")
    @ApiResponse(responseCode = "200", description = "成功返回選擇版本畫面")
    public String getVersions(Model model) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        System.out.println("get versions by " + studentId);
        List<Version> versions = versionService.getVersions(studentId);
        Student student = studentService.getStudent(studentId);
        model.addAttribute("studentId", student.getStudentId());
        model.addAttribute("studentName", student.getStudentName());
        model.addAttribute("versions", versions);
        return "student/chooseVersion";
    }

    @GetMapping("/choose/{versionId}")
    @Operation(summary = "設定選擇版本")
    @ApiResponse(responseCode = "200", description = "導向總攬畫面")
    public RedirectView chooseVresion(Model model, @PathVariable Integer versionId) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        versionService.setVersion(studentId, versionId);
        String url = "http://localhost:8080/versions/totalView";
        RedirectView redirectView = new RedirectView(url);
        return redirectView;
    }

    @GetMapping("/totalView")
    @Operation(summary = "版本總攬")
    @ApiResponse(responseCode = "200", description = "成功返回總攬畫面")
    public String getTotalView(Model model) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        Version version = versionService.getVersion(studentId);
        model.addAttribute("student", version.getStudent());
        model.addAttribute("courseStructureNames", versionService.getVersionInfo(studentId));
        model.addAttribute("aisle", versionService.getAisle(studentId));
        model.addAttribute("versionNames", versionService.getVersionNames(studentId));
        model.addAttribute("courseStructures", versionService.getTotalViewInfo(studentId));
        return "student/totalView";
    }

    @GetMapping("/majorDepartment")
    @Operation(summary = "版本主修")
    @ApiResponse(responseCode = "200", description = "成功返回主修畫面")
    public String getMajorDepartment(Model model) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        Version version = versionService.getVersion(studentId);
        model.addAttribute("courseStructure", version.getMajorDepartment());
        model.addAttribute("student", version.getStudent());
        model.addAttribute("courseStructureNames", versionService.getVersionInfo(studentId));
        model.addAttribute("aisle", versionService.getAisle(studentId));
        model.addAttribute("versionNames", versionService.getVersionNames(studentId));
        return "student/chooseClass";

    }

    @GetMapping("/auxiliaryDepartment")
    @Operation(summary = "版本輔系")
    @ApiResponse(responseCode = "200", description = "成功返回輔系畫面")
    public String getAuxiliaryDepartment(Model model) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        Version version = versionService.getVersion(studentId);
        model.addAttribute("courseStructure", version.getAuxiliaryDepartment());
        model.addAttribute("student", version.getStudent());
        model.addAttribute("courseStructureNames", versionService.getVersionInfo(studentId));
        model.addAttribute("aisle", versionService.getAisle(studentId));
        model.addAttribute("versionNames", versionService.getVersionNames(studentId));
        return "student/chooseClass";

    }

    @GetMapping("/doubleMajorDepartment")
    @Operation(summary = "版本雙主修")
    @ApiResponse(responseCode = "200", description = "成功返回雙主修畫面")
    public String getDoubleMajorDepartment(Model model) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        Version version = versionService.getVersion(studentId);
        model.addAttribute("courseStructure", version.getDoubleMajorDepartment());
        model.addAttribute("student", version.getStudent());
        model.addAttribute("courseStructureNames", versionService.getVersionInfo(studentId));
        model.addAttribute("aisle", versionService.getAisle(studentId));
        model.addAttribute("versionNames", versionService.getVersionNames(studentId));
        return "student/chooseClass";

    }

    @GetMapping("/general")
    @Operation(summary = "版本通識")
    @ApiResponse(responseCode = "200", description = "成功返回通識畫面")
    public String getGeneral(Model model) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        Version version = versionService.getVersion(studentId);
        model.addAttribute("courseStructure", version.getGeneral());
        model.addAttribute("student", version.getStudent());
        model.addAttribute("courseStructureNames", versionService.getVersionInfo(studentId));
        model.addAttribute("aisle", versionService.getAisle(studentId));
        model.addAttribute("versionNames", versionService.getVersionNames(studentId));
        return "student/chooseClass";

    }

    @GetMapping("/teachClass")
    @Operation(summary = "版本教程")
    @ApiResponse(responseCode = "200", description = "成功返回教程畫面")
    public String getTeachClass(Model model) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        Version version = versionService.getVersion(studentId);
        model.addAttribute("courseStructure", version.getTeachClass());
        model.addAttribute("student", version.getStudent());
        model.addAttribute("courseStructureNames", versionService.getVersionInfo(studentId));
        model.addAttribute("aisle", versionService.getAisle(studentId));
        model.addAttribute("versionNames", versionService.getVersionNames(studentId));
        return "student/chooseClass";

    }

    @GetMapping("/choose/0")
    @Operation(summary = "填創建新版本資訊")
    @ApiResponse(responseCode = "200", description = "成功返回創建新版本畫面")
    public String createVersion(Model model) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        int year = studentService.getStudentYear(studentId);
        model.addAttribute("majorDepartments", courseStructureService.getCourseStructures(year, 1));
        model.addAttribute("auxiliaryDepartments", courseStructureService.getCourseStructures(year, 2));
        model.addAttribute("doubleMajorDepartments", courseStructureService.getCourseStructures(year, 3));
        return "student/new-version";
    }

    @PostMapping("/create")
    @Operation(summary = "創建新版本到資料庫")
    @ApiResponse(responseCode = "200", description = "成功後，導向選擇版本畫面")
    public RedirectView createVersion(@RequestParam String name, int majorDepartmentId, int auxiliaryDepartmentId,
            int doubleMajorDepartmentId, int teachClassId) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        int year = studentService.getStudentYear(studentId);
        CourseStructure majorDepartment = courseStructureService.getCourseStructure(year, majorDepartmentId,
                teachClassId);
        CourseStructure auxiliaryDepartment = courseStructureService.getCourseStructureById(auxiliaryDepartmentId);
        CourseStructure doubleMajorDepartment = courseStructureService.getCourseStructureById(doubleMajorDepartmentId);
        CourseStructure teachClass = null;
        if (teachClassId == 1) {
            teachClass = courseStructureService.getCourseStructure(year, 4);
        }
        CourseStructure general = courseStructureService.getCourseStructure(year, 0);

        versionService.createVersion(studentId, name, majorDepartment, auxiliaryDepartment, doubleMajorDepartment,
                teachClass, general);
        // 重新導向
        String url = "http://localhost:8080/versions";
        RedirectView redirectView = new RedirectView(url);
        return redirectView;
    }

    @GetMapping("/update")
    @Operation(summary = "填更新版本資訊")
    @ApiResponse(responseCode = "200", description = "成功返回更新版本畫面")
    public String updateVersion(Model model) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        int year = studentService.getStudentYear(studentId);
        Version version = versionService.getVersion(studentId);
        model.addAttribute("versionName", version.getVersionName());
        model.addAttribute("majorDepartments", courseStructureService.getCourseStructures(year, 1));
        model.addAttribute("auxiliaryDepartments", courseStructureService.getCourseStructures(year, 2));
        model.addAttribute("doubleMajorDepartments", courseStructureService.getCourseStructures(year, 3));
        model.addAttribute("teachClass", courseStructureService.getCourseStructures(year, 4));
        return "student/update-version";
    }

    @PostMapping("/update")
    @Operation(summary = "更新資料庫版本資訊")
    @ApiResponse(responseCode = "200", description = "成功後，導向選擇版本畫面")
    public RedirectView updateVersion(@RequestParam String name, int majorDepartmentId, int auxiliaryDepartmentId,
            int doubleMajorDepartmentId, int teachClassId) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        int year = studentService.getStudentYear(studentId);
        CourseStructure majorDepartment = courseStructureService.getCourseStructure(year, majorDepartmentId,
                teachClassId);
        CourseStructure auxiliaryDepartment = courseStructureService.getCourseStructureById(auxiliaryDepartmentId);
        CourseStructure doubleMajorDepartment = courseStructureService.getCourseStructureById(doubleMajorDepartmentId);
        CourseStructure teachClass = null;
        if (teachClassId == 1) {
            teachClass = courseStructureService.getCourseStructure(year, 4);
        }

        versionService.updateVersion(studentId, name, majorDepartment, auxiliaryDepartment, doubleMajorDepartment,
                teachClass);
        // 重新導向
        String url = "http://localhost:8080/versions";
        RedirectView redirectView = new RedirectView(url);
        return redirectView;
    }

    @GetMapping("/leftPlane")
    @Operation(summary = "更新左畫面(課架模組)")
    @ApiResponse(responseCode = "200", description = "成功返回更新畫面")
    public String updateLeft(Model model, @RequestParam int courseStructureId) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        model.addAttribute("courseStructure", versionService.getLeftPanelInfo(studentId, courseStructureId));
        // html名稱::片段名稱
        return "student/left-panel :: left-panel";
    }

    @GetMapping("/rightPlane")
    @Operation(summary = "更新右畫面(學生已修課程)")
    @ApiResponse(responseCode = "200", description = "成功返回更新畫面")
    public String updateRight(Model model) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        Version version = versionService.getVersion(studentId);
        model.addAttribute("student", version.getStudent());
        return "student/right-panel :: right-panel";
    }

    @GetMapping("/search")
    @Operation(summary = "查詢已修課程")
    @ApiResponse(responseCode = "200", description = "成功返回搜尋結果")
    public String search(Model model, @RequestParam String keyword) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        model.addAttribute("courseDatas", versionService.search(studentId, keyword));
        return "student/search :: search";
    }

    @GetMapping("logout")
    @Operation(summary = "登出")
    @ApiResponse(responseCode = "200", description = "成功後，導向登入畫面")
    public void logout() {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        versionService.logout(studentId);
    }
}
