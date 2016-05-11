package com.wang.controller.front;

import com.wang.entity.TStudent;
import com.wang.service.StudentService;
import com.wang.util.ConstantUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by wxl on 2016/5/11.
 */
@Controller
@RequestMapping("/front/user/")
public class UserController {
    @Resource
    private StudentService studentService;

    @RequestMapping("index")
    public void userCenter(HttpSession session,Model model){
      model.addAttribute("student", session.getAttribute(ConstantUtil.STUDENT_LOGIN_FLAG)) ;
    }

    @RequestMapping("account")
    public void userCenterAccount(){

    }

    @RequestMapping("account/change")
    public String changePassword(String password,String newPassword,Model model,HttpSession session){
        TStudent student = (TStudent) session.getAttribute(ConstantUtil.STUDENT_LOGIN_FLAG);
        model.addAttribute("resultMessage", studentService.changePassword(password,newPassword,student));
        return "front/user/account";
    }






}
