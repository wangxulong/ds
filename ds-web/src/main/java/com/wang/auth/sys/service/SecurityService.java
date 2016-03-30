package com.wang.auth.sys.service;

import com.wang.auth.sys.entity.SysUser;
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
    public SysUser getLoginUser(){
        Subject subject = SecurityUtils.getSubject();
        String loginName = (String)subject.getPrincipal();
        return sysUserService.getByName(loginName);
    }
}
