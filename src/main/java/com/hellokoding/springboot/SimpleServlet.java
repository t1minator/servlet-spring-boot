package com.hellokoding.springboot;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@WebServlet(urlPatterns = {"/home"}, name="SimpleServlet", initParams = {@WebInitParam(name = "ProductName", value="Welcome Application")})
@Controller
public class SimpleServlet {
    String appName = "My Application";

    
    @RequestMapping(value="/home", method=RequestMethod.GET)
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        if(name != null) {
            resp.setContentType("text/xml");
            resp.getWriter().printf("<application>" +
                    "<name>Hello %s</name>" +
                    "<product>%s</product>" +
                    "</application>", name, appName);
        } else {
            throw new ServletException("A name should be entered");
        }
    }

    @RequestMapping(value="/home", method=RequestMethod.POST)
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        if(name != null && name != ""){
            resp.getWriter().printf("Hello %s", name);
        } else {
            resp.sendRedirect("/");
        }
    }
}
