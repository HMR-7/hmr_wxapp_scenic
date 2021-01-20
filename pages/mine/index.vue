<template>
  <view class="page">
    <view class="login">
      <view class="login-left">
        <image src="../../static/logo.png" mode="" />
      </view>
      <view class="login-right">
        <view class="username">
          <h1>
            老张
          </h1>
        </view>
        <view class="city">
        City：
        </view>
      </view>
    </view>
    <view class="czzx">
      <h1>操作中心</h1>
      <view class="cz">
      <view class="sc"><i>0</i><i>我的收藏</i> </view>
      <view class="zj"><i>0</i><i>我的足迹</i> </view>
    </view></view>
    <view class="kfzx">
    <h1>客服中心</h1>
      <view class="kf">
      <view class="dh"><i class="iconfont icon-dianhua01"></i><i>电话客服</i> </view>
      <view class="wx"><i class="iconfont icon-weixin"></i><i>微信客服</i> </view>
      <view class="ly"><i class="iconfont icon-biji"></i><i>旅游日志</i> </view>
    </view></view>
    </view>
  </view>
</template>

<script>
export default {
  data(){
    return{

    }
  },
  onLoad(){

  },
  methods:{
     getAjax() {
      let t = this,
        limit = t.limit,
        keyword = t.serarWord;
      let data = { page: 1, limit: limit, keyword: keyword };
      t.$u.ajax("/getKeyWordSearchList", data, function (res) {
        console.log(res, "搜索接口返回数据");
        t.list = res.data;
      });
    },
  }
};
</script>

<style lang="scss" scoped>
.page{
  background-color:#f8f8f8;
  height: 1500rpx;
}
.login {
  height: 200rpx;
  width: 100%;
  background-color: #ffd300;
  display: flex;
  justify-content: flex-start;
  .login-left {
    image {
      margin: 30rpx 20rpx 50rpx 50rpx;
      width: 130rpx;
      height: 130rpx;
      border-radius: 65rpx;
    }
  }

  .login-right {
    margin-top: 50rpx;
    .username {
      h1 {
        color: #fff;
      }
    }

    .city {
        color: #fff;

    }
  }
}
.czzx {
  background-color: #fff;
  margin: 20rpx 20rpx 20rpx 20rpx;
  height: 200rpx;
  border-radius: 30rpx;
  h1 {
    padding: 15rpx 0 10rpx 15rpx;
    font-weight: 700;
    color: black;
    border-bottom: 1rpx solid #f8f8f8;
  }
.cz{
  display: flex;
  justify-content: flex-start;
.sc {
    flex: 1;
    margin-top: 20rpx;
    text-align: center;
  }

  .zj {
    flex: 1;
    margin-top: 20rpx;
    text-align: center;
    
  }
}
  
}
.kfzx {
   background-color: #fff;
  margin: 20rpx 20rpx 20rpx 20rpx;
  height: 200rpx;
  border-radius: 30rpx;
  h1 {
 padding: 15rpx 0 10rpx 15rpx;
    font-weight: 700;
    color: black;
    border-bottom: 1rpx solid #f8f8f8;
  }

  .kf {
    display: flex;
  justify-content: flex-start;
    .dh {
      flex: 1;
    margin-top: 35rpx;
    text-align: center;
    }

    .wx {
      flex: 1;
    margin-top: 35rpx;
    text-align: center;
    }

    .ly {
      flex: 1;
    margin-top: 35rpx;
    text-align: center;
    }
  }
}
</style>