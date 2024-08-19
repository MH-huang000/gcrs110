package com.example.test.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.test.entity.Subject;
import com.example.test.entity.SubjectID;

@Repository
public interface SubjectDao extends JpaRepository<Subject, SubjectID> {
    public Subject findBySubjectID(SubjectID subjectID);
}
