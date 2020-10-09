<template>
  <view @click="test">搜索页面</view>
</template>

<script>
export default {
  data() {
    return {
      serarWord: "",
      list: [],
      limit: 10,
    };
  },
  onLoad(options) {
    console.log(options, "传递过来的数据");
    this.serarWord = options.name;
    this.getAjax();
  },
  methods: {
    getAjax() {
      let t = this,
        limit = t.limit,
        keyword = t.serarWord;
      let data = { page: 1, limit: limit, keyword: keyword };
      t.$u.ajax("/getKeyWordSearchList", data, function (res) {
        console.log(res, "搜索接口返回数据");
        // t.list = res;
      });
    },
  },
};
</script>

<style lang="scss" scoped>
</style>