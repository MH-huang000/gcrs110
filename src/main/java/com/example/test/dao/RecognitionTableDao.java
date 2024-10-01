package com.example.test.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.test.entity.RecognitionTable;

@Repository
public interface RecognitionTableDao extends JpaRepository<RecognitionTable, Integer> {
}
