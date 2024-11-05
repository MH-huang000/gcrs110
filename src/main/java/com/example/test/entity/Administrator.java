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
    @Column(name = "staff_id")
    private int staffId;
    @Column(name = "staff_name")
    private String staffName;
    @Column(name = "unit_id")
    private String unitId;

}
