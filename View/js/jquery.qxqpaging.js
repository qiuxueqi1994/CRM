; (function ($) {
    $.fn.extend({
        "qxqpaging": function (d) {
            // 检查参数
            d = d || {};
            d.pageIndex = d.pageIndex || 1; // 页码
            d.pageSize = d.pageSize || 10;   // 每页显示多少条
            d.url = d.url || "";            // 请求数据的服务地址
            d.data = d.data || {};          // 请求数据携带的其他参数
            // 请求数据成功后的回调函数
            d.success = d.success || function (data) { };
            // 定义当前对象
            $this = $(this);
            // 构建页面
            $this.addClass("qxqpaging-main");
            $this.empty();
            var pageHome = $('<span class="iconfont icon-pagehome" title="首页" />').appendTo(this);
            var pageUp = $('<span class="iconfont icon-pageup" title="上一页" />').appendTo(this);
            var pageDown = $('<span class="iconfont icon-pagedown" title="下一页" />').appendTo(this);
            var pageEnd = $('<span class="iconfont icon-pageend" title="尾页" />').appendTo(this);
            $("<label />").appendTo(this).text("Page 1 of 1");
            // 为所有链接注册点击事件
            pageHome.click(function () {
                d.pageIndex = 1;
            });
            pageEnd.click(function () {
                d.pageIndex = $this.data("pageCount") || 1;
            });
            pageUp.click(function () {
                if (--d.pageIndex <= 1)
                    d.pageIndex = 1;
            });
            pageDown.click(function () {
                var pageCount = $this.data("pageCount") || 1;
                if (++d.pageIndex >= pageCount)
                    d.pageIndex = pageCount;
            });
            // 所有链接点击刷新数据
            $this.find("span").click(function () { loadData(); });
            // ajax请求数据
            var loadData = function () {
                d.data.pageIndex = d.pageIndex;
                d.data.pageSize = d.pageSize;
                $.ajax({
                    type: "post",
                    url: d.url,
                    data: JSON.stringify(d.data),
                    contentType: "application/json",
                    dataType: "json",
                    success: function (r) {
                        if (r.d == null) {
                            d.success(r.d);
                            return;
                        }
                        var pageCount = parseInt((r.d.Total - 1) / d.pageSize) + 1;
                        $this.data("pageCount", pageCount);
                        //显示总页数
                        $this.find("label:last").text("Page " + d.pageIndex + " of " + pageCount);
                        //调用回调函数
                        d.success(r.d.Data);
                        // 改变样式
                        $this.find("span").removeClass("disabled");
                        if (d.pageIndex <= 1) {
                            pageUp.addClass("disabled");
                            pageHome.addClass("disabled");
                        }
                        if (d.pageIndex >= pageCount) {
                            pageDown.addClass("disabled");
                            pageEnd.addClass("disabled");
                        }
                    }
                });
            }
            // 首次加载
            loadData();
            return this;
        }
    });
})(jQuery);