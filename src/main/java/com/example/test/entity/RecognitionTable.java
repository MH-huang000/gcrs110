package com.example.test.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "recognition_table")
@Data
public class RecognitionTable {
    @Id
    @Column(name = "ID")
    private int id;
    @Column(name = "Student_ID")
    private String studentID;

}
