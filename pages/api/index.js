// 本地地址  http://127.0.0.1:8002
// 本地网络真机测试地址 随机 http://192.168.1.104:8002
const http = 'http://127.0.0.1:8002'
const api = {
    getIndex:http + '/',//获取首页列表数据
    getSwiper:http + '/getSwiper',//详情页页面数据
    getHotelList:http + '/getHotelList',//获取酒店推荐列表
    getFoodList:http + '/getFoodList',//获取食物推荐列表
    getKeywords:http + '/getKeywords',//获取搜索联想词
    getKeyWordSearchList:http + '/getKeyWordSearchList',// 搜索页面关键词
    getyzm:http + '/getyzm',//获取用户注册发送验证码
    getUserInsert:http + '/getUserInsert',//新用户信息存入
    userCollect:http + '/userCollect',// 添加、移除用户收藏
    getCollectList:http +'/getCollectList',// 查看用户收藏信息
    userFooter:http +'/userFooter',//添加用户足迹表
    getFooterList:http +'/getFooterList',//查询用户足迹表
    getUserId:http +'/getUserId',//获取用户userId 
    submitFeedback:http +'/submitFeedback',//用户上传日志
    getTravelLog:http +'/getTravelLog',// 获取用户日志
    getSearchResult:http +'/getSearchResult',//写日志时，搜索按钮的点击事件查询
    getScenicwords:http +'/getScenicwords',// 写日志时，获取景区联想词
    
}

export default api