package com.sl.weixing.websocket;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

/**
 * Created by 莉 on 2017/5/27.
 */
@ServerEndpoint(value = "/websocket")
@Component
public class ChatWebSocketHandler extends TextWebSocketHandler {

    @OnOpen
    public void onOpen(){

    }


}
