package com.wang.entity;

import javax.persistence.*;

/**
 * Created by wxl on 2016/5/8.
 */
@Entity
@Table(name = "t_plan", schema = "ds")
public class TPlan {
    private Integer id;
    private String topic;
    private String desc;
    private Integer teacherId;

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

    @Basic
    @Column(name = "teacher_id")
    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TPlan tPlan = (TPlan) o;

        if (id != null ? !id.equals(tPlan.id) : tPlan.id != null) return false;
        if (topic != null ? !topic.equals(tPlan.topic) : tPlan.topic != null) return false;
        if (desc != null ? !desc.equals(tPlan.desc) : tPlan.desc != null) return false;
        if (teacherId != null ? !teacherId.equals(tPlan.teacherId) : tPlan.teacherId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (topic != null ? topic.hashCode() : 0);
        result = 31 * result + (desc != null ? desc.hashCode() : 0);
        result = 31 * result + (teacherId != null ? teacherId.hashCode() : 0);
        return result;
    }
}
