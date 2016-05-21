package com.wang.controller.front;

import com.wang.controller.front.FrontController;
import com.wang.entity.TLeave;
import com.wang.entity.TNote;
import com.wang.entity.TStudent;
import com.wang.entity.enums.LeaveState;
import com.wang.service.LeaveService;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.wang.service.NoteService;
import com.wang.util.ConstantUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/front/leave/")
public class LeaveController extends FrontController {
    @Resource
    private LeaveService leaveService;
    @Resource
    private NoteService noteService;
    public LeaveController() {
    }

    @RequestMapping("index")
    public void index(Model model, HttpSession session) {
        TStudent loginStudent = this.getLoginUser(session);
       //  model.addAttribute("state", LeaveState.values());
        model.addAttribute("notes", noteService.getByStudentId(getLoginUser(session).getId()));
    }

    @RequestMapping(value = "submit",method = RequestMethod.GET)
    public void submit() {
    }

    @RequestMapping(value = "submit",method = RequestMethod.POST)
    public String doPost(MultipartFile file, TNote note, HttpSession session, HttpServletRequest request) {
        TStudent loginUser = getLoginUser(session);
        noteService.add(file, note, loginUser.getId(), getContentRealPath(request) + ConstantUtil.LEAVE_PATH);
        return "redirect:index";
    }
}

