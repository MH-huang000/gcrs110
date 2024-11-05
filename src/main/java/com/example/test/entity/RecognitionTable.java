package com.example.test.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "recognition_table")
@Data
public class RecognitionTable {
    @Id
    @Column(name = "id")
    private int id;

    @ManyToOne(targetEntity = Student.class)
    @JoinColumn(name = "student_id", referencedColumnName = "student_id")
    @JsonIgnore
    private Student student;

    @OneToOne(targetEntity = CourseData.class)
    @JoinColumn(name = "course_data_id", referencedColumnName = "course_data_id")
    private CourseData courseData;

    @OneToOne(targetEntity = Subject.class)
    @JoinColumn(name = "equivalent_subject_id", referencedColumnName = "subject_id")
    private Subject subject;

}
