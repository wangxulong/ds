package com.wang.auth.sys.service;

import com.wang.auth.sys.entity.SysUser;
import com.wang.dao.TeacherDao;
import com.wang.entity.TTeacher;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


/**
 * Created by wxl on 2015/10/21.
 */
@Service
public class SecurityService {
    @Resource
    private  SysUserService sysUserService;
    @Resource
    private  TeacherDao teacherDao;
    public SysUser getLoginUser(){
        Subject subject = SecurityUtils.getSubject();
        String loginName = (String)subject.getPrincipal();
        return sysUserService.getByName(loginName);
    }

    public TTeacher getLoginTeacher(){
        TTeacher tTeacher;
        SysUser sysUser=getLoginUser();
        String jobNumber = sysUser.getUserName();
        tTeacher = teacherDao.findByJobNumber(jobNumber);
        return tTeacher;
    }
}
