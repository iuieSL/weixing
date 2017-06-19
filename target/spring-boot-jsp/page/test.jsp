<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>信息提示</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <style type="text/css">
        * {
            margin: 0px;
            padding: 0px;
        }

        #top {
            background-image: url(images/top_02.gif);
            background-repeat: repeat-x;
            height: 58px;
            width: 100%;
        }

        #logo {
            float: left;
            background-image: url(images/logo.jpg);
            width: 293px;
            height: 58px;
        }

        #line {
            background-image: url(images/bg1.gif);
            width: 100%;
            height: 18px;
        }

        #info {
            font-size: 12px;
            color: #FFF;
            line-height: 19px;
            float: right;
            width: 230px;
            height: 58px;
        }
    </style>
    <title></title>
    <script type="text/javascript" src="js/ajax.js"></script>
    <script type="text/javascript" src="js/jquery.min.js"></script>

    <script type="text/javascript">
        /**
         * 类名：CLASS_MSN_MESSAGE
         * 功能：提供类似MSN消息框
         * 示例：
         * var MSG = new CLASS_MSN_MESSAGE("aa",200,120,"短消息提示：","您有1封消息","今天请我吃饭哈");
         * MSG.show();
         * 消息构造
         */
        function CLASS_MSN_MESSAGE(id,width,height,caption,title,message,target,action){
            this.id       = id;
            this.title    = title;
            this.caption = caption;
            this.message = message;
            this.target   = target;
            this.action   = action;
            this.width    = width?width:200;
            this.height   = height?height:120;
            this.timeout = 150;
            this.speed    = 20;
            this.step     = 1;
            this.right    = screen.width -1;
            this.bottom   = screen.height;
            this.left     = this.right - this.width;
            this.top      = this.bottom - this.height;
            this.timer    = 0;
            this.pause    = false;
            this.close    = false;
            this.autoHide = true;
        }

        /**
         * 隐藏消息方法
         */
        CLASS_MSN_MESSAGE.prototype.hide = function(){
            if(this.onunload()){
                var offset = this.height>this.bottom-this.top?this.height:this.bottom-this.top;
                var me = this;
                if(this.timer>0){
                    ///window.clearInterval(me.timer);
                }

                var fun = function(){
                    if(me.pause==false||me.close){
                        var x = me.left;
                        var y = 0;
                        var width = me.width;
                        var height = 0;
                        if(me.offset>0){
                            height = me.offset;
                        }

                        y = me.bottom - height;
                        if(true){
                            window.clearInterval(me.timer);
                            me.Pop.hide();
                        } else {
                            me.offset = me.offset - me.step;
                        }
                        // me.Pop.show(x,y,width,height);
                    }
                }
                fun();
                //  this.timer = window.setInterval(fun,1000)
            }
        }

        /**
         * 消息卸载事件，可以重写
         */
        CLASS_MSN_MESSAGE.prototype.onunload = function() {
            return true;
        }
        /**
         * 消息命令事件，要实现自己的连接，请重写它
         * window.open("http://www.lost63.com");
         */
        CLASS_MSN_MESSAGE.prototype.oncommand = function(){
            this.close = true;
            this.hide();

        }
        var bl=0;
        /**
         * 消息显示方法
         */
        //IE5.5+
        CLASS_MSN_MESSAGE.prototype.show = function(){
            var oPopup = window.open("","","width=300px,height=110px,resizable=no,scroll=no,status=no");
            this.Pop = oPopup;

            var w = this.width;
            var h = this.height;


            var str = "<div id='emag' style='border-right: #455690 1px solid; border-top: #a6b4cf 1px solid; z-index: 99999; left: 0px; border-left: #a6b4cf 1px solid; width: " + w + "px; border-bottom: #455690 1px solid; position: absolute; top: 0px; height: " + h + "px; background-color: #c9d3f3;display:block'>"
            str += "<table style='border-top: #ffffff 1px solid; border-left: #ffffff 1px solid' cellspacing=0 cellpadding=0 width='100%' bgcolor=#cfdef4 border=0>"

            str += "<tr>"
            str += "<td style='font-size: 12px;color: #0f2c8c' width=30 height=24></td>"
            str += "<td style='padding-left: 4px; font-weight: normal; font-size: 12px; color: #1f336b; padding-top: 4px' valign=center width='100%'>" + this.caption + "</td>"
            str += "</tr>"
            str += "<tr>"
            /*height：设置里面内容区域的高度 */
            str += "<td style='padding-right: 1px;padding-bottom: 1px' colspan=3 height=" + (h-50) + ">"
            str += "<div style='border-right: #b9c9ef 1px solid; padding-right: 8px; border-top: #728eb8 1px solid; padding-left: 8px; font-size: 12px; padding-bottom: 8px; border-left: #728eb8 1px solid; width: 100%; color: #1f336b; padding-top: 8px; border-bottom: #b9c9ef 1px solid; height: 100%'>" + this.title + "<br><br>"
            str += "<div style='word-break: break-all' align=left><a href='javascript:void(0)' hidefocus=false id='btcommand'><font color=#ff0000>" + this.message + "</font></a><a href='tencent://message/?uin=35501547&site=http://hi.baidu.com/lupeng0527&menu=yes' hidefocus=false id='ommand'><font color=#ff0000></font></a></div>"
            str += "</div>"
            str += "</td>"
            str += "</tr>"
            str += "<tr align=center>"
            str += "<td colspan=3>"
            str += "<div style='padding: 2 0 2 0;'>"
            str += "<span id='buttonClose'><input type='button' title=关闭 value=确认 style='width:60px; height:20px; border-right: #002D96 1px solid; padding-right: 2px; border-top: #002D96 1px solid; padding-left: 2px; FONT-SIZE: 12px; filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#FFFFFF, EndColorStr=#9DBCEA); border-left: #002D96 1px solid; CURSOR: hand; color: black; padding-top: 2px; border-bottom: #002D96 1px solid;'></span>"
            str += "</div>"
            str += "</td>"
            str += "</tr>"
            str += "</table>"
            str += "</div>"

            oPopup.document.body.innerHTML = str;

            this.offset = 0;
            var me = this;

            oPopup.document.body.onmouseover = function(){me.pause=true;}
            oPopup.document.body.onmouseout = function(){me.pause=true;}

            var fun1 = function(){
                var x = me.left;
                var y = 0;
                var width      = me.width;
                var height     = me.height;

                if(me.offset>me.height){
                    height = me.height;
                } else {
                    height = me.offset;
                }

                y = me.bottom - me.offset;
                if(y<=me.top){
                    me.timeout--;

                } else {
                    me.offset = me.offset + me.step;
                }
                me.Pop.show(1039,600,240,150);
            }
            if(bl<2){
                //this.timer = window.setInterval(fun1,this.speed);
                fun1();

            }

            bl=3;

            //"确认"关闭事件  this.close = true;
            // this.hide();

            var buttonClose = oPopup.document.getElementById("buttonClose");

            buttonClose.onclick = function(){
                me.close = true;
                me.hide();
            }


            var btCommand = oPopup.document.getElementById("btCommand");
            btCommand.onclick = function(){
                me.oncommand();
            }
            var ommand = oPopup.document.getElementById("ommand");
            ommand.onclick = function(){
                this.close = true;
                me.hide();
                window.open(ommand.href);
            }
        }
        /*
         * 设置速度方法
         */
        CLASS_MSN_MESSAGE.prototype.speed = function(s){
            var t = 20;
            try {
                t = praseInt(s);
            } catch(e){}
            this.speed = t;
        }
        /**
         * 设置步长方法
         */
        CLASS_MSN_MESSAGE.prototype.step = function(s){
            var t = 1;
            try {
                t = praseInt(s);
            } catch(e){}
            this.step = t;
        }

        CLASS_MSN_MESSAGE.prototype.rect = function(left,right,top,bottom){
            try {
                this.left        = left    !=null?left:this.right-this.width;
                this.right        = right    !=null?right:this.left +this.width;
                this.bottom        = bottom!=null?(bottom>screen.height?screen.height:bottom):screen.height;
                this.top        = top    !=null?top:this.bottom - this.height;
            } catch(e){}
        }
        var MSG1 = new CLASS_MSN_MESSAGE("aa",240,150,"管理员","有新的申请单需要您的审批!","");
        MSG1.rect(null,null,null,screen.height-50);
        MSG1.speed    = 10;
        MSG1.step    = 5;


        /**
         * 显示提示框
         */
        function showMSG(){

            MSG1.show();
        }

        function hideMsg(){
            MSG1.hide();
        }



        window.setInterval("showMSG()",10000);
    </script>
</head>
<body>
<div id="top">
    <div id="logo"></div><div id="back"></div>

</div>
</div>
<div id="line"></div>
</body>
</html>
