package com.wang.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by wxl on 2016/5/8.
 */
@Entity
@Table(name = "t_course", schema = "ds")
public class TCourse {
    private int id;
    private String name;
    private Date startTime;

    private Date endTime;
    private String schedule;
    private String outline;
    private Integer teacherId;
    private Integer groupId;
    private Integer examId;

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
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    @Basic
    @Column(name = "start_time")
    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }
    @Column(name = "endTime")
    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    @Basic
    @Column(name = "schedule")
    public String getSchedule() {
        return schedule;
    }

    public void setSchedule(String schedule) {
        this.schedule = schedule;
    }

    @Basic
    @Column(name = "outline")
    public String getOutline() {
        return outline;
    }

    public void setOutline(String outline) {
        this.outline = outline;
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
    @Column(name = "group_id")
    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    @Basic
    @Column(name = "exam_id")
    public Integer getExamId() {
        return examId;
    }

    public void setExamId(Integer examId) {
        this.examId = examId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TCourse tCourse = (TCourse) o;

        if (id != tCourse.id) return false;
        if (name != null ? !name.equals(tCourse.name) : tCourse.name != null) return false;
        if (startTime != null ? !startTime.equals(tCourse.startTime) : tCourse.startTime != null) return false;
        if (endTime != null ? !endTime.equals(tCourse.endTime) : tCourse.endTime != null) return false;
        if (schedule != null ? !schedule.equals(tCourse.schedule) : tCourse.schedule != null) return false;
        if (outline != null ? !outline.equals(tCourse.outline) : tCourse.outline != null) return false;
        if (teacherId != null ? !teacherId.equals(tCourse.teacherId) : tCourse.teacherId != null) return false;
        if (groupId != null ? !groupId.equals(tCourse.groupId) : tCourse.groupId != null) return false;
        if (examId != null ? !examId.equals(tCourse.examId) : tCourse.examId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (startTime != null ? startTime.hashCode() : 0);
        result = 31 * result + (endTime != null ? endTime.hashCode() : 0);
        result = 31 * result + (schedule != null ? schedule.hashCode() : 0);
        result = 31 * result + (outline != null ? outline.hashCode() : 0);
        result = 31 * result + (teacherId != null ? teacherId.hashCode() : 0);
        result = 31 * result + (groupId != null ? groupId.hashCode() : 0);
        result = 31 * result + (examId != null ? examId.hashCode() : 0);
        return result;
    }
}
