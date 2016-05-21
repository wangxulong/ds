package com.wang.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by wxl on 2016/5/8.
 */
@Entity
@Table(name = "t_exam", schema = "ds")
public class TExam {
    private Integer id;
    private String title;
    private String description;
    @DateTimeFormat( pattern = "yyyy-MM-dd" )
    private Date startTime;
    @DateTimeFormat( pattern = "yyyy-MM-dd" )
    private Date endTime;
    private Integer year;
    private Integer term;
    private String score;
    private Integer teacherId;
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
    @Column(name = "year")
    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    @Basic
    @Column(name = "term")
    public Integer getTerm() {
        return term;
    }

    public void setTerm(Integer term) {
        this.term = term;
    }

    @Basic
    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Column(name = "start_time")
    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }
    @Column(name = "end_time")
    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    @Basic
    @Column(name = "score")
    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    @Basic
    @Column(name = "teacher_id")
    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
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

        TExam tExam = (TExam) o;

        if (id != null ? !id.equals(tExam.id) : tExam.id != null) return false;
        if (title != null ? !title.equals(tExam.title) : tExam.title != null) return false;
        if (description != null ? !description.equals(tExam.description) : tExam.description != null) return false;
        if (startTime != null ? !startTime.equals(tExam.startTime) : tExam.startTime != null) return false;
        if (endTime != null ? !endTime.equals(tExam.endTime) : tExam.endTime != null) return false;
        if (score != null ? !score.equals(tExam.score) : tExam.score != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (startTime != null ? startTime.hashCode() : 0);
        result = 31 * result + (endTime != null ? endTime.hashCode() : 0);
        result = 31 * result + (score != null ? score.hashCode() : 0);
        return result;
    }
}
