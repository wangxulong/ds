package com.wang.entity;

import com.wang.entity.enums.StudentTopicState;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Created by jichao on 2016/5/24.
 */
@Entity
@Table(name = "r_student_topic", schema = "ds")
public class RStudentTopic {
    private Integer id;
    private Integer studentId;
    private Integer topicId;
    private Integer type;
    private Integer score;
    private String level;
    private StudentTopicState state;
    private Integer attachId;

    @Column(name = "attach_id")
    public Integer getAttachId() {
        return attachId;
    }

    public void setAttachId(Integer attachId) {
        this.attachId = attachId;
    }

    private Date createTime;

    @Column(name = "create_time")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Column(name = "state")
    public StudentTopicState getState() {
        return state;
    }

    public void setState(StudentTopicState state) {
        this.state = state;
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
    @Column(name = "student_id")
    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    @Basic
    @Column(name = "topic_id")
    public Integer getTopicId() {
        return topicId;
    }

    public void setTopicId(Integer topicId) {
        this.topicId = topicId;
    }

    @Basic
    @Column(name = "type")
    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Basic
    @Column(name = "score")
    public Integer getScore() {
        if(null==this.score)
            return 0;
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    @Basic
    @Column(name = "level")
    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

  /*  @OneToMany(fetch = FetchType.EAGER)
    @JoinColumn(name="student_id")
    public List<TStudent> getStudents() {
        return students;
    }

    public void setStudents(List<TStudent> students) {
        this.students = students;
    }*/
}
