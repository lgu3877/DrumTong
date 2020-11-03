<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container" style="display: none;">

    <div class="c2-input">
   		<h1>사업자번호</h1>
    	<input type="text" placeholder="-를 포함하여 입력하세요" name="crn" id="crn" required>
    </div>

    <div id="crnmsg" class="message"></div>
 
    <div  class="c2-input">
    	<h1>과세구분</h1>
    	<input type="text" placeholder="과세구분을 입력하세요" name="texation" id="texation" required>
    </div>    

    <div  class="c2-input">
    	<h1>상호명</h1>
    	<input type="text" placeholder="상호명을 입력하세요" name="brandnaming" id="brandnaming" required>
    </div>
    <div  class="c2-input">
       	<h1>대표자</h1>
    	<input type="text" placeholder="대표자를 입력하세요" name="representative" id="representative" required>
    </div>
    <div  class="c2-input">
    	<h1>소재지</h1>
    	<span style="width: 200px"></span>
    	<input type="button" value="주소찾기" style="width: 200px; text-align: center" onclick="searchAddress()"/>
    </div>
    <div class="c2-input" name="address">
    	<input type="text" placeholder="메인소재지를 입력하세요" name="mainlocation" id="mainlocation">
    </div>
        <div class="c2-input" name="address">
    	<input type="text" placeholder="상세소세지를 입력하세요" name="detaillocation" id="detaillocation">
    </div>
    <div  class="c2-input">
    	<h1>사업자 등록증</h1>
    	<label for="license" class="forLabel" style="display: table;"><span style="display: table-cell; vertical-align: middle;">업로드</span></label>
    	<input type="file" placeholder="사업자 등록증을 등록하세요" name="license" id="license" required>
    </div>
    <div id="imgdiv">
    	<img id="img-space" width="600px">
    </div>
	
	<input type="button" class="marginauto" style="width: 200px; height: 70px; font-size: 24pt" onclick="contract2Check(this)" value=" N E X T ">	
</div>