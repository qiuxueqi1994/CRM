// 检查是否登陆，会进入阻塞，直到检查成功
function checkIsLogin() {
    jQuery.ajax({
        type: "post",
        url: getUrlHeader() + "IsLogin.ashx",
        async: false,
        cache: false,
        success: function (d) {
            if (d == 1) window.location.href = getUrlHeader() + "login.html";
            else {
                jQuery("#usernamelink").text(d);
                jQuery("#pwd-username").text(d);
            }
        }
    });
}

// 获取地址栏的头部，进行更好的页面跳转
function getUrlHeader() {
    return location.protocol + "//" + location.host + "/";
}

// JSON字符串转换成短时间
function convertToDate(data, bl) {
    if (data == null) return "";
    var num = data.replace("/Date(", "").replace(")/", "");
    var date = new Date(parseInt(num));
    var yy = date.getFullYear();
    var M = date.getMonth() + 1;
    var MM = ("00" + M).substr(("00" + M).length - 2, 2);
    var d = date.getDate();
    var dd = ("00" + d).substr(("00" + d).length - 2, 2);
    var H = date.getHours();
    var HH = ("00" + H).substr(("00" + H).length - 2, 2);
    var m = date.getMinutes();
    var mm = ("00" + m).substr(("00" + m).length - 2, 2);
    var s = date.getSeconds();
    var ss = ("00" + s).substr(("00" + s).length - 2, 2);
    if (bl)
        return yy + "-" + MM + "-" + dd;
    else
        return yy + "-" + MM + "-" + dd + "　" + HH + ":" + mm + ":" + ss;
}

// 获取地址栏的参数
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return window.decodeURIComponent(r[2]); return null;
}