package com.example.test.service;

import java.util.List;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test.dao.StudentDao;
import com.example.test.entity.CourseStructure;
import com.example.test.entity.Student;
import com.example.test.entity.Version;

@Service
public class StudentService {
    @Autowired
    private StudentDao studentDao;

    public Student getStudent(String ID) {
        Student student = studentDao.findById(ID).orElse(new Student());
        return student;
    }

    public int getStudentYear(String studentId) {
        int temp = Integer.parseInt(studentId.substring(3, 6));
        return temp;
    }

    // 獲得學生清單
    public List<Student> getStudents(int type, int year, List<CourseStructure> courseStructures) {
        List<Student> students = new ArrayList<>();
        switch (type) {
            case 0:
                break;
            case 1:
                students = studentDao.findByMajorDepartmentIn(courseStructures);
                break;
            case 2:
                students = studentDao.findByAuxiliaryDepartmentIn(courseStructures);
            case 3:
                students = studentDao.findByDoubleMajorDepartmentIn(courseStructures);
            case 4:
                students = studentDao.findByTeachClassIn(courseStructures);
        }
        return students;
    }

    public void setStudentFinalVersion(String studentId, Version version) {
        Student student = studentDao.findById(studentId).orElse(null);
        if (student == null) {
            System.out.println("no student: " + studentId);
        } else {
            student.setVersion(version);
            studentDao.save(student);
        }
    }

    public Version getStudentFinalVersion(String studentId) {
        Student student = studentDao.findById(studentId).orElse(null);
        if (student == null) {
            System.out.println("no student: " + studentId);
            return null;
        } else {
            return student.getVersion();
        }
    }

}
