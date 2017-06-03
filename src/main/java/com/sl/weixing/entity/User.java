package com.sl.weixing.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by carols on 2017/5/26.
 */
@Entity
@Table
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Column(name="user_name")
    private String userName;

    @ManyToOne(targetEntity = File.class)
    @JoinColumn(name = "head_portrait_id", referencedColumnName = "id")
    private File headPortrait;

    @OneToMany(targetEntity = Chat.class,fetch = FetchType.LAZY, mappedBy = "fromUser")
    private Set<Chat> chats=new HashSet<Chat>();  //发送的话

    @ManyToMany(fetch=FetchType.LAZY, mappedBy="toUsers")
    private Set<Chat> receiveChats=new HashSet<Chat>();//接收的话

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public File getHeadPortrait() {
        return headPortrait;
    }

    public void setHeadPortrait(File headPortrait) {
        this.headPortrait = headPortrait;
    }

    public Set<Chat> getChats() {
        return chats;
    }

    public void setChats(Set<Chat> chats) {
        this.chats = chats;
    }

    public Set<Chat> getReceiveChats() {
        return receiveChats;
    }

    public void setReceiveChats(Set<Chat> receiveChats) {
        this.receiveChats = receiveChats;
    }
}
