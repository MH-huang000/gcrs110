package com.example.test.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.test.entity.Subject;

@Repository
public interface SubjectDao extends JpaRepository<Subject, Integer> {

}
