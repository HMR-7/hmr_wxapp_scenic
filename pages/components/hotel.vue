<template>
  <view>酒店</view>
</template>

<script>
export default {
  data() {
    return {
      list: [],
      good_id: "",
    };
  },
  onLoad: function (options) {
    console.log(options, "传递过来的数据");
    this.good_id = options.good_id;
    this.getAjax();
  },
  methods: {
    getAjax() {
      let t = this; //异步请求赋值 必要
      let data = { good_id: this.good_id };
      this.$u.ajax("/getGoodDetail", data, function (res) {
        console.log(res, "接口返回数据");
        t.list = res.data;
      });
    },
  },
};
</script>

<style>
</style>