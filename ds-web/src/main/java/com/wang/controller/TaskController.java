package com.wang.controller;

import com.wang.dao.RcourseStudentDao;
import com.wang.dao.TCourseDao;
import com.wang.dao.TTaskDao;
import com.wang.entity.THomework;
import com.wang.form.HomeworkFormBean;
import com.wang.service.THomeworkService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**作业管理（李昌亚）
 * Created by Administrator on 2016/5/9 0009.
 */
@Controller
@RequestMapping("/task/")
public class TaskController {

    @Resource
    private THomeworkService tHomeworkService;

    @RequestMapping("index")
    public void index(Model model){
        model.addAttribute("allhomeWork",tHomeworkService.getAllTHomeWork());
    }
    //添加
    @RequestMapping("add")
    public void add(Model model){
        THomework command = new HomeworkFormBean();
        model.addAttribute("command", command);
    }
    //保存记录到数据库
    @RequestMapping(value = "save")
    public String save(HomeworkFormBean form){

        tHomeworkService.addOneHomeWork(form);
        return "redirect:/task/index";
    }
    @RequestMapping("edit/{id}")
    public String  edit(@PathVariable("id") Integer id ,Model model){

        HomeworkFormBean homeWork =tHomeworkService.homeworkToFormBean(id);
        model.addAttribute("homeWork",homeWork);
        return "task/update";
    }

    @RequestMapping("update")
    public String update(HomeworkFormBean form){
        tHomeworkService.updateOneHomeWork(form);
        return "redirect:/task/index";
    }

    @RequestMapping(value = "delete/{id}")
    public String delete(@PathVariable("id") Integer id){
        tHomeworkService.deleteOneHomeWork(id);
        return "redirect:/task/index";
    }


}
