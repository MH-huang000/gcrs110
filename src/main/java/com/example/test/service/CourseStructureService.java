package com.example.test.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test.dao.CourseStructureDao;
import com.example.test.entity.CourseStructure;

@Service
public class CourseStructureService {

    @Autowired
    private CourseStructureDao courseStructureDao;

    // 0.通識 1.主修 2.輔修 3.雙主修 4.教育學程
    public List<CourseStructure> getCourseStructures(int year, int type) {
        List<CourseStructure> courseStructures = courseStructureDao.findByAcademicYearAndType(year, type);

        for (CourseStructure courseStructure : courseStructures) {
            String name = courseStructure.getDepartment().getDepartmentId()
                    + courseStructure.getCourseStructureName().substring(0, 3);
            courseStructure.setCourseStructureName(name);
        }
        return courseStructures;
    }

    public CourseStructure getCourseStructureId(int year, int type) {
        List<CourseStructure> courseStructures = courseStructureDao.findByAcademicYearAndType(year, type);
        return courseStructures.get(0);
    }

    public CourseStructure getCourseStructureById(int courseStructureId) {
        return courseStructureDao.findById(courseStructureId).orElse(null);
    }
}
