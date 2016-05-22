package com.wang.controller.front;

import com.wang.entity.TSeminar;
import com.wang.entity.TStudent;
import com.wang.service.SeminarService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by wxl on 2016/5/11.
 */
@Controller
@RequestMapping("/front/discuss/")
public class DiscussController extends FrontController {
    @Resource
    private SeminarService seminarService;
    @RequestMapping("index")
    public void index(){
    }

    @RequestMapping(value = "join",method= RequestMethod.GET)
    public void join(Model model,HttpSession session){
        TStudent student = getLoginUser(session);

        List<TSeminar> seminars = seminarService.getAvailableSeminar(student.getId());
        model.addAttribute("seminars",seminars);
    }

    @RequestMapping(value = "upload")
    public void upload(){

    }
}
