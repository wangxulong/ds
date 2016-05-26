package com.wang.service;

import com.wang.auth.sys.entity.SysUser;
import com.wang.auth.sys.service.SecurityService;
import com.wang.dao.StudentDao;
import com.wang.dao.TCourseDao;
import com.wang.dao.TCourseStudentDao;
import com.wang.dao.TeacherDao;
import com.wang.entity.RCourseStudent;
import com.wang.entity.TCourse;
import com.wang.entity.TStudent;
import com.wang.entity.TTeacher;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by liu on 2016/5/12.
 */
@Service
@Transactional
public class TStudetServeice {
    @Resource
    private StudentDao studentDao;
    @Resource
    private TCourseDao tCourseDao;
    @Resource
    private TeacherDao teacherDao;
    @Resource
    private TCourseStudentDao tCourseStudent;
    @Resource
    private SecurityService securityService;
    public List<TStudent> getAllStudent(){
        List<TStudent> students;
        students=studentDao.findAll();
        return students;
    }


    public List<TStudent> getAllStudentInCourse(){
        List<TStudent> students;
        SysUser sysUser=securityService.getLoginUser();
        String jobNumber = sysUser.getUserName();
        TTeacher tTeacher = teacherDao.findByJobNumber(jobNumber);
        TCourse tCourse=tCourseDao.findByTeacherId(tTeacher.getId());
        List<RCourseStudent> courseStudents=tCourseStudent.getCourseStudentBycourseId(tCourse.getId());
        int len =courseStudents.size();
        if(len!=0) {
            Integer[] ids = new Integer[len];
            for (int i = 0; i < len; i++) {
                ids[i] = courseStudents.get(i).getStudentId();
            }
            students = studentDao.findAllStudentInCourse(ids);
        }else {
            students=new ArrayList<TStudent>();
            return students;
        }
        return students;
    }
    public TStudent getStudentByStudentId(int studentId){
        return studentDao.findOne(studentId);
    }
}
