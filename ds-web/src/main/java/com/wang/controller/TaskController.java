package com.wang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**作业管理（李昌亚）
 * Created by Administrator on 2016/5/9 0009.
 */
@Controller
@RequestMapping("/task/")
public class TaskController {
    @RequestMapping("index")
    public void index(Model model){
    }
}
