package com.wang.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

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
    private List<TSeminarTopic> seminarTopics;
    @DateTimeFormat( pattern = "yyyy-MM-dd" )
    private Date startTime;
    @DateTimeFormat( pattern = "yyyy-MM-dd" )
    private Date endTime;

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


    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name="seminar_id")
    public List<TSeminarTopic> getSeminarTopics() {
        return seminarTopics;
    }

    public void setSeminarTopics(List<TSeminarTopic> seminarTopics) {
        this.seminarTopics = seminarTopics;
    }

    @Basic
    @Column(name = "start_time")
    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    @Basic
    @Column(name = "end_time")
    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }
}
