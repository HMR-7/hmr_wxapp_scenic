const utils = {
    showToast(title, time) {
        console.log(title, time);
        uni.showToast({
            title: title,
            duration: time
        });
    },
    ajax(url, data, fn) {
        console.log(url, '传递进来的路径');
        // console.log(data, '传递进来的请求参数');
        uni.request({
            url: 'https://hmr.wxapp.huangmaorui.cn' + url, //仅为示例，并非真实接口地址。
            data,
            header: {
                'request-header': 'HMR-Api' //自定义请求头信息
            },
            success: (res) => {
                fn(res.data)
            }
        });
    }
}
export default utils