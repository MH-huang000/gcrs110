package com.example.test.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "account")
@Data
// 自動生成get跟set方法
public class Account {
    @Id
    @Column(name = "account")
    private String account;
    @Column(name = "pwd")
    private String pwd;
    @Column(name = "identity")
    private String identity;

    @OneToOne(targetEntity = Administrator.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "staff_id", referencedColumnName = "staff_id", nullable = true)
    private Administrator administrator;
}
