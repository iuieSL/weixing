package com.sl.weixing.service.impl;

import com.sl.weixing.entity.Chat;
import com.sl.weixing.repository.ChatRepository;
import com.sl.weixing.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by carols on 2017/5/31.
 */
@Service
public class ChatServiceImpl implements ChatService{

    @Autowired
    private ChatRepository chatRepository;

    @Override
    public void saveChat(Chat chat) {
        chatRepository.saveAndFlush(chat);
    }
}
