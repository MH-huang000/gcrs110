package com.example.test.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Data;

@Data
@Embeddable
public class SubjectID implements Serializable {
    @Column(name = "subject_id ")
    private String subjectId;
    @Column(name = "academic_year")
    private int academicYear;
}
