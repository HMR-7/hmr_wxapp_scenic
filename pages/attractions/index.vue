<template>
<view>
  <scroll-view
    class="attractions_view"
    scroll-y
    >
     <!-- 轮播图 -->
    <view class="attractions-swiper">
      <swiper autoplay indicator-dots circular>
        <swiper-item v-for="item in list" :key="item.id">
          <image :src="item.swipeArr"></image>
        </swiper-item>
      </swiper>
    </view>
    <!-- 标题 -->
    <view class="title">
    <view class="title-gn">{{good_name}}</view>
    <view class="title-tags">{{tags}}</view>
    <view class="title-sc"></view>
    </view>
    </scroll-view>
    </view>
</template>

<script>
export default {
  data() {
    return {
      list:[],
      user_id:[],
      good_id:"",
    };
  },
  onLoad() {
    this.getAjax();
    return;
  },
  methods: {
    getAjax() {
      let data = { user_id: this.user_id, good_id: this.good_id };
      this.$u.ajax("/getGoodDetail", data, function (res) {
        console.log(res, "接口返回数据");
       
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.attractions_view {
  //height:屏幕的高度 - 头部标题的高度
  height: calc(100vh - 36px);
  background: #f8f8f8;
}
.attractions_swiper {
  swiper {
    //750rpx
    //height:calc(750rpx/2.3)
    height: 326.1rpx;
    image {
      height: 100%;
    }
  }
}
.title {
  height: 300rpx;
  width: 100%;
  display: flex;
  margin: 20rpx 0;
  .title-gn {

  }

  .title-tags {

  }

  .title-sc {

  }
}
</style>