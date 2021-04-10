<template>
  <view>
    <view class="search-top">
      <view class="search-content">
        <view class="left">
          <span class="iconfont icon-sousuo"></span>
          <input
            type="text"
            placeholder="请输入关键词"
            @input="onInput"
            v-model="text"
          />
        </view>
        <view v-show="isShow" class="bottom">
          <view class="search-chcontent">
            <view
              v-for="(item, index) in searchWordList"
              :key="index"
              class="nr-w"
              @click="getword(index)"
              >{{ item.good_name }}</view
            >
          </view>
        </view>
      </view>
      <view class="right">
        <button @click="getgoodList()">搜索</button>
      </view>
    </view>
    <view class="geduan"></view>
    <!-- 搜索结果模块 -->
    <view class="result">
      <view class="search-content">
        <navigator
          class="box"
          v-for="(item, index) in goodList"
          :key="index"
          :url="`../attractions/index?good_id=${item.id}&comments=true`"
        >
          <view class="bd">
            <swiper autoplay indicator-dots circular style="height: 394rpx">
              <swiper-item v-for="(item, index) in item.swipeArr" :key="index">
                <image :src="item" @click="previewImg(index)"></image>
              </swiper-item>
            </swiper>
          </view>
          <span class="main">
            {{ item.good_name }}
          </span>
          <span class="submain">
            {{ item.introduce }}
          </span>
          <view class="ft">
            <view class="outer">
              <view class="dotWrap">
                <image class="dot" src="../../static/icon/footbx.png" mode="" />
              </view>
              <view class="tagWrap">
                <span class="tag">
                  {{ item.address }}
                </span>
              </view>
            </view>
            <view class="block">
              <span class="num"> ￥{{ item.childTicket }}元/起 </span>
            </view>
          </view>
        </navigator>
      </view>
    </view>
    <!-- 搜索结果模块 -->
  </view>
</template>

<script>
export default {
  components: {},
  data() {
    return {
      searWord: "",
      text: "",
      isShow: false,
      searchWordList: [],
      gettextArr: [],
      textArr: [],
      goodList: [],
    };
  },
  onLoad() {},
  methods: {
    getword(index) {
      let t = this;
      var wordindex = index;
      t.text = t.searchWordList[wordindex].good_name;
      t.isShow = false;
    },
    onInput(e) {
      let t = this;
      t.isShow = true;
      //输入框防抖
      t.$u.Inputthrottle(() => {
        t.getkeyword();
      });
    },
    // 获取联想词
    getkeyword() {
      let t = this;
      var keyword = t.text;
      let data = { keyword: keyword };
      t.$u.ajax(t.$api.getScenicwords, data, function (res) {
        console.log(res, "搜索接口返回数据");
        var wordList = [];
        if (res.length > 10) {
          for (var i = 0; i < 10; i++) {
            wordList.push(res[i]);
          }
          t.searchWordList = wordList;
        } else {
          t.searchWordList = res;
        }
      });
    },
    //预览轮播图
    previewImg(index) {
      let t = this;
      t.$u.previewImage(t.goodList.swipeArr, index);
    },
    // 获取搜索结果
    getgoodList() {
      let t = this;
      t.isShow = false;
      var keyword = t.text;
      let data = { good_name: keyword };
      t.$u.ajax(t.$api.getSearchResult, data, function (res) {
        console.log(res, "搜索接口返回数据");
        t.goodList = res;
      });
    },
  },
};
</script>

<style lang="scss" scoped>
//以前的
.search-top {
  display: flex;
  width: 100%;
  height: 70rpx;
  margin-bottom: 15rpx;
  .search-content {
    display: flex;
    justify-content: space-between;
    width: 80%;
    padding-left: 20rpx;
    text-align: left;
    margin: 10rpx 5rpx 10rpx 15rpx;
    height: 50rpx;
    // background: #fff;
    font-size: 20rpx;
    background-color: #f8f8f8;
    .left {
      flex: 1;
      display: flex;
      justify-content: flex-start;
      color: #999;
      span {
        font-size: 50rpx;
      }
      input {
        flex: 1;
        margin-top: 3rpx;
        input::-webkit-input-placeholder {
          color: #dadada !important;
        }
      }
    }
    .bottom {
      z-index: 1;
      top: 55rpx;
      left: 15rpx;
      border: 1rpx solid #f8f8f8;
      width: 605rpx;
      background-color: #fff !important;
      position: fixed;
      .search-chcontent {
        display: flex;
        flex-wrap: wrap;
        flex-direction: row;
        width: 100%;
        .nr-w {
          margin: 10rpx 0rpx 0rpx 15rpx;
          padding: 0 10rpx;
          color: #5c606c;
          font-size: 24upx;
          height: 50rpx;
          line-height: 50rpx;
          text-align: center;
          display: flex;
          flex: row;
          background-color: #f5f5f9;
        }
      }
    }
  }

  .right {
    margin: 10rpx 5rpx 10rpx 10rpx;
    height: 50rpx;
    button {
      line-height: 50rpx;
      font-size: 25rpx;
      text-align: center;
      color: #fff;
      background: var(--themeColor);
      border: none;
    }
  }
}
.geduan {
  width: 100%;
  height: 10rpx;
  background-color: #f8f8f8;
  margin-bottom: 15rpx;
}
.result {
  height: 450rpx;
  width: 95%;
  margin: 20rpx;
}
.search-content {
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
  box-shadow: 0 2rpx * 2 9rpx * 2 0 rgba(0, 0, 0, 0.11);
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
  image {
    width: 100%;
    height: 100%;
  }
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
  background-color: rgba(253, 234, 238, 0.9);
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
  color: var(--themeColor);
  font-size: 20rpx;
  font-weight: 400;
}
</style>
