package com.example.test.entity;

import org.apache.commons.lang3.builder.ToStringExclude;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "department_list")
public class DepartmentList {
    @Id
    @Column(name = "id")
    private int id;

    @ManyToOne(targetEntity = Department.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "department_id", referencedColumnName = "department_id")
    @ToStringExclude
    @JsonIgnoreProperties("departmentLists")
    private Department department;

    @OneToOne(targetEntity = Subject.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "subject_id", referencedColumnName = "subject_id")
    private Subject subject;

    @OneToOne(targetEntity = Subject.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "equivalent_subject_id", referencedColumnName = "subject_id")
    private Subject equivalentSubject;
}
