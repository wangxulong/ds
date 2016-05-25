package com.wang.controller.front;

import com.wang.dto.MyJoinedTopicDto;
import com.wang.entity.RStudentTopic;
import com.wang.entity.TSeminar;
import com.wang.entity.TStudent;
import com.wang.service.SeminarService;
import com.wang.service.StudentTopicService;
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
@RequestMapping("/front/discuss/")
public class DiscussController extends FrontController {
    @Resource
    private SeminarService seminarService;
    @Resource
    private StudentTopicService studentTopicService;
    @RequestMapping("index")
    public void index(HttpSession session,Model model){
        TStudent loginUser = getLoginUser(session);
        List<MyJoinedTopicDto>  myTopics = studentTopicService.getMyJoinedTopic(loginUser.getId());
        model.addAttribute("now",new Date().getTime());
        model.addAttribute("myTopics",myTopics);
    }

    @RequestMapping(value = "join",method= RequestMethod.GET)
    public void join(Model model,HttpSession session){
        TStudent student = getLoginUser(session);
        List<TSeminar> seminars = seminarService.getAvailableSeminar(student.getId());
       // RStudentTopic studentTopic = studentTopicService.findByTopicId(student.getId(),topc)
        model.addAttribute("seminars",seminars);
    }

    @RequestMapping(value = "{id}/upload",method = RequestMethod.GET)
    public String upload(@PathVariable Integer id,Model model){
        model.addAttribute("id",id);
        return "/front/discuss/upload";
    }
    @RequestMapping(value = "{id}/upload",method = RequestMethod.POST)
    public String doUpload(@PathVariable Integer id,MultipartFile file,HttpServletRequest request){
        studentTopicService.add(file,id,getContentRealPath(request)+"/"+ ConstantUtil.STUDENT_TOPIC_PATH);
        return "redirect:/front/discuss/index";
    }

    @RequestMapping(value = "{topicId}/join")
    public String doJoin(@PathVariable Integer topicId,HttpSession session){
        TStudent loginUser = getLoginUser(session);
        studentTopicService.joinTopic(loginUser.getId(),topicId);
        return "redirect:/front/discuss/index";
    }
    @RequestMapping(value = "{id}/delete")
    public String unJoin(@PathVariable Integer id){
        studentTopicService.deleteMyTopic(id);
        return "redirect:/front/discuss/index";
    }
}
