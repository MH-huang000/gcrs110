package com.example.test.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.example.test.entity.Account;

public class MyUserDetails implements UserDetails {
    private Account user;

    public MyUserDetails(Account user) {
        this.user = user;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<SimpleGrantedAuthority> authoritys = new ArrayList<>();
        authoritys.add(new SimpleGrantedAuthority(user.getIdentity()));
        // SimpleGrantedAuthority authority = new
        // SimpleGrantedAuthority(user.getIdentity());
        if (user.getAdministrator() != null) {
            System.out.println(user.getAdministrator().getStaffName());
            authoritys.add(new SimpleGrantedAuthority(user.getAdministrator().getUnitId()));
        }
        return authoritys;

    }

    @Override
    public String getPassword() {
        return user.getPwd();

    }

    @Override
    public String getUsername() {
        return user.getAccount();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

}
