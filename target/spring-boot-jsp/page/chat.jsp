<%--
  Created by IntelliJ IDEA.
  User: carols
  Date: 2017/5/29
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%
    String contextpath = application.getContextPath();
%>
<html>
<head>
    <link href="<%=contextpath%>/static/css/qq.css" rel="stylesheet" type="text/css"/>
    <title>对话</title>
</head>
<body>
<div>
    <div class="page-container">
        <div class="leftChat">
            <input type="hidden" name="username" value="${sessionScope.user.userName}"/>
            <input type="hidden" name="toUserIds" value="">
            <input type="hidden" name="toUserName" value="">
            <div class="box_hd">
                <div id="chatRoomMembersWrap" style="display:none;">
                    <div id="mmpop_chatroom_members" class="mmpop ng-scope members_wrp slide-down" tabindex="-1" style="">
                        <div class="members">
                            <div class="members_inner ng-scope">
                                <div class="member opt">
                                    <i class="web_wechat_add_friends"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="title_wrap">
                    <div class="title poi">
                        <a class="title_name ng-binding"></a>
                        <span class="title_count ng-binding ng-scope"></span>
                        <i class="web_wechat_down_icon"></i>
                    </div>
                </div>
            </div>
            <div class="textareaDiv" id="textareaDiv">
            </div>
            <div class="box_ft ng-scope">
                <div class="toolbar" id="tool_bar">
                    <a class="web_wechat_face" href="javascript:;" title="表情" id="web_wechat_face"></a>
                    <%--<a class="web_wechat_pic js_fileupload ng-isolate-scope webuploader-container" title="文件和图片" id="web_wechat_pic">
                        <div class="webuploader-pick"></div>
                        <div id="rt_rt_1b8tub7ee1qig1m11qoia9iv7g1"
                             style="position: absolute; top: 0px; left: 0px; width: 30px; height: 30px; overflow: hidden; bottom: auto; right: auto;">
                            <label style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);"></label>
                        </div>
                    </a>--%>
                </div>
                <div id="message" class="messageWrite" contenteditable=true>

                </div>
                <div id="mmpop_emoji_panel"  class="mmpop ng-scope slide-top"  tabindex="-1"  style="top:34px;left: 0px;opacity:0;display: none;">
                    <div class="expression">
                        <div class="scroll-wrapper exp_bd scrollbar-dynamic"  style="position: relative;">
                            <div  class="exp_bd scrollbar-dynamic scroll-content"  style="margin-bottom: 0px; margin-right: 0px;" id="qqEm">
                                <div class="exp_cont active">
                                    <div  class="qq_face">
                                        <a title="微笑" type="qq" class="face qqface0">微笑</a>
                                        <a title="撇嘴" type="qq" class="face qqface1">撇嘴</a>
                                        <a title="色" type="qq" class="face qqface2">色</a>
                                        <a title="发呆" type="qq" class="face qqface3">发呆</a>
                                        <a title="得意" type="qq" class="face qqface4">得意</a>
                                        <a title="流泪" type="qq" class="face qqface5">流泪</a>
                                        <a title="害羞" type="qq" class="face qqface6">害羞</a>
                                        <a title="闭嘴" type="qq" class="face qqface7">闭嘴</a>
                                        <a title="睡" type="qq" class="face qqface8">睡</a>
                                        <a title="大哭" type="qq" class="face qqface9">大哭</a>
                                        <a title="尴尬" type="qq" class="face qqface10">尴尬</a>
                                        <a title="发怒" type="qq" class="face qqface11">发怒</a>
                                        <a title="调皮" type="qq" class="face qqface12">调皮</a>
                                        <a title="呲牙" type="qq" class="face qqface13">呲牙</a>
                                        <a title="惊讶" type="qq" class="face qqface14">惊讶</a>
                                        <a title="难过" type="qq" class="face qqface15">难过</a>
                                        <a title="酷" type="qq" class="face qqface16">酷</a>
                                        <a title="冷汗" type="qq" class="face qqface17">冷汗</a>
                                        <a title="抓狂" type="qq" class="face qqface18">抓狂</a>
                                        <a title="吐" type="qq" class="face qqface19">吐</a>
                                        <a title="偷笑" type="qq" class="face qqface20">偷笑</a>
                                        <a title="愉快" type="qq" class="face qqface21">愉快</a>
                                        <a title="白眼" type="qq" class="face qqface22">白眼</a>
                                        <a title="傲慢" type="qq" class="face qqface23">傲慢</a>
                                        <a title="饥饿" type="qq" class="face qqface24">饥饿</a>
                                        <a title="困" type="qq" class="face qqface25">困</a>
                                        <a title="惊恐" type="qq" class="face qqface26">惊恐</a>
                                        <a title="流汗" type="qq" class="face qqface27">流汗</a>
                                        <a title="憨笑" type="qq" class="face qqface28">憨笑</a>
                                        <a title="悠闲" type="qq" class="face qqface29">悠闲</a>
                                        <a title="奋斗" type="qq" class="face qqface30">奋斗</a>
                                        <a title="咒骂" type="qq" class="face qqface31">咒骂</a>
                                        <a title="疑问" type="qq" class="face qqface32">疑问</a>
                                        <a title="嘘" type="qq" class="face qqface33">嘘</a>
                                        <a title="晕" type="qq" class="face qqface34">晕</a>
                                        <a title="疯了" type="qq" class="face qqface35">疯了</a>
                                        <a title="衰" type="qq" class="face qqface36">衰</a>
                                        <a title="骷髅" type="qq" class="face qqface37">骷髅</a>
                                        <a title="敲打" type="qq" class="face qqface38">敲打</a>
                                        <a title="再见" type="qq" class="face qqface39">再见</a>
                                        <a title="擦汗" type="qq" class="face qqface40">擦汗</a>
                                        <a title="抠鼻" type="qq" class="face qqface41">抠鼻</a>
                                        <a title="鼓掌" type="qq" class="face qqface42">鼓掌</a>
                                        <a title="糗大了" type="qq" class="face qqface43">糗大了</a>
                                        <a title="坏笑" type="qq" class="face qqface44">坏笑</a>
                                        <a title="左哼哼" type="qq" class="face qqface45">左哼哼</a>
                                        <a title="右哼哼" type="qq" class="face qqface46">右哼哼</a>
                                        <a title="哈欠" type="qq" class="face qqface47">哈欠</a>
                                        <a title="鄙视" type="qq" class="face qqface48">鄙视</a>
                                        <a title="委屈" type="qq" class="face qqface49">委屈</a>
                                        <a title="快哭了" type="qq" class="face qqface50">快哭了</a>
                                        <a title="阴险" type="qq" class="face qqface51">阴险</a>
                                        <a title="亲亲" type="qq" class="face qqface52">亲亲</a>
                                        <a title="吓" type="qq" class="face qqface53">吓</a>
                                        <a title="可怜" type="qq" class="face qqface54">可怜</a>
                                        <a title="菜刀" type="qq" class="face qqface55">菜刀</a>
                                        <a title="西瓜" type="qq" class="face qqface56">西瓜</a>
                                        <a title="啤酒" type="qq" class="face qqface57">啤酒</a>
                                        <a title="篮球" type="qq" class="face qqface58">篮球</a>
                                        <a title="乒乓" type="qq" class="face qqface59">乒乓</a>
                                        <a title="咖啡" type="qq" class="face qqface60">咖啡</a>
                                        <a title="饭" type="qq" class="face qqface61">饭</a>
                                        <a title="猪头" type="qq" class="face qqface62">猪头</a>
                                        <a title="玫瑰" type="qq" class="face qqface63">玫瑰</a>
                                        <a title="凋谢" type="qq" class="face qqface64">凋谢</a>
                                        <a title="嘴唇" type="qq" class="face qqface65">嘴唇</a>
                                        <a title="爱心" type="qq" class="face qqface66">爱心</a>
                                        <a title="心碎" type="qq" class="face qqface67">心碎</a>
                                        <a title="蛋糕" type="qq" class="face qqface68">蛋糕</a>
                                        <a title="闪电" type="qq" class="face qqface69">闪电</a>
                                        <a title="炸弹" type="qq" class="face qqface70">炸弹</a>
                                        <a title="刀" type="qq" class="face qqface71">刀</a>
                                        <a title="足球" type="qq" class="face qqface72">足球</a>
                                        <a title="瓢虫" type="qq" class="face qqface73">瓢虫</a>
                                        <a title="便便" type="qq" class="face qqface74">便便</a>
                                        <a title="月亮" type="qq" class="face qqface75">月亮</a>
                                        <a title="太阳" type="qq" class="face qqface76">太阳</a>
                                        <a title="礼物" type="qq" class="face qqface77">礼物</a>
                                        <a title="拥抱" type="qq" class="face qqface78">拥抱</a>
                                        <a title="强" type="qq" class="face qqface79">强</a>
                                        <a title="弱" type="qq" class="face qqface80">弱</a>
                                        <a title="握手" type="qq" class="face qqface81">握手</a>
                                        <a title="胜利" type="qq" class="face qqface82">胜利</a>
                                        <a title="抱拳" type="qq" class="face qqface83">抱拳</a>
                                        <a title="勾引" type="qq" class="face qqface84">勾引</a>
                                        <a title="拳头" type="qq" class="face qqface85">拳头</a>
                                        <a title="差劲" type="qq" class="face qqface86">差劲</a>
                                        <a title="爱你" type="qq" class="face qqface87">爱你</a>
                                        <a title="NO" type="qq" class="face qqface88">NO</a>
                                        <a title="OK" type="qq" class="face qqface89">OK</a>
                                        <a title="爱情" type="qq" class="face qqface90">爱情</a>
                                        <a title="飞吻" type="qq" class="face qqface91">飞吻</a>
                                        <a title="跳跳" type="qq" class="face qqface92">跳跳</a>
                                        <a title="发抖" type="qq" class="face qqface93">发抖</a>
                                        <a title="怄火" type="qq" class="face qqface94">怄火</a>
                                        <a title="转圈" type="qq" class="face qqface95">转圈</a>
                                        <a title="磕头" type="qq" class="face qqface96">磕头</a>
                                        <a title="回头" type="qq" class="face qqface97">回头</a>
                                        <a title="跳绳" type="qq" class="face qqface98">跳绳</a>
                                        <a title="投降" type="qq" class="face qqface99">投降</a>
                                        <a title="激动" type="qq" class="face qqface100">激动</a>
                                        <a title="乱舞" type="qq" class="face qqface101">乱舞</a>
                                        <a title="献吻" type="qq" class="face qqface102">献吻</a>
                                        <a title="左太极" type="qq" class="face qqface103">左太极</a>
                                        <a title="右太极" type="qq" class="face qqface104">右太极</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="action">
                <span ng-if="!isMacOS" class="desc ng-scope">按下Enter换行</span>
                <a class="btn btn_send" href="javascript:;" id="send">发送</a>


            </div>
        </div>
        <div class="rightChat">
            <div class="header">
                <div class="avatar">
                    <img class="img"
                         src="<%=contextpath %>/ShowPic.action?imageName=${sessionScope.user.headPortrait.name}">
                </div>
                <div class="info"><h3 class="nickname">
                    <span class="display_name ng-binding">${sessionScope.user.userName}</span></h3></div>
            </div>
            <%--<div class="search_bar"><i class="web_wechat_search"></i>
                <input class="frm_search ng-isolate-scope ng-valid ng-dirty" placeholder="Search"/>
            </div>--%>
            <div class="tab">
                <div class="tab_item"><a class="chat" title="聊天"><i
                        class="web_wechat_tab_chat web_wechat_tab_chat_hl"></i></a></div>
            </div>
            <div class="nav_view ng-scope" style="visibility: visible; width: auto;">
                <div class="scroll-wrapper chat_list scrollbar-dynamic">
                    <div class="chat_list scrollbar-dynamic scroll-content scroll-scrolly_visible"
                         style="margin-bottom: 0px; margin-right: 0px; height: 446px;">
                        <div>
                            <div class="ng-scope">
                                <c:forEach items="${sessionScope.userList}" var="user">
                                <c:if test="${user.id == sessionScope.user.id}">
                                <div class="chat_item slide-left ng-scope active startChat" data-userid="${user.id}"
                                     data-username="${user.userName}" data-type="person">
                                </c:if>
                                <c:if test="${user.id!=sessionScope.user.id}">
                                    <div class="chat_item slide-left ng-scope startChat" data-userid="${user.id}"
                                      data-username="${user.userName}" data-type="person">
                                </c:if>
                                        <div class="ext"><p class="attr ng-binding">12:48</p></div>
                                        <div class="avatar">
                                            <img class="img"
                                                 src="<%=contextpath %>/ShowPic.action?imageName=${user.headPortrait.name}">
                                        </div>
                                        <div class="info">
                                            <h3 class="nickname">
                                                <span class="nickname_text ng-binding"
                                                      id="chatUserId">${user.userName}</span></h3>
                                            <!-- <p class="msg ng-scope"><span class="ng-binding">嗯嗯嗯嗯</span></p> -->
                                        </div>
                                    </div>
                                    </c:forEach>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
<script type="text/javascript" src="<%=contextpath%>/static/lib/jquery/1.9.1/jquery.js"></script>
<script type="text/javascript" src="<%=contextpath %>/static/js/util.js"></script>
<script type="text/javascript" src="<%=contextpath %>/static/js/barTool.js"></script>
<script type="text/javascript" src="<%=contextpath%>/static/js/webSocket.js"></script>
<script type="text/javascript" src="<%=contextpath%>/static/js/chat.js"></script>
<script type="text/javascript">
     $("#send").bind('click',Chat.sendMessage);
     $(".startChat").bind('click',Chat.changePerson);
     $("#web_wechat_face").bind('click',barTool.showEmojiPanel);
     $("#qqEm").bind('click',barTool.selectEmoticon);
     //给windown绑定事件
     $(window).bind('click',barTool.hideEmojiPanel);
     //自定义快捷键
     $(document).bind('keydown',Util.KeyPress);
</script>
</body>

</html>
