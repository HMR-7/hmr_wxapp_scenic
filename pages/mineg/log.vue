<template>
<view>
  <view class="search-top">
<view class="search-content">
<view class="left">
  <span class="iconfont icon-sousuo"></span>
  <input type="text" placeholder="请输入关键词" @input="onInput" v-model="text">
</view>
<view v-show="isShow" class="bottom">
  <view class="search-chcontent">
    <view v-for="(item,index) in searchWordList" :key="index" class="nr-w">
      <view class="nr" @click="getword(index)">{{item.good_name}}</view>
    </view>
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
    <!-- <navigator class="result-content" v-for="(item,index) in goodList" :key="index"
    :url="`../attractions/index?good_id=${item.id}&comments=true`">
        <view class="result-nr"> -->
            <!-- 轮播图 -->
            <!-- <view class="result-swiper">
              <swiper autoplay indicator-dots circular >
                <swiper-item v-for="(item,index) in item.swipeArr" :key="index" >
                  <image :src="item" @click="previewImg(index)"></image>
                </swiper-item>
              </swiper>
            </view> -->
            <!-- 热门推荐  -->
            <!-- <view class="bottom">
            <view class="title">{{item.good_name}}</view>
            <view class="jieshao">{{item.introduce}}</view>
            <view class="address">{{item.address}}</view>
   </view>     </view>
    </navigator> -->
    <!-- 接上 -->
    <view  class="search-content">
  <navigator class="box" v-for="(item,index) in goodList" :key="index" 
    :url="`../attractions/index?good_id=${item.id}&comments=true`">
  <view class="bd">
              <swiper  autoplay indicator-dots circular style="height:394rpx">
                <swiper-item v-for="(item,index) in item.swipeArr" :key="index" >
                  <image  :src="item" @click="previewImg(index)"></image>
                </swiper-item>
              </swiper>
            </view>
  <span class="main">
    {{item.good_name}}
  </span>
  <span class="submain">
    {{item.introduce}}
  </span>
  <view class="ft">
    <view class="outer">
       <view class="dotWrap">
        <image class="dot" src="../../static/icon/footbx.png" mode="" />
      </view>
           <view class="tagWrap">
        <span class="tag">
          {{item.address}}
        </span>
      </view>
    </view>
    <view class="block">
      <span class="num">
        ￥{{item.childTicket}}元/起
      </span>
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
  components: { },
  data() {
    return{
      searWord:"",
      text:'',
      isShow:false,
      searchWordList:[],
      gettextArr:[],
      textArr:[],
      goodList:[]
    }
  },
  onLoad() {
    // this.getSsls();
  },
  methods: {
    getword(index){
      var wordindex = index;
      this.text = this.searchWordList[wordindex].good_name
      this.isShow=false;
    },
    onInput(e) {
      this.isShow=true;
      const vm = this;
        // 输入框防抖
      clearTimeout(vm.timer) // 每次进来的时候都将之前的清除掉，如果还没到一秒的时候就将之前的清除掉，这样就不会触发之前setTimeout绑定的事件， 如果超过一秒，之前的事件就会被触发下次进来的时候同样清除之前的timer
      vm.timer = setTimeout(function () {
        vm.getkeyword();
        
      }, 1000)

			},
    getkeyword(){
      let t = this;
      var keyword = t.text;
      let data = { keyword: keyword };
      t.$u.ajax("/getScenicwords", data, function (res) {
        console.log(res, "搜索接口返回数据");
        var wordList = []
        if(res.length>10){
          for(var i=0;i<10;i++){
            wordList.push(res[i])
          }
          t.searchWordList = wordList;
        }else{
          t.searchWordList = res;
        }
        
      });
    },
       //预览轮播图
	previewImg(index){
    let t=this;
		//uniapp预览轮播图
		uni.previewImage({
			current:index, //预览图片的下标
			urls:t.goodList.swipeArr //预览图片的地址，必须要数组形式，如果不是数组形式就转换成数组形式就可以
		})
	},
    getgoodList() {
    this.isShow=false;
      let t = this;
      var keyword = t.text;
      let data = { good_name: keyword };
      t.$u.ajax("/getSearchResult", data, function (res) {
        console.log(res, "搜索接口返回数据");
        t.goodList=res;
       });
    },
  }
};
</script>

<style lang="scss" scoped>
//以前的
.search-top{
  display: flex;
  width: 100%;
  height: 70rpx;
  margin-bottom: 15rpx;
    .search-content{
    display: flex;
    justify-content:space-between;
    width: 80%;
    padding-left: 20rpx;
    text-align: left;
    margin: 10rpx 5rpx 10rpx 15rpx;
    height: 50rpx;
    // background: #fff;
    font-size: 20rpx;
    background-color: #f8f8f8;
        .left{
          flex: 1;
          display: flex;
          justify-content: flex-start;
          color:#999;
          span{
            font-size: 50rpx;
          }
          input{
            flex: 1;
            margin-top: 3rpx;
          input::-webkit-input-placeholder{
            color: #dadada !important;
            
          }
          }
        }
        .bottom{  
          z-index: 1;
          top: 55rpx;
          left: 15rpx;
          height: 240rpx;
          min-height: 100rpx;
          border: 1rpx solid #f8f8f8;
          width: 80%;
          background-color: #fff !important;
          position: fixed;
          .search-chcontent{
            width: 100%;
            height: 240rpx;
          min-height: 100rpx;
             align-content: flex-start;
            display: flex;
            margin: 10rpx 10rpx;
            // display: flex;
            flex-wrap: wrap;
            // border: 1rpx solid #f8f8f8; 
            // border-bottom: none  !important;
            .nr-w{
              margin-bottom: 10rpx;
              // background-color: #f8f8f8;
                padding: 5rpx;
                flex: 0 0 50%!important;
                height: 30rpx;
                box-sizing: border-box;
              .nr{
               
              font-size: 28rpx;
            // height: 30rpx;
            // line-height: 30rpx;
            // border-bottom: 1rpx solid #999;
            margin-bottom: 5rpx;
          }
            }
            
          }
          
        }
        
    }
    
    .right{
      margin:10rpx 5rpx 10rpx 10rpx;
      height: 50rpx;
      button{
      line-height: 50rpx;
      font-size: 25rpx;
      text-align: center;
      color: #fff;
      background: #ffd300;
      border: none;

      }
    }
}
.geduan{
  width: 100%;
  height: 10rpx;
  background-color: #f8f8f8;
  margin-bottom: 15rpx;
}
.result{
    height: 450rpx;
    width: 95%;
    margin: 20rpx;
}
.search-content{
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
  box-shadow: 0 2rpx * 2 9rpx * 2 0 rgba(0,0,0,0.11);
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
  image{
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
  background-color: rgba(253,234,238,0.90);
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
  color: #ffd300;
  font-size: 20rpx;
  font-weight: 400;
}
</style>