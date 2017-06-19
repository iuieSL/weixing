/**
 * 用于通话的js
 * @author:舒莉
 */
var websocket = null;
if ('WebSocket' in window) {
	websocket = new WebSocket("ws://"+document.location.host+"/websocket");
} else {
	alert('当前浏览器 Not support websocket 不能进行聊天')
}
websocket.onerror=function(){
	window.alert("对话发生异常,请稍后重试");
}
/**
 * 接收到消息
 */
websocket.onmessage =function(event){
	var message=Chat.getMessage(event.data);
	Chat.showMessage(message);
	barTool.srollerButton(); //把滚动条下拉
};
/**
 * 连接关闭的回调方法
 */
websocket.onclose=function(){
	window.alert("连接已经关闭,请稍后重试");
};

/**
 * 监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常
 */
window.onbeforeunload = function() {
	closeWebSocket();
}

/**
 * 页面没加载的时候
 */
window.onunload=function(){
	closeWebSocket();
}

/**
 * 关闭WebSocket连接
 */
function closeWebSocket() {
	websocket.close();
}