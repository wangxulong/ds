package com.wang.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wxl on 2016/5/11.
 */
@Controller
@RequestMapping("/front/leave/")
public class LeaveController {
    @RequestMapping("index")
    public void index(){
    }

    @RequestMapping(value = "submit")
    public void submit(){

    }


}
