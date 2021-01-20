<template>
<view>
  <view class="search-top">
<view class="search-content">
<view class="left">
  <span class="iconfont icon-sousuo"></span>
  <input type="text" placeholder="请输入关键词" v-model="text">
</view>

</view>
<view class="right">
  <button @click="test(text)">搜索</button>
</view>
  </view>
  <view class="geduan"></view>
  <!-- 搜索历史模块 -->
  <view class="lstop">
    <view class="title">
      <span class="left">搜索历史</span>
      <span class="right iconfont icon-shanchu"></span>
    </view>
  </view>
  <!-- /搜索历史模块 -->

  </view>
</template>

<script>
export default {
  data() {
    return{
      
    }
  },
  onLoad(options) {

  },
  methods: {
    test(text) {
      console.log(text);
      uni.navigateTo({
        url: "./searchDetails?name=" + text,
      });
    },
  }
};
</script>

<style lang="scss" scoped>
.search-top{
  display: flex;
  width: 100%;
  height: 70rpx;
  margin-bottom: 15rpx;
    .search-content{
    display: flex;
    justify-content:space-between;
    width: 80%;
    padding-left: 20rpx;
    text-align: left;
    margin: 10rpx 5rpx 10rpx 15rpx;
    height: 50rpx;
    background: #fff;
    font-size: 20rpx;
    background-color: #f8f8f8;
        .left{
          flex: 1;
          display: flex;
          justify-content: flex-start;
          color:#999;
          span{
            font-size: 50rpx;
          }
          input{
            flex: 1;
            margin-top: 3rpx;
          input::-webkit-input-placeholder{
            color: #dadada !important;
            
          }
          }
        }
        
    }
    .right{
      margin:10rpx 5rpx 10rpx 10rpx;
      height: 50rpx;
      button{
      line-height: 50rpx;
      font-size: 25rpx;
      text-align: center;
      color: #fff;
      background: #ffd300;
      border: none;

      }
    }
}
.geduan{
  width: 100%;
  height: 10rpx;
  background-color: #f8f8f8;
  margin-bottom: 15rpx;
}
.lstop{
  .title{
    display: flex;
    justify-content: space-between;
    .left{
      margin-left: 10rpx;
    }
    .right{
      margin-right: 10rpx;
    }
  }
}
</style>