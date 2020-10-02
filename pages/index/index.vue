<template>
  <view>
    <!-- 搜索 开始 -->
    <search></search>

    <!-- 搜索 结束 -->

    <!-- 导航栏 开始 -->
    <Ticket></Ticket>
    <!-- 导航栏 结束 -->

    <!-- 精准导航 开始 -->
    <Classify></Classify>
    <!-- 精准导航 结束 -->

    <!-- 内容 开始 -->
    <Content id="boxFixed" :class="{'is_fixed' : isFixed}"></Content>
    <!-- 内容 结束 -->
    <view style="height:140rpx;"></view>
    <Article></Article>
  </view>
</template>

<script>
import Search from "./components/search";
import Ticket from "./components/ticket";
import Classify from "./components/classify";
import Content from "./components/content";
import Article from "./components/article";

export default {
  components: {
    Search,
    Ticket,
    Classify,
    Content,
    Article,
  },
  data() {
    return {
      isFixed: false,
      rect: "",
      menutop: "",
    };
  },
  onLoad() {
    const query = wx.createSelectorQuery();
    query.select("#boxFixed").boundingClientRect();
    query.exec((res) => {
      this.menutop = res[0].top;
    });
  },
  //监听页面滚动
  onPageScroll(e) {
    this.rect = e.scrollTop;
  },
  //计算属性
  computed: {
    //滑动组件置顶
    namepage() {
      console.log("执行");
      if (this.rect > this.menutop) {
        this.isFixed = true;
      } else {
        this.isFixed = false;
      }
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