package com.example.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test.dao.CourseDataDao;
import com.example.test.entity.CourseData;

@Service
public class CourseDataService {
    @Autowired
    private CourseDataDao courseDataDao;

    public CourseData getCourseData(int id) {
        return courseDataDao.findById(id).orElse(null);
    }
}
