<template>
  <view class="page">
    <view class="top">
      <view class="gs">
        <image src="../../static/icon/dl1.png" mode="" />
      </view>
    </view>
    <view class="content">
      <!-- 手机号内容 -->
      <view class="sj">
        <image src="../../static/icon/sj.png" mode="" />
        <h1>+86</h1>
        <input
          type="text"
          id="phone"
          v-model="phone"
          placeholder="请输入手机号"
        />
        <view class="get" @click="getyzm(phone)">
          <text>{{ !codeTime ? "获取验证码" : codeTime + "s" }}</text>
        </view>
      </view>
      <!-- 输入验证码内容 -->
      <view class="yzm"
        ><image src="../../static/icon/yzm.png" mode="" /><input
          type="text"
          placeholder="请输入验证码"
          v-model="yzm"
      /></view>
      <view class="login"><button @click="getyzmtr()">登录</button></view>
    </view>
  </view>
</template>

<script>
export default {
  data() {
    return {
      phone: "",
      yzm: "",
      PhoneCode: {},
      codeTime: 0,
    };
  },
  methods: {
    //验证码发送请求
    getyzm(phone) {
      let t = this,
        phonetf = /^[1][3,4,5,7,8][0-9]{9}$/,
        codeIstrue = phonetf.test(phone);
      console.log(codeIstrue);
      if (codeIstrue == false) {
        t.$u.showToast("手机号码有误，请重填", 1000, "none");
      } else {
        if (t.codeTime > 0) {
          t.$u.showToast("不能重复获取", 1000, "none");
          return;
        } else {
          t.codeTime = 60;
          let timer = setInterval(() => {
            t.codeTime--;
            if (t.codeTime < 1) {
              clearInterval(timer);
              t.codeTime = 0;
            }
          }, 1000);
        }
        // console.log(t.phone);
        let data = { phone: t.phone };
        t.$u.ajax(t.$api.getyzm, data, function (res) {
          console.log(res);
          t.PhoneCode = res.validate;
          let yzm = "你的验证码：" + JSON.stringify(res.js_code);
          t.$u.showToast(yzm, 3000, "none");
        });
      }
    },
    //验证码验证真假
    getyzmtr() {
      let t = this,
        phone = t.phone,
        code = t.yzm,
        phonecode = t.PhoneCode,
        sendCodeP = (phone) => {
          for (let i = 0; i < phonecode.length; i++) {
            // console.log(phonecode[i]);
            if (phone == phonecode[i].phone) {
              return true;
            } else {
              // console.log(validatePhoneCode[0].phone);
              return false;
            }
          }
        };
      let findCodeAndPhone = (phone, code) => {
        for (let item of phonecode) {
          if (phone == item.phone && code == item.code) {
            return "login";
          }
        }
        return "error";
      };
      //验证码登录

      // console.log(phone);
      // 该手机号是否发送过验证码
      if (sendCodeP(phone)) {
        //验证码和手机号是否匹配
        let status = findCodeAndPhone(phone, code);
        if (status == "login") {
          //登录成功
          console.log("登录成功");
          uni.setStorageSync("phone", phone);
          uni.getUserProfile({
            desc: "Wexin", // 声明获取用户个人信息后的用途，后续会展示在弹窗中，请谨慎填写
            success: (res) => {
              console.log(res.userInfo);
              t.userInfo = res.userInfo;
              if (res.userInfo) {
                uni.setStorageSync("userInfo", res.userInfo);
              }
              uni.switchTab({
                url: "/pages/index/index",
              });
            },
            fail: (err) => {
              console.log(err);
            },
          });
        } else if (status == "error") {
          console.log("登录失败");
          t.$u.showToast("验证码错误", 2000, "none");
        }
      } else {
        console.log("未发送验证码");
        t.$u.showToast("未发送验证码", 2000, "none");
      }
    },
  },
};
</script>

<style lang="scss" scoped>
.page {
  position: relative;
  background-color: #f1f1f1;
  height: 1800rpx;
  .top {
    background-color: var(--themeColor);
    height: 300rpx;

    .gs {
      padding-top: 20rpx;
      width: 100%;
      height: 150rpx;
      display: flex;
      justify-content: center;
      align-items: center;
      image {
        width: 150rpx;
        height: 150rpx;
      }
    }
  }
  .content {
    position: absolute;
    top: 140rpx;
    left: 25rpx;
    width: 700rpx;
    background-color: #fff;
    margin: 40rpx auto;
    border-radius: 15rpx;
    display: flex;
    justify-content: space-between;
    flex-direction: column;
    align-items: center;
    height: 400rpx;
    .sj {
      flex: 1;
      width: 100%;
      margin: 0 20rpx;
      padding: 20rpx 50rpx;
      border-bottom: 1rpx solid #c8c7cc;
      display: flex;
      justify-content: space-between;
      line-height: 60rpx;
      height: 60rpx;

      image {
        margin-top: 30rpx;
        width: 40rpx;
        height: 40rpx;
        margin-right: 20rpx;
      }
      h1 {
        margin-top: 20rpx;
      }
      input {
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 30rpx 40rpx;
      }
      .get {
        margin-top: 20rpx;
        display: flex;
        justify-content: center;
        align-items: center;
        width: 180rpx;
        font-size: 20rpx;
        background-color: var(--themeColor);
        height: 70rpx;
        line-height: 70rpx;
        color: white;
        border-radius: 10rpx;
        padding: 0 20rpx;
      }
    }
    .yzm {
      height: 150rpx;
      flex: 1;
      width: 100%;
      padding: 20rpx 50rpx;
      border-bottom: 1rpx solid #c8c7cc;
      display: flex;
      justify-content: start;
      image {
        width: 40rpx;
        height: 40rpx;
        margin-right: 20rpx;
        margin-top: 30rpx;
      }
      input {
        margin-top: 30rpx;
      }
    }
    .login {
      flex: 1;
      width: 100%;
      padding: 20rpx 50rpx;
      height: 80rpx;
      button {
        background-color: #f1f1f1;
      }
    }
  }
}
</style>
