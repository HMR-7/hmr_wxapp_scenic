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
        <!-- 关键词联想模块 -->
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
        <button @click="toSearchDetails(text)">搜索</button>
      </view>
    </view>
    <view class="geduan"></view>
    <!-- 新的搜索历史模块 -->
    <scroll-view class="keyword-box" scroll-y>
      <view class="keyword-block">
        <view class="keyword-list-header">
          <view>历史搜索</view>
          <view>
            <image
              @click="clearlsjl()"
              src="../../static/icon/delete.png"
            ></image>
          </view>
        </view>
        <view class="keyword">
          <view v-for="(item, index) in gettextArr" :key="index">
            <view @click="changeText(item)">{{ item }}</view></view
          >
        </view>
      </view>
    </scroll-view>
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
      //历史记录
      gettextArr: [],
      textArr: [],
      textArrchild: [],
      textArrtf: false,
    };
  },
  onLoad() {
    this.getSsls();
  },

  methods: {
    //清除历史记录
    clearlsjl() {
      let t = this,
      cleartextArr = [];
      t.gettextArr = [];
      uni.setStorage({
        key: "textArr",
        data: cleartextArr,
        success: function () {
          // console.log('success');
        },
      });
    },
    //点击联想词替换搜索词
    getword(index) {
      let t = this;
      var wordindex = index;
      t.text = t.searchWordList[wordindex].good_name;
      t.isShow = false;
    },
    //监听输入联想词
    onInput(e) {
      let t = this;
      t.isShow = true;
      //输入框防抖
      t.$u.Inputthrottle(() => {
        t.getkeyword();
      });
    },
    //联想词模糊搜索
    getkeyword() {
      let t = this,
        keyword = t.text,
        data = { keyword: keyword };
      t.$u.ajax(t.$api.getKeywords, data, function (res) {
        // console.log(res, "搜索接口返回数据");
        let wordList = [];
        if (res.length > 10) {
          for (let i = 0; i < 10; i++) {
            wordList.push(res[i]);
          }
          t.searchWordList = wordList;
        } else {
          t.searchWordList = res;
        }
      });
    },
    // 获取历史记录
    getSsls() {
      let t = this;
      uni.getStorage({
        key: "textArr",
        success: function (res) {
          console.log(res);
          t.gettextArr = res.data;
        },
      });
    },
    // 跳转搜索详情页面
    toSearchDetails(text) {
      let t = this;
      console.log(text);
      //每次添加数据前，先把前面的值清空
      t.textArr = [];
      t.textArr.push(text);
      console.log(t.textArr);
      if (t.gettextArr) {
        console.log(t.gettextArr);
        // 循环记录 判读插入的是否是同一个
        for (let i = 0; i < t.gettextArr.length; i++) {
          if (text == t.gettextArr[i]) {
            console.log("对的");
            t.textArrtf = true;
            break;
          } else {
            t.textArrtf == false;
          }
        }
        if (t.textArrtf == false) {
          t.gettextArr = [...t.gettextArr, ...t.textArr];
        }
      } else {
        t.gettextArr = t.textArr;
      }
      uni.setStorage({
        key: "textArr",
        data: t.gettextArr,
        success: function () {
          // console.log('success');
        },
      });
      t.$u.toPage("./searchDetails?name=" + text)
      // uni.navigateTo({
      //   url: "./searchDetails?name=" + text,
      // });
    },
    //点击搜索历史修改关键字
    changeText(text) {
      this.text = text;
    },
  },
};
</script>

<style lang="scss" scoped>
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
      top: 55rpx;
      left: 15rpx;
      border: 1rpx solid #f8f8f8;
      width: 605rpx;
      background-color: #fff !important;
      position: fixed;
      z-index: 1;
      .search-chcontent {
        width: 100%;
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
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
.lstop {
  .title {
    display: flex;
    justify-content: space-between;
    .left {
      margin-left: 15rpx;
    }
    .right {
      margin-right: 10rpx;
    }
  }
  .sscontent-partent {
    .sscontent {
      display: flex;
      flex-wrap: wrap;
      .ls {
        font-size: 30rpx;
        color: black;
        margin-bottom: 10rpx;
        background-color: #f1f1f1;
        display: flex;
        flex: 0 0 50% !important;
        justify-content: center;
        align-items: center;
        align-content: center;
        height: 50rpx;
        line-height: 50rpx;
        box-sizing: border-box;
      }
    }
  }
}
.keyword-box {
  height: calc(100vh - 110upx);
  border-radius: 20upx 20upx 0 0;
  background-color: #fff;
}
.keyword-box .keyword-block {
  padding: 10upx 0;
}
.keyword-box .keyword-block .keyword-list-header {
  width: 98%;
  padding: 10upx 3%;
  font-size: 27upx;
  color: #333;
  display: flex;
  justify-content: space-between;
}
.keyword-box .keyword-block .keyword-list-header image {
  width: 40upx;
  height: 40upx;
}
.keyword-box .keyword-block .keyword {
  width: 94%;
  padding: 3px 3%;
  display: flex;
  flex-flow: wrap;
  justify-content: flex-start;
}
.keyword-box .keyword-block .keyword > view {
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 60upx;
  padding: 0 20upx;
  margin: 10upx 20upx 10upx 0;
  height: 60upx;
  font-size: 28upx;
  background-color: rgb(242, 242, 242);
  color: #6b6b6b;
}
</style>
