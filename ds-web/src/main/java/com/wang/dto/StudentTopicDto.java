package com.wang.dto;

import com.wang.entity.RStudentTopic;
import com.wang.entity.TStudent;
import com.wang.entity.enums.StudentTopicState;

import java.math.BigInteger;
import java.util.Date;
import java.util.List;

/**
 * Created by wxl on 2016/5/25.
 */
public class StudentTopicDto{
    private Integer id;
    private Integer studentId;
    private Integer topicId;
    private BigInteger selectedCount;
    private Date createTime;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }
    public Integer getTopicId() {
        return topicId;
    }

    public void setTopicId(Integer topicId) {
        this.topicId = topicId;
    }

    public BigInteger getSelectedCount() {
        return selectedCount;
    }

    public void setSelectedCount(BigInteger selectedCount) {
        this.selectedCount = selectedCount;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
