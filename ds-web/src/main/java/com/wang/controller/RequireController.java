package com.wang.controller;

import com.wang.entity.TbRequire;
import com.wang.service.CategoryService;
import com.wang.service.RequireService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by wxl on 2016/3/1.
 */
@Controller
@RequestMapping("/require/")
public class RequireController {

    @Resource
    private RequireService requireService;
    @Resource
    private CategoryService categoryService;


    @RequestMapping("index")
    public void index(Model model){
        model.addAttribute("requires", requireService.getAllRequire());
    }

    @RequestMapping("add")
    public void add(Long id,Model model){

        TbRequire command = new TbRequire();
        if(null !=id){
           command = requireService.findById(id);
        }
        model.addAttribute("categorys",categoryService.getFirstLevelCategory()) ;
        model.addAttribute("command",command);
    }

    @RequestMapping("save")
    public String  save(HttpServletRequest request, MultipartFile pic,TbRequire require){
        requireService.addRequire(request,pic,require);
        return "redirect:/require/index";
    }

    @RequestMapping(value = "delete")
    public String delete(Long id){
        requireService.remove(id);
        return "redirect:/require/index";
    }
    @RequestMapping(value = "hot")
    public String setHot(Long id){
        requireService.upToHot(id);
        return "redirect:/require/index";
    }

    @RequestMapping(value = "back")
    public String setNormal(Long id){
        requireService.backToNormal(id);
        return "redirect:/require/index";
    }

}
