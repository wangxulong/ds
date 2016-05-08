package com.wang.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by wxl on 2016/5/8.
 */
@Entity
@Table(name = "t_student", schema = "ds")
public class TStudent {
    private Integer id;
    private String name;
    private Integer sex;
    private Integer age;
    @Column(name = "birth_date")
    private Date birthDate;
    private String studentNumber;
    @Column(name = "join_date")
    private Date joinDate;
    @Column(name = "leave_date")
    private Date leaveDate;
    @Column(name = "create_time")
    private Date createTime;
    private Integer seminarTopicId;

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
    @Column(name = "sex")
    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
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
    @Column(name = "birth_date")
    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    @Basic
    @Column(name = "student_number")
    public String getStudentNumber() {
        return studentNumber;
    }

    public void setStudentNumber(String studentNumber) {
        this.studentNumber = studentNumber;
    }

    public Date getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }

    public Date getLeaveDate() {
        return leaveDate;
    }

    public void setLeaveDate(Date leaveDate) {
        this.leaveDate = leaveDate;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Basic
    @Column(name = "seminar_topic_id")
    public Integer getSeminarTopicId() {
        return seminarTopicId;
    }

    public void setSeminarTopicId(Integer seminarTopicId) {
        this.seminarTopicId = seminarTopicId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TStudent tStudent = (TStudent) o;

        if (id != null ? !id.equals(tStudent.id) : tStudent.id != null) return false;
        if (name != null ? !name.equals(tStudent.name) : tStudent.name != null) return false;
        if (sex != null ? !sex.equals(tStudent.sex) : tStudent.sex != null) return false;
        if (age != null ? !age.equals(tStudent.age) : tStudent.age != null) return false;
        if (birthDate != null ? !birthDate.equals(tStudent.birthDate) : tStudent.birthDate != null) return false;
        if (studentNumber != null ? !studentNumber.equals(tStudent.studentNumber) : tStudent.studentNumber != null)
            return false;
        if (joinDate != null ? !joinDate.equals(tStudent.joinDate) : tStudent.joinDate != null) return false;
        if (leaveDate != null ? !leaveDate.equals(tStudent.leaveDate) : tStudent.leaveDate != null) return false;
        if (createTime != null ? !createTime.equals(tStudent.createTime) : tStudent.createTime != null) return false;
        if (seminarTopicId != null ? !seminarTopicId.equals(tStudent.seminarTopicId) : tStudent.seminarTopicId != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (sex != null ? sex.hashCode() : 0);
        result = 31 * result + (age != null ? age.hashCode() : 0);
        result = 31 * result + (birthDate != null ? birthDate.hashCode() : 0);
        result = 31 * result + (studentNumber != null ? studentNumber.hashCode() : 0);
        result = 31 * result + (joinDate != null ? joinDate.hashCode() : 0);
        result = 31 * result + (leaveDate != null ? leaveDate.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (seminarTopicId != null ? seminarTopicId.hashCode() : 0);
        return result;
    }
}
