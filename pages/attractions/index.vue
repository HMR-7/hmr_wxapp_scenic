<template>
  <scroll-view
    class="attractions_view"
    :scroll-top="scrollTop"
    scroll-y="true"
    @scrolltoupper="upper"
    @scrolltolower="lower"
  >
    <!-- 轮播图 -->
    <view class="attractions-swiper">
      <swiper autoplay indicator-dots circular>
        <swiper-item v-for="(item, index) in list.swipeArr" :key="index">
          <image :src="item" @click="previewImg(list, index)"></image>
        </swiper-item>
      </swiper>
    </view>
    <!-- 标题 -->
    <view class="title">
      <view class="titlesrc-gn"
        >{{ list.good_name
        }}<view class="title-tags"
          ><view class="tags" v-for="(item, index) in list.tags" :key="index">{{
            item
          }}</view></view
        ><view class="sc">
          <image
            class="collection"
            src="../../static/icon/wsc.png"
            v-show="showUpImg"
            @click="changeImg"
          ></image>
          <image
            class="collection"
            src="../../static/icon/ysc.png"
            v-show="!showUpImg"
            @click="changeImg"
          ></image>
          <!-- <icons type="home" size="28upx" color="#333" @click="clickMe"></icons> -->
        </view></view
      >
      <view class="title-idu"
        ><view class="introduce">{{ list.introduce }}</view>
        <view class="dp" @click="cutcomments()"
          >{{ commentslistlenth }}条点评></view
        ></view
      >
      <view class="title-ars"
        ><view class="address">{{ list.address }} </view
        ><view class="mp">门票价：{{ list.good_price }}/起</view></view
      >
    </view>
    <!-- 主要内容 -->
    <!-- 评论区内容 -->
    <view class="comments" v-show="comments">
      <view class="title"
        ><view class="img"
          ><image src="../../static/icon/pltitle.png" mode="" /></view
        ><view class="zxpl">最新评论</view></view
      >
      <view class="commentsnr-sf" v-if="commentslist.length==0">
        <h1>赶紧来占个沙发吧！</h1>
      </view>
      <view
        v-else
        class="commentsnr"
        v-for="(item, index) in commentslist"
        :key="index"
      >
        <view class="tx"><image :src="item.user_head" mode="" /></view>
        <view class="right">
          <view class="mz">{{ item.user_name }}</view>
          <view class="time">{{ item.time | formatDate("-") }}</view>
          <view class="pl">{{ item.article }}</view>
        </view>
      </view>
      <wyb-popup
        ref="popuppl"
        type="bottom"
        height="450"
        width="600"
        radius="6"
        :showCloseIcon="flase"
      >
        <view class="rizhi">
          <h1>旅游日志</h1>
          <view class="nr">
            <textarea
              v-model="article"
              name="comments"
              id=""
              cols="30"
              rows="10"
              placeholder="请输入内容"
            ></textarea>
          </view>
          <button @click="uploadcomments()">提交</button>
        </view>
      </wyb-popup>
    </view>
    <!-- 评论编写按钮 -->
    <view v-show="comments" class="bx" @click="commentsbx()"
      ><image src="../../static/icon/plbx.png" mode=""
    /></view>
    <!-- 附近其他内容 -->
    <view v-show="!comments" class="contentzx">
      <!-- 门票信息 开始 -->
      <view class="mpxx">
        <view class="mp-title">
          <p>门票信息</p>
        </view>
        <view class="mp-cr"
          >成人票 <view class="price">￥{{ list.good_price }}元/起</view></view
        >
        <view class="mp-rt"
          >儿童票 <view class="price">￥{{ list.childTicket }}元/起</view></view
        >
        <view class="xq">详情可到景区售票处询问</view>
      </view>
      <!-- 门票信息 结束 -->

      <!-- 美食推荐 开始 -->
      <view class="mstj">
        <view class="ms-title">
          <p>蓬莱美食推荐</p>
        </view>
        <view class="ms-tj1" v-for="item in foodlist" :key="item.id">{{
          item.food_name
        }}</view>
      </view>
      <!-- 美食推荐 结束 -->

      <!-- 附近酒店信息 开始-->
      <view class="fjjd">
        <view class="jd-title"> 附近酒店信息 </view>
        <view
          class="jd-fj1"
          v-for="(item, index) in hotellist"
          :key="index"
          @click="open(index)"
          >{{ item.hotel_name
          }}<view class="price">￥{{ item.hotel_price }}/起</view></view
        >
        <wyb-popup
          ref="popupjd"
          type="center"
          height="530"
          width="700"
          radius="6"
          :showCloseIcon="flase"
        >
          <view class="popup-content">
            <view class="lbt">
              <swiper autoplay indicator-dots circular style="height: 380rpx">
                <swiper-item v-for="(item, index) in arr" :key="index">
                  <image
                    :src="item"
                    @click="prehotelviewImg(hotellist, index)"
                  ></image>
                </swiper-item>
              </swiper>
            </view>
            <!-- <view v-for="item in hotellist[0]" :key="item.id"> -->
            <view class="jdm">{{ hotellist[open_id].hotel_name }}</view>
            <view class="bottom">
              <view class="address"
                >酒店地址：{{ hotellist[open_id].hotel_address }}</view
              ><view class="x_price"
                >￥{{ hotellist[open_id].hotel_price }}/起</view
              ></view
            >
            <!-- </view> -->
          </view>
        </wyb-popup>
      </view>
      <!-- 附近酒店信息 结束-->
      <!-- 判断是否登录 -->
      <uni-popup ref="popup" type="dialog">
        <uni-popup-dialog
          mode="base"
          type="warn"
          message="成功消息"
          content="你还未登录，需要先去登录吗"
          :duration="2000"
          :before-close="true"
          @close="close"
          @confirm="confirm"
        ></uni-popup-dialog>
      </uni-popup>
      <!-- 分享小程序卡片到其他地方 开始-->
      <view class="share"
        ><button class="btn" open-type="share">分享</button></view
      >
    </view>
  </scroll-view>
</template>

<script>
import wybPopup from "../components/wyb-popup/wyb-popup";
export default {
  components: {
    wybPopup,
  },
  data() {
    return {
      showUpImg: true,
      list: {},
      good_id: "",
      hotellist: [],
      foodlist: [],
      page: 1,
      limit: 6,
      scsf: 0,
      user_id: 0,
      sf: true,
      open_id: 0,
      arr: [],
      comments: false,
      commentslist: [],
      time: "",
      article: "",
      userInfo: "",
      userName: "",
      user_head: "",
      commentslistlenth: 0,
      pl: false,
      flag: "no",
    };
  },

  onLoad: function (options) {
    console.log(this.commentslist);
    let t = this;
    if (options.comments) {
      t.comments = options.comments;
    }
    t.good_id = options.good_id;
    t.getAjax();
    t.getHotel();
    t.getFood();
    t.user_id = uni.getStorageSync("user_id");
    if (t.user_id) {
      t.getCollect();
    }
    t.getuserfooter();
    t.getComments();
    t.getuserInfo();
  },
  filters: {
    // 时间戳处理
    formatDate(value, spe = "/") {
      value = value * 1000;
      let data = new Date(value);
      let year = data.getFullYear();
      let month = data.getMonth() + 1;
      let day = data.getDate();
      let h = data.getHours();
      let mm = data.getMinutes();
      let s = data.getSeconds();
      month = month > 10 ? month : "0" + month;
      day = day > 10 ? day : "0" + day;
      h = h > 10 ? h : "0" + h;
      mm = mm > 10 ? mm : "0" + mm;
      s = s > 10 ? s : "0" + s;
      return `${year}${spe}${month}${spe}${day} ${h}:${mm}:${s}`;
    },
  },
  //分享小程序给微信好友
  onShareAppMessage(res) {
    if (res.from === "button") {
      // 来自页面内分享按钮
      console.log(res.target);
    }
    return {
      title: "ZM旅游小程序",
      path: "pages/attractions/index",
    };
  },
  methods: {
    // 打开消息提示框
    openpop() {
      // 通过组件定义的ref调用uni-popup方法
      this.$refs.popup.open();
    },
    close(done) {
      done();
    },
    //  点击确认按钮触发
    confirm(done, value) {
      uni.navigateTo({
        url: "../mine/login",
      });
      done();
    },
    //获取用户信息
    getuserInfo() {
      let t = this;
      t.userInfo = uni.getStorageSync("userInfo");
      // console.log(t.userInfo);
      t.user_head = t.userInfo.avatarUrl;
      t.userName = t.userInfo.nickName;
    },
    //上传评论
    uploadcomments() {
      let t = this,
        good_id = t.good_id,
        user_id = t.user_id,
        user_head = t.user_head,
        userName = t.userName,
        article = t.article,
        data = {
          good_id: good_id,
          user_id: user_id,
          user_head: user_head,
          user_name: userName,
          article: article,
        };
      t.$u.ajaxP(t.$api.submitFeedback, data, function (res) {
        console.log(res);
        if (res.flag == t.flag) {
          t.$u.showToast("评论失败请登录后重试", 2000, "none");
        }
      });
      t.$refs.popuppl.hide(); // 隐藏
      t.getComments();
    },
    // 触底加载
    onReachBottom() {
      // console.log("底线");
      this.page += 1;
      this.getComments();
    },
    //编写评论
    commentsbx() {
      this.$refs.popuppl.show(); // 显示
    },
    //评论区切换
    cutcomments() {
      this.comments = !this.comments;
    },
    //获取评论区内容
    getComments() {
      let t = this;
      let data = { good_id: t.good_id, page: t.page, limit: t.limit };
      t.$u.ajax(t.$api.getTravelLog, data, function (res) {
        // console.log(res);
        t.commentslistlenth = res.length;
        if (res.length) {
          t.pl = true;
        }
        if (res.log.length == 0 && t.pl == true) {
          t.page--;
          t.$u.showToast("没有更多数据了", 2000, "none");
        } else {
          if (t.page == 1) {
            t.commentslist = res.log;
          } else {
            t.commentslist = [...t.commentslist, ...res.log];
          }
        }
      });
    },
    //酒店轮播图处理成数组
    open(id) {
      let t = this;
      t.$refs.popupjd.show(); // 显示
      t.open_id = id;
      // console.log(t.open_id);
      var str = t.hotellist[t.open_id].src;
      t.arr = str.split(",");
    },
    // 添加用户足迹
    getuserfooter() {
      let t = this;
      t.user_id = uni.getStorageSync("user_id");
      let data = { good_id: t.good_id, user_id: t.user_id };
      t.$u.ajaxP(t.$api.userFooter, data, function (res) {
        //  console.log(res);
      });
    },
    // 获取收藏列表
    getCollect() {
      let t = this,
        user_id = t.user_id,
        data = { user_id: user_id, limit: 6, page: 1 };
      t.$u.ajax(t.$api.getCollectList, data, function (res) {
        let id = parseInt(t.good_id);
        for (var i = 0; i < res.length; i++) {
          if (id == res[i].id) {
            // console.log('对');
            t.sf = false;
            break;
          } else {
            t.sf = true;
            // console.log('错');
          }
        }
        if (!t.sf) {
          t.showUpImg = false;
        } else {
          t.showUpImg = true;
        }
      });
    },
    // 收藏按钮变化和请求收藏接口
    changeImg() {
      let t = this;
      t.user_id = uni.getStorageSync("user_id");
      if (t.user_id) {
        t.showUpImg = !t.showUpImg;
      } else {
        t.$u.showToast("请先登录，再收藏", 1000, "none");
        setTimeout(() => {
          // var userInfo = uni.getStorageSync("userInfo");
          // console.log(userInfo);
          t.openpop();
        }, 1100);
      }
      let data = { good_id: t.good_id, user_id: t.user_id };
      t.$u.ajaxP(t.$api.userCollect, data, function (res) {
        console.log(res);
        if (res.msg == "取消收藏成功") {
          t.$u.showToast("取消收藏", 1500, "success");
        } else {
          t.$u.showToast("添加收藏成功", 1500, "success");
        }
      });
    },
    //获取首页数据
    getAjax() {
      let t = this, //异步请求赋值 必要
        data = { good_id: t.good_id };
      t.$u.ajax(t.$api.getSwiper, data, function (res) {
        // console.log(res, "接口返回数据");
        t.list = res[0];
      });
    },
    // 获取酒店数据
    getHotel() {
      let t = this, //异步请求赋值 必要
        data = { good_id: t.good_id };
      t.$u.ajax(t.$api.getHotelList, data, function (res) {
        // console.log(res, "接口返回数据");
        t.hotellist = res;
        // console.log(t.hotellist[0]);
      });
    },
    // 获取美食数据
    getFood() {
      let t = this, //异步请求赋值 必要
        data = { page: t.page, limit: t.limit };
      t.$u.ajax(t.$api.getFoodList, data, function (res) {
        // console.log(res, "接口返回数据");
        t.foodlist = res;
      });
    },
    // 酒店轮播图
    prehotelviewImg(index) {
      let t = this;
      t.$u.previewImage(t.arr, index);
    },
    // 景区轮播图
    previewImg(list, index) {
      let t = this;
      t.$u.previewImage(list.swipeArr, index);
    },
  },
};
</script>

<style lang="scss" scoped>
.attractions_view {
  color: black;
  // background: var(--contentBgc);
}
.attractions-swiper {
  swiper {
    height: 375rpx;
    image {
      height: 100%;
    }
  }
}
// 标题 开始
.title {
  height: 200rpx;
  display: flex;
  padding: 0 15rpx 20rpx 15rpx;
  flex-direction: column;
  justify-content: space-between;
  background-color: #fff;
  .titlesrc-gn {
    margin-top: 20rpx;
    display: flex;
    width: 100%;
    height: 30rpx;
    .title-tags {
      height: 30rpx;
      display: flex;
      justify-content: start;
      margin-top: 7rpx;
      font-size: 15rpx;
      flex: 1;
      color: var(--themeColor);
      .tags {
        float: left;
        margin-top: 7rpx;
        justify-content: center;
        align-items: center;
        padding: 0 10rpx;
        margin-left: 15rpx;
        border: 1rpx solid var(--themeColor);
        border-radius: 15rpx;
        text-align: center;
      }
    }
    .sc {
      height: 45rpx;
      width: 45rpx;
      .collection {
        height: 45rpx;
        width: 45rpx;
      }
    }
  }

  .title-idu {
    display: flex;
    width: 100%;
    height: 30rpx;
    font-size: 22rpx;
    justify-content: space-between;
    .introduce {
      color: #808080;
      font-size: 20rpx;
    }
    .dp {
      flex: 1;
      text-align: right;
      color: #007aff;
    }
  }

  .title-ars {
    display: flex;
    width: 100%;
    height: 30rpx;
    font-size: 22rpx;
    justify-content: space-between;
    margin-bottom: 20rpx;
    .address {
      color: #808080;
    }
    .mp {
      flex: 1;
      text-align: right;
      color: #f0ad4e;
    }
  }
}
// 标题结束
//评论区内容
.comments {
  position: relative;
  margin-bottom: 100rpx;
  .title {
    display: flex;
    justify-content: start;
    height: 50rpx;
    margin: 0;
    .img {
      height: 40rpx;
      width: 40rpx;
      image {
        height: 40rpx;
        width: 40rpx;
      }
    }
    .zxpl {
      margin-top: -30rpx;
      font-size: 20rpx;
      padding-left: 50rpx;
    }
  }
  .commentsnr-sf{
    color: black;
    h1{
      text-align: center;
    }
  }
  .commentsnr {
    background-color: #fff;
    padding: 0 20rpx;
    border-bottom: 1px solid #f1f1f1;
    height: 100%;
    display: flex;
    justify-content: start;
    .tx {
      height: 100rpx;
      width: 100rpx;
      margin: 20rpx 20rpx;
      image {
        border-radius: 100rpx;
        height: 100rpx;
        width: 100rpx;
      }
    }
    .right {
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      .mz {
        font-size: 25rpx;
        font-weight: 700;
        margin-top: 10rpx;
      }
      .time {
        font-size: 18rpx;
        color: #c0c0c0;
      }
      .pl {
        font-size: 23rpx;
        margin-bottom: 15rpx;
      }
    }
  }
  .rizhi {
    box-sizing: border-box;
    h1 {
      padding: 20rpx 15rpx;
      font-size: 30rpx;
      color: #f0ad4e;
    }
    .nr {
      width: 100%;
      padding: 0 15rpx;
      box-sizing: border-box;
      textarea {
        box-sizing: border-box;
        height: 210rpx;
        width: 700rpx;
        margin: 0 15rpx 28rpx 15rpx;
        padding: 20rpx 20rpx;
        background-color: #f1f1f1;
        overflow: hidden;
      }
    }

    button {
      border-radius: 50rpx;
      color: #fff;
      background-color: #f0ad4e;
      margin: 0 15rpx;
    }
  }
}
.bx {
  position: fixed;
  right: 20rpx;
  bottom: 120rpx;
  image {
    width: 70rpx;
    height: 70rpx;
  }
}

// 附近其他内容
.contentzx {
  //门票信息 开始
  .mpxx {
    box-shadow: 0 0 8px black;
    height: 280rpx;
    margin: 20rpx 15rpx;
    background-color: #fff;
    border-radius: 30rpx;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
    .mp-title {
      color: #007aff;
      height: 70rpx;
      border-bottom: 1rpx solid rgb(223, 220, 220);
      p {
        margin-left: 30rpx;
        height: 70rpx;
        line-height: 70rpx;
      }
    }

    .mp-cr {
      display: flex;
      justify-content: space-between;
      padding-left: 30rpx;
      height: 70rpx;
      border-bottom: 1rpx solid rgb(223, 220, 220);
      height: 70rpx;
      line-height: 70rpx;
      .price {
        color: #f0ad4e;
        font-size: 18rpx;
        margin-right: 30rpx;
      }
    }

    .mp-rt {
      display: flex;
      justify-content: space-between;
      padding-left: 30rpx;
      height: 70rpx;
      height: 70rpx;
      line-height: 70rpx;
      border-bottom: 1rpx solid rgb(223, 220, 220);

      .price {
        color: #f0ad4e;
        font-size: 18rpx;
        margin-right: 30rpx;
      }
    }

    .xq {
      height: 50rpx;
      color: #007aff;
      text-align: center;
      padding-top: 15rpx;
    }
  }
  //门票信息 结束

  //美食推荐 开始
  .mstj {
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
    box-shadow: 0 0 8px black;
    height: 280rpx;
    margin: 20rpx 15rpx;
    background-color: #fff;
    border-radius: 30rpx;
    .ms-title {
      color: #007aff;
      height: 70rpx;
      border-bottom: 1rpx solid rgb(223, 220, 220);
      p {
        margin-left: 30rpx;
        height: 70rpx;
        line-height: 70rpx;
      }
    }

    .ms-tj1 {
      display: flex;
      justify-content: space-between;
      padding-left: 30rpx;
      height: 70rpx;
      border-bottom: 1rpx solid rgb(223, 220, 220);
      height: 70rpx;
      line-height: 70rpx;
    }
    .ms-tj1:nth-last-child(1) {
      display: flex;
      justify-content: space-between;
      padding-left: 30rpx;
      height: 70rpx;
      border-bottom: none;
      height: 70rpx;
      line-height: 70rpx;
    }
  }
  //美食推荐 结束

  // 附近酒店 开始
  .fjjd {
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
    box-shadow: 0 0 8px black;
    height: 350rpx;
    margin: 20rpx 15rpx;
    background-color: #fff;
    border-radius: 30rpx;
    margin-bottom: 120rpx;
    .jd-title {
      color: #007aff;
      height: 70rpx;
      border-bottom: 1rpx solid rgb(223, 220, 220);
      padding-left: 30rpx;
      height: 70rpx;
      line-height: 70rpx;
    }

    .jd-fj1 {
      display: flex;
      justify-content: space-between;
      padding-left: 30rpx;
      height: 70rpx;
      border-bottom: 1rpx solid rgb(223, 220, 220);
      height: 70rpx;
      line-height: 70rpx;
      .price {
        color: #f0ad4e;
        font-size: 18rpx;
        margin-right: 30rpx;
      }
    }
    .jd-fj1:nth-last-child(1) {
      display: flex;
      justify-content: space-between;
      padding-left: 30rpx;
      height: 70rpx;
      height: 70rpx;
      line-height: 70rpx;
      z-index: 1000;
      border-bottom: none !important;
      .price {
        color: #f0ad4e;
        font-size: 18rpx;
        margin-right: 30rpx;
      }
    }
    .popup-content {
      .lbt {
        margin: 20rpx;
      }
      .jdm {
        font-weight: 700;
        font-size: 35rpx;
        margin: 20rpx;
      }
      .bottom {
        margin: 0 20rpx;
        display: flex;
        justify-content: space-between;
        .address {
          font-size: 25rpx;
          color: #c0c0c0;
        }
        .x_price {
          color: #f0ad4e;
          font-size: 25rpx;
        }
      }
    }
  }
  // 附近酒店 结束
  //分享
  .share {
    .btn {
      position: fixed;
      bottom: var(--window-bottom);
      // bottom:100rpx;
      left: 0rpx;
      right: 0rpx;
      height: 100rpx;
      background-color: var(--themeColor);
      border: none;
      border-radius: 0;
    }
  }
}
</style>
