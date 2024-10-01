package com.example.test.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "account")
@Data
// 自動生成get跟set方法
public class Account {
    @Id
    @Column(name = "user_id")
    private String userId;
    @Column(name = "pwd")
    private String pwd;
    @Column(name = "identity")
    private String identity;

}
