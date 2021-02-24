const data = getRestDayInfo();
//getRestDeInfo();
//getHolidays();
console.log(data);


function getRestDayInfo() {
	const request = new XMLHttpRequest();
	
	const url = "http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo";
	const key = "Alr3S2gnHsAGWsn9nbp77lR%2F1k4ZsVXmV5PUzT7gOoe%2FNU5vf2Y8dZDFERmW8GvCVgiHEKx1Wikh1JIL0W9FLw%3D%3D";
	
	let queryParams = '?' + encodeURIComponent('ServiceKey') + '=' + key;
	queryParams += '&' + encodeURIComponent('solYear') + '=' + encodeURIComponent("2021");
	queryParams += '&' + encodeURIComponent('_returnType') + '=' + encodeURIComponent("json");
	
//	queryParams += '&' + encodeURIComponent('solYear') + '=' + encodeURIComponent(new Date().getFullYear());
//	queryParams += '&' + encodeURIComponent('solMonth') + '=' + encodeURIComponent(new Date().getMonth() + 1);
	
	
	request.open('GET', url + queryParams);

	request.onreadystatechange = () => {
		if (this.readyState == 4) {
			console.log(this);
			alert('Status: '+ this.status + ' nHeaders: '+ JSON.stringify(this.getAllResponseHeaders())+' nBody: '+ this.responseText);
		}
	};
	
	request.setRequestHeader("Access-Control-Allow-Origin", "*");
	request.send('abc');
}



function getRestDeInfo() {
	// Url & Key
	const url = "http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo";
	const key = "Alr3S2gnHsAGWsn9nbp77lR%2F1k4ZsVXmV5PUzT7gOoe%2FNU5vf2Y8dZDFERmW8GvCVgiHEKx1Wikh1JIL0W9FLw%3D%3D";
	
	const baseUrl = url + "?ServiceKey=" + key;
	
	const params = {
		solYear: new Date().getFullYear(),
//		"solMonth": new Date().getMonth() + 1
	}
	
	let query = "";
	query += "&solYear=" + new Date().getFullYear();
	query += "&_returnType=json";
	
	const headers = {
		"Content-Type": "application/json",
		"Access-Control-Allow-Credentials": true,
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "POST, GET, PUT, DELETE, OPTIONS",
        "Access-Control-Allow-Headers": "X-PINGOTHER, Content-Type", 
        "Access-Control-Max-Age": "86400"
	};
//	"Content-Type": "application/json",
	
//	const { data } = await axios.get(baseUrl, { params }, { headers })
//	const { data } = await axios.get(baseUrl + query, { headers })
//	const { data } = axios.post(baseUrl + query);
	
	const { data } = axios.get(baseUrl + query, { headers });
	      	
	console.log(data);

}


function getHolidays() {
	console.log("1");
	// Url & Key
	const url = "http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo";
	const key = "Alr3S2gnHsAGWsn9nbp77lR%2F1k4ZsVXmV5PUzT7gOoe%2FNU5vf2Y8dZDFERmW8GvCVgiHEKx1Wikh1JIL0W9FLw%3D%3D";
	
	const baseUrl = url + "?ServiceKey=" + key; 
	
	let query = "";
	query += "&solYear=" + new Date().getFullYear();
	query += "&_returnType=json";
	
    $.ajax({
        type : 'GET',
        url : baseUrl + query,
        dataType : 'json',
        beforeSend : function (request) {
        	request.setRequestHeader("Access-Control-Allow-Origin", "*");
        },
        error: function (error) {
            console.log(error);
        },
        success : function (data) {
            console.log(data);
            console.log(data.response.body.items);
        },
    });
}


