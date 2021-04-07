<template>
<view>
  <view class="search-top">
<view class="search-content">
<view class="left">
  <span class="iconfont icon-sousuo"></span>
  <input type="text" placeholder="请输入关键词" @input="onInput" v-model="text">
</view>
<!-- 关键词联想模块 -->
<view v-show="isShow" class="bottom">
  <view class="search-chcontent">
    <view v-for="(item,index) in searchWordList" :key="index" class="nr-w">
      <view class="nr" @click="getword(index)">{{item.good_name}}</view>
    </view>
  </view>
</view>
</view>
<view class="right">
  <button @click="test(text)">搜索</button>
</view>
  </view>
  <view class="geduan"></view>
<!-- 新的搜索历史模块 -->
<scroll-view class="keyword-box"  scroll-y>
				<view class="keyword-block" >
					<view class="keyword-list-header">
						<view>历史搜索</view>
						<view>
							<image @click="clearlsjl()" src="../../static/icon/delete.png"></image>
						</view>
					</view>
					<view class="keyword">
						<view  v-for="(item,index) in gettextArr" :key="index">
              <view @click="changetext(item)">{{item}}</view></view>
					</view>
				</view>
			</scroll-view>
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
      //历史记录
      gettextArr:[],
      textArr:[],
      textArrchild:[],
      textArrtf:false,
      cleartextArr:[]
    }
  },
  onLoad() {
    this.getSsls();
  },

  methods: {
    //清除历史记录
    clearlsjl(){
      this.gettextArr=[];
      let t =this;
      uni.setStorage({
        key: 'textArr',
        data: t.cleartextArr,
        success: function () {
          // console.log('success');
        }
      });
    },
    //点击联想词替换搜索词
    getword(index){
      var wordindex = index;
      this.text = this.searchWordList[wordindex].good_name
      this.isShow=false;
    },
    //监听输入联想词
    onInput(e) {
      this.isShow=true;
      const vm = this;
  // 输入框防抖
      clearTimeout(vm.timer) 
      // 每次进来的时候都将之前的清除掉，如果还没到一秒的时候就将之前的清除掉，这样就不会触发之前setTimeout绑定的事件， 如果超过一秒，之前的事件就会被触发下次进来的时候同样清除之前的timer
      vm.timer = setTimeout(function () {
        vm.getkeyword();
        
      }, 1000)

			},
    //联想词模糊搜索
    getkeyword(){
      let t = this;
      var keyword = t.text;
      let data = { keyword: keyword };
      t.$u.ajax("/getKeywords", data, function (res) {
        // console.log(res, "搜索接口返回数据");
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
    // 获取历史记录
    getSsls(){
      let t =this;
     uni.getStorage({
      key: 'textArr',
      success: function (res) {
        console.log(res); 
        t.gettextArr = res.data;
      }
    });
    },
    // 跳转搜索详情页面
    test(text) {
      console.log(text);
      //每次添加数据前，先把前面的值清空
      this.textArr=[];
      this.textArr.push(text);
      console.log(this.textArr); 
      if(this.gettextArr){
        // this.gettextArr=[...this.gettextArr, ...this.textArr]
        console.log(this.gettextArr);
        // 循环记录 判读插入的是否是同一个
        for(var i=0;i<this.gettextArr.length;i++){
          if(text==this.gettextArr[i]){
            console.log('对的');
            this.textArrtf=true;
            break;
          }else{
            this.textArrtf==false;
          }
        }
        if(this.textArrtf==false){
          this.gettextArr=[...this.gettextArr, ...this.textArr]
        }
        
      }else{
        this.gettextArr = this.textArr; 
      }
      
      let t = this;
      uni.setStorage({
        key: 'textArr',
        data: t.gettextArr,
        success: function () {
          // console.log('success');
        }
      });
      
      uni.navigateTo({
        url: "./searchDetails?name=" + text,
      });
      
    },
    //点击搜索历史修改关键字
    changetext(text){
    this.text=text;
  }
  },
  
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
          top: 55rpx;
          left: 15rpx;
          height: 240rpx;
          min-height: 100rpx;
          border: 1rpx solid #f8f8f8;
          width: 80%;
          background-color: #fff !important;
          position: fixed;
          z-index: 1;
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
.lstop{
  .title{
    display: flex;
    justify-content: space-between;
    .left{
      margin-left: 15rpx;
    }
    .right{
      margin-right: 10rpx;
    }
  }
  .sscontent-partent{
    // width: 100%;
    //     height: 400rpx;
    //     background-color: pink;
    //     display: flex;
    //     flex-flow: row wrap;
    //     align-content: flex-start;

   .sscontent{
        // box-sizing: border-box;
        // background-color: white;
        // flex: 0 0 33.3%;
        // height: 50px;
        // border: 1px dotted grey; 
        // list-style: none;
        display: flex;
    flex-wrap: wrap;
    .ls{
      font-size: 30rpx;
      color: black;
      margin-bottom: 10rpx;
      background-color: #f1f1f1;
      display: flex;
              // background-color: #f8f8f8;
                flex: 0 0 50%!important;
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
.keyword-box {height:calc(100vh - 110upx);border-radius:20upx 20upx 0 0;background-color:#fff;}
	.keyword-box .keyword-block {padding:10upx 0;}
	.keyword-box .keyword-block .keyword-list-header {width:98%;padding:10upx 3%;font-size:27upx;color:#333;display:flex;justify-content:space-between;}
	.keyword-box .keyword-block .keyword-list-header image {width:40upx;height:40upx;}
	.keyword-box .keyword-block .keyword {width:94%;padding:3px 3%;display:flex;flex-flow:wrap;justify-content:flex-start;}
	.keyword-box .keyword-block .keyword>view {display:flex;justify-content:center;align-items:center;border-radius:60upx;padding:0 20upx;margin:10upx 20upx 10upx 0;height:60upx;font-size:28upx;background-color:rgb(242,242,242);color:#6b6b6b;}

</style>