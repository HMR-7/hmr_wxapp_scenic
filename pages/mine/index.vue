<template>
  <view class="page">
    <!-- 已登录 -->
    <view class="login">
      <view class="login-left">
        <image
          :src="
            userInfo.avatarUrl ? userInfo.avatarUrl : '../../static/icon/tx.png'
          "
          mode=""
        />
      </view>
      <view v-if="userInfo.avatarUrl" class="login-right">
        <view class="username">
          <h1>
            {{ userInfo.nickName }}
          </h1>
        </view>
        <view class="city"> City：{{ userInfo.city }} </view>
        <view style="color: #fff" @click="exit()">退出登录 ></view>
      </view>
      <view v-else class="login-right-gg">
        <view class="login-btn" @click="getUserInfo()">点击登录 ></view>
      </view>
    </view>
    <uni-popup ref="popup" type="dialog">
      <uni-popup-dialog
        mode="base"
        type="warn"
        message="成功消息"
        content="你还未登录，需要先去登录吗"
        :duration="2000"
        :before-close="true"
        @close="close"
        @confirm="confirm"
      ></uni-popup-dialog>
    </uni-popup>
    <!-- 未登录 -->
    <view class="czzx">
      <h1>操作中心</h1>
      <view class="cz">
        <view class="sc"
          ><i>{{ collectlength ? collectlength : a }}</i
          ><i @click="getcolletye()">我的收藏</i>
        </view>
        <view class="zj"
          ><i>{{ footlength ? footlength : a }}</i
          ><i @click="getFooer()">我的足迹</i>
        </view>
      </view></view
    >
    <view class="kfzx">
      <h1>客服中心</h1>
      <view class="kf">
        <view class="dh"
          ><button @click="callPhone">
            <i class="iconfont icon-dianhua01"></i><i>电话客服</i>
          </button>
        </view>
        <view class="wx"
          ><button open-type="contact">
            <i class="iconfont icon-weixin"></i><i>微信客服</i>
          </button></view
        >
        <view class="ly"
          ><button @click="bxrz()">
            <i class="iconfont icon-biji"></i><i>旅游日志</i>
          </button>
        </view>
      </view></view
    >
  </view>
</template>

<script>
export default {
  data() {
    return {
      loginzt: false,
      userInfo: {},
      openid: "",
      userName: "",
      userPhone: "",
      footlength: 0,
      user_id: 0,
      collectlength: 0,
      a: 0,
    };
  },
  onShow() {
    let t =this;
    var userphone = uni.getStorageSync("phone");
     t.userPhone = userphone
    if (userphone || t.userInfo) {
      t.getUserId();
    }
    t.userInfo = uni.getStorageSync("userInfo");
        if (!t.userInfo.avatarUrl) {
          t.open();
        }
  },
  onLoad() {
  },
  methods: {
    //退出登录
    exit() {
      let t =this;
      t.collectlength = 0;
      t.footlength = 0;
      t.userInfo = {};
      let userInfohc = {};
      let user_id = "";
      let phone = "";
      uni.setStorageSync("userInfo", userInfohc);
      uni.setStorageSync("user_id", user_id);
      uni.setStorageSync("phone", phone);
    },
    // 打开消息提示框
    open() {
      // 通过组件定义的ref调用uni-popup方法
      this.$refs.popup.open();
    },
    close(done) {
      done();
    },
    //  点击确认按钮触发
    confirm(done, value) {
      uni.navigateTo({
        url: "./login",
      });
      done();
    },
    //跳转去编写文章页面
    bxrz() {
      uni.navigateTo({
        url: "../mineg/log",
      });
    },
    //得到用户userid
    getUserId() {
      let t = this;
      var userphone = uni.getStorageSync("phone");
      console.log(userphone);
      let data = { userPhone: userphone };
      t.$u.ajax(t.$api.getUserId, data, function (res) {
        // console.log(res, "搜索接口返回数据");
        var user_id = res[0].id;
        uni.setStorageSync("user_id", user_id);
        let user_iddd = uni.getStorageSync("user_id");
        if (user_iddd) {
          t.getlength();
          t.getcollectlength();
        }
        console.log(user_iddd, "99999");
      });
    },
    //跳转去用户收藏界面
    getcolletye() {
      uni.navigateTo({
        url: "../mineg/collect",
      });
    },
    // 跳去浏览历史页面
    getFooer() {
      uni.navigateTo({
        url: "../mineg/foot",
      });
    },
    //获取用户浏览页面的个数
    getlength() {
      let t = this;
      t.user_id = uni.getStorageSync("user_id");
      let data = { page: 1, limit: 200, user_id: t.user_id };
      t.$u.ajax(t.$api.getFooterList, data, function (res) {
        // console.log(res, "搜索接口返回数据");
        // console.log(res.length);
        t.footlength = res.length;
      });
    },
    //获取用户收藏页面的个数
    getcollectlength() {
      let t = this;
      t.user_id = uni.getStorageSync("user_id");
      let data = { page: 1, limit: 200, user_id: t.user_id };
      t.$u.ajax(t.$api.getCollectList, data, function (res) {
        // console.log(res, "搜索接口返回数据");
        // console.log(res);
        t.collectlength = res.length;
      });
    },
    // 存入用户信息
    getUserInsert() {
      let t = this;
      let data = { nickname: t.userName, userPhone: t.userPhone };
      t.$u.ajax(t.$api.getUserInsert, data, function (res) {
        console.log(res, "搜索接口返回数据");
      });
    },
    // 电话客服 start
    callPhone() {
      uni.makePhoneCall({
        phoneNumber: "13285871185", //仅为示例
      });
    },
    // 获取用户信息
    getUserInfo() {
      uni.navigateTo({
        url: "./login",
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.page {
  background-color: #f8f8f8;
  height: 100vh;
}
.login {
  height: 200rpx;
  width: 100%;
  background-color: var(--themeColor);
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
    margin-top: 38rpx;
    .username {
      h1 {
        color: #fff;
      }
    }

    .city {
      color: #fff;
    }
  }
  .login-right-gg {
    display: flex;
    justify-content: center;
    align-items: center;
    color: #fff;
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
  .cz {
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

      button {
        background-color: #fff;
        height: 135rpx;
        color: #808080;
        font-size: 27rpx;

        i {
          margin-top: 10rpx;
          height: 40rpx;
        }
      }
      button::after {
        border: none;
      }
    }

    .wx {
      flex: 1;
      text-align: center;
      button {
        background-color: #fff;
        height: 135rpx;
        color: #808080;
        font-size: 27rpx;

        i {
          height: 40rpx;
          margin-top: 10rpx;
        }
      }
      button::after {
        border: none;
      }
    }

    .ly {
      flex: 1;
      text-align: center;
      button {
        background-color: #fff;
        height: 135rpx;
        color: #808080;
        font-size: 27rpx;

        i {
          height: 40rpx;
          margin-top: 10rpx;
        }
      }
      button::after {
        border: none;
      }
    }
  }
}
</style>
