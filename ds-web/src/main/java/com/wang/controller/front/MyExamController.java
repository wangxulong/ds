package com.wang.controller.front;

import com.wang.dao.RcourseStudentDao;
import com.wang.dao.TCourseStudentDao;
import com.wang.entity.RCourseStudent;
import com.wang.entity.TStudent;
import com.wang.service.TExamService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by wxl on 2016/5/11.
 */
@Controller
@RequestMapping("/front/exam/")
public class MyExamController  extends FrontController{
    @Resource
    private TCourseStudentDao tCourseStudentDao;

    @RequestMapping("index")
    public void index(HttpSession session,Model model){
        TStudent loginUser = getLoginUser(session);
        RCourseStudent rCourseStudent = tCourseStudentDao.getCourseStudent(loginUser.getId());
        model.addAttribute("score",rCourseStudent.getScore());
    }

}
