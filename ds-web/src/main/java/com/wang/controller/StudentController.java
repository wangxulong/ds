package com.wang.controller;

import com.wang.entity.TStudent;
import com.wang.entity.TTeacher;
import com.wang.service.StudentService;
import com.wang.service.TeacherService;
import com.wang.util.ConstantUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by wxl on 2016/5/9.
 */
@Controller
@RequestMapping("/student/")
public class StudentController  {
    @Resource
    private StudentService studentService;
    @Resource
    private TeacherService teacherService;

    private Map<String,Object> wrapRequest(HttpServletRequest request){
        Map<String,Object> params = new HashMap();
        Enumeration<String> names = request.getParameterNames();
        while (names.hasMoreElements()){
            String name = names.nextElement();
            Object value = request.getParameter(name);
            params.put(name,value);
        }
        params.put("pageSize", ConstantUtil.PAGE_SIZE);
        if(!params.containsKey("currentPage")){
            params.put("currentPage",ConstantUtil.FIRST);
        }
        return params;
    }

    @RequestMapping("index")
    public void index(Model model,HttpServletRequest request){
        Map<String,Object> params = wrapRequest(request);
        model.addAttribute("pager",studentService.dynamicSearch(params));
    }

    @RequestMapping("add")
    public void add(Model model){
        TStudent student = new TStudent();
        model.addAttribute("command",student);
    }

    @RequestMapping(value = "edit/{id}",method = RequestMethod.GET)
    public String edit(Model model, @PathVariable Integer id){
        TStudent student = studentService.findById(id);
        model.addAttribute("command",student);
        return "student/add";
    }
    @RequestMapping(value = "delete/{id}")
    public String delete(Model model, @PathVariable Integer id){
        studentService.deleteByIds(new Integer[]{ id });
        return "redirect:/student/index";
    }


    @RequestMapping("save")
    public String save(Model model, TStudent student){
        studentService.addOrUpdate(student);
        return "redirect:/student/index";

    }
}
