package com.example.test.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.ToString;

@Entity
@Table(name = "subject")
@Data
public class Subject {
    @EmbeddedId
    private SubjectID subjectID;
    @Column(name = "Cname")
    private String Cname;
    @Column(name = "Ename")
    private String Ename;
    @Column(name = "Credit")
    private float credit;
    @Column(name = "Sel")
    private int sel;

    @ManyToMany(mappedBy = "subjects", fetch = FetchType.LAZY)
    @ToString.Exclude
    private List<CourseModule> courseModules;

}
