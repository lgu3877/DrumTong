// 로그인했는지 안했는지에 따라서 호출하는 함수를 달리해줍니다.
function checkConnectType(searchData) {
	addToSession(memberID, searchData);
}

// 최근검색어 Session을 추가해줍니다.
function addToSession(sessionData, searchData) {
	
	let memberIDList = JSON.parse(sessionStorage.getItem(sessionData));
	
	if(memberIDList === null) 
		memberIDList = [];
		
	console.log("memberIDLIST2 : ", memberIDList);
	
	// 가져온 세션의 사이즈가 5이상이면 0번째 최근검색어를 삭제해줍니다.
	if(memberIDList.length !== 0 && memberIDList.length === 5 ) 
	   memberIDList.shift();
	
	// 최근검색어를 추가해줍니다.
	memberIDList.push(searchData);
	
	
	// 기존에 있는 세션 데이터를 삭제해줍니다.
	sessionStorage.removeItem(sessionData);
	
	// 새 세션 데이터 추가
	sessionStorage.setItem(sessionData , JSON.stringify(memberIDList));

}

// 세션 데이터를 호출해줍니다.
function getSessionData() {
	sessionStorage.getItem(memberID);
}


// 원하는 세션을 삭제하고 싶을 때 사용합니다.
function deleteSession(sessionData) {
	sessionStorage.removeItem(sessionData);
}

function getIP() {
	// 현재 접속하고 있는 컴퓨터의 IP를 구한다.
	text('https://www.cloudflare.com/cdn-cgi/trace').then(data => {
		let ipRegex = /[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/
		let ip = data.match(ipRegex)[0];
		return ip;
	});
	
}


// ip 관련 텍스트 불러오기
function text(url) {
  return fetch(url).then(res => res.text());
}

// test Data 꼭 지워주세요!!!!!!!!!!!!
// 입력할 때는 checkConnectType
// 값을 가져올 때는 getSessionData 호출하시면됩니다.
checkConnectType("구인공지");
getSessionData();

