package com.example.test.controller;

import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;

import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.test.entity.CourseData;
import com.example.test.entity.Sgdc;

import com.example.test.service.CourseDataService;
import com.example.test.service.StudentService;
import com.example.test.service.VersionService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.ExampleObject;
import org.springframework.web.bind.annotation.PostMapping;

@RestController
@RequestMapping("/versions")
public class VersionController2 {
    // @Autowired注入以創建的Bean
    @Autowired
    VersionService versionService;
    @Autowired
    StudentService studentService;
    @Autowired
    CourseDataService courseDataService;

    @PutMapping("/canMove")
    @Operation(summary = "判斷能否移入到課架中")
    public boolean canMove(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(content = @Content(examples = @ExampleObject("{'courseStructureId': '3', 'classModuleId': '5', 'coursePackageId' : '11', 'courseModuleId': 'A'}"))) @RequestBody Map<String, String> data) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        CourseData courseData = courseDataService.getCourseData(Integer.parseInt(data.get("courseDataId")));
        Sgdc sgdc = new Sgdc();
        sgdc.setCourseData(courseData);
        sgdc.setCourseStructureId(Integer.parseInt(data.get("courseStructureId")));
        sgdc.setClassModuleId(Integer.parseInt(data.get("classModuleId")));
        sgdc.setCoursePackageId(Integer.parseInt(data.get("coursePackageId")));
        sgdc.setCourseModuleId(data.get("courseModuleId"));
        return versionService.canMove(studentId, sgdc);
    }

    @PutMapping("/moveOut")
    @Operation(summary = "從課架中移出課程")
    public String moveOut(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(content = @Content(examples = @ExampleObject("{'courseStructureId': '3', 'coursePackageId' : '11', 'courseModuleId': 'A'}"))) @RequestBody Map<String, String> data) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        CourseData courseData = courseDataService.getCourseData(Integer.parseInt(data.get("courseDataId")));
        versionService.moveOut(studentId, courseData);
        return "moveOut";
    }

    @DeleteMapping("/delete")
    @Operation(summary = "刪除版本")
    public String deleteVersion() {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        String versionName = versionService.deleteVersion(studentId);
        return "刪除版本:" + versionName;
    }

    @PostMapping("/submit")
    @Operation(summary = "設定該版本為最後審查版本")
    public String submitVersion() {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        studentService.setStudentFinalVersion(studentId, versionService.getVersion(studentId));
        return "提交進行中";
    }

    @GetMapping("/reset")
    @Operation(summary = "重設某課架中以放入課程")
    public String reset(@RequestParam() int courseStructureId) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        versionService.reset(studentId, courseStructureId);
        return "重設結束";
    }

    @GetMapping("/autofill")
    @Operation(summary = "自動把課程放入課架")
    public String autoFill() throws CloneNotSupportedException {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        versionService.autoFill(studentId);
        return "自動放入結束";
    }

    @PutMapping("/save")
    @Operation(summary = "儲存版本紀錄")
    public String save() {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        versionService.save(studentId);
        return "保存結束";
    }
}