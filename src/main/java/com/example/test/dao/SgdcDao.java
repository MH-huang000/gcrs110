package com.example.test.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.test.entity.Sgdc;

import jakarta.transaction.Transactional;

@Repository
public interface SgdcDao extends JpaRepository<Sgdc, Integer> {
    @Transactional
    @Modifying
    @Query("DELETE FROM Sgdc s WHERE s.sgdcId = ?1")
    public void deleteSgdcById(int id);
}
