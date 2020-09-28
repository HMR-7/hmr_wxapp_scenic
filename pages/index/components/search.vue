<template>
  <view>
    <!-- 搜索 -->
    <view class="search-cont">
      <view class="search-code">
        <image src="../../../static/icon/erweima.svg" mode="widthFix"></image>
      </view>
      <view class="search">
      <image src="../../../static/icon/ss.svg" mode="widthFix" class="search-img"></image>
      <input type="text" placeholder="请输入文字" disabled>

      </view>
      <view class="search-code">
        <image src="../../../static/icon/xiaoxi.svg" mode="widthFix"></image>
      </view>
    </view>
    <!-- 轮播图 -->
    <swiper  :indicator-dots="true" :autoplay="true" :interval="3000" :duration="1000" :circular="true" indicator-color="rgba(255,255,255)" indicator-active-color="#00ff00">
      <swiper-item>
        <view class="swiper-item" id="swiper-item" @click="localCont()"><image src="https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2579860314,778624796&fm=26&gp=0.jpg" mode="" /></view>
      </swiper-item>
      <swiper-item>
        <view class="swiper-item" id="swiper-item" @click="localCont()"><image src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601272129441&di=9484548ca30554996be8c1a0908a9e97&imgtype=0&src=http%3A%2F%2Fimg.improve-yourmemory.com%2Fpic%2Fd47d90903d43dcb4ec62f7f99bda574b-0.jpg" mode="" /></view>
      </swiper-item>
      <swiper-item>
        <view class="swiper-item" id="swiper-item" @click="localCont()"><image src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1601272129440&di=84f4d1464e6b9dbbf4e2f00324ff6541&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2Ff%2F54e18e5654482.jpg" mode="" /></view>
      </swiper-item>
        </swiper>
  </view>
</template>

<script>
export default {
  name: "search",
};
</script>

<style lang="scss" scoped>
.search-cont {
  display: flex;
  justify-content: space-between;
  height: 120rpx;
  align-items: center;
  background: linear-gradient(to top,#ffe566 10%,#ffd300 100%);
  padding: 30rpx 0;
  .search-code {
    width: 70rpx;
    height: 70rpx;
  }

  .search {
    height: 80rpx;
    line-height: 80rpx;
    width: 100%;
    display: flex;
    flex-direction:flex;
    background: #fff7d4;
    border-top-left-radius: 60rpx;
    border-bottom-left-radius: 60rpx;
    border-bottom-right-radius: 60rpx;
    margin: 0 10rpx;
    .search-img {
      margin: auto 0 auto 20rpx;
      width: 100rpx;
      height: 100rpx;
    }

    input {
      height: 100rpx;
      line-height: 100rpx;
      width: 100%;
      font-size: 30rpx;
      color: #666666;
    }
  }
}
//轮播
.imageurl{
  width: 100%;
  height: 300rpx !important;
  swiper{
    height: 300rpx !important;

  }
}
</style>