package com.example.test.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "administrator")
@Data
public class Administrator {
    @Id
    @Column(name = "Staff_ID")
    private int staff_ID;
    @Column(name = "Staff_Name")
    private String staff_Name;

}
