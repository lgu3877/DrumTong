// 지도가 변화할 때 함수를 불러오기!	// 남서 북동
	async function useCoordinates(swLatLng, neLatLng){
	console.log('[test코드]swLatLng :',swLatLng);
	console.log('[test코드]neLatLng :',neLatLng);
	bottom_ = swLatLng.getLat();
	left_ = swLatLng.getLng();
	top_ = neLatLng.getLat();
	right_ = neLatLng.getLng();

	let address = left_+'/'+right_+'/'+top_+'/'+bottom_;
	console.log('address :', address)
	// 프리미엄 Y 인 리스트
	const {data} = await axios.get('/drumtong/customer/laundry/customerSearch/rest/selectLaundry/coordinate/'+ address +'/');
	const premiumList = data[0];

	const generalList = data[1];
	insertLaundryList(premiumList, generalList);
}
async function useEmdcode(emdcode){
	console.log('[test코드]emdcode :',emdcode);
	
	const {data} = await axios.get('/drumtong/customer/laundry/customerSearch/rest/selectLaundry/emdcode/' +emdcode+'/');
	const premiumList = data[0];
	
	const generalList = data[1];
	insertLaundryList(premiumList, generalList);
}
function insertLaundryList(premiumList, generalList){
	console.log('premiumList :', premiumList);
	console.log('generalList :', generalList);
}