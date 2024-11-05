package com.example.test.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.test.entity.CourseStructure;
import com.example.test.entity.Student;
import java.util.List;

@Repository
public interface StudentDao extends JpaRepository<Student, String> {
    List<Student> findByStudentIdLikeOrderByStudentId(String keyword);

    List<Student> findByMajorDepartmentIn(List<CourseStructure> majorDepartment);

    List<Student> findByDoubleMajorDepartmentIn(List<CourseStructure> doubleMajorDepartment);

    List<Student> findByAuxiliaryDepartmentIn(List<CourseStructure> auxiliaryDepartment);

    List<Student> findByTeachClassIn(List<CourseStructure> teachClass);
}
