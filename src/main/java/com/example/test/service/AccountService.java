package com.example.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test.dao.AccountDao;
import com.example.test.entity.Account;

@Service
public class AccountService {
    @Autowired
    private AccountDao accountDao;

    public String getDeparmentIdOfAccount(String name) {
        Account account = accountDao.findById(name).orElse(null);
        if (account != null) {
            return account.getAdministrator().getUnitId();
        }
        return null;
    }
}
