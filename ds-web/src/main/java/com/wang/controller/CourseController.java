package com.wang.controller;

import com.wang.entity.TCourse;
import com.wang.form.CourseFormBean;
import com.wang.service.CourseService;
import com.wang.service.GroupService;
import com.wang.service.TeacherService;
import com.wang.util.ConstantUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**课程介绍
 * Created by Administrator on 2016/5/9 0009.
 */
@Controller
@RequestMapping("/course/")
public class CourseController {
    @Resource
    private CourseService courseService;
    @Resource
    private GroupService groupService;
    @Resource
    private TeacherService teacherService;
    @RequestMapping("index")
    public void index(Model model){
        String  messages = groupService.getGroupMessage();
        Map<String,Integer> map1 = teacherService.getNumOfLevels();
        Map<String,Integer> map2 = teacherService.getNumOfSexState();
        model.addAttribute("Course",courseService.getAllCourse());
        model.addAttribute("group",messages);
        model.addAttribute("teachers",teacherService.findAllTeacher());
        model.addAttribute("levelNums",map1);
        model.addAttribute("sexStateNums",map2);
    }

    //添加
    @RequestMapping("add")
    public void add(Model model){

        TCourse command = new CourseFormBean();
        model.addAttribute("command", command);
    }
    //保存记录到数据库
    @RequestMapping(value = "save")
    public String save(CourseFormBean form,HttpServletRequest request){

        courseService.addCourse(form,request.getServletContext().getRealPath("/") + ConstantUtil.TEACH_PLAN_PATH);
        return "redirect:/course/index";
    }
    @RequestMapping("edit/{id}")
    public String  edit(@PathVariable("id") Integer id ,Model model){

        CourseFormBean course =courseService.courseToFormBean(id);
        model.addAttribute("course",course);
        return "course/update";
    }
    @RequestMapping("update")
    public String update(CourseFormBean form,HttpServletRequest request){
        courseService.updateCourse(form,request.getServletContext().getRealPath("/") + ConstantUtil.TEACH_PLAN_PATH);
        return "redirect:/course/index";
    }
    @RequestMapping(value = "delete/{id}")
    public String delete(@PathVariable("id") Integer id){
        courseService.deleteCourseById(id);
        return "redirect:/course/index";
    }
//    @RequestMapping(value = "group"){
//
//    }
}
