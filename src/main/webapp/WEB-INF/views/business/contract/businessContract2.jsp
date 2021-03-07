<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container" style="display: none;">

    <div class="c2-input">
   		<h1>사업자번호</h1>
    	<input type="text" placeholder="-를 포함하여 입력하세요" name="crn" id="crn" required autocomplete="off">
    </div>

    <div id="crnmsg" class="message"></div>
 
    <div  class="c2-input">
    	<h1>과세구분</h1>
    	<select name="taxation" id="texation" required>
    		<option value="null" selected disabled>=== 과세구분 유형선택 ===</option>
    		<option value="일반과세자">일반과세자</option>
    		<option value="간이과세자">간이과세자</option>
    		<option value="법인과세자">법인과세자</option>    		
    		<option value="부가가치세 면세사업자">부가가치세 면세사업자</option>    		
    		<option value="면세법인 사업자">면세법인 사업자</option>    		
    	</select>
    </div>    

    <div  class="c2-input">
    	<h1>상호명</h1>
    	<input type="text" placeholder="상호명을 입력하세요" name="brandnaming" id="brandnaming" maxlength="11" required autocomplete="off">
    </div>
    <div  class="c2-input">
       	<h1>대표자</h1>
    	<input type="text" placeholder="대표자를 입력하세요" name="representative" id="representative" maxlength="9" required  autocomplete="off">
    </div>
    <div  class="c2-input">
    	<h1>소재지</h1>
    	<span style="width: 200px"></span>
    	<input type="button" value="주소찾기" style="width: 200px; text-align: center"  onclick="searchAddress(document.getElementById('mainlocation'), document.getElementById('detaillocation'), document.getElementById('emdcode'), document.getElementById('latitude'), document.getElementById('longitude'))">
    </div>
    <div class="c2-input" name="address">
    	<input type="text" placeholder="메인소재지를 입력하세요" name="mainlocation"  id="mainlocation" required readonly>
    	<!-- 위도, 경도 값 저장 -->
    	<input type="hidden" name="emdcode" id="emdcode">
    	<input type="hidden" name="latitude" id="latitude">
    	<input type="hidden" name="longitude" id="longitude">
    </div>
        <div class="c2-input" name="address">
    	<input type="text" placeholder="상세소세지를 입력하세요" name="detaillocation" id="detaillocation" required maxlength="24" autocomplete="off">
    </div>
    
    <div  class="c2-input">
    	<h1>영업자 신고증</h1>
    	<label for="reportcard" class="forLabel" style="display: table;"><span style="display: table-cell; vertical-align: middle;">업로드</span>
    		<input type="file" placeholder="영업자 신고증을 등록하세요" name="businessInformationImage" id="reportcard" required>
    	</label>
    </div>
    <div id="reportcarddiv">
    	<img id="reportcard-space" >
    </div>
	
    <div  class="c2-input">
    	<h1>사업자 등록증</h1>
    	<label for="license" class="forLabel" style="display: table;"><span style="display: table-cell; vertical-align: middle;">업로드</span>
    		<input type="file" placeholder="사업자 등록증을 등록하세요" name="businessInformationImage" id="license" required>
    	</label>
    </div>
    <div id="imgdiv">
    	<img id="img-space">
    </div>
	
	<input type="button" class="next" onclick="prevButton()" value=" P R E V ">	
	<input type="button" class="next" onclick="contract2Check(this)" value=" N E X T ">	
</div>