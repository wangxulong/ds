package com.wang.service;


import com.wang.auth.sys.dao.SysRoleDao;
import com.wang.auth.sys.dao.SysUserDao;
import com.wang.auth.sys.entity.SysRole;
import com.wang.auth.sys.entity.SysUser;
import com.wang.dao.TCourseDao;
import com.wang.dao.TeacherDao;
import com.wang.entity.TCourse;
import com.wang.entity.TGroup;
import com.wang.entity.TTeacher;
import com.wang.util.ConstantUtil;
import com.wang.util.PasswordHelper;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;

/**
 * Created by wxl on 2016/3/1.
 */
@Service
@Transactional
public class TeacherService {
    //老师角色
    private static String TEACHER_DODE="teacher";
    @Resource
    private TeacherDao teacherDao;
    @Resource
    private SysUserDao sysUserDao;
    @Resource
    private SysRoleDao sysRoleDao;
    @Resource
    private GroupService groupService;
    @Qualifier("TCourseDao")
    @Resource
    private TCourseDao courseDao;

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
            //添加账号信息
            addSysUser(teacher);

            teacherDao.save(teacher);
            //添加课程信息
            TGroup group = groupService.getDsGroup();
            TCourse course = new TCourse();
            course.setAvailable(true);
            course.setName(ConstantUtil.DS);
            course.setTeacherId(teacher.getId());
            course.setGroupId(group.getId());
            //courseDao.save(course);
            return;

        }else{
            TTeacher dbTeacher = teacherDao.findOne(teacher.getId());
            if(null ==  dbTeacher){
                throw  new RuntimeException("修改信息不存在");
            }
            teacher.setCreateTime(dbTeacher.getCreateTime());
        }
        teacherDao.save(teacher);
    }
    //新增教师信息的同时自动创建账号信息,自动绑定教师角色
    public void addSysUser(TTeacher teacher){
        //username : idcard password:idcard
        String userName = teacher.getJobNumber();
        String password = teacher.getIdcard();
        SysUser sysUser = PasswordHelper.md5Password(userName,password);
        sysUser.setNickName(teacher.getName());
        //获取角色信息
        SysRole sysRole = sysRoleDao.findByRoleCode(TEACHER_DODE);
        if(null == sysRole){
            throw new RuntimeException("教师角色不存在");
        }
        sysUser.setRoleIds(sysRole.getId()+"");
        sysUserDao.save(sysUser);
    }
    //获取各种职称的人数
    public Map<String,Integer> getNumOfLevels(){
        Map<String,Integer> map = new LinkedHashMap<String, Integer>();
        List<TTeacher> list = teacherDao.findAll();
        int sumTotal=0,preNum=0,vPreNum=0,lecNum=0,taNum=0;
        sumTotal = list.size();
        for(int i=0;i<sumTotal;i++){
            if(list.get(i).getLevel().equals("教授")){
                preNum++;
                continue;
            }
            if(list.get(i).getLevel().equals("副教授")){
                vPreNum++;
                continue;
            }
            if(list.get(i).getLevel().equals("讲师")){
                lecNum++;
                continue;
            }
            if(list.get(i).getLevel().equals("助教")){
                taNum++;
                continue;
            }
        }
        map.put("总人数:", sumTotal);
        map.put("教授:",preNum);
        map.put("副教授:",vPreNum);
        map.put("讲师:",lecNum);
        map.put("助教:",taNum);
        return map;
    }

    //获取老师性别人数,教课中的人数
    public Map<String,Integer> getNumOfSexState(){
        Map<String,Integer> map = new LinkedHashMap<String, Integer>();
        List<TTeacher> list = teacherDao.findAll();
        int manNum=0,womenNum=0,inTech=0,outTeach=0;
        for(int i=0;i<list.size();i++){
            if(list.get(i).getSex()==1){
                manNum++;
            }else{
                womenNum++;
            }
            if(list.get(i).getState()==1){
                inTech++;
            }else{
                outTeach++;
            }

        }
        map.put("男:",manNum);
        map.put("女:",womenNum);
        map.put("教课中:",inTech);
        map.put("未教课:",outTeach);
        return map;
    }
}

