/**
 * 
 */

function insertCart(id) {
	let amount = $('.account').val();

	if(confirm('해당 상품 ' + amount +'개를\n장바구니에 추가하시겠습니까?')){
		location.href = '../cart/cart_insert.do?amount=' + amount + '&id=' + id;
	}
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
	let price = $('#totalprice').text().replace('원','');
	price = price.replace(',','');
	let pname = $('#pname').text();
	var IMP = window.IMP; // 생략 가능
	IMP.init("imp01661305"); // 예: imp00000000
	// IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({
		pg: 'html5_inicis', // version 1.1.0부터 지원.
		pay_method: 'card', // 'card' : 신용카드 | 'trans' : 실시간계좌이체 | 'vbank' : 가상계좌 | 'phone' : 휴대폰소액결제
		merchant_uid: 'merchant_' + new Date().getTime(),
		name: pname,
		amount: Number(price),
		buyer_email: '1004dustkd@gmail.com',
		buyer_name: '윤연상',
		buyer_tel: '010-1234-5678',
		buyer_addr: '서울특별시 마포구 서교동',
		buyer_postcode: '121-210',
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
