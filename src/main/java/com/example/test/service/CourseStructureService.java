package com.example.test.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test.dao.CourseStructureDao;
import com.example.test.entity.CourseStructure;
import com.example.test.entity.Department;

@Service
public class CourseStructureService {

    @Autowired
    private CourseStructureDao courseStructureDao;

    // 0.通識 1.主修 2.輔修 3.雙主修 4.教育學程 5.系教程
    public List<CourseStructure> getCourseStructures(int year, int type) {
        List<CourseStructure> courseStructures = courseStructureDao.findByAcademicYearAndType(year, type);

        for (CourseStructure courseStructure : courseStructures) {
            String name = courseStructure.getDepartment().getDepartmentId()
                    + courseStructure.getCourseStructureName().substring(0, 3);
            courseStructure.setCourseStructureName(name);
        }
        return courseStructures;
    }

    // 通識跟教程
    public CourseStructure getCourseStructure(int year, int type) {
        List<CourseStructure> courseStructures = courseStructureDao.findByAcademicYearAndType(year, type);
        return courseStructures.get(0);
    }

    // 主修有分有沒有教程 0通識 1主修 2輔系 3雙主修 4 教程 5系教程
    public CourseStructure getCourseStructure(int year, int majorDepartmentId, int teachClassId) {
        CourseStructure courseStructure = courseStructureDao.findById(majorDepartmentId).orElse(null);
        if (teachClassId == 1) {
            Department department = new Department();
            department.setDepartmentId(courseStructure.getDepartment().getDepartmentId());
            CourseStructure temp = courseStructureDao.findByAcademicYearAndTypeAndDepartment(year, 5, department);
            return temp;
        }
        return courseStructure;
    }

    public CourseStructure getCourseStructureById(int courseStructureId) {
        return courseStructureDao.findById(courseStructureId).orElse(null);
    }

}
