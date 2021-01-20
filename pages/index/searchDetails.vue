<template>
  <view  class="search-content">
   <navigator v-for="(item,index) in list" :key="index" 
    :url="`../attractions/index?good_id=${item.id}`" class="tcon">
      <view class="recommended">
        <view class="recommended-l">
          <image :src="item.src" />
        </view>

        <view class="recommended-r">
          <view class="bottom-t">{{item.good_name}}</view>
          <view class="bottom">
            <view class="bottom-l">￥{{item.childTicket}}元/起</view>
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
      serarWord: "",
      list: [],
      limit: 10,
    };
  },
  onLoad(options) {
    // console.log(options, "传递过来的数据");
    this.serarWord = options.name;
    this.getAjax();
  },
  methods: {
    getAjax() {
      let t = this,
        limit = t.limit,
        keyword = t.serarWord;
      let data = { page: 1, limit: limit, keyword: keyword };
      t.$u.ajax("/getKeyWordSearchList", data, function (res) {
        console.log(res, "搜索接口返回数据");
        t.list = res.data;
      });
    },
  },
}
</script>

<style lang="scss" scoped>
.search-content{
  display: flex;
  flex-wrap: wrap;
  justify-content: flex-start;
  .tcon{
    width: 50%;
    border-radius: 30rpx;
    .recommended{
      margin-top: 25rpx;
      margin-left: 12.5rpx;
      margin-right: 12.5rpx;
      .recommended-l{
        image{
          height: 250rpx;
          border-radius: 30rpx;
        }
      }
      .recommended-r{
        .bottom{
          display: flex;
          justify-content: space-between;
          .bottom-l{

          }
          .bottom-r{
        
            
          }
        }
      }
    }
  }
}
</style>