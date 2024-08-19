package com.example.test.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.test.entity.Member;

@Repository
public interface MemberDao extends JpaRepository<Member, String> {

}
