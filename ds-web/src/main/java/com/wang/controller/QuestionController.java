package com.wang.controller;

import com.alibaba.fastjson.JSON;
import com.wang.dto.QuestionDto;
import com.wang.dto.ResultMessage;
import com.wang.entity.TbRequire;
import com.wang.service.RequireService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by wxl on 2016/2/26.
 */
@Controller
@RequestMapping("/question/")
public class QuestionController {
    @Resource
    private RequireService requireService;


    @RequestMapping("index")
    public void index(Model model){
      model.addAttribute("questions", requireService.getAllQuestion());
    }

    @RequestMapping(value = "add",method = RequestMethod.POST)
    public void add(Long id,Model model){
        TbRequire command = new TbRequire();
        if(null!= id){
            command = requireService.findById(id);
        }
        model.addAttribute("command", command);
    }
    @RequestMapping(value = "save")
    public String save(TbRequire question){
        requireService.addQuestion(question);
        return "redirect:/question/index";
    }

    @RequestMapping(value = "delete")
    public String delete(Long id){
        requireService.removeQuestion(id);
        return "redirect:/question/index";
    }
    @RequestMapping(value = "hot")
    public String setHot(Long id){
        requireService.upToHot(id);
        return "redirect:/question/index";
    }

    @RequestMapping(value = "back")
    public String setNormal(Long id){
        requireService.backToNormal(id);
        return "redirect:/question/index";
    }
    @RequestMapping("ajaxHot")
    @ResponseBody
    public String getAjaxHot(){
        List<QuestionDto> hots = requireService.getHotQuestion();
        String result = JSON.toJSONString(new ResultMessage(ResultMessage.SUCCESS,"请求成功",hots));
        return result ;
    }

}
