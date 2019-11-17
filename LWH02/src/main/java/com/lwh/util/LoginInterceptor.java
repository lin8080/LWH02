package com.lwh.util;

import com.lwh.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    //重写了HandlerInterceptor的接口，三个方法，这里只用preHandle()方法，
    //preHandle()方法，boolean布尔类型，false表示请求结束，true代表继续执行（如果是最后一个拦截器那么就会调用当前controller的方法
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        // 获取请求的地址，登录的页面免拦截，
        String uri = request.getRequestURI();

        // 其他情况判断session中是否有key，有的话继续用户的操作
        if(request.getSession() != null && request.getSession().getAttribute("useradmin") != null) {
            return true;
        }

        // 允许登录页面访问
        if(uri.indexOf("/login") >= 0 ) {
                return true;
        }

        // 未登录时返回到登录页面
        request.setAttribute("msg","还没登陆！快去登陆啊！");
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);

        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
