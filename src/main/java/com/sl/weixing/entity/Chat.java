package com.sl.weixing.entity;

import com.sl.weixing.enumeration.ChatTypeEnum;
import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by 莉 on 2017/5/30.
 */
@Entity
@Table
public class Chat implements Serializable {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private  Integer id;


    private  String chatValue; //发送的话

    @Column
    @Enumerated(EnumType.STRING)
    private ChatTypeEnum type; //发送的类型

    @ManyToOne(targetEntity = User.class, cascade = { javax.persistence.CascadeType.ALL })
    @JoinColumn(name = "from_user_id", referencedColumnName = "id")
    private  User fromUser; //发送者

    @ManyToMany(fetch=FetchType.EAGER)
    @JoinTable(name="chat_user", joinColumns={@javax.persistence.JoinColumn(name="from_user")},
            inverseJoinColumns={@javax.persistence.JoinColumn(name="to_user")})
    @Cascade({org.hibernate.annotations.CascadeType.SAVE_UPDATE})
    private Set<User> toUsers=new HashSet<User>();  //接受者;

    @Temporal(TemporalType.TIMESTAMP)    //页面端取：2011-04-12 22:51:34.0
    @Column(name="send_time")
    private Date sendTime; //发送者发送时间

    @Column(name="show_time")
    @org.hibernate.annotations.Type(type="true_false")
    private Boolean showTime;  //是否显示时间

    @Column(name="has_send")
    @org.hibernate.annotations.Type(type="true_false")
    private Boolean hasSend; //是否发送成功

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getChatValue() {
        return chatValue;
    }

    public void setChatValue(String chatValue) {
        this.chatValue = chatValue;
    }

    public ChatTypeEnum getType() {
        return type;
    }

    public void setType(ChatTypeEnum type) {
        this.type = type;
    }

    public User getFromUser() {
        return fromUser;
    }

    public void setFromUser(User fromUser) {
        this.fromUser = fromUser;
    }

    public Set<User> getToUsers() {
        return toUsers;
    }

    public void setToUsers(Set<User> toUsers) {
        this.toUsers = toUsers;
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public Boolean getShowTime() {
        return showTime;
    }

    public void setShowTime(Boolean showTime) {
        this.showTime = showTime;
    }

    public Boolean getHasSend() {
        return hasSend;
    }

    public void setHasSend(Boolean hasSend) {
        this.hasSend = hasSend;
    }
}
