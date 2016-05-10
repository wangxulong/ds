package com.wang.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by wxl on 2016/5/8.
 */
@Entity
@Table(name = "t_homework", schema = "ds")
public class THomework {
    protected Integer id;
    protected String topic;
    protected String desc;

    protected Date createTime;
    @DateTimeFormat( pattern = "yyyy-MM-dd" )
    protected Date finshTime;

    protected Integer score;
    protected Integer taskId;
    protected Integer attachmentId;

    public THomework() {
    }

    public THomework(String topic, String desc, Date finshTime) {
        this.topic = topic;
        this.desc = desc;
        this.finshTime = finshTime;
    }

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
    @Column(name = "topic")
    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    @Basic
    @Column(name = "desc")
    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
    @Column(name = "create_time")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Column(name = "finsh_time")
    public Date getFinshTime() {
        return finshTime;
    }

    public void setFinshTime(Date finshTime) {
        this.finshTime = finshTime;
    }


    @Basic
    @Column(name = "score")
    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    @Basic
    @Column(name = "task_id")
    public Integer getTaskId() {
        return taskId;
    }

    public void setTaskId(Integer taskId) {
        this.taskId = taskId;
    }

    @Basic
    @Column(name = "attachment_id")
    public Integer getAttachmentId() {
        return attachmentId;
    }

    public void setAttachmentId(Integer attachmentId) {
        this.attachmentId = attachmentId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        THomework tHomework = (THomework) o;

        if (id != null ? !id.equals(tHomework.id) : tHomework.id != null) return false;
        if (topic != null ? !topic.equals(tHomework.topic) : tHomework.topic != null) return false;
        if (desc != null ? !desc.equals(tHomework.desc) : tHomework.desc != null) return false;
        if (finshTime != null ? !finshTime.equals(tHomework.finshTime) : tHomework.finshTime != null) return false;
        if (score != null ? !score.equals(tHomework.score) : tHomework.score != null) return false;
        if (taskId != null ? !taskId.equals(tHomework.taskId) : tHomework.taskId != null) return false;
        if (attachmentId != null ? !attachmentId.equals(tHomework.attachmentId) : tHomework.attachmentId != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (topic != null ? topic.hashCode() : 0);
        result = 31 * result + (desc != null ? desc.hashCode() : 0);
        result = 31 * result + (finshTime != null ? finshTime.hashCode() : 0);
        result = 31 * result + (score != null ? score.hashCode() : 0);
        result = 31 * result + (taskId != null ? taskId.hashCode() : 0);
        result = 31 * result + (attachmentId != null ? attachmentId.hashCode() : 0);
        return result;
    }
}
