package com.service;

import com.wang.dao.TCourseStudentDao;
import com.wang.form.RCourseStudentFormBean;
import com.wang.service.CourseService;
import com.wang.service.ScoreService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by wxl on 2016/5/12.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/spring-context.xml")
public class CourseServiceTest {
    @Resource
    private CourseService courseService;
    @Resource
    private ScoreService scoreService;
    @Test
    public void getTeacherCourse(){
        List result = courseService.getTeachingCourse();
        System.out.println(result.size());
    }
    @Test
    public void setScore(){
        scoreService.setStydentUsualScore(2,3,7);
    }
    @Test
    public void getRcourseStudent(){
        List<RCourseStudentFormBean> students=scoreService.getRCourseStudentInfo();
        int len=students.size();
        if(len!=0){
            for(int i=0;i<len;i++){
                System.out.println(students.get(i));
            }
        }
    }
}
