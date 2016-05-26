package com.wang.dto;

import com.wang.entity.enums.StudentTopicState;

import java.util.Date;

/**
 * Created by wxl on 2016/5/24.
 */
public class MyJoinedTopicDto {
    private Integer studentTopicId;
    private String topicName;
    private Integer topicId;
    private Date joinTime;
    private Byte state;
    private Date endTime;
    private String seminarName;

    private Integer attachId;

    public Integer getAttachId() {
        return attachId;
    }

    public void setAttachId(Integer attachId) {
        this.attachId = attachId;
    }

    public String getSeminarName() {
        return seminarName;
    }

    public void setSeminarName(String seminarName) {
        this.seminarName = seminarName;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Integer getStudentTopicId() {
        return studentTopicId;
    }

    public void setStudentTopicId(Integer studentTopicId) {
        this.studentTopicId = studentTopicId;
    }

    public String getTopicName() {
        return topicName;
    }

    public void setTopicName(String topicName) {
        this.topicName = topicName;
    }

    public Integer getTopicId() {
        return topicId;
    }

    public void setTopicId(Integer topicId) {
        this.topicId = topicId;
    }

    public Date getJoinTime() {
        return joinTime;
    }

    public void setJoinTime(Date joinTime) {
        this.joinTime = joinTime;
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }
}
