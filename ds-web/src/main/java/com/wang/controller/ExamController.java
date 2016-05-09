package com.wang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**考试管理（刘建军）
 * Created by Administrator on 2016/5/9 0009.
 */
@Controller
@RequestMapping("/exam/")
public class ExamController {
    @RequestMapping("index")
    public void index(Model model){
    }
}
