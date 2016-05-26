package com.wang.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.wang.dao.StudentTopicDao;
import com.wang.dao.TCourseStudentDao;
import com.wang.dao.THomeworkDao;
import com.wang.entity.RCourseStudent;
import com.wang.entity.RStudentTopic;
import com.wang.entity.THomework;
import com.wang.entity.TStudent;
import com.wang.form.RCourseStudentFormBean;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
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
    public void setStydentUsualScore(int studentId, int taskPercent, int homeworkPercent){
        RCourseStudent rCourseStudent=tCourseStudentDao.getCourseStudent(studentId);
        int sum=taskPercent+homeworkPercent;
        double usualScore=getStudentTopicScore(studentId)* taskPercent /sum+getHomeworkScore(studentId)*homeworkPercent/sum;
        rCourseStudent.setUsualScore(usualScore);
    }
    public boolean setTeachersStudentUsualScore(int taskPercent, int homeworkPercent){
        boolean flag=false;
        List<TStudent> students=tStudetServeice.getAllStudentInCourse();
        int len=students.size();
        if(len!=0){
            for(int i=0;i<len;i++){
                setStydentUsualScore(students.get(i).getId(), taskPercent,homeworkPercent);
            }
            flag=true;
        }
        return flag;
    }
    public RCourseStudentFormBean bindNameInRCourseStudent(TStudent tStudent){
        RCourseStudentFormBean rCourseStudentFormBean=new RCourseStudentFormBean();
        RCourseStudent rCourseStudent=tCourseStudentDao.getCourseStudent(tStudent.getId());
        BeanUtils.copyProperties(rCourseStudent,rCourseStudentFormBean);
        rCourseStudentFormBean.setName(tStudent.getName());
        rCourseStudentFormBean.setStudentNumber(tStudent.getStudentNumber());
        return rCourseStudentFormBean;
    }
    public List<RCourseStudentFormBean> getRCourseStudentInfo(){
        List<RCourseStudentFormBean> stuScores = new ArrayList<RCourseStudentFormBean>();
        List<TStudent> studentsInCourse=tStudetServeice.getAllStudentInCourse();
        int len=studentsInCourse.size();
        if(len!=0){
            for(int i=0;i<len;i++) {
                RCourseStudentFormBean rCourseStudentFormBean;
                rCourseStudentFormBean=bindNameInRCourseStudent(studentsInCourse.get(i));
                stuScores.add(rCourseStudentFormBean);
            }
            return  stuScores;
        }
        return null;
    }
    public void saveOneStudentScore(int studentId,int courseId,double usualScore,double examScore,double finalScore){
        RCourseStudent rCourseStudent=tCourseStudentDao.getCourseStudent(studentId,courseId);
        rCourseStudent.setUsualScore(usualScore);
        rCourseStudent.setExamScore(examScore);
        rCourseStudent.setScore(finalScore);
    }
    public boolean saveStudentsScores(String jsonData) {
        boolean flag=false;
        JSONArray jsonArray=JSONArray.parseArray(jsonData);
        int len=jsonArray.size();
        if(len!=0) {
            for (int i = 0; i < len; i++) {
                JSONObject jsonObj = jsonArray.getJSONObject(i);
                System.err.println("解析数据");
                int studenId = Integer.parseInt(jsonObj.getString("stuId"));
                int courseId = Integer.parseInt(jsonObj.getString("courseId"));
                double usualScore=Double.parseDouble(jsonObj.getString("usualScore"));
                double examScore = Double.parseDouble(jsonObj.getString("examScore"));
                double finalScore = Double.parseDouble(jsonObj.getString("finalScore"));
                System.err.println(studenId+","+courseId+","+usualScore+","+examScore+","+finalScore);
                saveOneStudentScore(studenId,courseId,usualScore,examScore,finalScore);
            }
            flag=true;
        }
        return flag;
    }
}
