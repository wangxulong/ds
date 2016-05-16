package com.wang.intercepter;

import com.wang.util.ConstantUtil;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by wxl on 2016/5/11.
 * 过滤学生是否登陆
 */
public class FrontUserLoginInterceptor extends HandlerInterceptorAdapter{

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();

        if(null == session.getAttribute(ConstantUtil.STUDENT_LOGIN_FLAG)){
            //用户没有登陆
            session.setAttribute("login",true);
            response.sendRedirect(request.getServletContext().getContextPath()+"/front/index");
            return false;
        }

        return super.preHandle(request, response, handler);
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        String uri =  request.getRequestURI();
        if(null != modelAndView)
            modelAndView.addObject("headerUri",uri);
        super.postHandle(request, response, handler, modelAndView);
    }
}
