package com.wang.entity;

import javax.persistence.*;

/**
 * Created by wxl on 2016/5/8.
 */
@Entity
@Table(name = "t_seminar", schema = "ds")
public class TSeminar {
    private Integer id;
    private String name;
    private String desc;
    private Integer courseId;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "desc")
    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    @Basic
    @Column(name = "course_id")
    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TSeminar tSeminar = (TSeminar) o;

        if (id != null ? !id.equals(tSeminar.id) : tSeminar.id != null) return false;
        if (name != null ? !name.equals(tSeminar.name) : tSeminar.name != null) return false;
        if (desc != null ? !desc.equals(tSeminar.desc) : tSeminar.desc != null) return false;
        if (courseId != null ? !courseId.equals(tSeminar.courseId) : tSeminar.courseId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (desc != null ? desc.hashCode() : 0);
        result = 31 * result + (courseId != null ? courseId.hashCode() : 0);
        return result;
    }
}
