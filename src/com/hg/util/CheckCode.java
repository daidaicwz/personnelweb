package com.hg.util;



import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;
import cn.hutool.captcha.ShearCaptcha;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/CheckCode")
public class CheckCode extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LineCaptcha lineCaptcha = CaptchaUtil.createLineCaptcha(100, 38,4,15);
        lineCaptcha.write((response.getOutputStream()));
        HttpSession session = request.getSession();
        String checkcodeSession = lineCaptcha.getCode();
        session.setAttribute("checkcodeSession",checkcodeSession);
        System.out.println("验证码："+checkcodeSession);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
