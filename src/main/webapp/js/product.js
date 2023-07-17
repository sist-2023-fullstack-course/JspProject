/**
 * 
 */
function requestProductData(cate, searchword, page){
	$.ajax({
		type:'post',
		url:'newdata.do',
		data:{
			"cate" : cate,			
			"searchword" : searchword,
			"page" : page
		},
		success : function(data){
			let json = JSON.parse(data);
			console.log(json);
			
			// 12개의 업체 내용 업데이트
			for(let i=0;i<12;i++){
				if(i < json.listcount){
					$('.poster').get(i).setAttribute('style', '');
					$('.single-blog > .content > a').get(i).setAttribute('href', 'detail.do?id='+json.data[i].id);
					$('.single-blog > .content > h2 > a').get(i).setAttribute('href', 'detail.do?id='+json.data[i].id);
					$('.single-blog > .content > h2 > a').get(i).innerHTML = json.data[i].name;
					$('.single-blog > .content > a > img').get(i).setAttribute('src', json.data[i].poster);
					
					let price = json.data[i].price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					let discount_price = json.data[i].discount_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					let discount_rate = json.data[i].discount_rate;
					let star = json.data[i].star;
					
					if(discount_rate==0){
						$('.meta').get(i).innerHTML = '<p><i class="fa fa-krw">'+price+'원</i></p><p><i class="fa fa-star">'+star.toFixed(1)+'</i></p>';
					}
					else{
						$('.meta').get(i).innerHTML = '<p><i class="fa fa-krw">'+discount_price+'원(<del>'+price+'원</del>)</i></p><p><i style="color: red">'+discount_rate+'%</i></p><p><i class="fa fa-star">'+star.toFixed(1)+'</i></p>';
					}
				}
				else{
					$('.poster').get(i).setAttribute('style', 'display:none');
				}
			}
			
			// pagination 수정
			curpage = json.curpage;
			$('#product-totalPage').val(json.totalpage);
			
			$('.pagination > ul.product > li').remove();
			$('.pagination > ul.product').append('<li><a class="leftPage"><i class="fa fa-angle-left"></i></a></li>');
			
			for(let i=json.startpage;i<=json.endpage;i++){
				if(i==curpage){
					$('.pagination > ul.product').append('<li class="active"><span>' + i + '</span></li>');
				}
				else{
					$('.pagination > ul.product').append('<li><a class="numPage">'+ i +'</a></li>');
				}
			}
			
			$('.pagination > ul.product').append('<li><a class="rightPage"><i class="fa fa-angle-right"></i></a></li>');
			$('.pagination > ul.product > li > a').click(clickProductPage);
		}
	})
}


function clickProductSearch(){
	let searchword = $('#product_sch_text').val();
	let cate = $('ul.product-category > li > a.selected').text();
	
	requestProductData(cate,searchword,1);
}

function clickProductCategory(){
	let searchword = $('#product_sch_text').val();
	
	requestProductData($(this).text(),searchword,1);
	
	$('ul.product-category > li > a').removeAttr('class');
	$(this).attr('class', 'selected');
}

function clickProductPage(){
	let kind = $(this).attr('class');
	let totalpage = $('#product-totalPage').val();
	let cate = $('ul.product-category > li > a.selected').text();
	let searchword = $('#product_sch_text').val();
	
	if(kind == 'numPage'){
		requestProductData(cate, searchword, $(this).text());
	}
	else if (kind == 'leftPage'){
		if(curpage==1)
			return;
		requestProductData(cate, searchword, curpage-1);
	}
	else if (kind == 'rightPage'){
		if(curpage+1>totalpage)
			return;
		requestProductData(cate, searchword, curpage+1);
	}
}

$('ul.product-category > li > a').click(clickProductCategory);
$('#product_sch_btn').click(clickProductSearch);
$('.pagination > ul.product > li > a').click(clickProductPage);