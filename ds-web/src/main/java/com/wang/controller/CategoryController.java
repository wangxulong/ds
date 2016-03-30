package com.wang.controller;

import com.wang.service.CategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by wxl on 2016/3/1.
 */
@Controller
@RequestMapping("/category/")
public class CategoryController {
    @Resource
    private CategoryService categoryService;

    @RequestMapping("index")
    public void index(Model model){
        model.addAttribute("categorys",categoryService.getAllCategory());
    }
}
