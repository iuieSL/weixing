/**
 * Created by carols on 2017/5/31.
 */
var barTool = {
    srollerButton:function(){
        $('#textareaDiv').scrollTop( $('#textareaDiv')[0].scrollHeight );
    },
    //显示qq表情
    showEmojiPanel : function() {
        if ($("#mmpop_emoji_panel").css("opacity") == "0") {
            $("#mmpop_emoji_panel").show();
            $("#mmpop_emoji_panel").animate({
                top : '-234px',
                left : '15px',
                opacity : '1'
            }, "slow");
        } else {
            $("#mmpop_emoji_panel").animate({
                top : '34px',
                left : '0px',
                opacity : '0'
            }, "slow");
            $("#mmpop_emoji_panel").hide();
        }
        return false;
    },
    //隐藏qq表情,隐藏添加用户的按钮
    hideEmojiPanel : function() {
        var event = event || window.event;
        if ($("#mmpop_emoji_panel").css("opacity") != "0"
            && $(event.target).parent("div").attr("class") != "qq_face") {
            $("#mmpop_emoji_panel").animate({
                top : '34px',
                left : '0px',
                opacity : '0'
            }, "slow");
            $("#mmpop_emoji_panel").hide();

        }
        if ($(event.target).attr("class") != "web_wechat_down_icon"
            && !$("#chatRoomMembersWrap").is(":hidden")) {
            $("#chatRoomMembersWrap").hide();
        }
    },
    //点击表情
    selectEmoticon : function() {
        if ($("#mmpop_emoji_panel").css("opacity") == "0")
            return;
        var event = event || window.event;
        var target = $(event.target);
        var targetClass = target.attr("class");
        var arrayClass = targetClass.split(" ");
        var arrayClass1 = arrayClass[1];
        var relClass = arrayClass1.replace(/qqface/, "qqemoji");
        var image = '<img class="qqemoji ' + relClass
            + '" src="/static/images/spacer.gif">'
        $(image).appendTo("#message");
    },
}