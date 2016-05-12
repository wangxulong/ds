package com.wang.intercepter;

import com.wang.auth.sys.entity.SysUser;
import com.wang.auth.sys.service.SysResourceService;
import com.wang.auth.sys.service.SysUserService;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by wxl on 2015/10/20.
 */
public class UserInfoInterceptor extends HandlerInterceptorAdapter {
    @Resource
    private SysUserService sysUserService;
    @Resource
    private SysResourceService sysResourceService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        SysUser user = sysUserService.getCurrentUser();
        if(null == user){
            String path = request.getServletContext().getContextPath();
            response.sendRedirect(path);
            return false;
        }
        return super.preHandle(request, response, handler);
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse reponse, Object o, ModelAndView modelAndView) throws Exception {
        SysUser user = sysUserService.getCurrentUser();

        if(null!=modelAndView && null !=user){
            modelAndView.addObject("loginUser",user);
            modelAndView.addObject("myMenus",sysResourceService.getMyMenus());
        }


    }

}
