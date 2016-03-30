package com.wang.controller;

import com.alibaba.fastjson.JSON;
import com.wang.auth.sys.entity.SysResource;
import com.wang.auth.sys.enumeration.SysResourceType;
import com.wang.auth.sys.service.SysResourceService;
import com.wang.dto.TreeDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by wxl on 2015/10/22.
 */
@Controller
@RequestMapping("/sys/res/")
public class SysResourceController {
    @Resource
    private SysResourceService sysResourceService;

    @RequestMapping("index")
    public void index(Model model){
        model.addAttribute("menus",sysResourceService.getMenuList());
    }

    @RequestMapping(value = "add",method = RequestMethod.POST)
    public void add(Long parentId,String type,Model model){
        SysResource command = new SysResource();
        command.setParentId(parentId);
        command.setType(SysResourceType.valueOf(type.toUpperCase()));
        if(null!=parentId){
            //command =查询数据库
        }

        model.addAttribute("command", command);
    }

    @RequestMapping("save")
    public String save(SysResource sysResource){
        sysResourceService.addSysRes(sysResource);
        return "redirect:/sys/res/index";
    }
    @RequestMapping("delete")
    public String delete(Long... id){
        sysResourceService.deleteRes(id);
        return "redirect:/sys/res/index";
    }

    @RequestMapping(value = "addButton",method = RequestMethod.POST)
    public void addButton(Long parentId,Model model){
        model.addAttribute("menu", sysResourceService.getButtonByMenu(parentId));
    }

    @RequestMapping("ajaxTree")
    @ResponseBody
    public String ajaxTree(Long parentId,Long roleId){
        List<TreeDto> treeData= sysResourceService.getRoleResTree(parentId,roleId);
        return JSON.toJSONString(treeData);
    }

}
