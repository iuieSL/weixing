/**
 * Created by carols on 2017/5/29.
 */
var Chat = {
    /**
     * 发送消息
     * @param event
     * @param chatType,发送的类型：文字，图片，文件
     * @param content 发送的内容，url,文字
     */
    sendMessage: function (event, chatType, content) {
        var fromUserId = $("#userId").val();
        if (fromUserId == "" || fromUserId == 'undefined') return;
        chatType = typeof chatType !== 'undefined' ? chatType : CHAT_TYPE.WORD_TYPE;
        content = typeof content !== 'undefined' ? content : $("#message").html();
        var username = $("#username").val();
        var toUsers = $("#toUserIds").val();
        if (content == "" && content == "") return;
        websocket.send(JSON.stringify({
            nickname: username,
            content: content,
            type: chatType,
            toUsers: toUsers,
        }));
        //清空输入框
        $("#message").html("");
        $("#message").focus();
    },
    /**
     * 拼接展示的消息
     * @param message json字符串
     */
    getMessage: function (message) {
        if (typeof message == "string") {
            var message = JSON.parse(message);
        }
        var headPhtoUrl = "ShowPic.action?imageURL=" + message.name;
        var messageItem = null;
        //是否是发送者
        if (message.isSelf) {
            messageItem = '<div class="message ng-scope me">'
        } else {
            messageItem = '<div class="message ng-scope">'
        }
        messageItem = messageItem + '<div class="inputDiv">' + '<div>';
        //是否显示时间
        if (message.showTime) {
            messageItem = messageItem
                + '<p class="message_system"><span class="content">' + ''
                + message.sendTime + '</span></p>'
        }
        messageItem = messageItem
            + '<div class="avatar">'
            + '<img src="' + headPhtoUrl + '">'
            + '</div>'
            + '<div class="content">'
            + '<div class="bubble js_message_bubble ng-scope bubble_primary">'
            + '<div  class="bubble_cont ng-scope">'
        if (message.type == CHAT_TYPE.IMAGE_TYPE) {
            var url = "ShowPic.action?imageURL=" + message.chatValue;
            messageItem = messageItem + '<div class="picture">'
                + '<img class="msg-img" src=' + url + '/></div>'
        }
        messageItem = messageItem + '</div>' + '</div>'
            + '</div>' + '</div>' + '</div>' + '</div>';

        return messageItem;
    },
    /**
     * 显示消息到消息框
     * @param message
     */
    showMessage: function (message) {
        $(message).appendTo("#textareaDiv");
        //滚动到最底部
        $('#textareaDiv').scrollTop($('#textareaDiv')[0].scrollHeight);
    },
    /**
     * 切换用户
     */
    changePerson: function () {
        var event = event || window.event;
        removeChatItemActive();
        $(event.target).parents('.chat_item').addClass("active");
        var toUserId = $(this).data("userid");
        var toUserName = $(this).data("username");
        if (toUserId != "" && toUserId != 'undefined') {
            $("input[name='toUserId']").val(toUserId);
        }
        if (toUserName != "" && toUserName != 'undefined') {
            $("input[name='toUserName']").val(toUserName);
            $(".title_name").first().html(toUserName)
        }
        //清空展示框
        $("#textareaDiv").html("");
        //清空输入框
        $("#message").html("");
    }
}


var CHAT_TYPE = {
    WORD_TYPE: "WORD_TYPE",
    IMAGE_TYPE: "IMAGE_TYPE",
    FILE_TYPE: "FILE_TYPE"
}

//清除所有的样式
function removeChatItemActive() {
    $('.chat_item').each(function (index, value) {
        if ($(this).hasClass("active")) {
            $(this).removeClass("active");
        }
    });
}