package com.sl.weixing.service.impl;

import com.sl.weixing.service.ChatService;
import com.sl.weixing.service.GetService;
import com.sl.weixing.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by carols on 2017/5/31.
 */
public class GetServiceImpl implements GetService{

    @Autowired
    public  UserService userService;

    @Autowired
    public  ChatService chatService;

    public UserService getUserService() {
        return userService;
    }

    public ChatService getChatService() {
        return chatService;
    }
}
