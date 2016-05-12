package com.wang.controller.front;

import com.wang.auth.sys.service.SysUserService;
import com.wang.dto.ResultMessage;
import com.wang.entity.TStudent;
import com.wang.service.GroupService;
import com.wang.service.StudentService;
import com.wang.util.ConstantUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.format.TextStyle;

/**
 * Created by wxl on 2015/10/20.
 */
@Controller
@RequestMapping("/front/")
public class IndexController {

    @Resource
    private StudentService studentService;
    @Resource
    private GroupService groupService;

    @RequestMapping("index")
    public void index(Model model){
        model.addAttribute("group",groupService.getDsGroup());
    }

    @RequestMapping("login")
    @ResponseBody
    public ResultMessage login(String name,String password,HttpSession session){
        TStudent student = studentService.login(name,password);
        if(null == student){
            //登录失败
            return new ResultMessage(ResultMessage.ERROR,"用户名或密码错误");
        }else{
            session.setAttribute(ConstantUtil.STUDENT_LOGIN_FLAG,student);
            return new ResultMessage(ResultMessage.SUCCESS,"登录成功");

        }
    }

    @RequestMapping("logout")
    public String logout(HttpSession session){
        Object loginStudent =  session.getAttribute(ConstantUtil.STUDENT_LOGIN_FLAG);
        if(null != loginStudent){
            session.removeAttribute(ConstantUtil.STUDENT_LOGIN_FLAG);
        }
        return "redirect:/front/index";
    }
}
