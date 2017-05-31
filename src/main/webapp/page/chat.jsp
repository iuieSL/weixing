<%--
  Created by IntelliJ IDEA.
  User: carols
  Date: 2017/5/29
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                    <a class="web_wechat_pic js_fileupload ng-isolate-scope webuploader-container" title="文件和图片"
                       id="web_wechat_pic">
                        <div class="webuploader-pick"></div>
                        <div id="rt_rt_1b8tub7ee1qig1m11qoia9iv7g1"
                             style="position: absolute; top: 0px; left: 0px; width: 30px; height: 30px; overflow: hidden; bottom: auto; right: auto;">
                            <label style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);"></label>
                        </div>
                    </a>
                </div>
                <div id="message" class="messageWrite" contenteditable=true>

                </div>
            </div>
            <div class="action">
                <span ng-if="!isMacOS" class="desc ng-scope">按下Ctrl+A换行</span>
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
            <div class="search_bar"><i class="web_wechat_search"></i>
                <input class="frm_search ng-isolate-scope ng-valid ng-dirty" placeholder="Search"/>
            </div>
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
<script type="text/javascript" src="<%=contextpath%>/lib/jquery/1.9.1/jquery.js"></script>
<script type="text/javascript" src="<%=contextpath %>/static/js/barTool.js"></script>
<script type="text/javascript" src="<%=contextpath%>/static/js/webSocket.js"></script>
<script type="text/javascript" src="<%=contextpath%>/static/js/chat.js"></script>
<script type="text/javascript">
     $("#send").bind('click',Chat.sendMessage);
     $(".startChat").bind('click',Chat.changePerson);
</script>
</body>

</html>
