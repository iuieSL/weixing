/**
 * Created by carols on 2017/5/31.
 */
var Util={
    KeyPress:function(){
        var event=event||window.event;
        var key=event.key;
        if(key=="Enter"){
            $("#send").click();
            return false;
        }else if(key=="Control"){
            var div='<div><br></div>';
            $(div).appendTo("#message");
            return false;
        }
    },
}