package com.example.test.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.example.test.dao.MemberDao;
import com.example.test.entity.Member;

import jakarta.transaction.Transactional;

@Service
public class MyUserDetailsService implements UserDetailsService {
    @Autowired
    private MemberDao memberDao;

    @Transactional
    @Override
    public UserDetails loadUserByUsername(String accout) throws UsernameNotFoundException {
        Member member = memberDao.getReferenceById(accout);
        System.out.println(member);
        if (member == null) {
            throw new UsernameNotFoundException("User not found");
        }
        return new MyUserDetails(member);
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
}
