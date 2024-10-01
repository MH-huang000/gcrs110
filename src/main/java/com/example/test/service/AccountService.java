package com.example.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test.dao.AccountDao;
import com.example.test.entity.Account;

@Service
public class AccountService {

    @Autowired
    private AccountDao accountDao;

    public Account getByID(String id) {
        Account user = accountDao.findById(id).orElse(new Account());
        return user;
    }

    public List<Account> getAll() {
        return accountDao.findAll();
    }
}
