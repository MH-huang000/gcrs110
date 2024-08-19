package com.example.test.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Data;

@Data
@Embeddable
public class SubjectID implements Serializable {
    @Column(name = "Subject_ID")
    private String subject_ID;
    @Column(name = "Academic_Year")
    private int academic_Year;
}
