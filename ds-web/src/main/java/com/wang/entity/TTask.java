package com.wang.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by wxl on 2016/5/8.
 */
@Entity
@Table(name = "t_task", schema = "ds")
public class TTask {
    private Integer id;
    private String topic;
    private String content;
    private Integer  courseId;
    private Integer  teacherId;
    private Integer  attachmentId;

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public void setAttachmentId(Integer attachmentId) {
        this.attachmentId = attachmentId;
    }
    @Basic
    @Column(name = "teacher_id")
    public Integer getTeacherId() {

        return teacherId;
    }
    @Basic
    @Column(name = "attachment_id")
    public Integer getAttachmentId() {
        return attachmentId;
    }

    private Date createTime;
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

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }
    @Basic
    @Column(name = "course_id")
    public Integer getCourseId() {
        return courseId;

    }

    @Basic
    @Column(name = "topic")
    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    @Basic
    @Column(name = "content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Column(name = "create_time")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    @Column(name = "end_time")
    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }



}
