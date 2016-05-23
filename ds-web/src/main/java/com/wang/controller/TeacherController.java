package com.wang.controller;

import com.wang.entity.TTeacher;
import com.wang.service.TeacherService;
import com.wang.util.ConstantUtil;
import org.hibernate.exception.DataException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by wxl on 2016/5/9.
 */
@Controller
@RequestMapping("/teacher/")
public class TeacherController {
    @Resource
    private TeacherService teacherService;


    @RequestMapping("index")
    public void index(Model model){
        model.addAttribute("teachers",teacherService.findAllTeacher());
    }

    @RequestMapping("add")
    public void add(Model model){
        TTeacher teacher = new TTeacher();

        model.addAttribute("command",teacher);
    }

    @RequestMapping(value = "edit/{id}",method = RequestMethod.GET)
    public String edit(Model model, @PathVariable Integer id){
        TTeacher teacher = teacherService.findById(id);
        model.addAttribute("command",teacher);
        return "teacher/add";
    }
    @RequestMapping(value = "delete/{id}")
    public String delete(Model model, @PathVariable Integer id){
        teacherService.deleteByIds(new Integer[]{id});
        return "redirect:/teacher/index";
    }
    //Integer id, String name, String idcard, String jobNumber, Integer sex, Date birthDate,Date joinDate,Date leaveDate
    @RequestMapping("save")
    public String save(Model model, TTeacher teacher){
        teacherService.addOrUpdate(teacher);
        return "redirect:/teacher/index";

    }

    //上传教学计划
    @RequestMapping(value = "{id}/plan",method = RequestMethod.GET)
    public String plan(@PathVariable Integer id,Model model){
        model.addAttribute("schedules", teacherService.getMySchedule(id));
        model.addAttribute("teacherId",id);
        return "teacher/plan";
    }

    @RequestMapping(value = "{id}/plan",method = RequestMethod.POST)
    public String addPlan(@PathVariable("id") Integer teacherId,String content,MultipartFile file,HttpServletRequest request){
        teacherService.addSchedule(teacherId,content,file,request.getServletContext().getRealPath("/")+ ConstantUtil.TEACH_PLAN_PATH);
        return "redirect:/teacher/"+teacherId+"/plan";
    }
}
