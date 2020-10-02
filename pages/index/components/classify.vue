<template>
  <view>
    <!-- 表格 -->
    <view style="margin:0 20rpx">
      <view class="conteng">
        <block v-for="(item,index) in tables" :key="index">
          <view>
            <text class="tick">{{item.tick}}</text>

            <text class="nametext">{{item.nametext}}</text>
          </view>
        </block>
      </view>
    </view>
  </view>
</template>

<script>
export default {
  name: "classify",
  data() {
    return {
      tables: [
        {
          tick: "出境游",
          nametext: "走遍全球",
        },
        {
          tick: "国内游",
          nametext: "精选路线",
        },
        {
          tick: "周边游",
          nametext: "暑假红包",
        },
        {
          tick: "精选购",
          nametext: "免税购物",
        },
        {
          tick: "签证/签注",
          nametext: "领卷",
        },
        {
          tick: "会员",
          nametext: "签到",
        },
        {
          tick: "每日福利",
          nametext: "领里程",
        },
        {
          tick: "全部",
          nametext: "更多推荐",
        },
      ],
    };
  },
};
</script>

<style lang="scss" scoped>
.conteng {
  display: flex;
  flex-wrap: wrap;
  width: 100%;
  -webkit-flex-wrap: wrap;
  overflow: hidden;
  border: 1rpx solid #eeeeee;
  border-radius: 10rpx;
  view {
    width: 25%;
    flex-direction: column;
    align-items: center;
    box-sizing: border-box;
    padding: 20rpx 0;

    .tick {
      display: block;
      text-align: center;
      font-size: 30rpx;
      color: #333333;
      font-weight: bold;
    }

    .nametext {
      font-size: 23rpx;
      display: block;
      color: #686868;
      text-align: center;
    }
  }
  view:nth-child(2) {
    border-left: 1px solid #eeeeee;
    border-right: 1px solid #eeeeee;
  }
  view:nth-child(6) {
    border-left: 1px solid #eeeeee;
    border-right: 1px solid #eeeeee;
  }
  view:nth-child(3) {
    border-right: 1rpx solid #eeeeee;
  }
  view:nth-child(7) {
    border-right: 1rpx solid #eeeeee;
  }
  view:nth-child(-n + 4) {
    border-bottom: 1rpx solid #eeeeee;
  }
}
</style>