package com.wang.controller;

import com.wang.entity.TTask;
import com.wang.form.TaskFormBean;
import com.wang.service.TTaskService;
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
    private TTaskService tTaskService;

    @RequestMapping("index")
    public void index(Model model){
        model.addAttribute("allTask",tTaskService.getAllTask());
    }
    //添加
    @RequestMapping("add")
    public void add(Model model){

        TTask command = new TaskFormBean();
        model.addAttribute("command", command);
    }
    //保存记录到数据库
    @RequestMapping(value = "save")
    public String save(TaskFormBean form){

        tTaskService.addOneTask(form);
        return "redirect:/task/index";
    }
    @RequestMapping("edit/{id}")
    public String  edit(@PathVariable("id") Integer id ,Model model){

        TaskFormBean task =tTaskService.taskToFormBean(id);
        model.addAttribute("task",task);
        return "task/update";
    }

    @RequestMapping("update")
    public String update(TaskFormBean form){
        tTaskService.updateOneTask(form);
        return "redirect:/task/index";
    }

    @RequestMapping(value = "delete/{id}")
    public String delete(@PathVariable("id") Integer id){
        tTaskService.deleteOneTask(id);
        return "redirect:/task/index";
    }


}
