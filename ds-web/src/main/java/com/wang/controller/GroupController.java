package com.wang.controller;

import com.wang.entity.TGroup;
import com.wang.service.GroupService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by wxl on 2016/5/9.
 */
@Controller
@RequestMapping("/group/")
public class GroupController {
    @Resource
    private GroupService groupService;


    @RequestMapping("index")
    public void index(Model model){
        model.addAttribute("command", groupService.getDsGroup());
    }
    @RequestMapping("save")
    public String save(TGroup group){
        groupService.saveOrUpdate(group);
        return "redirect:/group/index";
    }

}
