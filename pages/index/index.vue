<template>
  <view>
    <!-- 搜索框 -->
    <view class="index-search">
      <button class="sr " @click="test"><span class="iconfont icon-sousuo"></span>请输入景区名称</button>
      <!-- <input class="sr" type="text" v-model="text" placeholder="请输入景区名称"/> -->
      <!-- <view class="ss" @click="test(text)">搜索</view> -->
    </view>
    <!-- 轮播图 -->
    <view class="index-swiper">
      <swiper autoplay indicator-dots circular >
        <swiper-item v-for="(item,index) in listimg" :key="index" >
          <image :src="item" @click="previewImg(listimg,index)"></image>
        </swiper-item>
      </swiper>
    </view>
    <!-- 热门推荐  -->
    <view class="title">热门推荐</view>
    <navigator v-for="(item,index) in list" :key="index" 
    :url="`../attractions/index?good_id=${item.id}`">
      <view class="recommended">
        <view class="recommended-l">
          <image :src="item.src" />
        </view>

        <view class="recommended-r">
          <view class="bottom-t">{{item.good_name}}</view>
          <view class="bottom-m">16:00前均可购买门票</view>
          <view class="bottom">
            <view class="bottom-y">￥{{item.childTicket}}元/起</view>
            <view class="bottom-r">详情</view>
          </view>
        </view>
      </view>
    </navigator>
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
      listimg:[]
    };
  },
  //下拉刷新
  onPullDownRefresh() {
    let t = this;
    t.list = [];
    t.page = 1;
    this.getAjax();
    console.log("refresh");
    uni.stopPullDownRefresh();
  },
  // 触底加载
  onReachBottom() {
    // console.log("底线");
    this.page += 1;
    this.getAjax();
  },
  onLoad() {
    // this.getLisy();
    // this.$u.showToast("我是封装后的提示框", 5000);
    this.getAjax();
    return;
    uni.showToast({
      title: "我是消息提示框",
      duration: 2000,
    });
  },
  methods: {
    test(text) {
      console.log(text);
      uni.navigateTo({
        url: "./search?name=" + text,
      });
    },
    // tuij(tuij) {
    //   console.log(this.list.id);
    //   uni.navigateTo({
    //     url: "././../attractions/index?good_id=" + this.list.id,
    //   });
    // },

    // getLisy() {
    //   let t = this;
    //   uni.request({
    //     url: t.url + "/getIndexList", //仅为示例，并非真实接口地址。
    //     data: {
    //       page: 1,
    //       limit: 10,
    //     },
    //     header: {
    //       "request-header": "HMR-Api", //自定义请求头信息
    //     },
    //     success: (zmres) => {
    //       if (zmres.data.code == 1) {
    //         console.log("请求成功");
    //         console.log(zmres);
    //         t.list = zmres.data;
    //       } else {
    //         console.log(zmres);
    //       }
    //       // console.log(res.data);
    //       // this.text = "request success";
    //     },
    //     fail: (res) => {
    //       console.log(res);
    //     },
    //   });
    // },
    getAjax() {
      let t = this,
        limit = t.limit;
      let data = { page: t.page, limit: limit };
      t.$u.ajax("/getIndexList", data, function (res) {
        // console.log(res, "接口返回数据");
        if (res.data.length == 0) {
          t.page--;
          uni.showToast({
            title: "没有更多数据了",
            icon: "none",
          });
        } else {
          if (t.page == 1) {
            t.list = res.data;
            if(t.list){
            for (var i = 0; i < 6; i++) {
            t.listimg.push(t.list[i].swipeArr);
            }
          }
          } else {
            t.list = [...t.list, ...res.data];
          }
          
        }
      });
    },
    //预览轮播图
	previewImg(listimg,index){
    // var i = this.list.swipeArr; //获取当前页面的轮播图数据
    let imgsArray = [];
    for (var i = 0; i < 6; i++) {//处理一下图片的路径
        imgsArray.push(listimg[i]);
    }
		//uniapp预览轮播图
		uni.previewImage({
			current:index, //预览图片的下标
			urls:imgsArray //预览图片的地址，必须要数组形式，如果不是数组形式就转换成数组形式就可以
		})
	}
  },
};
</script>

<style lang="scss" scoped>
.index-search {
  display: flex;
  width: 100%;
  height: 85rpx;
  background: #ffd300;

  .sr{
    width: 100%;
    padding-left: 20rpx;
    margin: 0 15rpx;
    height: 70rpx;
    line-height: 70rpx;
    background: #fff;
    color: #c0c0c0;
    text-align:left;
    display: flex;
    justify-content: center;
    align-items: center;
    .text{
     align-content: center;
    }
  }
 
}

.index_swiper {
  swiper {
    height:375rpx;
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
        color: #ffd300;
      }
      .bottom-r {
        padding: 10rpx 15rpx;
        margin-right: 30rpx;
        color: white;
        background-color: #ffd300;
      }
    }
  }
}
</style>