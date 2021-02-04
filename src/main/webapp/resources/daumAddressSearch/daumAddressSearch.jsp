<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 영경 다음 주소 메서드  -->
<script>
// 도큐먼트 넣어주기 (필요없는 부분은 null값을 넣어주기)
// 예 => searchAddress(document.getElementById('mainAddress'), document.getElementById('subAddress'), null);
// mainaddress는 선택한 주소를 넣어주고, subaddress는 비워주고, emdcode에는 읍면동 코드를 넣어준다.
function searchAddress(mainaddress, subaddress, emdcode) {
       new daum.Postcode(
               {
                   oncomplete : function(data) {
                       // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                       // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                       // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                       var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                       var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                       // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                       // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                       if (data.bname !== ''
                               && /[동|로|가]$/g.test(data.bname)) {
                           extraRoadAddr += data.bname;
                       }
                       // 건물명이 있고, 공동주택일 경우 추가한다.
                       if (data.buildingName !== ''
                               && data.apartment === 'Y') {
                           extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                   + data.buildingName : data.buildingName);
                       }
                       // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                       if (extraRoadAddr !== '') {
                           extraRoadAddr = ' (' + extraRoadAddr + ')';
                       }
                       // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                       if (fullRoadAddr !== '') {
                           fullRoadAddr += extraRoadAddr;
                       }

//                        console.log('읍면동 코드 번호 :', data.bcode);
                       
//                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
//                        document.getElementById('mainAddress').value = fullRoadAddr; //5자리 새우편번호 사용
//                        document.getElementById('subAddress').value = '';
                       if(mainaddress !== null)
                       		mainaddress.value = fullRoadAddr;
                       if(subaddress !== null)
                       		subaddress.value = '';
                       if(emdcode !== null)
                    	   	// data.bcode는 리 코드까지 나와서 읍면동 코드만 잘라준다.
                       		emdcode.value = data.bcode.substring(0,8);
                   }
               }).open();
   }
</script>