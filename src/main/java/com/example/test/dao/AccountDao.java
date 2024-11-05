package com.example.test.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.test.entity.Account;

@Repository
public interface AccountDao extends JpaRepository<Account, String> {

}
