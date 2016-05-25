package com.wang.service;

import com.wang.dao.StudentTopicDao;
import com.wang.dao.TCourseStudentDao;
import com.wang.dao.THomeworkDao;
import com.wang.entity.RCourseStudent;
import com.wang.entity.RStudentTopic;
import com.wang.entity.THomework;
import com.wang.entity.TStudent;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by liu on 2016/5/25.
 */
@Service
@Transactional
public class ScoreService {
    @Resource
    private StudentTopicDao studentTopicDao;
    @Resource
    private THomeworkDao tHomeworkDao;
    @Resource
    private TCourseStudentDao tCourseStudentDao;
    @Resource
    private TStudetServeice tStudetServeice;

    public  int getStudentTopicScore(int studentId){

        int result;
        List<RStudentTopic> studentTopics=studentTopicDao.getAllStudentTopic(studentId);
        int len=studentTopics.size();
        if(len!=0){
            result=studentTopics.get(0).getScore().intValue();
        }else
            result=0;
        return result;
    }
    public double getHomeworkScore(int studentId){
        double result=0;
        List<THomework> homeworksScore=tHomeworkDao.getAllStudentHomeWork(studentId);
        int len=homeworksScore.size();
        if(len!=0){
            for(int i=0;i<len;i++){
                result+=homeworksScore.get(i).getScore().intValue();
            }
            result=result*1.0/len;
        }
        return result;
    }
    public void setStydentUsualScore(int studentId,int usualPercent,int homeworkPercent){
        RCourseStudent rCourseStudent=tCourseStudentDao.getCourseStudent(studentId);
        double usualScore=getStudentTopicScore(studentId)*usualPercent/10+getHomeworkScore(studentId)*homeworkPercent/10;
        rCourseStudent.setUsualScore(usualScore);
    }
    public void setTeachersStudentUsualScore(int usualPercent,int homeworkPercent){
        List<TStudent> students=tStudetServeice.getAllStudentInCourse();
        int len=students.size();
        if(len!=0){
            for(int i=0;i<len;i++){
                setStydentUsualScore(students.get(i).getId(),usualPercent,homeworkPercent);
            }
        }
    }
}
