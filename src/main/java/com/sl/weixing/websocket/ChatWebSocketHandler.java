package com.sl.weixing.websocket;

import com.sl.weixing.entity.Chat;
import com.sl.weixing.entity.User;
import com.sl.weixing.enumeration.ChatTypeEnum;
import com.sl.weixing.service.ChatService;
import com.sl.weixing.service.UserService;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.*;

import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;



/**
 * Created by 莉 on 2017/5/27.
 */
@ServerEndpoint(value = "/websocket")
@Component
public class ChatWebSocketHandler implements WebSocketHandler {

    private static final ArrayList<WebSocketSession> users = new ArrayList<WebSocketSession>();

    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    private static boolean isShowTime = true;

    private static String username;

    @Autowired
    private UserService userService;

    private ChatService chatService;

    /**
     * 建立连接
     * @param webSocketSession
     * @throws Exception
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession webSocketSession) throws Exception {
        users.add(webSocketSession);
    }

    /**
     * 发送消息
     * @param webSocketSession
     * @param webSocketMessage
     * @throws Exception
     */
    @Override
    public void handleMessage(WebSocketSession webSocketSession, WebSocketMessage<?> webSocketMessage) throws Exception {
        username = (String) webSocketSession.getAttributes().get("username");
        JSONObject message = webSocketMessageChangeJSONObject(webSocketMessage);
        User toUser = userService.findUserById(Integer.valueOf(message.get("toUsers").toString()));
        sendMessage(toUser,message);
        saveChat(message);
    }

    /**
     *发送消息给固定的人
     * @param toUser
     * @param message
     */
    private void sendMessage(User toUser,JSONObject message) throws JSONException {
        String toUserName=toUser.getUserName();
        for (WebSocketSession user : users) {
            String name = "";
            Object str = user.getAttributes().get("username");
            if (str != null)
                name = (String) str;
            if (name.equals(username)){
                message.put("isSelf", true);
            }else if(name.equals(toUserName)){
                message.put("isSelf", false);
            }
            if (name.trim().equals(toUserName)||name.trim().equals(username)) {
                try {
                    if (user.isOpen()) {
                        user.sendMessage(new TextMessage(message.toString()));
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * 保存发送的对话
     * @param message
     * @throws JSONException
     */
    private void saveChat(JSONObject message) throws JSONException {
        Chat chat=new Chat();
        chat.setChatValue(message.get("content").toString());
        chat.setSendTime(new Date());
        String chatType=message.get("type").toString();
        if(ChatTypeEnum.WORD_TYPE.getValue().equals(chatType)){
            chat.setType(ChatTypeEnum.WORD_TYPE);
        }else if(ChatTypeEnum.FILE_TYPE.getValue().equals(chatType)){
            chat.setType(ChatTypeEnum.FILE_TYPE);
        }else if(ChatTypeEnum.IMAGE_TYPE.getValue().equals(chatType)){
            chat.setType(ChatTypeEnum.IMAGE_TYPE);
        }
        User fromUser= userService.findUserByName(message.get("nickname").toString());
        User toUser = userService.findUserById(Integer.valueOf(message.get("toUsers").toString()));
        Set<User> toUsers=new HashSet<>();
        toUsers.add(toUser);
        chat.setFromUser(fromUser);
        chat.setToUsers(toUsers);
        chatService.saveChat(chat);
    }

    /**
     * 消息传输错误
     * @param webSocketSession
     * @param throwable
     * @throws Exception
     */
    @Override
    public void handleTransportError(WebSocketSession webSocketSession, Throwable throwable) throws Exception {
        users.remove(webSocketSession);
    }

    /**
     * 关闭连接
     * @param webSocketSession
     * @param closeStatus
     * @throws Exception
     */
    @Override
    public void afterConnectionClosed(WebSocketSession webSocketSession, CloseStatus closeStatus) throws Exception {
        users.remove(webSocketSession);
    }

    /**
     * 实现部分消息
     * @return
     */
    @Override
    public boolean supportsPartialMessages() {
        return false;
    }

    private JSONObject webSocketMessageChangeJSONObject(WebSocketMessage<?> webSocketMessage) throws JSONException {
        Object obj = webSocketMessage.getPayload();
        JSONObject message = new JSONObject(obj.toString());
        message.put("sendTime", DATE_FORMAT.format(new Date()));
        return  message;
    }

}
