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
      <view class="titlesrc-gn">{{list.good_name}}<view class="title-tags"><view class="tags" v-for="(item,index) in list.tags" :key="index">{{item}}</view></view><view class="sc">
        <image class="collection" src="../../static/icon/wsc.png" v-show="showUpImg" @click="changeImg"></image>
      <image class="collection" src="../../static/icon/ysc.png" v-show="!showUpImg" @click="changeImg"></image>
        <!-- <icons type="home" size="28upx" color="#333" @click="clickMe"></icons> -->
        </view></view>
      <view class="title-idu"><view class="introduce">{{list.introduce}}</view> <view class="dp" @click="cutcomments()">{{commentslistlenth}}条点评></view></view>
      <view class="title-ars"><view class="address">{{list.address}} </view><view class="mp">门票价：{{list.good_price}}/起</view></view>
    </view>
    <!-- 主要内容 -->
<!-- 评论区内容 -->
<view class="comments" v-show="comments">
<view class="title"><view class="img"><image  src="../../static/icon/pltitle.png" mode="" /></view><view class="zxpl">最新评论</view></view>
<view class="commentsnr" v-for="(item,index) in commentslist" :key="index">
  <view class="tx"><image :src="item.user_head" mode="" /></view>
  <view class="right">
    <view class="mz">{{item.user_name}}</view>
    <view class="time" >{{item.time | formatDate('-')}}</view>
    <view class="pl">{{item.article}}</view>
  </view>
</view>
<wyb-popup ref="popuppl" type="bottom" height="450" width="600" radius="6" :showCloseIcon="flase">
  <view class="rizhi">
  <h1>旅游日志</h1>
  <view class="nr">
  <textarea v-model="article" name="comments" id="" cols="30" rows="10" placeholder="请输入内容"></textarea>
  </view>
  <button @click="uploadcomments()">提交</button>
  </view>
</wyb-popup>
</view>
<view v-show="comments" class="bx" @click="commentsbx()"><image src="../../static/icon/plbx.png" mode="" /></view>
<!-- 附近其他内容 -->
<view v-show="!comments" class="contentzx">
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
      <view class="jd-fj1" v-for="(item,index) in hotellist" :key="index" @click="open(index)">{{item.hotel_name}}<view class="price">￥{{item.hotel_price}}/起</view></view>
      <wyb-popup ref="popup" type="center" height="490" width="700" radius="6" :showCloseIcon="flase">
    <view class="popup-content" >
      <view class="lbt">
        <swiper autoplay indicator-dots circular>
        <swiper-item v-for="(item,index) in arr" :key="index" >
          <image :src="item" @click="prehotelviewImg(hotellist,index)"></image>
        </swiper-item>
      </swiper> 
      </view>
      <!-- <view v-for="item in hotellist[0]" :key="item.id"> -->
      <view class="jdm">{{hotellist[open_id].hotel_name}}</view>
      <view class="bottom">
      <view class="address">酒店地址：{{hotellist[open_id].hotel_address}}</view><view class="x_price">￥{{hotellist[open_id].hotel_price}}/起</view></view>
      <!-- </view> -->
    </view>
</wyb-popup>
      <!-- <view class="jd-fj2">银座佳驿烟台蓬莱阁店<view class="price">￥49元/起</view></view>
      <view class="jd-fj3">蓬莱仙境戴斯酒店<view class="price">￥99元/起</view></view>
      <view class="jd-fj4">蓬莱都市118酒店<view class="price">￥108元/起</view></view> -->
      
       
    </view>
    <!-- 附近酒店信息 结束-->
</view>
  <!-- 分享小程序卡片到其他地方 开始-->
  <view class="share"><button @click="share()">分享</button></view>
  </scroll-view>
</template>

<script>
// import UniFav from '../../uni_modules/uni-fav/components/uni-fav/uni-fav.vue';
import wybPopup from '../components/wyb-popup/wyb-popup'
// import hotel from "../../pages/components/hotel";
// import UniFav from '../components/uni-fav'
export default {
  components: {
        wybPopup
    },
  data() {
    return {
      showUpImg:true,
      list: {},
      good_id: '',
      hotellist: [],
      foodlist: [],
      page: 1,
      limit: 6,
      scsf:0,
      user_id:0,
      sf:true,
      open_id:0,
      arr:[],
      comments:false,
      commentslist:[],
      time:'',
      article:'',
      userInfo:'',
      userName:'',
      user_head:'',
      commentslistlenth:0,
      pl:false,
      flag:'no'
    };
  },

  onLoad: function (options) {
    // console.log(options, "传递过来的数据");
    if(options.comments){
    this.comments= options.comments;
      // console.log(this.comments);
    }
    this.good_id = options.good_id;
    // this.good_id = 1;
    this.getAjax();
    this.getHotel();
    this.getFood();
    this.user_id = uni.getStorageSync('user_id');
    if(this.user_id){
      this.getCollect();
    }
    this.getuserfooter();
    this.getComments();
    this.getuserInfo();
    // this.getCommentslength();
   
    //  wx.getUserInfo({
    //   success:(res) =>{
    //     // 更新userInfo的状态数据
    //     this.userInfo = res.userInfo;
    //     // console.log(this.userInfo);
        
    //     // console.log(this.user_head);
    //     // console.log(this.userName);
    //   },
    //   fail:() =>{
    //     console.log('获取失败');
    //   }
    // })
  },
   filters:{
			// 时间戳处理
			formatDate(value,spe='/'){
				value = value*1000
			  let data= new Date(value);
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
			     }
		},
  methods: {
    //获取用户信息
    getuserInfo(){
    this.userInfo = uni.getStorageSync('userInfo');
        // console.log(this.userInfo);
    this.user_head=this.userInfo.avatarUrl;
    this.userName=this.userInfo.nickName;

    },
    //上传评论
    uploadcomments(){
      let t =this;
      let data = {good_id:t.good_id,user_id:t.user_id,user_head:t.user_head,user_name:t.userName,article:t.article}
      t.$u.ajaxP('/submitFeedback',data,function(res){
        console.log(res);
        if(res.flag==t.flag){
              uni.showToast({
                title: '评论失败，请登录后重试',
                duration: 2000,
                icon:'none'
              });
            }
      })
        this.$refs.popuppl.hide() // 隐藏
        this.getComments();
    },
    // 触底加载
    onReachBottom() {
    // console.log("底线");
    this.page += 1;
    this.getComments();
    
   
  },
    //编写评论
    commentsbx(){
      this.$refs.popuppl.show() // 显示
    },
    //评论区切换
    cutcomments(){
        this.comments = !this.comments;
    },
    //获取评论区内容
    getComments(){
      let t =this;
      let data={good_id:t.good_id,page:t.page,limit:t.limit};
      t.$u.ajax("/getTravelLog",data,function(res){
        // console.log(res);
        t.commentslistlenth = res.length;
        if(res.length){
           t.pl=true;
        }
         if (res.log.length == 0 &&t.pl==true) {
          t.page--;
          uni.showToast({
            title: "没有更多数据了",
            icon: "none",
          });
        } else {
          if (t.page == 1) {
            t.commentslist = res.log;
            
          } else {
            t.commentslist = [...t.commentslist, ...res.log];
            
  
          }
          
        }
      })
    },
    //酒店轮播图处理成数组
    open(id){
    this.$refs.popup.show() // 显示
    this.open_id = id;
    // console.log(this.open_id);
    var str = this.hotellist[this.open_id].src;
    this.arr = str.split(',');
    },
    // 分享小程序
    share(){
      console.log('Hi好');
      uni.share({
      provider: 'weixin',
      scene: "WXSceneSession",
      type: 5,
      imageUrl: 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1576613329,438776543&fm=26&gp=0.jpg',
      title: '欢迎体验zm_tour',
      miniProgram: {
        id: 'wx70e6906a860b171e',
        path: '../attractions/index',
        type: 2,
        webUrl: 'http://uniapp.dcloud.io'
    },
    success: ret => {
        console.log(JSON.stringify(ret));
    },
    fail:res => {
        console.log(JSON.stringify(res));
    }
});
    },
    // 添加用户足迹
    getuserfooter(){
       let t = this;
       t.user_id = uni.getStorageSync('user_id');
       let data ={good_id: t.good_id,user_id:t.user_id};
       t.$u.ajaxP('/userFooter',data,function(res){
        //  console.log(res);
       })
    },
    // 获取收藏列表
    getCollect(){
      let t = this;
      let data = { user_id: t.user_id,limit:6,page:1 };
      this.$u.ajax("/getCollectList", data, function (res) {
        let id = parseInt(t.good_id);
        for(var i=0;i<res.length;i++){
          if(id==res[i].id){
            // console.log('对');
            t.sf=false
            break;
          }else{
            t.sf=true
            // console.log('错');
          }
        }
        if(!t.sf){
          t.showUpImg=false
        }else{
          t.showUpImg=true
        }
       
      });
    },
    // 收藏按钮变化和请求收藏接口
     changeImg(){
       let t = this;
      t.user_id = uni.getStorageSync('user_id');
      if( t.user_id){
        this.showUpImg = !this.showUpImg;
        }else{
          uni.showToast({
            title: '请先登录，再收藏',
            duration: 2000,
            icon:'none'
          });
        }
        let data={good_id: t.good_id,user_id:t.user_id};
        t.$u.ajaxP('/userCollect',data,function(res){
          console.log(res);
          if(res.msg == '取消收藏成功'){
            uni.showToast({
            title: '取消收藏',
            duration: 1500,
          });
          }else{
            uni.showToast({
            title: '添加收藏成功',
            duration: 1500,
          });
          }
        })
     },   
    getAjax() {
      let t = this; //异步请求赋值 必要
      let data = { good_id: this.good_id };
      this.$u.ajax("/getSwiper", data, function (res) {
        // console.log(res, "接口返回数据");
        t.list = res[0];
      });
    },

    getHotel() {
      let t = this; //异步请求赋值 必要
      let data = { good_id: this.good_id };
      this.$u.ajax("/getHotelList", data, function (res) {
        // console.log(res, "接口返回数据");
        t.hotellist = res;
        // console.log(t.hotellist[0]);
      });
    },
    getFood() {
      let t = this; //异步请求赋值 必要
      let data = { page: this.page, limit: this.limit };
      this.$u.ajax("/getFoodList", data, function (res) {
        // console.log(res, "接口返回数据");
        t.foodlist = res;
      });
    },
    // 酒店轮播图
    prehotelviewImg(hotellist, index) {
      
      uni.previewImage({
        current: index, //预览图片的下标
        urls: this.arr, //预览图片的地址，必须要数组形式，如果不是数组形式就转换成数组形式就可以
      });
    },
    // 景区轮播图
    previewImg(list, index) {
      //uniapp预览轮播图
      uni.previewImage({
        current: index, //预览图片的下标
        urls: list.swipeArr, //预览图片的地址，必须要数组形式，如果不是数组形式就转换成数组形式就可以
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.attractions_view {
  color: black;
  //height:屏幕的高度 - 头部标题的高度
  background: #f8f8f8;
  .share{  
    position: fixed;  
    bottom: var(--window-bottom);  
    left: 0rpx;  
    right: 0rpx;  
    height: 100rpx;  
    background-color: #404040;  
    button{
      background: #ffd300;
      color: #fff;
      border: none;
    }
}
}
.attractions-swiper {
  swiper {
    height: 375rpx;
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
      height: 30rpx;
      display: flex;
      justify-content: start;
      margin-top: 7rpx;
      font-size: 15rpx;
      flex: 1;
      color: #ffd300;
      .tags {
        float: left;
        margin-top: 7rpx;
        justify-content: center;
        align-items: center;
        padding: 0 10rpx;
        margin-left: 15rpx;
        border: 1rpx solid #ffd300;
        border-radius: 15rpx;
        text-align: center;
      }
    }
    .sc {
      height: 45rpx;
      width: 45rpx;
      .collection{
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
    .introduce{
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
    .address{
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
.comments{
  position: relative;
  padding-bottom: 100rpx;
  .title{
    display: flex;
    justify-content: start;
    height: 50rpx;
    margin: 0;
    .img{
      height: 40rpx;
      width: 40rpx;
      image{
      height: 40rpx;
      width: 40rpx;
    }
    }
    .zxpl{
      margin-top: -30rpx;
      font-size: 20rpx;
      padding-left:50rpx;
    }
  }
  .commentsnr{
    background-color: #fff;
    padding: 0 20rpx;
    border-bottom:1px solid #f1f1f1;
    height: 100%;
    display: flex;
    justify-content: start;
    .tx{
      height: 100rpx;
      width: 100rpx;
      margin:20rpx 20rpx;
      image{
        border-radius: 100rpx;
        height: 100rpx;
        width: 100rpx;
      }
    }
    .right{
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      .mz{
        font-size: 25rpx;
        font-weight: 700;
        margin-top: 10rpx;
      }
      .time{
        font-size: 18rpx;
        color: #c0c0c0;
      }
      .pl{
        font-size: 23rpx;
        margin-bottom: 15rpx;
      }
    }
  }
  .rizhi{
    box-sizing: border-box;
    h1{
      padding: 20rpx 15rpx;
      font-size: 30rpx;
      color: #f0ad4e;
    }
    .nr{
      width: 100%;
      padding:0 15rpx;
      box-sizing:border-box;
      textarea{
      box-sizing: border-box;
      height: 210rpx;
      width: 700rpx;
      margin:  0 15rpx 28rpx 15rpx;
      padding: 20rpx 20rpx;
      background-color:#f1f1f1;
      overflow: hidden;
    }
    }
    
    button{
      border-radius: 50rpx;
      color: #fff;
      background-color: #f0ad4e;
      margin: 0 15rpx;
    }
  }
}
.bx{
    position: fixed;
    right: 20rpx;
    bottom: 120rpx;
    image{
      width: 70rpx;
      height: 70rpx;
      
    }
  }

// 附近其他内容
.contentzx{
//门票信息 开始
.mpxx {
  box-shadow: 0 0 8px black;
  height: 280rpx;
  margin: 15rpx 15rpx;
  background-color: #fff;
  border-radius: 30rpx;
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
  box-shadow: 0 0 8px black;
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
  .ms-tj1:nth-last-child(1) {
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
  box-shadow: 0 0 8px black;
  height: 350rpx;
  margin: 15rpx 15rpx;
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
    border-bottom: 1rpx solid white;
    .price {
      color: #f0ad4e;
      font-size: 18rpx;
      margin-right: 30rpx;
    }
  }
  .popup-content{
    .lbt{
      margin: 20rpx;
    }
    .jdm{
      font-weight: 700;
      font-size: 35rpx;
      margin: 20rpx;
    }
    .bottom{
      margin: 0 20rpx;
      display: flex;
      justify-content: space-between;
      .address{
        font-size: 20rpx;
        color: #c0c0c0;

      }
      .x_price{
        color: #f0ad4e;
      font-size: 20rpx;
      }
    }
  }
}
// 附近酒店 结束
}
</style>
