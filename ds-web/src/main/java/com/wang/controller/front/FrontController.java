package com.wang.controller.front;

import com.wang.entity.TStudent;
import com.wang.util.ConstantUtil;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by wxl on 2016/5/12.
 */
public class FrontController {

    protected TStudent getLoginUser(HttpSession session){
        return (TStudent) session.getAttribute(ConstantUtil.STUDENT_LOGIN_FLAG);
    }

    protected String getContentRealPath(HttpServletRequest request){
        return request.getServletContext().getRealPath("/");
    }
}
