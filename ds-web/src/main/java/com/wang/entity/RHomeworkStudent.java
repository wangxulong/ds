package com.wang.entity;

import javax.persistence.*;

/**
 * Created by wxl on 2016/5/8.
 */
@Entity
@Table(name = "r_homework_student", schema = "ds")
public class RHomeworkStudent {
    private int id;
    private Integer homeworkId;
    private Integer studentId;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "homework_id")
    public Integer getHomeworkId() {
        return homeworkId;
    }

    public void setHomeworkId(Integer homeworkId) {
        this.homeworkId = homeworkId;
    }

    @Basic
    @Column(name = "student_id")
    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        RHomeworkStudent that = (RHomeworkStudent) o;

        if (id != that.id) return false;
        if (homeworkId != null ? !homeworkId.equals(that.homeworkId) : that.homeworkId != null) return false;
        if (studentId != null ? !studentId.equals(that.studentId) : that.studentId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (homeworkId != null ? homeworkId.hashCode() : 0);
        result = 31 * result + (studentId != null ? studentId.hashCode() : 0);
        return result;
    }
}
