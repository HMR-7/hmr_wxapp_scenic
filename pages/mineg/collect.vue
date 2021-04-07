<template>
  <!-- 接上 -->
  <view>
    <view  class="search-content">
  <navigator class="box" v-for="(item,index) in collectList" :key="index" 
    :url="`../attractions/index?good_id=${item.id}`">
  <image class="bd" :src="item.src" mode="" />
  <span class="main">
    {{item.good_name}}
  </span>
  <span class="submain">
    {{item.introduce}}
  </span>
  <view class="ft">
    <view class="outer">
       <view class="dotWrap">
        <image class="dot" src="../../static/icon/ysc.png" mode="" />
      </view>
           <view class="tagWrap">
        <span class="tag">
          {{item.tags}}
        </span>
      </view>
    </view>
    <view class="block">
      <span class="num">
        ￥{{item.childTicket}}元/起
      </span>
    </view>
    </view>
    
</navigator>
  </view>
  </view>
</template>

<script>
export default {
    data(){
        return{
            collectList:[],
            user_id:0,
            page:1,
        }
    },
    created(){
      this.user_id = uni.getStorageSync('user_id');
      if(this.user_id){
        this.getCollect();
      }else{
        uni.showToast({
            title: "请先手机登录后再查看",
            icon: "none",
          });
}
        
    },
    methods:{
      // 触底加载
  onReachBottom() {
    // console.log("底线");
    this.page += 1;
    this.getCollect();
  },
       getCollect(){
      let t = this;
      let data = { user_id: t.user_id,limit:30,page:t.page };
      this.$u.ajax("/getCollectList", data, function (res) {
        console.log(res, "接口返回数据");
        if (res.length == 0) {
          t.page--;
          uni.showToast({
            title: "没有更多数据了",
            icon: "none",
          });
        } else {
          if (t.page == 1) {
        t.collectList=res;
          } else {
            t.collectList = [...t.collectList, ...res];
          }
        }
      });
    },
    }

}
</script>

<style lang="scss" scoped>
.search-content{
  display: flex;
  flex-wrap: wrap;
  justify-content: flex-start;
}
.box {
  display: flex;
  align-items: flex-start;
  flex-direction: column;
  border-radius: 24rpx;
  background-color: #ffffff;
  width: 94%;
  height: 646rpx;
  box-shadow: 0 2rpx * 2 9rpx * 2 0 rgba(0,0,0,0.11);
  align-self: center;
  justify-content: center;
  margin-top: 16rpx * 2;
  margin-right: 20rpx;
  margin-left: 20rpx;
}
.box .bd {
  margin: 10rpx 20rpx;
  width: 94%;
  height: 394rpx;
  border-radius: 24rpx;
}
.box .main {
  margin-top: 30rpx;
  margin-left: 24rpx;
  max-width: 666rpx;
  height: 36rpx;
  overflow: hidden;
  text-overflow: ellipsis;
  line-height: 36rpx;
  color: #333333;
  font-size: 32rpx;
  font-weight: 500;
}
.box .submain {
  margin-top: 16rpx;
  margin-left: 24rpx;
  width: 676rpx;
  height: 60rpx;
  overflow: hidden;
  text-overflow: ellipsis;
  line-height: 40rpx;
  color: #888888;
  font-size: 26rpx;
  font-weight: 300;
}
.box .ft {
  box-sizing: border-box;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  padding-right: 23rpx;
  padding-left: 18rpx;
  width: 702rpx;
}
.box .outer {
  display: flex;
  align-items: center;
  flex-direction: row;
  height: 36rpx;
}
.box .dotWrap {
  display: flex;
  position: relative;
  align-items: flex-start;
  flex-direction: row;
  justify-content: flex-end;
  width: 36rpx;
  height: 36rpx;
}
.box .dot {
  position: absolute;
  top: 0rpx;
  left: 0rpx;
  width: 36rpx;
  height: 36rpx;
  overflow: hidden;
}
.box .tonghuajilu {
  position: relative;
  margin-top: 22rpx;
  width: 14rpx;
  height: 14rpx;
}
.box .beautyFashion {
  margin-left: 6rpx;
  height: 28rpx;
  line-height: 28rpx;
  color: #666666;
  font-size: 24rpx;
  font-weight: 300;
}
.box .tagWrap {
  box-sizing: border-box;
  display: flex;
  align-items: flex-start;
  flex-direction: row;
  margin-left: 6rpx;
  border-radius: 6rpx;
  background-color: rgba(253,234,238,0.90);
  padding-right: 9rpx;
  padding-left: 8rpx;
  height: 28rpx;
}
.box .tag {
  margin-top: 2rpx;
  height: 24rpx;
  line-height: 24rpx;
  color: #ff2c54;
  font-size: 20rpx;
  font-weight: 400;
}
.box .block {
  display: flex;
  flex-direction: row;
}
.box .jinbi {
  margin-top: 11rpx;
  width: 26rpx;
  height: 20rpx;
}
.box .num {
  margin-top: 9rpx;
  margin-right: 20rpx;
  height: 24rpx;
  line-height: 24rpx;
  color: #ffd300;
  font-size: 20rpx;
  font-weight: 400;
}
</style>