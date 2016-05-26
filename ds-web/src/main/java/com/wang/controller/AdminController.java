package com.wang.controller;

import com.wang.auth.sys.entity.SysUser;
import com.wang.auth.sys.service.SecurityService;
import com.wang.auth.sys.service.SysUserService;
import com.wang.dto.ResultMessage;
import com.wang.util.PasswordHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
    @Resource
    private SecurityService securityService;
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
    @RequestMapping(value = "password",method = RequestMethod.GET)
    public void password(){

    }
    @RequestMapping(value = "password",method = RequestMethod.POST)
    public String doPassword(Model model,String password,String newPassword){
        SysUser loginUser = securityService.getLoginUser();
        boolean isPassword =  PasswordHelper.checkMd5Password(loginUser.getUserName(), password, loginUser.getSalt(), loginUser.getPassword());
        ResultMessage resultMessage = new ResultMessage(ResultMessage.SUCCESS,"修改密码成功");
        if(isPassword){
            sysUserService.updateUser(loginUser.getId(),null,newPassword);
        }else{
            resultMessage = new ResultMessage(ResultMessage.ERROR,"原密码不正确");
        }
        model.addAttribute("resultMessage",resultMessage);

        return "/admin/password";
    }
}
