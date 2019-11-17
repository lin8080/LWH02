package com.lwh.controller;

import com.lwh.pojo.User;
import com.lwh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController {

        @Autowired
        UserService userService;


        //进入login页面
        @RequestMapping("/login")
        public String userlogin(){
        return "login";
        }

       //执行login操作，匹配用户名和密码，建立session持久连接
        @RequestMapping(value="/login",method = RequestMethod.POST)
        public String login(User useradmin, Model model,HttpServletRequest request){
            String loginname = request.getParameter("name");
            String loginpass = request.getParameter("password");
            User user = new User();
            user.setUsername(loginname);
            user.setPassword(loginpass);

            User userLogin = userService.getLogin(user);
            if(userLogin!=null){
                model.addAttribute(useradmin);
                request.getSession(true).setAttribute("useradmin",useradmin);
                return "redirect:/main.jsp";
            }else{
                model.addAttribute("message","登录名或密码错误！");
                return "error";
            }
        }


    }
