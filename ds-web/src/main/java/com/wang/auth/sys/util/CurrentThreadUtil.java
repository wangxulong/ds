package com.wang.auth.sys.util;

import com.wang.auth.sys.entity.SysUser;
import com.wang.auth.sys.service.SysUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * Created by wxl on 2015/10/18.
 */
@Component
public class CurrentThreadUtil {
    @Resource
    private  SysUserService sysUserService;
    private final static ThreadLocal<SysUser> currentUser=new ThreadLocal<SysUser>();

    public SysUser getCurrentUser(){
        SysUser sysUser = currentUser.get();
        if(null==sysUser){
            Subject subject = SecurityUtils.getSubject();
            if (subject.isAuthenticated()) {
                sysUser = sysUserService.getByName((String)subject.getPrincipal());
                currentUser.set(sysUser);
            }
        }
        return sysUser;
    }

    public void setCurrentUser(SysUser sysUser){
        if(null!=currentUser.get()){
            currentUser.remove();
        }
        currentUser.set(sysUser);
    }


}
