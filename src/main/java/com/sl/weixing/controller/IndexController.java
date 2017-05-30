package com.sl.weixing.controller;

import com.sl.weixing.entity.User;
import com.sl.weixing.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by carols on 2017/5/26.
 */
@Controller
public class IndexController {

    @Autowired
    private UserService userServiceImpl;

    @RequestMapping("/index")
    public String index(HttpServletRequest request) {
        List<User> userList=userServiceImpl.getAllUser();
        request.getSession().setAttribute("userList",userList);
        return "index";
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(@RequestParam("userId") Integer userId, HttpServletRequest request){
        if(userId != null){
             User user=userServiceImpl.findUserById(userId);
             request.getSession().setAttribute("user",user);
        }
        return "chat";
    }
}
