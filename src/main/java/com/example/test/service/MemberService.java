package com.example.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test.dao.MemberDao;
import com.example.test.entity.Member;

@Service
public class MemberService {

    @Autowired
    private MemberDao memberDao;

    public Member getByID(String id) {
        Member user = memberDao.findById(id).orElse(new Member());
        return user;
    }

    public List<Member> getAll() {
        return memberDao.findAll();
    }
}
