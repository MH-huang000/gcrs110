package com.example.test.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "course_data")
@Data
public class CourseData implements Cloneable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "course_data_id")
    private int courseDataId;

    @Column(name = "student_id")
    private String studentId;

    @OneToOne
    @JoinColumn(name = "subject_id", referencedColumnName = "subject_id")
    private Subject subject;

    @Column(name = "grade", nullable = true)
    private Integer grade;

    // 1通過 2未通過 3正在修
    @Column(name = "status")
    private int status;

    @Column(name = "semester")
    private int semester;

    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone();
    }

}
