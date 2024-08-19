package com.example.test.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.test.entity.CourseModule;
import com.example.test.entity.CourseModuleID;

@Repository
public interface CourseModuleDao extends JpaRepository<CourseModule, CourseModuleID> {

}
