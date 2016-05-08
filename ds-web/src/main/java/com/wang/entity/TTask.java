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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TTask tTask = (TTask) o;

        if (id != null ? !id.equals(tTask.id) : tTask.id != null) return false;
        if (topic != null ? !topic.equals(tTask.topic) : tTask.topic != null) return false;
        if (content != null ? !content.equals(tTask.content) : tTask.content != null) return false;
        if (createTime != null ? !createTime.equals(tTask.createTime) : tTask.createTime != null) return false;
        if (endTime != null ? !endTime.equals(tTask.endTime) : tTask.endTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (topic != null ? topic.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (endTime != null ? endTime.hashCode() : 0);
        return result;
    }
}
