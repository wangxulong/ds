package com.wang.controller;

import com.wang.entity.TbComment;
import com.wang.service.CommentService;
import com.wang.service.RequireService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

/**
 * Created by wxl on 2016/2/27.
 */
@Controller
@RequestMapping("/comment/")
public class CommentController {

    @Resource
    private CommentService commentService;
    @Resource
    private RequireService requireService;

    @RequestMapping("question/index")
    public void index(Model model,Long contentId){
        model.addAttribute("question",requireService.findById(contentId));
        model.addAttribute("comments", commentService.getAllQuestionComment(contentId));
    }

    @RequestMapping(value = "question/add",method = RequestMethod.POST)
    public void add(Long id,Long contentId,Byte contentType,Model model){
        TbComment command = new TbComment();
        command.setContentId(contentId);
        command.setContentType(contentType);
        if(null!= id){
            command = commentService.findById(id);
        }
        model.addAttribute("command", command);
    }
    @RequestMapping(value = "question/save")
    public String saveQuestionComment(TbComment comment){
        commentService.addOrUpdateComment(comment);
        return "redirect:/comment/question/index?contentId="+comment.getContentId();
    }
    //contentId 就是question的ID
    @RequestMapping(value = "question/delete")
    public String deleteComment(Long id){
        TbComment comment = commentService.findById(id);
        if(null!=comment){

        }else{
            throw new RuntimeException("没有要删除的内容");
        }
        commentService.deleteComment(id);
        return "redirect:/comment/question/index?contentId="+comment.getContentId();
    }
}
