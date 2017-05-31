package com.sl.weixing.websocket;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

/**
 * Created by 莉 on 2017/5/27.
 */
@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {
    @Bean
    public ServerEndpointExporter serverEndpointExporter() {
        return new ServerEndpointExporter();
    }

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
