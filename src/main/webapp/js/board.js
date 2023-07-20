/**
 * 
 */
let i=0; // 전역변수 
let u=0;
let k=0;
$(function(){
	$('#newIn').click(function(){
		console.log('tt');
		location.href="../board/board_insert.do";
	})
		
	$('#del').click(function(){
		if(i==0)
		{
			$(this).text("취소");
			$('#delTr').show();
			i=1;
		}
		else
		{
			$(this).text("삭제");
			$('#delTr').hide();
			i=0;
		}
	})
	//게시물 삭제
	$('#delBtn').click(function(){
		let pwd=$('#pwd1').val();
		let no=$('#delBtn').attr("data-no");
		if(pwd.trim()=="")
		{
			$('#pwd1').focus();
			return;
		}
		// delete.do?no=1&pwd=1111
		$.ajax({
			type:'post',
			url:'../board/board_delete.do',
			data:{"no":no,"pwd":pwd},
			success:function(result) //YES, NO전달
			{
				let res=result.trim();
				if(res==='NO')
				{
					alert("비밀번호가 틀립니다")
					$('#pwd1').val("")
					$('#pwd1').focus()
				}
				else
				{
					location.href="../board/board_list.do"
				}
			}
		})
	})
	
	// Update (댓글 수정)
	$('.ups').click(function(){
		let no=$(this).attr("data-no"); //댓글의 번호
		$('.ups').text("수정");
		$('.updates').hide();
		$('.reins').hide();
		if(u===0)
		{
			$('#u'+no).show();
			$(this).text("취소");
			u=1;
		}
		else
		{
			$('#u'+no).hide();
			$(this).text("수정");
			u=0;
		}
	})
	$('.ins').click(function(){
		let no=$(this).attr("data-no");
		$('.ins').text("댓글");
		$('.reins').hide();
		$('.updates').hide();
		if(k==0)
		{
			$(this).text("취소");
			$('#i'+no).show();
			k=1;
		}
		else
		{
			$(this).text("댓글");
			$('#i'+no).hide();
			k=0;
		}
		
	})
})

//댓글 삭제
function deleteComment(no, bno){
		let check=confirm("정말 삭제 하시겠습니까?");
		
		if(check){
			location.href="reply_delete.do?no=" + no + "&bno=" + bno;
		}
		else{
			return false;
		}
	}