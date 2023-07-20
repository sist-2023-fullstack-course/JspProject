/**
 * 
 */

function insertCart(id) {
	let amount = $('.account').val();

	location.href = '../cart/cart_insert.do?amount=' + amount + '&id=' + id;
}

function changeTotalPrice(){
	let cnt = $('#acc').val();
	let price = $('#realPrice').text();
	price = price.replace(',','') * cnt;
	$('.totalPrice').text(price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
}

function intocart() {
	$('#gotocart').change(function() {
		let amount = $(this).val()
		let price = $('#total_price').attr('data-price')
		let total = amount * price

		$('#total_price').html("<span style='color:green'>" + total + "</span>원")
		$('#price').val(price)
		$('#amount').val(amount)
		$('#cartFrm').show();
	})
}

function requestPay(t) {
	let cart_id = $(t).data('no');
	let price = $('#totalprice').text();
	
	var IMP = window.IMP; // 생략 가능
	IMP.init("imp01661305"); // 예: imp00000000
	// IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({
		pg: 'html5_inicis', // version 1.1.0부터 지원.
		/*
			'kakao':카카오페이,
			'inicis':이니시스, 'html5_inicis':이니시스(웹표준결제),
			'nice':나이스,
			'jtnet':jtnet,
			'uplus':LG유플러스
		*/
		pay_method: 'card', // 'card' : 신용카드 | 'trans' : 실시간계좌이체 | 'vbank' : 가상계좌 | 'phone' : 휴대폰소액결제
		merchant_uid: 'merchant_' + new Date().getTime(),
		name: pname,
		amount: Number(price),
		buyer_email: 'iamport@siot.do',
		buyer_name: '구매자이름',
		buyer_tel: '010-1234-5678',
		buyer_addr: '서울특별시 강남구 삼성동',
		buyer_postcode: '123-456',
		app_scheme: 'iamporttest' //in app browser결제에서만 사용 
	}, function(rsp) {
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
		} else {
			location.href = "../cart/cart_buy.do?no="+cart_id;
		}
	})
}
