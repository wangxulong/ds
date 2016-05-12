package com.wang.controller.front;

import com.wang.entity.THomework;
import com.wang.entity.TStudent;
import com.wang.entity.TTask;
import com.wang.form.HomeworkFormBean;
import com.wang.service.THomeworkService;
import com.wang.service.TTaskService;
import com.wang.util.ConstantUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by wxl on 2016/5/11.
 */
@Controller
@RequestMapping("/front/homework/")
public class HomeworkController extends FrontController {
    @Resource
    private TTaskService taskService;

    @Resource
    private THomeworkService homeworkService;

    @RequestMapping("index")
    public void index(HttpSession session,Model model){
        TStudent loginUser = getLoginUser(session);
        //获取任务信息
        model.addAttribute("tasks",taskService.getTaskByStudentId(loginUser.getId()));
    }

    @RequestMapping(value = "upload",method = RequestMethod.GET)
    public void upload(){

    }

//    我提交的作业

    @RequestMapping("{taskId}/my")
    public String myHomework(@PathVariable Integer taskId,Model model,HttpSession session){
        TTask task = taskService.getOnetask(taskId);
        model.addAttribute("task",task);//任务
        List<THomework> homeworks = homeworkService.getMyHomeworkByTaskId(getLoginUser(session).getId(),taskId);
        model.addAttribute("homeworks",homeworks);
        return "front/homework/myHomework";
    }
    //上传作业
    @RequestMapping(value = "upload",method = RequestMethod.POST)
    public String doPost(HomeworkFormBean homeworkFormBean,HttpSession session,HttpServletRequest request){
        homeworkFormBean.setStudentId(getLoginUser(session).getId());
        homeworkService.addOneHomeWork(homeworkFormBean,getContentRealPath(request)+ConstantUtil.STUDENT_HOMEWORK_PATH);
        return "redirect:/front/homework/index";
    }


    @RequestMapping(value = "upload/{taskId}",method = RequestMethod.GET)
    public String homeworkUpload(@PathVariable Integer taskId,Model model){
        TTask task = taskService.getOnetask(taskId);
        checkTask(task);
        model.addAttribute("task", task);
        return "/front/homework/upload";
    }

    private void checkTask(TTask task){
        if(null==task){
            throw new RuntimeException("任务不存在");
        }
        if(null!=task.getEndTime()&&task.getEndTime().getTime()<new Date().getTime()){
            throw new RuntimeException("晚了八百年了");
        }
    }


}
