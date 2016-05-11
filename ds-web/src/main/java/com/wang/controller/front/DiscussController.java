package com.wang.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by wxl on 2016/5/11.
 */
@Controller
@RequestMapping("/front/discuss/")
public class DiscussController {
    @RequestMapping("index")
    public void index(){
    }

    @RequestMapping(value = "join")
    public void join(){

    }

    @RequestMapping(value = "upload")
    public void upload(){

    }
}
