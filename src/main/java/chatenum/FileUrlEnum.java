package chatenum;

import util.CommonUrI;

/**
 * Created by carols on 2017/5/29.
 */
public enum FileUrlEnum {

    CHAT_IMAGES_TYPE("聊天发送的图片", CommonUrI.CHAT_IMAGES_RESOURCES_URI),
    CHAT_FILES_TYPE("聊天发的文件",CommonUrI.CHAT_FILE_RESOURCES_URI),
    PERSON_PICTURE("人员的头像",CommonUrI.PERSON_PHTOTO_RESOURCES_URI);

    private String value;
    private String desc;

    private FileUrlEnum(String value, String desc) {
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
