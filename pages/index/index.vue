<template>
  <view>
    <view v-for="(item,index) in list.data" :key="index">
      <view>{{item.good_name}}</view>
    </view>
  </view>
</template>

<script>
export default {
  data() {
    return {
      list: [],
      limit: 10,
    };
  },
  onLoad() {
    // this.getLisy();
    // this.$u.showToast("我是封装后的提示框", 5000);
    this.getAjax();
    return;
    uni.showToast({
      title: "我是消息提示框",
      duration: 2000,
    });
  },
  methods: {
    getLisy() {
      let t = this;
      uni.request({
        url: t.url + "/getIndexList", //仅为示例，并非真实接口地址。
        data: {
          page: 1,
          limit: 10,
        },
        header: {
          "request-header": "HMR-Api", //自定义请求头信息
        },
        success: (zmres) => {
          if (zmres.data.code == 1) {
            console.log("请求成功");
            console.log(zmres);
            t.list = zmres.data;
          } else {
            console.log(zmres);
          }
          // console.log(res.data);
          // this.text = "request success";
        },
        fail: (res) => {
          console.log(res);
        },
      });
    },
    getAjax() {
      let t = this,
        limit = t.limit;
      let data = { page: 1, limit: limit };
      t.$u.ajax("/getIndexList", data, function (res) {
        console.log(res, "接口返回数据");
        t.list = res;
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.is_fixed {
  position: fixed;
  left: 0;
  right: 0;
  top: 0;
}
.search {
  height: 80rpx;
  button {
    font-size: 15px;
    color: #808080;
    border-radius: 80rpx;
    display: flex;
    height: 80rpx;
    border: #808080;
    margin: 20rpx 20rpx;
    background-color: #f1f1f1;
    justify-content: center;
    align-items: center;
  }
}
</style>