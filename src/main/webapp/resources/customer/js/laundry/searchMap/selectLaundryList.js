// 지도가 변화할 때 함수를 불러오기!	// 남서 북동
function useCoordinates(swLatLng, neLatLng){
	console.log('[test코드]swLatLng :',swLatLng);
	console.log('[test코드]neLatLng :',neLatLng);
	let bottom_ = swLatLng.getLat();
	let left_ = swLatLng.getLng();
	let top_ = neLatLng.getLat();
	let right_ = neLatLng.getLng();

	let coordinatesAddress = 'coordinate/' + left_ + '/' + right_ + '/' + top_ + '/' + bottom_ + '/';
	console.log('coordinatesAddress :', coordinatesAddress)
	
	selectLaundry(coordinatesAddress);
}
function useEmdcode(emdcode){
	console.log('[test코드]emdcode :',emdcode);
	
	let emdAddress = 'emdcode/' +emdcode+'/';
	
	selectLaundry(emdAddress);
}
async function selectLaundry(axiosAddress){
	let filter1 = document.getElementById('filter1').value;
	let filter2 = document.getElementById('filter2').value;
	let filter3 = document.getElementById('filter3').value;
	let filter4 = document.getElementById('filter4').value;

	filterAddress = filter1 + '/' + filter2 + '/' + filter3 + '/' + filter4 + '/';

	console.log('filter :', filterAddress);
	
	const {data} = await axios.get('/drumtong/customer/laundry/customerSearch/rest/selectLaundry/' + axiosAddress + filterAddress);
	const premiumList = data[0];
	
	const generalList = data[1];
	insertLaundryList(premiumList, generalList);
} 
function insertLaundryList(premiumList, generalList){
	console.log('premiumList :', premiumList);
	console.log('generalList :', generalList);
}