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
            // url: 'https://hmr.wxapp.huangmaorui.cn' + url, //仅为示例，并非真实接口地址。
            // url: 'http://127.0.0.1:8002' + url, 
            url: 'http://192.168.1.115:8002' + url, 
            data,
            success: (res) => {
                fn(res.data)
            }
        });
    },
    ajaxP(url, data, fn) {
        console.log(url, '传递进来的路径');
        uni.request({
            // url: 'http://127.0.0.1:8002' + url, 
            url: 'http://192.168.1.115:8002' + url, 
            data,
            method:'POST',
            header: {
                'Content-type':'application/json'
            },
            success: (res) => {
                fn(res.data)
            }
        });
    },
}
export default utils 