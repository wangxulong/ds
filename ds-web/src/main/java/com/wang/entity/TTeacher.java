package com.wang.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by wxl on 2016/5/8.
 */
@Entity
@Table(name = "t_teacher", schema = "ds")
public class TTeacher {
    private Integer id;
    private String name;
    private Integer sex;
    private String idcard;
    private Integer age;
    private String jobNumber;
    @DateTimeFormat( pattern = "yyyy-MM-dd" )
    private Date birthDate;
    @DateTimeFormat( pattern = "yyyy-MM-dd" )
    private Date joinDate;
    @DateTimeFormat( pattern = "yyyy-MM-dd" )
    private Date leaveDate;
    private String description;
    private Date createTime;

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
    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
    @Column(name = "sex")
    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    @Basic
    @Column(name = "idcard")
    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    @Basic
    @Column(name = "age")
    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    @Basic
    @Column(name = "job_number")
    public String getJobNumber() {
        return jobNumber;
    }

    public void setJobNumber(String jobNumber) {
        this.jobNumber = jobNumber;
    }

    @Basic
    @Column(name = "birth_date")
    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }
    @Column(name = "join_date")
    public Date getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }
    @Column(name = "leave_date")
    public Date getLeaveDate() {
        return leaveDate;
    }

    public void setLeaveDate(Date leaveDate) {
        this.leaveDate = leaveDate;
    }
    @Column(name = "create_time")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TTeacher tTeacher = (TTeacher) o;

        if (id != null ? !id.equals(tTeacher.id) : tTeacher.id != null) return false;
        if (name != null ? !name.equals(tTeacher.name) : tTeacher.name != null) return false;
        if (sex != null ? !sex.equals(tTeacher.sex) : tTeacher.sex != null) return false;
        if (idcard != null ? !idcard.equals(tTeacher.idcard) : tTeacher.idcard != null) return false;
        if (age != null ? !age.equals(tTeacher.age) : tTeacher.age != null) return false;
        if (jobNumber != null ? !jobNumber.equals(tTeacher.jobNumber) : tTeacher.jobNumber != null) return false;
        if (birthDate != null ? !birthDate.equals(tTeacher.birthDate) : tTeacher.birthDate != null) return false;
        if (joinDate != null ? !joinDate.equals(tTeacher.joinDate) : tTeacher.joinDate != null) return false;
        if (leaveDate != null ? !leaveDate.equals(tTeacher.leaveDate) : tTeacher.leaveDate != null) return false;
        if (createTime != null ? !createTime.equals(tTeacher.createTime) : tTeacher.createTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (sex != null ? sex.hashCode() : 0);
        result = 31 * result + (idcard != null ? idcard.hashCode() : 0);
        result = 31 * result + (age != null ? age.hashCode() : 0);
        result = 31 * result + (jobNumber != null ? jobNumber.hashCode() : 0);
        result = 31 * result + (birthDate != null ? birthDate.hashCode() : 0);
        result = 31 * result + (joinDate != null ? joinDate.hashCode() : 0);
        result = 31 * result + (leaveDate != null ? leaveDate.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        return result;
    }
}
