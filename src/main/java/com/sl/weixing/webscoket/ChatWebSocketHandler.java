package com.sl.weixing.webscoket;

import com.sl.weixing.entity.Chat;
import com.sl.weixing.entity.User;
import com.sl.weixing.enumeration.ChatTypeEnum;
import com.sl.weixing.service.ChatService;
import com.sl.weixing.service.UserService;
import com.sl.weixing.util.ApplicationContextRegister;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.web.socket.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 *
 * Created by 莉 on 2017/5/27.
 *
 *
 */

public class ChatWebSocketHandler implements WebSocketHandler {

    private static final ArrayList<WebSocketSession> users = new ArrayList<>();

    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    private static boolean isShowTime = true;

    private static String username;

    private UserService userService;


    private ChatService chatService;

    {
        ApplicationContext act = ApplicationContextRegister.getApplicationContext();
        userService=act.getBean(UserService.class);
        chatService=act.getBean(ChatService.class);
    }
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
        User fromUser=userService.findUserByName(username);
        message.put("headPhtoName",fromUser.getHeadPortrait().getName());
        message.put("showTime",isShowTime);
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
            chat.setType(ChatTypeEnum.WORD_TYPE.getValue());
        }else if(ChatTypeEnum.FILE_TYPE.getValue().equals(chatType)){
            chat.setType(ChatTypeEnum.FILE_TYPE.getValue());
        }else if(ChatTypeEnum.IMAGE_TYPE.getValue().equals(chatType)){
            chat.setType(ChatTypeEnum.IMAGE_TYPE.getValue());
        }
        User fromUser= userService.findUserByName(message.get("nickname").toString());
        User toUser = userService.findUserById(Integer.valueOf(message.get("toUsers").toString()));
        Set<User> toUsers=new HashSet<>();
        toUsers.add(toUser);
        chat.setFromUser(fromUser);
        chat.setToUsers(toUsers);
        chat.setHasSend(true);
        chat.setShowTime(isShowTime);
        isShowTime=!isShowTime;
        chat.setIds(String.valueOf(Calendar.getInstance().getTimeInMillis()));
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
        if(webSocketSession.isOpen()){
            webSocketSession.close();
        }
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

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public ChatService getChatService() {
        return chatService;
    }

    public void setChatService(ChatService chatService) {
        this.chatService = chatService;
    }
}
