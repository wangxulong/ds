package com.wang.entity;

import javax.persistence.*;

/**
 * Created by wxl on 2016/5/8.
 */
@Entity
@Table(name = "t_material", schema = "ds")
public class TMaterial {
    private Integer id;
    private String name;
    private String desc;
    private Integer courseId;
    private boolean isParent;
    private Integer pid;
    private Integer pId;
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
    @Column(name = "descp")
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

        TMaterial tMaterial = (TMaterial) o;

        if (id != null ? !id.equals(tMaterial.id) : tMaterial.id != null) return false;
        if (name != null ? !name.equals(tMaterial.name) : tMaterial.name != null) return false;
        if (desc != null ? !desc.equals(tMaterial.desc) : tMaterial.desc != null) return false;
        if (courseId != null ? !courseId.equals(tMaterial.courseId) : tMaterial.courseId != null) return false;

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

    @Basic
    @Column(name = "is_parent")
    public boolean isParent() {
        return isParent;
    }

    public void setParent(boolean parent) {
        isParent = parent;
    }

    @Basic
    @Column(name = "p_id")
    public Integer getPid() {
        pId = pid;
        return pid;
    }

    public void setPid(Integer pid) {
        this.pId = pid;
        this.pid = pid;
    }
}
