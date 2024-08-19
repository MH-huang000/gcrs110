package com.example.test.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.test.entity.Administrator;

@Repository
public interface AdministratorDao extends JpaRepository<Administrator, Integer> {

}