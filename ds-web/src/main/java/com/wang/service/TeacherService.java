package com.wang.service;


import com.wang.dao.TeacherDao;
import com.wang.entity.TTeacher;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by wxl on 2016/3/1.
 */
@Service
@Transactional
public class TeacherService {
    @Resource
    private TeacherDao teacherDao;

    public List<TTeacher> findAllTeacher(){
       return teacherDao.findAll();
    }
    public TTeacher findById(Integer id){
       return teacherDao.findOne(id);
    }
    public void deleteByIds(Integer[] ids){
        for(Integer id:ids){
            teacherDao.delete(id);
        }
    }

    //添加或修改教师信息
    public void addOrUpdate(TTeacher teacher){
        if(null == teacher.getId()){
            //新添加
            teacher.setCreateTime(new Date());
        }else{
            TTeacher dbTeacher = teacherDao.findOne(teacher.getId());
            if(null ==  dbTeacher){
                throw  new RuntimeException("修改信息不存在");
            }
            teacher.setCreateTime(dbTeacher.getCreateTime());
        }
        teacherDao.save(teacher);
    }
}

