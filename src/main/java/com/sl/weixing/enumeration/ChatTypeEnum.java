package com.sl.weixing.enumeration;

/**
 * Created by 莉 on 2017/5/30.
 */
public enum ChatTypeEnum {

    WORD_TYPE("WORD_TYPE","说的话或者表情"),
    IMAGE_TYPE("IMAGE_TYPE","发的图片"),
    FILE_TYPE("FILE_TYPE","发的文件");


    private String value;
    private String desc;

    private ChatTypeEnum(String value, String desc) {
        this.value = value;
        this.desc = desc;
    }

    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }
    public String getDesc() {
        return desc;
    }
    public void setDesc(String desc) {
        this.desc = desc;
    }
}
