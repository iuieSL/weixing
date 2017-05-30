package com.sl.weixing.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by carols on 2017/5/29.
 * 头像，文件，图片的储存
 */
@Entity
@Table
public class File implements Serializable {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private  Integer id;

    @Column(name = "description")
    private  String desc;

    private String url;

    @OneToMany                                          //指定一对多关系
    @JoinColumn(name="head_portrait_id")
    private Set<User> users=new HashSet<User>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }
}
