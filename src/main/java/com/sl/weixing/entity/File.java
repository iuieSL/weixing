package com.sl.weixing.entity;

import javax.persistence.*;
import java.io.Serializable;

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

    private  String name;

    private  String desciption;

    private String url;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesciption() {
        return desciption;
    }

    public void setDesciption(String desciption) {
        this.desciption = desciption;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
