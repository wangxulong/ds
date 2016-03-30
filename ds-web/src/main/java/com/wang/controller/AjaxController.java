package com.wang.controller;

import com.wang.auth.sys.entity.SysUser;
import com.wang.auth.sys.service.SysUserService;
import com.wang.dto.CommentDto;
import com.wang.dto.QuestionDto;
import com.wang.dto.RequireDto;
import com.wang.dto.ResultMessage;
import com.wang.service.CommentService;
import com.wang.service.RequireService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by wxl on 2016/2/26.
 */
@Controller
@RequestMapping("/ajax/")
public class AjaxController {
    @Resource
    private RequireService requireService;
    @Resource
    private CommentService commentService;
    @Resource
    private SysUserService sysUserService;

    //获取热点问答
    @RequestMapping("login")
    @ResponseBody
    public ResultMessage login(String name,String password){
       SysUser sysUser= sysUserService.getUserByNameAndPass(name, password);
        if(null == sysUser) return new ResultMessage(ResultMessage.ERROR,"登陆失败");
        return new ResultMessage(ResultMessage.SUCCESS,"success",sysUser);
    }

    //获取热点问答
    @RequestMapping("hotQuestion")
    @ResponseBody
    public ResultMessage getAjaxHot(){
        List<QuestionDto> hots = requireService.getHotQuestion();
        return new ResultMessage(ResultMessage.SUCCESS,"请求成功",hots);
    }
    //
    @RequestMapping("laterQuestion")
    @ResponseBody
    public ResultMessage getLaterQuestion(){
        List<QuestionDto> laters = requireService.getLaterQuestion();
        return new ResultMessage(ResultMessage.SUCCESS,"请求成功",laters);
    }
    //通过ID获取问答
    @RequestMapping("question")
    @ResponseBody
    public ResultMessage getQuestionById(Long id){
        QuestionDto questionDto = requireService.getQuestionById(id);
        return new ResultMessage(ResultMessage.SUCCESS,"请求成功",questionDto);
    }

    //获取问答上的回复
    @RequestMapping("question/comment")
    @ResponseBody
    public ResultMessage getQuestionComments(Long id){
        List<CommentDto> comments = commentService.getAllQuestionComment(id);
        return new ResultMessage(ResultMessage.SUCCESS,"请求成功",comments);
    }

    //添加回复  id:用户Id  contentId 问答ID  content 问答内容
    @RequestMapping("question/reply")
    @ResponseBody
    public ResultMessage replyQuestion(Long userId,Long contentId,String content){
        boolean flag = commentService.ajaxAddQuestionComment(userId,contentId,content);
        return new ResultMessage(ResultMessage.SUCCESS,"添加问答回复成功");
    }


    //获取热点需求
    @RequestMapping("require/hot")
    @ResponseBody
    public ResultMessage hotRequire(){
        List<RequireDto> results = requireService.getHotRequire();
        return new ResultMessage(ResultMessage.SUCCESS,"获取成功",results);
    }


}
