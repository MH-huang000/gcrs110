package com.example.test.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.test.entity.Version;

@Repository
public interface VersionDao extends JpaRepository<Version, Integer> {
}