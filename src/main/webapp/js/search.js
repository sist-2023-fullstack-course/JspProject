/**
 *  지역 선택 select
 */
let curpage = 1;
let totalpage = 0;

// 상위 지역에 따라 하위 지역 목록 수정
function categoryChange(addr1) {

	const seoul = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	const gyeonggi = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	const gangwon = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	const gyeongsangnam = ["거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"];
	const gyeongsangbuk = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	const gwangju = ["광산구", "남구", "동구", "북구", "서구"];
	const daegu = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
	const daejeon = ["대덕구", "동구", "서구", "유성구", "중구"];
	const busan = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	const ulsan = ["남구","동구","북구","중구","울주군"];
	const incheon = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	const jeonnam = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	const jeonbuk = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
	const jeju = ["제주"];
	const chungbuk = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	const chungnam = ["천안시","공주시","보령시","아산시","서산시","논산시","계룡시","당진시","금산군","부여군","서천군","청양군","홍성군","예산군","태안군"];

  	const state = document.getElementById("state");

	if(addr1 == '전국'){
		state.options.length = 1;
		return;
	}
	else if (addr1 == "서울") {
	  add = seoul;
	} else if (addr1 == "경기") {
	  add = gyeonggi;
	} else if (addr1 == "인천") {
	  add = incheon;
	} else if (addr1 == "충북") {
	  add = chungbuk;
	} else if (addr1 == "충남") {
	  add = chungnam;
	} else if (addr1 == "대전") {
	  add = daejeon;
	} else if (addr1 == "경북") {
	  add = gyeongsangbuk;
	} else if (addr1 == "대구") {
	  add = daegu;
	} else if (addr1 == "경남") {
	  add = gyeongsangnam;
	} else if (addr1 == "부산") {
	  add = busan;
	} else if (addr1 == "울산") {
	  add = ulsan;
	} else if (addr1 == "강원") {
		add = gangwon;
	} else if (addr1 == "전북") {
	  add = jeonbuk;
	} else if (addr1 == "전남") {
	  add = jeonnam;
	} else if (addr1 == "광주") {
	  add = gwangju;
	} else if (addr1 == "제주") {
	  add = jeju;
	}

  	state.options.length = 1;
  	// 군/구 갯수;
	
	for (property in add) {
		let opt = document.createElement('option');
		opt.innerHTML = add[property];
		state.appendChild(opt);
	}
}

// 새로운 데이터 ajax 요청
function requestData(page, cate) {
	let addr1 = $('#addr1 option:selected').text();
	let addr2 = $('#state option:selected').text();
	if(cate=="none"){
		cate = $('a.selected').text();
	}
	let searchword = $('.SearchInput').val();
	
	$.ajax({
		type:'post',
		url:'../company/newdata.do',
		data:{
			"addr1":addr1,
			"addr2":addr2,
			"cate":cate,
			"page":page,
			"searchword":searchword
		},
		success : function(data){
			// json 파싱
			let json = JSON.parse(data);
			
			// 12개의 업체 내용 업데이트
			for(let i=0;i<12;i++){
				if(i < json.listcount){
					$('.poster').get(i).setAttribute('style', '');
					$('.single-blog > .content > a').get(i).setAttribute('href', 'detail.do?id='+json.data[i].id);
					$('.single-blog > .content > h2 > a').get(i).setAttribute('href', 'detail.do?id='+json.data[i].id);
					$('.single-blog > .content > h2 > a').get(i).innerHTML = json.data[i].name;
					$('.single-blog > .content > a > img').get(i).setAttribute('src', json.data[i].poster);
					$('.single-blog .meta .time').get(i).innerHTML = '<i class="fa fa-calendar"></i>' + json.data[i].time;
					$('.single-blog p').get(i).innerHTML = json.data[i].address;
				}
				else{
					$('.poster').get(i).setAttribute('style', 'display:none');
				}
			}
			
			// pagination 수정
			curpage = json.curpage;
			$('.totalPage').val(json.totalpage);
			
			$('.pagination > ul > li').remove();
			$('.pagination > ul').append('<li><a class="leftPage"><i class="fa fa-angle-left"></i></a></li>');
			
			for(let i=json.startpage;i<=json.endpage;i++){
				if(i==curpage){
					$('.pagination > ul').append('<li class="active"><span>' + i + '</span></li>');
				}
				else{
					$('.pagination > ul').append('<li><a class="numPage">'+ i +'</a></li>');
				}
			}
			
			$('.pagination > ul').append('<li><a class="rightPage"><i class="fa fa-angle-right"></i></a></li>');
			$('.pagination > ul > li > a').click(pageClick);
		}
	})
}

// 카테고리 목록 클릭 
function categoryClick(){
	$('ul.category > li > a').removeAttr('class');
	$(this).attr('class', 'selected');
	requestData(1, $(this).text());
}

// pagination 클릭
function pageClick(){
	let kind = $(this).attr('class');
	let totalpage = $('.totalPage').val();
	let selectedCate = $('ul.category > li > a.selected').text();
	
	if(kind == 'numPage'){
		requestData($(this).text(), selectedCate);
	}
	else if (kind == 'leftPage'){
		if(curpage==1)
			return;
		requestData(curpage-1, selectedCate);
	}
	else if (kind == 'rightPage'){
		if(curpage+1>totalpage)
			return;
		requestData(curpage+1, selectedCate);
	}
}

function clickHeartBtn(){
	if($('.heart_button').attr('class').includes('clicked')){
		$('.heart_button').attr('class', 'heart_button');
		$('.heart_button > dt > img').attr('src', '../img/beforeheart.png');
	}
	else{
		$('.heart_button').attr('class', 'heart_button clicked');
		$('.heart_button > dt > img').attr('src', '../img/afterheart.png');
	}
}
$('.heart_button').click(clickHeartBtn);
$('ul.category > li > a').click(categoryClick);
$('.pagination > ul > li > a').click(pageClick);
