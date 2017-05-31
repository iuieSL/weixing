package com.sl.weixing.webscoket;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

/**
 * Created by 莉 on 2017/5/27.
 */
@Component
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        String websocket_url = "/websocket";
        registry.addHandler(new ChatWebSocketHandler(),websocket_url)
                .addInterceptors(new ChatHandshakeInterceptor());
    }
    @Bean
    public WebSocketHandler systemWebSocketHandler(){
        return new ChatWebSocketHandler();
    }

}
