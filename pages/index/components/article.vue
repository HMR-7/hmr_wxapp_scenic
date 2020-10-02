<template>
  <view class="active">
    <view class="conteng">
<block v-for="(item,index) in Aeticleend" :key="index">
<view class="conteng-article" @click="localCont()">
  <view class="conteng-img">
    <image :src="item.src" mode="aspectFill" class="animated fadeIn"></image>
  </view>
  <!-- 文字介绍 -->
  <view class="active-introduce">
    <view class="active-name">{{item.good_name}}</view>
    <view class="active-title">{{item.tags}}</view>
    <view class="active-label">{{item.introduce}}</view>
    <view class="purchase">
      <text class="active-price">￥{{item.price}}</text>
    </view>
  </view>
</view>
</block>
</view>
  </view>
</template>

<script>
export default {
  name: "article",
  data(){
    return{
      Aeticleend:[
        {
          good_name: "蓬莱阁景区",
          good_price: 88,
          src: "https://travel.backend.huangmaorui.cn/image/plg.jpg",
          address: "烟台市蓬莱市迎宾路7号",
          tags: ["碑刻匾额满目", "人间仙境"],
          introduce: "八仙过海”神话源于此，可以远眺黄海与渤海的交界处。",
        }
      ]
    }
  }
};
</script>

<style lang="scss" scoped>
.active{
  margin: 0 20rpx;

}
.conteng{
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  width: 100%;
  -webkit-flex-wrap:wrap;
  overflow: hidden;
}
.conteng-article{
  width: 48%;
  flex-direction: column;
  display: flex;
  box-sizing: border-box;
}
</style>