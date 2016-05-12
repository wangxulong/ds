package com.wang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**课堂教学（周冀超）
 * Created by Administrator on 2016/5/9 0009.
 */
@Controller
@RequestMapping("/class/")
public class ClassController {
    @RequestMapping("index")
    public void index(Model model){
    }

    @RequestMapping("material/index")
    public void materialIndex(Model model){
    }

    @RequestMapping("request/index")
    public void requestIndex(Model model){
    }

    @RequestMapping("seminar/index")
    public void seminarIndex(Model model){
    }
}
