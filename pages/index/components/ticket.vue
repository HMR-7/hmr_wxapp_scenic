<template>
  <view>
      <view class="ticket">
          <block v-for="(item,index) in ticket" :key="index">
          <view>
              <image :src="item.image" mode="widthFix"></image>
              <text>{{item.name}}</text>
          </view>
          </block>
         
      </view>
  </view>
</template>

<script>
export default {
  name: "ticket",
  data(){
      return{
          ticket:[
              {
                  image:"../../../static/icon/jid.svg",
                  name:"景点"
              },
              {
                  image:"../../../static/icon/jd.svg",
                  name:"酒店"
              },
              {
                  image:"../../../static/icon/ms.svg",
                  name:"美食"
              },
              {
                  image:"../../../static/icon/jd.svg",
                  name:"酒店"
              },
              {
                  image:"../../../static/icon/jd.svg",
                  name:"酒店"
              },
          ]
      }
  }
};
</script>

<style lang="scss" scoped>
.ticket{
    display: flex;
    justify-content: space-around;
    text-align: center;
    margin: 30rpx 0;
    image{
        width: 70rpx;
        height: 70rpx;
    }
    text {
        font-size: 30rpx;
        display: block;

    }
}
</style>