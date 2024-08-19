package com.example.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test.dao.CourseStructureDao;
import com.example.test.dao.DepartmentDao;
import com.example.test.entity.CourseStructure;
import com.example.test.entity.Department;

@Service
public class CourseStructureService {

    @Autowired
    private CourseStructureDao courseStructureDao;
    @Autowired
    private DepartmentDao departmentDao;

    public List<CourseStructure> getAll() {
        return courseStructureDao.findAll();
    }

    public List<Department> getAll2() {
        return departmentDao.findAll();
    }

}
