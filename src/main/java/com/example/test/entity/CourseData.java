package com.example.test.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinColumns;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "Course_data")
@Data
public class CourseData {
    @Id
    @Column(name = "Course_Data_ID")
    private int course_Data_ID;
    @Column(name = "Student_ID")
    private String student_ID;

    @OneToOne
    @JoinColumns({
            @JoinColumn(name = "Subject_ID", referencedColumnName = "Subject_ID"),
            @JoinColumn(name = "Academic_Year", referencedColumnName = "Academic_Year")
    })
    private Subject subject;

    @Column(name = "Grade")
    private int grade;
    @Column(name = "Status")
    private int status;
    @Column(name = "Semester")
    private int semester;

}
