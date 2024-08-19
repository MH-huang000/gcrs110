package com.example.test.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.test.entity.ClassModule;

@Repository
public interface ClassModuleDao extends JpaRepository<ClassModule, Integer> {

}
