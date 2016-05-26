package com.wang.dto;

import java.util.Date;

/**
 * Created by Yage on 2016/5/25.
 */
public class HomeworkStudentDto {
    private Integer taskId;
    private Date finishTime;
    private Integer homeworkScore;
    private String studentName;
    private String studentCard;
    private Integer homeworkId;

    public Integer getHomeworkId() {
        return homeworkId;
    }

    public void setHomeworkId(Integer homeworkId) {
        this.homeworkId = homeworkId;
    }

    public String getStudentCard() {
        return studentCard;
    }

    public void setStudentCard(String studentCard) {
        this.studentCard = studentCard;
    }

    public Integer getTaskId() {
        return taskId;
    }

    public void setTaskId(Integer taskId) {
        this.taskId = taskId;
    }

    public Date getFinishTime() {
        return finishTime;
    }

    public void setFinishTime(Date finishTime) {
        this.finishTime = finishTime;
    }

    public Integer getHomeworkScore() {
        return homeworkScore;
    }

    public void setHomeworkScore(Integer homeworkScore) {
        this.homeworkScore = homeworkScore;
    }



    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }
}
