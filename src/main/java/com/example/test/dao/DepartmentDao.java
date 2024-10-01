package com.example.test.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.test.entity.Department;

@Repository
public interface DepartmentDao extends JpaRepository<Department, String> {

}
