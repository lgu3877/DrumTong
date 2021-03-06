<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container" style="display: none">

    <div class="c3-input">
    	<h1>은행사</h1>
		<input type="text" placeholder="은행사를 입력하세요" name="accountbank" id="accountbank" required readonly>
		<input type="button" id="bank-modal-button" value="은행 찾기">
    </div>    

    <div class="c3-input">
    	<h1>계좌번호</h1>
    	<input type="text" placeholder="계좌번호를 입력하세요" name="accountnum" id="accountnum"  autocomplete="off" maxlength="20" required>
    </div>
    
    <div id="accountmsg" class="message"></div>
    
    <div  class="c3-input">
    	<h1>통장사본</h1>
    	<label for="copyofbankbook" class="forLabel" style="display: table;"><span style="display: table-cell; vertical-align: middle;">업로드</span>
    		<input type="file" placeholder="통장사본을 등록하세요" name="businessInformationImage" id="copyofbankbook" required>
    	</label>
    </div>
    
    <div id="copydiv">
    	<img id="copy-space" width="600px">
    </div>
    
    <div id="modal" style="display: none;">
    	<!-- 반복문 이용해서 한번에 이미지 이름들 가져오기 -->
    	<img id="신한은행" src="${cpath }/resources/business/img/bank/신한은행.jpg" style="width: 50%; display: inline-block; float:left" onclick="selectBank(this)">
    	<img id="경남은행" src="${cpath }/resources/business/img/bank/경남은행.jpg" style="width: 50%; display: inline-block; float:left"  onclick="selectBank(this)">
    	<img id="국민은행" src="${cpath }/resources/business/img/bank/국민은행.jpg" style="width: 50%; display: inline-block; float:left" onclick="selectBank(this)">
    	<img id="기업은행" src="${cpath }/resources/business/img/bank/기업은행.jpg" style="width: 50%; display: inline-block; float:left" onclick="selectBank(this)">
    	<img id="농협은행" src="${cpath }/resources/business/img/bank/농협은행.jpg" style="width: 50%; display: inline-block; float:left" onclick="selectBank(this)">
    	<img id="부산은행" src="${cpath }/resources/business/img/bank/부산은행.jpg" style="width: 50%; display: inline-block; float:left" onclick="selectBank(this)">
    	
    	<a class="modal-close">닫기</a>
    </div>
    
	<input type="button" class="next" onclick="prevButton()" value=" P R E V ">	
	<input type="button" class="next" onclick="contract3Check(this)" value=" N E X T ">
</div>