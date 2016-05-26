package com.wang.form;

import com.wang.entity.RCourseStudent;

/**
 * Created by liu on 2016/5/26.
 */
public class RCourseStudentFormBean extends RCourseStudent{
    private String name;
    private String studentNumber;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStudentNumber() {
        return studentNumber;
    }

    public void setStudentNumber(String studentNumber) {
        this.studentNumber = studentNumber;
    }
}
