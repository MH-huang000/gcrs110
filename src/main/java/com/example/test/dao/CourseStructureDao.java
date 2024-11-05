package com.example.test.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.test.entity.CourseStructure;
import com.example.test.entity.Department;

@Repository
public interface CourseStructureDao extends JpaRepository<CourseStructure, Integer> {
    public List<CourseStructure> findByAcademicYearAndType(int academicYear, int type);

    public CourseStructure findByAcademicYearAndTypeAndDepartment(int academicYear, int type, Department department);
}
