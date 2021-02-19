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
        <swiper-item v-for="(item,index) in list.swipeArr" :key="index" >
          <image :src="item" @click="previewImg(list,index)"></image>
        </swiper-item>
      </swiper>
    </view>
    <!-- 标题 -->
    <view class="title">
      <view class="titlesrc-gn">{{list.good_name}}<view class="title-tags"><view class="tags">{{list.tags}}</view></view><view class="sc">♥</view></view>
      <view class="title-idu">{{list.introduce}} <view class="dp">21条点评></view></view>
      <view class="title-ars">{{list.address}} <view class="mp">门票价：{{list.good_price}}/起</view></view>
    </view>
    <!-- 主要内容 -->

    <!-- 门票信息 开始 -->
    <view class="mpxx">
      <view class="mp-title">
        <p>门票信息</p> 
      </view>
      <view class="mp-cr">成人票 <view class="price">￥{{list.good_price}}元/起</view></view>
      <view class="mp-rt">儿童票 <view class="price">￥{{list.childTicket}}元/起</view></view>
      <view class="xq">详情可到景区售票处询问</view>
    </view>

    <!-- 门票信息 结束 -->

    <!-- 美食推荐 开始 -->
      <view class="mstj">
      <view class="ms-title">
        <p>蓬莱美食推荐</p> 
      </view>
      <view class="ms-tj1" v-for="item in foodlist" :key="item.id">{{item.food_name}}</view>
      <!-- <view class="ms-tj2">凤凰炸鸡</view>
      <view class="ms-tj3">鲜美羊肉汤</view> -->
    </view>
    <!-- 美食推荐 结束 -->

    <!-- 附近酒店信息 开始-->
    <view class="fjjd">
      <view class="jd-title">
        附近酒店信息
      </view>
      <view class="jd-fj1" v-for="item in hotellist" :key="item.id">{{item.hotel_name}}<view class="price">￥{{item.hotel_price}}/起</view></view>
      <!-- <view class="jd-fj2">银座佳驿烟台蓬莱阁店<view class="price">￥49元/起</view></view>
      <view class="jd-fj3">蓬莱仙境戴斯酒店<view class="price">￥99元/起</view></view>
      <view class="jd-fj4">蓬莱都市118酒店<view class="price">￥108元/起</view></view> -->
      
       
    </view>
    <!-- 附近酒店信息 结束-->

  </scroll-view>
</template>

<script>
// import hotel from "../../pages/components/hotel";
export default {
  components:{},
  data() {
    return {
      list: {},
      good_id: "",
      hotellist:[],
      foodlist:[],
      page:1,
      limit:6,
    };
  },

  onLoad: function (options) {
    // console.log(options, "传递过来的数据");
    this.good_id = options.good_id;
    // this.good_id = 1;
    this.getAjax();
    this.getHotel();
    this.getFood();
  },
  methods: {
    getAjax() {
      let t = this; //异步请求赋值 必要
      let data = { good_id: this.good_id };
      this.$u.ajax("/getGoodDetail", data, function (res) {
        // console.log(res, "接口返回数据");
        t.list = res.data;
      });
    },
    getHotel(){
      let t = this; //异步请求赋值 必要
      let data = { good_id: this.good_id };
      this.$u.ajax("/getHotelList", data, function (res) {
        // console.log(res, "接口返回数据");
        t.hotellist = res.data;
      });
    },
    getFood(){
      let t = this; //异步请求赋值 必要
      let data = { page:this.page,limit:this.limit };
      this.$u.ajax("/getFoodList", data, function (res) {
        // console.log(res, "接口返回数据");
        t.foodlist = res.data;
      });
    },
    previewImg(list,index){
		//uniapp预览轮播图
		uni.previewImage({
			current:index, //预览图片的下标
			urls:list.swipeArr //预览图片的地址，必须要数组形式，如果不是数组形式就转换成数组形式就可以
		})
	}
    
  },
};
</script>

<style lang="scss" scoped>
.attractions_view {
  color: black;
  //height:屏幕的高度 - 头部标题的高度
  background:#f8f8f8;
}
.attractions-swiper {
  swiper {
    height:375rpx;
    // height:calc(750rpx/2.3)
    // height: 326.1rpx;
    image {
      height: 100%;
    }
  }
}
// 标题 开始
.title {
  height: 200rpx;
  display: flex;
  margin: 0 15rpx 20rpx 15rpx;
  flex-direction: column;
  justify-content: space-between;
  background-color: #fff;
  .titlesrc-gn {
    margin-top: 20rpx;
    display: flex;
    width: 100%;
    height: 30rpx;
    .title-tags {
      margin-top: 10rpx;
      font-size: 15rpx;
      flex: 1;
      margin-left: 15rpx;
      color: #ffd300;
      .tags{
        width:40%;
         border: 1rpx solid #ffd300;
         border-radius: 15rpx;
        text-align: center;
      }
    }
    .sc{
      height: 30rpx;
    }
  }

  .title-idu {
    display: flex;
    width: 100%;
    height: 30rpx;
    font-size: 22rpx;
    justify-content: space-between;
    .dp{
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

     .mp{
       flex: 1;
       text-align: right;
       color: #f0ad4e;
    }
  }
}
// 标题结束

//门票信息 开始
.mpxx {
  box-shadow: 0 0 8px black;
  height: 280rpx;
  margin: 15rpx 15rpx;
  background-color: #fff;
  border-radius: 30rpx;
  .mp-title {
    color: #007aff;
    height: 70rpx;
    border-bottom: 1rpx solid rgb(223, 220, 220);
    p{
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
  box-shadow: 0 0 8px black;
  height: 280rpx;
  margin: 15rpx 15rpx;
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
  .ms-tj1:nth-last-child(1){
    display: flex;
    justify-content: space-between;
    padding-left: 30rpx;
    height: 70rpx;
    border-bottom: 1rpx solid white;
    height: 70rpx;
    line-height: 70rpx;
  }

 
}
//美食推荐 结束

// 附近酒店 开始
.fjjd {
   box-shadow: 0 0 8px black;
  height: 350rpx;
  margin: 15rpx 15rpx;
  background-color: #fff;
  border-radius: 30rpx;
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
  .jd-fj1:nth-last-child(1){
     display: flex;
    justify-content: space-between;
    padding-left: 30rpx;
    height: 70rpx;
    height: 70rpx;
    line-height: 70rpx;
    border-bottom: 1rpx solid white;
    .price {
      color: #f0ad4e;
      font-size: 18rpx;
      margin-right: 30rpx;
    }
  }

  

  .jd-fj4 {
    display: flex;
    justify-content: space-between;
    padding-left: 30rpx;
    height: 70rpx;
    height: 70rpx;
     line-height: 70rpx;
    .price {
color: #f0ad4e;
      font-size: 18rpx;
      margin-right: 30rpx;
  }
}
  }
// 附近酒店 结束

</style>