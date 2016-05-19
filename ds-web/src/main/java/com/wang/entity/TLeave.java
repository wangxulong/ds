package com.wang.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.wang.entity.enums.LeaveState;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(
        name = "t_leave"
)
public class TLeave {
    @Id
    @Column(
            name = "id"
    )
    @GeneratedValue(
            strategy = GenerationType.IDENTITY
    )
    private Integer id;
    @Column(
            name = "content"
    )
    private String content;
    @Column(
            name = "create_time"
    )
    private Date createTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "leave_date")
    private Date leaveDate;
    @Column(name = "attach_id")
    private Integer attachId;
    @Column(name = "state")
    private LeaveState state;
    @Column(name = "student_id"
    )
    private Integer studentId;
    @Column(
            name = "course_id"
    )
    private Integer courseId;

    public TLeave() {
    }

    public Integer getCourseId() {
        return this.courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getStudentId() {
        return this.studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public LeaveState getState() {
        return this.state;
    }

    public void setState(LeaveState state) {
        this.state = state;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateTime() {
        return this.createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getLeaveDate() {
        return this.leaveDate;
    }

    public void setLeaveDate(Date leaveDate) {
        this.leaveDate = leaveDate;
    }

    public Integer getAttachId() {
        return this.attachId;
    }

    public void setAttachId(Integer attachId) {
        this.attachId = attachId;
    }
}
