package com.example.test.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.test.entity.Student;

@Repository
public interface StudentDao extends JpaRepository<Student, String> {

}
