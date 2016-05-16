package com.wang.controller;

import com.wang.entity.THomework;
import com.wang.form.ExamFormBean;
import com.wang.form.HomeworkFormBean;
import com.wang.service.TExamService;
import com.wang.service.TStudetServeice;
import com.wang.service.TTaskService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**考试管理（刘建军）
 * Created by Administrator on 2016/5/9 0009.
 */
@Controller
@RequestMapping("/exam/")
public class ExamController {
    @Resource
    private TExamService tExamService;
    @Resource
    private TStudetServeice tStudentService;

    @RequestMapping("index")
    public void index(Model model){
        ExamFormBean command = new ExamFormBean();
        model.addAttribute("command", command);
        model.addAttribute("allStu",tStudentService.getStudentDao().findAll());
    }
    @RequestMapping(value ="upload")
    public String save(ExamFormBean command){
        tExamService.uploadExam(command);
        return "redirect:/exam/index";
    }
    @RequestMapping("search")
    @ResponseBody
    public String searchExam(){
        return "success";
    }
}
