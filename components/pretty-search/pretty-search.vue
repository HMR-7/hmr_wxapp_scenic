<template>
	<view>
		<view class="search_hd">
			<view class="iconfont iconsousuo searchicon"></view>
			<input class="search" :class="ifcircle ? 'circle' : 'notcircle'" type="text" :value="value" @focus="showAdvice"
			 @input="getinput" @blur="getblur" :placeholder="placeholervalue"></input>
			<view class="iconfont iconshanchu clearicon" v-if="value.length > 0" @click.stop="clearValue"></view>
			<!-- 搜索建议 -->
			<view class="searchAdviceList" :hidden="!ifShow">
				<scroll-view style="height:100%" scroll-y>
					<view class="searchAdviceList-item" v-for="(item,index) in adviceList" :key="index" @click="getAdvice(item)">
						{{item.name}}
					</view>
				</scroll-view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		name: 'upload',
		model: {
			prop: "showPop",
			event: "change"
		},
		props: {
			/**
			 * @description  是否圆形输入框
			 */
			ifcircle: {
				type: Boolean,
				default: true
			},
			/**
			 * @description  是否打开输入建议
			 */
			ifshowadvice: {
				type: Boolean,
				default: true
			},
			placeholervalue: {
				type: String,
				default: '请输入搜索内容'
			},
			/**
			 * @description  输入建议数据列表
			 */
			adviceList: {
				type: Array,
				default () {
					return [];
				},
			},
			value:{
				type: String,
				default: ''
			}
		},
		data() {
			return {
				ifShow:false // 是否显示搜索建议
			}
		},
		methods: {
			getinput(e) {
				this.$emit("input",e.detail.value)
			},
			getblur(e) {
				this.$emit("blur",e.detail.value)
			},
			clearValue() {
				this.$emit("clear")
				this.ifShow = false
			},
			showAdvice() {
				this.$emit("show")
				this.ifShow = this.$props.ifshowadvice? true: false
			},
			getAdvice(item) {
				this.$emit('getadvice',item)
				this.ifShow = false
			}
		}
	}
</script>

<style>
	@import "./pretty-uploadFile.css";

	.search_hd {
		margin: 10px auto;
		position: relative;
		width: 300px;
		display: flex;
		background-color: #fff;
	}

	.search {
		width: 100%;
		background-color: #eee;
		font-size: 14px;
		height: 35px;
		line-height: 35px;
		padding-left: 40px;
		padding-right: 40px;
	}

	.circle {
		border-radius: 20px;
	}

	.notcircle {
		border-radius: 5px;
	}

	.searchicon {
		color: #aaa;
		font-size: 22px;
		top: 6px;
		position: absolute;
		left: 13px;
		z-index: 999;
	}

	.clearicon {
		color: #aaa;
		font-size: 17px;
		position: absolute;
		top: 9px;
		right: 10px;
		z-index: 999;
	}

	.searchAdviceList-item {
		padding: 5px 0;
		border-bottom: 1px solid #eee;
	}

	.searchAdviceList {
		position: absolute;
		background-color: #fff;
		top: 38px;
		left: 0px;
		width: 85%;
		height: 100px;
		font-size: 14px;
		padding: 10px 20px;
		border: 1px solid #eee;
		border-radius: 5px;
		z-index: 999;
	}
</style>
