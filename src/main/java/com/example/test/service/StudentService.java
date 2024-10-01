package com.example.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test.dao.StudentDao;
import com.example.test.entity.Student;

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
}
