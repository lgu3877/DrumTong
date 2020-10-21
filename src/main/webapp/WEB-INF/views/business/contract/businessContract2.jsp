<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container" style="display: none;">

    <div class="c2-input">
   		<h1>사업자번호</h1>
    	<input type="text" placeholder="-를 포함하여 입력하세요" name="crn" required>
    </div>
    <div  class="c2-input">
    	<h1>과세구분</h1>
    	<input type="text" placeholder="과세구분을 입력하세요" name="texation" required>
    </div>
    <div  class="c2-input">
    	<h1>상호명</h1>
    	<input type="text" placeholder="상호명을 입력하세요" name="brandnaming" required>
    </div>
    <div  class="c2-input">
       	<h1>대표자</h1>
    	<input type="text" placeholder="대표자를 입력하세요" name="representative" required>
    </div>
    <div  class="c2-input">
    	<h1>소재지</h1>
    	<span style="width: 300px"></span>
    	<input type="button" value="주소찾기" style="width: 100px" onclick="searchAddress()"/>
    </div>
    <div  class="c2-input">
    	<input type="text" placeholder="메인소재지를 입력하세요" name="address">
    </div>
        <div  class="c2-input">
    	<input type="text" placeholder="상세소세지를 입력하세요" name="address">
    </div>
    <div  class="c2-input">
    	<h1>사업자 등록증</h1>
    </div>
    <div  class="c2-input">
    	<input type="file" placeholder="사업자 등록증을 등록하세요" name="license" style="margin-left: 50px;" required>
    </div>
	
	<input type="button" class="marginauto" style="width: 200px; height: 70px; font-size: 24pt" onclick="" value=" N E X T ">	
</div>