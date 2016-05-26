package com.wang.form;

import com.wang.entity.TStudent;

/**
 * Created by liu on 2016/5/26.
 */
public class StudentFormBean extends TStudent{
    private double score;
    private double usualScore;
    private double examScore;

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public double getUsualScore() {
        return usualScore;
    }

    public void setUsualScore(double usualScore) {
        this.usualScore = usualScore;
    }

    public double getExamScore() {
        return examScore;
    }

    public void setExamScore(double examScore) {
        this.examScore = examScore;
    }
}
