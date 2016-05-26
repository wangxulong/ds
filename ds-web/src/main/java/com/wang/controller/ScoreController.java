package com.wang.controller;

import com.alibaba.fastjson.JSONObject;
import com.wang.form.ExamFormBean;
import com.wang.form.RCourseStudentFormBean;
import com.wang.service.ScoreService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by liu on 2016/5/26.
 */
@Controller
@RequestMapping("/score/")
public class ScoreController {

    @Resource
    private ScoreService scoreService;

    @ResponseBody
    @RequestMapping("usual")
    public String setUsualScore(String jsonString){
        JSONObject jsonObject=JSONObject.parseObject(jsonString);
        int topicPercent=Integer.parseInt(jsonObject.getString("topicPercent"));
        int homeworkPercent=Integer.parseInt(jsonObject.getString("homeworkPercent"));
        boolean flag=scoreService.setTeachersStudentUsualScore(topicPercent,homeworkPercent);
        if(flag)
            return "success";
        return "fail";
    }

    @RequestMapping("list")
    public String setExamScore(Model model){
        model.addAttribute("allStuScore",scoreService.getRCourseStudentInfo());
        return "exam/score";
    }

    @ResponseBody
    @RequestMapping("saveScore")
    public String saveScore(String jsonData){
        boolean flag=scoreService.saveStudentsScores(jsonData);
        if(flag)
            return "success";
        else
            return "fail";
    }
}
