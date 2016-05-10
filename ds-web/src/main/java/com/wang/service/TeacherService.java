package com.wang.service;


import com.wang.auth.sys.dao.SysRoleDao;
import com.wang.auth.sys.dao.SysUserDao;
import com.wang.auth.sys.entity.SysRole;
import com.wang.auth.sys.entity.SysUser;
import com.wang.auth.sys.service.SysUserService;
import com.wang.dao.TeacherDao;
import com.wang.entity.TTeacher;
import com.wang.util.PasswordHelper;
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
    //老师角色
    private static String TEACHER_DODE="teacher";
    @Resource
    private TeacherDao teacherDao;
    @Resource
    private SysUserDao sysUserDao;
    @Resource
    private SysRoleDao sysRoleDao;

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

}

