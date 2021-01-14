<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="inner_login_btn"
	style="position: absolute; z-index: 1; margin: 175px auto; width: 80%;">
	<button onclick="location.href='/drumtong/business/${preLink}'"
		style="display:${preStatus == 'SUCCESS' ? 'none' : ''};outline: none; border: none; width: 210px; height: 70px; color: white; background-color: #1da1f2; border-radius: 5px; font-size: 17pt;">
		${preBtName}
	</button>
</div>

<div class="m_preview_con" style="filter:${preStatus == 'SUCCESS' ? 'blur(0px)': 'blur(5px)'}"> 
	<div class="m_preivew_left">
		<div class="upper">
			<div style="text-align: center;">
				<h1>방문량</h1>
				<div class="previewpart">
					<p class="countnum" id="counter1"></p>
					<p class="countname">오늘</p>
				</div>					
				<div class="previewpart">
					<p class="countnum" id="counter2"></p>
					<p class="countname">이번주</p>
				</div>					
				<div class="previewpart">
					<p class="countnum" id="counter3"></p>
					<p class="countname">이번달</p>
				</div>					
			</div>
		</div>
		<div class="lower">
			<div style="text-align: center;">
				<h1>가게매출</h1>
				<div class="previewpart">
					<p class="countnum" id="counter4"></p>
					<p class="countname">오늘</p>
				</div>					
				<div class="previewpart">
					<p class="countnum" id="counter5"></p>
					<p class="countname">이번주</p>
				</div>					
				<div class="previewpart">
					<p class="countnum" id="counter6"></p>
					<p class="countname">이번달</p>
				</div>					
			</div>
		</div>
	</div>
	
	<div style="width: 20%; height: 100%; display: table;">
		<div style="display: table-cell; vertical-align: middle;">
		<img src="${cpath }/resources/business/img/main/laundry.png" width="100%">
		</div>
	</div>
		
	<div class="m_preivew_right">
		<div class="upper">
			<div style="text-align: center;">
				<h1>주문현황</h1>
				<div class="previewpart">
					<p class="countnum" id="counter7"></p>
					<p class="countname">요청</p>
				</div>					
				<div class="previewpart">
					<p class="countnum" id="counter8"></p>
					<p class="countname">처리중</p>
				</div>					
				<div class="previewpart">
					<p class="countnum" id="counter9"></p>
					<p class="countname">완료</p>
				</div>					
			</div>
		</div>
		<div class="lower">
			<div style="text-align: center;">
				<h1>세탁물 판매</h1>
				<div class="previewpart">
					<p class="countnum" id="counter10"></p>
					<p class="countname">오늘</p>
				</div>					
				<div class="previewpart">
					<p class="countnum" id="counter11"></p>
					<p class="countname">이번주</p>
				</div>					
				<div class="previewpart">
					<p class="countnum" id="counter12"></p>
					<p class="countname">이번달</p>
				</div>					
			</div>
		</div>
	</div>
	
<script type="text/javascript">
	function numberCounter(target_frame, target_number) {
	    this.count = 0;
	    this.diff = 0;
	    this.target_frame = document.getElementById(target_frame);
	    this.target_count = parseInt(target_number);
	    this.timer = null;
	    this.counter();
	};
	numberCounter.prototype.counter = function() {
	    var self = this;
	    this.diff = this.target_count - this.count;
	     
	    if(this.diff > 0) {
	        self.count += Math.ceil(this.diff / 5);
	    }
	     
	    this.target_frame.innerHTML = this.count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	     
	    if(this.count < this.target_count) {
	        this.timer = setTimeout(function() { self.counter(); }, 20);
	    } else {
	        clearTimeout(this.timer);
	    }
	};
	new numberCounter("counter1", '${HitsMap == null ? 5000 : HitsMap.DAY}');
	new numberCounter("counter2", '${HitsMap == null ? 5000 : HitsMap.WEEK}');
	new numberCounter("counter3", '${HitsMap == null ? 5000 : HitsMap.MONTH}');
	new numberCounter("counter4", '${PriceMap == null ? 5000 : PriceMap.DAY}');
	new numberCounter("counter5", '${PriceMap == null ? 5000 : PriceMap.WEEK}');
	new numberCounter("counter6", '${PriceMap == null ? 5000 : PriceMap.MONTH}');
	new numberCounter("counter7", '${OrderMap == null ? 5000 : OrderMap.REQUEST}');
	new numberCounter("counter8", '${OrderMap == null ? 5000 : OrderMap.PROCESSING}');
	new numberCounter("counter9", '${OrderMap == null ? 5000 : OrderMap.SUCCESS}');
	new numberCounter("counter10", '${LaundryMap == null ? 5000 : LaundryMap.DAY}');
	new numberCounter("counter11", '${LaundryMap == null ? 5000 : LaundryMap.WEEK}');
	new numberCounter("counter12", '${LaundryMap == null ? 5000 : LaundryMap.MONTH}');
</script>
<!-- 	<div class="m_preivew_right">
		<div id="chart_div" class="right_entire"></div>
	</div> -->
</div>
