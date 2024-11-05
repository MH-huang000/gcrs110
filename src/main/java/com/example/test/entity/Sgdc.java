package com.example.test.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Column;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "sgdc")
@Data
@JsonIgnoreProperties(ignoreUnknown = true, value = { "hibernateLazyInitializer", "handler", "fieldHandler" })
public class Sgdc {
    @Id
    @Column(name = "sgdc_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int sgdcId;

    @ManyToOne(targetEntity = CourseData.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "course_data_id", referencedColumnName = "course_data_id")
    private CourseData courseData;

    // @ManyToOne(targetEntity = Version.class, fetch = FetchType.EAGER)
    // @JoinColumn(name = "version_id", referencedColumnName = "version_id")
    // @JsonIgnoreProperties(ignoreUnknown = true, value = "version")
    // @ToString.Exclude
    // private Version version;
    @Column(name = "version_id")
    private int versionId;

    @Column(name = "course_structure_id")
    private int courseStructureId;
    @Column(name = "class_module_id")
    private int classModuleId;
    @Column(name = "course_package_id")
    private int coursePackageId;
    @Column(name = "course_module_id")
    private String courseModuleId;
    // 0 啟用 1 未啟用(delete)
    @Column(name = "type")
    private int type = 0;

    @Column(name = "remark", nullable = true)
    private String remark;
}
