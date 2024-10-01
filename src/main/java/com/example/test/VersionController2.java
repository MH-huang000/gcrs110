package com.example.test;

import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.test.entity.CourseData;
import com.example.test.entity.Sgdc;
import com.example.test.entity.Version;
import com.example.test.service.CourseDataService;
import com.example.test.service.StudentService;
import com.example.test.service.VersionService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    // 判斷能否移入到課架中
    @PutMapping("/canMove")
    public boolean move(@RequestBody Map<String, String> data) {
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

    // 移出subject
    @PutMapping("/moveOut")
    public String moveOut(Model model, @RequestBody Map<String, String> data) {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        CourseData courseData = courseDataService.getCourseData(Integer.parseInt(data.get("courseDataId")));
        versionService.moveOut(studentId, courseData);
        Version version = versionService.getVersion(studentId);
        model.addAttribute("student", version.getStudent());
        return "moveOut";
    }

    // 儲存版本紀錄
    @PutMapping("/save")
    public String getMethodName() {
        String studentId = SecurityContextHolder.getContext().getAuthentication().getName();
        versionService.save(studentId);
        return "保存成功";
    }

}
// <tr th:each = "i : ${#numbers.sequence(1,3)}">
// <td></td>
// </tr>