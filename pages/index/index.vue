<template>
  <view>
    <!-- 搜索 开始 -->
    <search></search>

    <!-- 搜索 结束 -->

    <view class="content">
      <!-- 轮播图 开始 -->
      <!-- <view class="swiper">
        <swiper autoplay indicator-dots circular>
        <swiper-item v-for="item in banner" :key="item.id">
          <image :src="item.thumb"></image>
        </swiper-item>
        </swiper>
      </view>-->
      <!-- 轮播图 结束 -->

      <!-- 热门推荐 开始 -->
      <view class="recommend"></view>
      <!-- 热门推荐 结束 -->
    </view>
  </view>
</template>

<script>
import Search from "./components/search";
export default {
  components: {
    Search,
  },
  data() {
    return {};
  },
};
</script>

<style lang="scss" scoped>
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