const utils = {
    showToast(title, time, icon) {
        console.log(title, time, icon);
        uni.showToast({
            title,
            duration: time,
            icon
        });
    },
    // get方法
    ajax(url, data, fn) {
        // console.log(url, '传递进来的路径');
        // console.log(data, '传递进来的请求参数');
        uni.request({
            url,
            data,
            success: (res) => {
                fn(res.data)
            }
        });
    },
    // post方法
    ajaxP(url, data, fn) {
        console.log(url, '传递进来的路径');
        uni.request({
            url,
            data,
            method: 'POST',
            header: {
                'Content-type': 'application/json'
            },
            success: (res) => {
                fn(res.data)
            }
        });
    },
    // 返回接口数据的拼接和消息提示
    pullRefresh(list, res, page) {
        var p = null;
        // console.log(page, '传递进来的page');
        list = [...list, ...res]
        if (list.length == 0 && page == 1) {
            console.log("没有数据");
        }
        if (res.length == 0 && page > 1) {
            console.log(111);
            uni.showToast({
                title: "没有更多了",
                icon: "none",
                duration: 2000,
            });
            page--
            console.log(page, '最后的page');
        } else {}
        return {
            list: list,
            page: page
        }
    },
    //输入框防抖
    Inputthrottle(fn) {
        let t = this;
        // 输入框防抖
        clearTimeout(t.timer);
        // 每次进来的时候都将之前的清除掉，如果还没到一秒的时候就将之前的清除掉，这样就不会触发之前setTimeout绑定的事件， 如果超过一秒，之前的事件就会被触发下次进来的时候同样清除之前的timer
        t.timer = setTimeout(function () {
            fn();
        }, 1000);
    },
    // 轮播图预览
    previewImage(list,index){
        uni.previewImage({
            current: index, //预览图片的下标
            urls: list, //预览图片的地址，必须要数组形式，如果不是数组形式就转换成数组形式就可以
            longPressActions: {
                itemList: ["发送给朋友", "保存图片", "收藏"],
                success: function(data) {
                  console.log(
                    "选中了第" +
                      (data.tapIndex + 1) +
                      "个按钮,第" +
                      (data.index + 1) +
                      "张图片"
                  );
                },
                fail: function(err) {
                  console.log(err.errMsg);
                }
              }
          });
    },
    //跳转页面封装
    toPage(url){
        uni.navigateTo({
            url: url,
          });
    }
}
export default utils