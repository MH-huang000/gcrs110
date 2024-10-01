package com.example.test.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.test.entity.CourseData;

@Repository
public interface CourseDataDao extends JpaRepository<CourseData, Integer> {

}
