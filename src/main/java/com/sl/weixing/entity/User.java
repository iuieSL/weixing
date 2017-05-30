package com.sl.weixing.entity;

import javax.persistence.*;
import java.io.Serializable;

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

}
