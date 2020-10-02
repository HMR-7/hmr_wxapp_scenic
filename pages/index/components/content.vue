<template>
  <view>
    <scroll-view scroll-x="true" class="scroll" scroll-with-animation="true">
      <view>
        <block v-for="(item,index) in contentdata" :key="index">
          <view class="list-cont" @click="tabs(index)" :class="{active:index==num}">
            <view>
              <text class="con-text-a">{{item.title}}</text>
            </view>
            <view>
              <text class="con-text-b" :class="{activeb:index == num}">{{item.labei}}</text>
            </view>
          </view>
        </block>
      </view>
    </scroll-view>
  </view>
</template>

<script>
export default {
  name: "tab",
  data() {
    return {
      num: 0,
      contentdata: [
        {
          title: "推荐",
          labei: "猜你喜欢",
        },
        {
          title: "好景点",
          labei: "周末放空",
        },
        {
          title: "人文",
          labei: "文化之旅",
        },
        {
          title: "海岛",
          labei: "阳光与沙滩",
        },
        {
          title: "自由行",
          labei: "超值精选",
        },
        {
          title: "情侣",
          labei: "别样的浪漫",
        },
        {
          title: "网红",
          labei: "最红打卡地",
        },
      ],
    };
  },
  methods: {
    tabs(index) {
      this.num = index;
    },
  },
};
</script>
    
<style lang="scss" scoped>
.scroll {
  white-space: nowrap;
  width: 100%;
  position: absolute;
  left: 0;
  right: 0;
  background: #ffffff;
  padding: 20rpx 0;

  .list-cont {
    width: 180rpx;
    display: inline-block;
    text-align: center;

    .con-text-a {
      color: #292c33;
      font-size: 30rpx;
      font-weight: bold;
    }
    .con-text-b {
      color: #9ea0a5;
      font-size: 23rpx;
    }
  }
}
.active {
  background-image: linear-gradient(to right, #ccffff 0%, #ffcc00 100%);
  border-top-right-radius: 50rpx;
}
.activeb {
  color: #292c33 !important;
  font-size: 23rpx !important;
}
</style>