<template>
  <view class="page">
    <!-- 已登录 -->
    <view class="login">
      <view class="login-left">
        <image :src="userInfo.avatarUrl?userInfo.avatarUrl:'../../static/logo.png'" mode="" />
      </view>
      <view v-if="userInfo.avatarUrl" class="login-right">
        <view class="username">
          <h1>
            {{userInfo.nickName}}
          </h1>
        </view>
        <view class="city">
        City：{{userInfo.city}}
        </view>
      </view>
      <view v-else class="login-right">
      <button class="login-btn" open-type="getUserInfo" @getuserinfo="handleGetUserInfo">登录</button>
    </view>
    </view>
    <!-- 未登录 -->
    
    <view class="czzx">
      <h1>操作中心</h1>
      <view class="cz">
      <view class="sc"><i>0</i><i>我的收藏</i> </view>
      <view class="zj"><i>0</i><i>我的足迹</i> </view>
    </view></view>
    <view class="kfzx">
    <h1>客服中心</h1>
      <view class="kf">
      <view class="dh" ><button @click="callPhone"><i class="iconfont icon-dianhua01"></i><i>电话客服</i></button> </view>
      <view class="wx"><button open-type="contact"><i class="iconfont icon-weixin"></i><i>微信客服</i></button></view>
      <view class="ly"><button><i class="iconfont icon-biji"></i><i>旅游日志</i></button> </view>
    </view></view>
    </view>
</template>

<script>
export default {
  data(){
    return{
      loginzt:false,
      userInfo:{},
      openid:'',
      userName:'',
      userPhone:'13285871185'
    }
  },
  created(){
    // this.getcode();
    // this.getInsertUserInfo();
  },
  methods:{
     getcode(){
       wx.login({
        success: (res) =>{
        // 1.获取用户登陆的临时凭证，和用户是否授权没有直接关系
        var js_code= res.code;
        let t=this;
        if(js_code){
          // console.log('用户登录凭证'+js_code);
          let data={js_code:js_code};
          t.$u.ajax("/getOpenid", data, function (res) {
        console.log(res,"搜索接口返回数据");
         t.openid=res.openid;
         console.log(t.openid);
      });

        }
      }
    })
    },
    getInsertUserInfo(){
      console.log(this.openid);
      let t =this;
      let openid=t.openid;
      let data={openid:openid,userName:t.userName,userPhone:t.userPhone};
           t.$u.ajax("/insertUserInfo", data, function (res) {
        console.log(res,"搜索接口返回数据");
      });
    },
    //  getAjax() {
    //   let t = this,
    //    code=t.js_code;
    //    console.log(code+'码');
    //   let data = {js_code:code};
     
    // },
    callPhone(){
      uni.makePhoneCall({
      phoneNumber: '13285871185' //仅为示例
});
    },
    handleGetUserInfo(res){
      console.log(res);
      if(res.mp.detail.userInfo){
        this.userInfo = res.mp.detail.userInfo
      }
    }
  },
  mounted(){
    wx.getUserInfo({
      success:(res) =>{
        // 更新userInfo的状态数据
        this.userInfo = res.userInfo;
        // console.log(this.userInfo);
        this.userName=this.userInfo.nickName;
        // console.log(this.userName);
      },
      fail:() =>{
        console.log('获取失败');
      }
    })
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
  color: #808080;
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
    text-align: center;

    button{
    background-color: #fff;
    height: 135rpx;
    color: #808080;
  font-size: 27rpx;

    i{
      margin-top: 10rpx;
      height: 40rpx;
    }
  }
     button::after{ border: none;} 
    }

    .wx {
      flex: 1;
      text-align: center;
  button{
    background-color: #fff;
    height: 135rpx;
    color: #808080;
  font-size: 27rpx;

    i{
      height: 40rpx;
      margin-top: 10rpx;

    }
  }
     button::after{ border: none;} 
    }

    .ly {
      flex: 1;
    text-align: center;
    button{
    background-color: #fff;
    height: 135rpx;
    color: #808080;
  font-size: 27rpx;

    i{
      height: 40rpx;
      margin-top: 10rpx;

    }
  }
     button::after{ border: none;} 
    }
  }
}
</style>