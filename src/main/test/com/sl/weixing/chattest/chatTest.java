package com.sl.weixing.chattest;

import com.sl.weixing.entity.Chat;
import com.sl.weixing.entity.User;
import com.sl.weixing.service.ChatService;
import com.sl.weixing.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by 莉 on 2017/6/3.
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class chatTest {

    @Autowired
    private ChatService chatService;

    @Autowired
    private UserService userService;

    @Test
    public void test(){

       Chat chat=new Chat();
        chat.setIds(String.valueOf(Calendar.getInstance().getTimeInMillis()));
       chat.setShowTime(false);
       chat.setHasSend(false);
       chat.setChatValue("1234343");
        User fromUser=userService.findUserById(1);
       chat.setFromUser(fromUser);
        Set<User> userSets=new HashSet<>();
        userSets.add(userService.findUserById(2));
        chat.setToUsers(userSets);
        chat.setSendTime(new Date());
        chat.setType("123456");
        chatService.saveChat(chat);
    }

}
