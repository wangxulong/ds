package com.wang.controller;

import com.alibaba.fastjson.JSONObject;
import com.wang.entity.TExam;
import com.wang.entity.THomework;
import com.wang.form.ExamFormBean;
import com.wang.form.HomeworkFormBean;
import com.wang.form.RCourseStudentFormBean;
import com.wang.service.ScoreService;
import com.wang.service.TExamService;
import com.wang.service.TStudetServeice;
import com.wang.service.TTaskService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

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
    @Resource
    private ScoreService scoreService;

    //访问考试管理主页
    @RequestMapping("index")
    public void index(Model model){
        ExamFormBean command = new ExamFormBean();
        model.addAttribute("command", command);
       /* List<RCourseStudentFormBean> allStuScore=scoreService.getRCourseStudentInfo();
        model.addAttribute("allStuScore",scoreService.getRCourseStudentInfo());*/

    }

    //上传考试试卷
    @RequestMapping(value ="upload")
    public String save(ExamFormBean command){
        tExamService.uploadExam(command);
        return "redirect:/exam/index";
    }
    //获取所有的课程信息
    @RequestMapping("history")
    public String history(Model model){
        List<ExamFormBean> exams=tExamService.getAllExams();
        model.addAttribute("exams",exams);
        return "exam/history";
    }
    //验证考试是否上传
    @RequestMapping("search")
    @ResponseBody
    public String searchExam(String jsonString){
        System.err.println(jsonString);
        JSONObject jsonObject=JSONObject.parseObject(jsonString);
        int year=Integer.parseInt(jsonObject.getString("year"));
        int term=Integer.parseInt(jsonObject.getString("term"));
        int type=Integer.parseInt(jsonObject.getString("type"));
        boolean flag=tExamService.searchExist(year,term,type);
        if(flag) {
            return "success";
        }
        return "fail";
    }

    @RequestMapping("edit")
    public String editExam(Integer id,Integer type,Model model){
        TExam tExam=tExamService.getExamById(id);
        ExamFormBean form=new ExamFormBean();
        BeanUtils.copyProperties(tExam,form);
        form.setExamTypeId(type);
        model.addAttribute("exam",form);
        return "exam/update";
    }

    @RequestMapping("update")
    public String updateExam(ExamFormBean form,Model model){
        tExamService.updateExam(form);
        List<ExamFormBean> exams=tExamService.getAllExams();
        model.addAttribute("exams",exams);
        return "exam/history";
    }
    @RequestMapping("delete")
    public String deleteExam(Integer id,Integer type,Model model){
        tExamService.deletExam(id,type);
        List<ExamFormBean> exams=tExamService.getAllExams();
        model.addAttribute("exams",exams);
        return "exam/history";
    }
}
