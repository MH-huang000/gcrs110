package com.example.test.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.example.test.dao.AccountDao;
import com.example.test.entity.Account;

import jakarta.transaction.Transactional;

@Service
public class MyUserDetailsService implements UserDetailsService {
    @Autowired
    private AccountDao accountDao;

    @Transactional
    @Override
    public UserDetails loadUserByUsername(String accout) throws UsernameNotFoundException {
        Account user = accountDao.findById(accout).orElse(null);
        System.out.println(user.getAccount() + " 登入");

        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }
        return new MyUserDetails(user);
    }
}
/*
 * @Override
 * public UserDetails loadUserByUsername(String username) throws
 * UsernameNotFoundException {
 * // TODO Auto-generated method stub
 * throw new
 * UnsupportedOperationException("Unimplemented method 'loadUserByUsername'");
 * }
 */
/*
 * could not initialize proxy [com.example.test.security.Member#ACS110105] - no
 * Session
 */