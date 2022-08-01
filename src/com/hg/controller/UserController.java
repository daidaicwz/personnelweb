package com.hg.controller;

import com.hg.pojo.Counts;
import com.hg.pojo.User;
import com.hg.service.CountsService;
import com.hg.service.UserService;
import com.hg.service.UserServiceImp1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private CountsService countsService;

    @RequestMapping("/login")
    public String login(String username, String password, String checkcode, HttpServletRequest request){
        HttpSession session = request.getSession();
        String checkcodeSession = (String)session.getAttribute("checkcodeSession");
        String loginInfo = "验证码错误";
        if (checkcode.equalsIgnoreCase(checkcodeSession)){
            User user = userService.login(username,password);
            if (user!=null){
                Counts counts = countsService.selectCounts();
                HttpSession session1=request.getSession();
              session1.setAttribute("user",user);
                session.setAttribute("counts",counts);
              return "main";
            }else {
                loginInfo = "用户名或密码错误！";
            }

        }
        request.setAttribute("loginInfo",loginInfo);
        return "index";

    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){

        HttpSession session = request.getSession();
        session.setAttribute("user",null);
        session.setMaxInactiveInterval(0);

        return "index";
    }

    @RequestMapping("/registerUser")
    @ResponseBody
    public String register(String json){
        System.out.println("json==="+json);
        return "true";
    }

}
