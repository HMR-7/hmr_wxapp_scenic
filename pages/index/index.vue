<template>
  <view>
    <!-- 搜索框 -->
    <view class="index-search">
      <button class="sr" @click="toSearchPage">
        <span class="iconfont icon-sousuo"></span>请输入景区名称
      </button>
    </view>

    <view class="mod">
      <view class="box">
        <!-- 轮播图 -->
        <view class="Slider0">
          <swiper autoplay indicator-dots circular style="height: 380rpx">
            <swiper-item v-for="(item, index) in listimg" :key="index">
              <image :src="item" @click="previewImg(listimg, index)"></image>
            </swiper-item>
          </swiper>
        </view>
        <!-- 主要内容 -->
        <span class="places"> 热门推荐 </span>
        <navigator
          class="main"
          v-for="(item, index) in list"
          :key="index"
          :url="`../attractions/index?good_id=${item.id}`"
        >
          <view class="block">
            <view class="block_1">
              <view class="pic">
                <image :src="item.src" mode="" />
              </view>
            </view>
            <view class="group">
              <span class="info">
                {{ item.good_name }}
              </span>
              <view class="wrap">
                <span class="leventbesiktas"> 16:00前均可购买门票 </span>
              </view>
              <view class="block_2">
                <span class="count"> ￥{{ item.childTicket }}元/起 </span>
              </view>
            </view>
          </view>
          <view class="icon_4"></view>
        </navigator>
      </view>
    </view>
  </view>
</template>

<script>
export default {
  data() {
    return {
      text: "",
      list: [],
      limit: 6,
      page: 1,
      listimg: [],
    };
  },
  //下拉刷新
  onPullDownRefresh() {
    let t = this;
    (t.listimg = []), (t.list = []);
    t.page = 1;
    t.getAjax();
    uni.stopPullDownRefresh();
  },
  // 触底加载
  onReachBottom() {
    let t = this;
    // console.log("底线");
    t.page += 1;
    t.getAjax();
  },
  onLoad() {
    let t = this;
    t.getAjax();
  },
  methods: {
    //跳转去搜索页面
    toSearchPage() {
      this.$u.toPage('./search')
    },
    getAjax() {
      let t = this,
        list = t.list,
        page = t.page,
        data = { page: t.page, limit: t.limit };
      t.$u.ajax(t.$api.getIndex, data, function (res) {
        // console.log(res, "接口返回数据");
        // 数据拼接
        t.list = t.$u.pullRefresh(list, res, page).list;
        t.page = t.$u.pullRefresh(list, res, page).page;
        //轮播图数组
        if (t.page == 1) {
          // t.list = res;
          if (t.list) {
            for (let i = 0; i < 6; i++) {
              t.listimg.push(t.list[i].swipeArr);
            }
          }
        }
      });
    },
    //预览轮播图
    previewImg(listimg, index) {
      let t = this;
      // var i = this.list.swipeArr; //获取当前页面的轮播图数据
      let imgsArray = [];
      for (let i = 0; i < 6; i++) {
        //处理一下图片的路径
        imgsArray.push(listimg[i]);
      }
      //uniapp预览轮播图
      t.$u.previewImage(imgsArray,index);
    },
  },
};
</script>

<style lang="scss" scoped>
.index-search {
  display: flex;
  width: 100%;
  height: 85rpx;
  background: var(--themeColor);

  .sr {
    width: 100%;
    padding-left: 20rpx;
    margin: 0 15rpx;
    height: 70rpx;
    line-height: 70rpx;
    background: #fff;
    color: #c0c0c0;
    text-align: left;
    display: flex;
    justify-content: center;
    align-items: center;
    .text {
      align-content: center;
    }
  }
}

.index_swiper {
  swiper {
    height: 375rpx;
    //750rpx
    //height:calc(750rpx/2.3)
    image {
      height: 100%;
    }
  }
}
.title {
  padding: 40rpx;
  text-align: center;
  width: 100%;
  height: 100rpx;
  background: rgba(190, 189, 189, 0.116);
}
.recommended {
  display: flex;
  width: 100%;
  margin: 30rpx 0;
  .recommended-l {
    margin: 0 30rpx;
    width: 200rpx;
    height: 180rpx;
    border-radius: 12rpx;
    overflow: hidden;
    image {
      width: 100%;
      height: 100%;
    }
  }
  .recommended-r {
    flex: 80%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    .bottom-t {
      color: black;
      font-weight: bold;
    }
    .bottom-m {
      font-size: 20rpx;
      color: #c0c0c0;
    }
    .bottom {
      display: flex;
      justify-content: space-between;
      margin-bottom: 15rpx;

      .bottom-y {
        align-self: center;
        font-size: 24rpx;
        font-weight: bold;
        color: var(--themeColor);
      }
      .bottom-r {
        padding: 10rpx 15rpx;
        margin-right: 30rpx;
        color: white;
        background-color: var(--themeColor);
      }
    }
  }
}

//接上的
.mod {
  width: 375rpx * 2;
  // height: 872rpx * 2;
}
.mod .box {
  display: flex;
  align-items: flex-start;
  flex-direction: column;
  background-color: #f5f8fb;
  width: 375rpx * 2;
  // height: 872rpx * 2;
  overflow: hidden;
}
.mod .Slider0 {
  width: 375rpx * 2;
  height: 235rpx * 2;
}
.mod .bd {
  display: flex;
  position: relative;
  align-items: center;
  flex-direction: row;
  // background-color: #C7CAD1;
  width: 375rpx * 2;
  height: 235rpx * 2;
  overflow: hidden;
}
.mod .layer {
  position: absolute;
  top: 0rpx * 2;
  left: 0rpx * 2;
  width: 375rpx * 2;
  height: 235rpx * 2;
}
.mod .container {
  display: flex;
  position: relative;
  align-items: center;
  flex-direction: column;
  // background-color: rgba(0,0,0,0.26);
  width: 375rpx * 2;
  height: 235rpx * 2;
}
.mod .turkish {
  position: relative;
  margin-top: 81rpx * 2;
  max-width: 228rpx * 2;
  height: 40rpx * 2;
  overflow: hidden;
  text-overflow: ellipsis;
  line-height: 40rpx * 2;
  letter-spacing: 0;
  color: #ffffff;
  font-family: MicrosoftYaHei, Microsoft YaHei;
  font-size: 30rpx * 2;
  font-weight: normal;
}
.mod .places {
  position: relative;
  margin-top: -29rpx * 2;
  margin-left: 16rpx * 2;
  max-width: 359rpx * 2;
  height: 18rpx * 2;
  // overflow: hidden;
  text-overflow: ellipsis;
  line-height: 22rpx * 2;
  letter-spacing: 0;
  color: #000000;
  font-family: Helvetica;
  font-size: 18rpx * 2;
  font-weight: normal;
}
.mod .main {
  box-shadow: 0 2rpx * 2 9rpx * 2 0 rgba(0, 0, 0, 0.11);
  display: flex;
  position: relative;
  align-items: flex-start;
  align-self: center;
  flex-direction: row;
  justify-content: center;
  margin-top: 16rpx * 2;
  border-radius: 8rpx * 2;
  background-color: #ffffff;
  width: 343rpx * 2;
  height: 130rpx * 2;
}
.mod .block {
  display: flex;
  align-items: center;
  flex-direction: row;
  margin-top: 16rpx * 2;
  margin-bottom: 16rpx * 2;
  margin-right: 46rpx * 2;
  height: 101rpx * 2;
}
.mod .block_1 {
  display: flex;
  align-items: center;
  flex-direction: row;
  justify-content: center;
  margin-right: 16rpx * 2;
  border-radius: 6rpx * 2;
  background-color: rgba(199, 202, 209, 0.46);
  width: 98rpx * 2;
  height: 98rpx * 2;
  overflow: hidden;
}
.mod .pic {
  width: 98rpx * 2;
  height: 98rpx * 2;
  image {
    width: 100%;
    height: 100%;
  }
}
.mod .group {
  display: flex;
  align-items: flex-start;
  flex-direction: column;
  height: 101rpx * 2;
}
.mod .info {
  position: relative;
  width: 129rpx * 2;
  height: 44rpx * 2;
  overflow: hidden;
  text-overflow: ellipsis;
  line-height: 22rpx * 2;
  letter-spacing: 0;
  color: #26315f;
  font-family: Helvetica;
  font-size: 18rpx * 2;
  font-weight: normal;
  -webkit-line-clamp: 2rpx * 2;
}
.mod .wrap {
  display: flex;
  position: relative;
  align-items: center;
  flex-direction: row;
  margin-top: 4rpx * 2;
  height: 18rpx * 2;
}
.mod .icon_3 {
  margin-right: 4rpx * 2;
  width: 11rpx * 2;
  height: 16rpx * 2;
}
.mod .leventbesiktas {
  line-height: 18rpx * 2;
  letter-spacing: 0;
  color: #b9bdc5;
  font-family: Helvetica;
  font-size: 14rpx * 2;
  font-weight: normal;
}
.mod .block_2 {
  display: flex;
  position: relative;
  align-items: center;
  flex-direction: row;
  margin-top: 15rpx * 2;
  height: 20rpx * 2;
}
.mod .icon-home {
  margin-top: -4rpx * 2;
  margin-right: 4rpx * 2;
  width: 12rpx * 2;
  height: 12rpx * 2;
}
.mod .count {
  line-height: 17rpx * 2;
  letter-spacing: 0;
  color: var(--themeColor);
  font-family: Helvetica;
  font-size: 14rpx * 2;
  font-weight: normal;
}
.mod .ratings {
  margin-top: -3rpx * 2;
  line-height: 17rpx * 2;
  letter-spacing: 0;
  color: #b9bdc5;
  font-family: Helvetica;
  font-size: 14rpx * 2;
  font-weight: normal;
}
.mod .icon_4 {
  margin-top: 16rpx * 2;
  width: 16rpx * 2;
  height: 23rpx * 2;
}
</style>
