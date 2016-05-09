package com.wang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**课程介绍（吴明）
 * Created by Administrator on 2016/5/9 0009.
 */
@Controller
@RequestMapping("/course/")
public class CourseController {
    @RequestMapping("index")
    public void index(Model model){
    }
}
