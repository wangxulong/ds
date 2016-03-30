package com.wang.controller;

import com.wang.auth.sys.service.SysUserService;
import com.wang.dto.ResultMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by wxl on 2015/10/20.
 */
@Controller
@RequestMapping("/admin/")
public class AdminController {
    private Logger logger = LoggerFactory.getLogger(AdminController.class);
    @Resource
    private SysUserService sysUserService;
    @RequestMapping("login")
    @ResponseBody
    public ResultMessage login(String name,String password){
        ResultMessage resultMessage = new ResultMessage(ResultMessage.SUCCESS,"登陆成功");
        try{
            sysUserService.login(name,password);
        }catch (Exception e){
            logger.info(e.toString());
            resultMessage = new ResultMessage(ResultMessage.ERROR,"用户名或密码错误");
        }
        return resultMessage;
    }

    @RequestMapping("logout")
    public String logout(){
        return null;
    }

    @RequestMapping("index")
    public void index(){
    }
}
