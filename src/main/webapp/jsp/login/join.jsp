<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
  <div class="container">
  	<div class="row">
  	<div class="col-sm-2"></div>
  	<div class="col-sm-8">
	    <h2 class="sectiontitle">회원가입</h2>
	    <div class="row">
	     <form method="post" action="../jsp/login/join_ok.do" name="joinFrm" id="joinFrm">
	      <table class="table">
	        <tr>
	         <th class="text-right" width=10%>ID</th>
	         <td width=90% class="inline">
	          <input type=text name=id id=id size=20 class="input-sm" readonly>
	          <input type=button value="중복체크" class="btn btn-sm btn-primary" id="idCheckBtn">
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-right" width=10%>비밀번호</th>
	         <td width=90% class="inline">
	          <input type=password name=pwd id=pwd size=20 class="input-sm">
	          &nbsp;비밀번호 확인 <input type=password name=pwd1 id=pwd1 size=20 class="input-sm">
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-right" width=10%>이름</th>
	         <td width=90% class="inline">
	          <input type=text name=name id=name size=20 class="input-sm">
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-right" width=10%>성별</th>
	         <td width=90% class="inline">
	          <input type="radio" name=sex value="남자" checked>남자
	          <input type="radio" name=sex value="여자">여자
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-right" width=10%>생년월일</th>
	         <td width=90% class="inline">
	          <input type="date" name=birthday size=20>
	         </td>
	        </tr>
	       
	        <tr>
	         <th class="text-right" width=10%>닉네임</th>
	         <td width=90% class="inline">
	          <input type=text name=nickname id=nickname size=20 class="input-sm" readonly>
	          <input type=button value="중복체크" class="btn btn-sm btn-primary" id="nicknameCheckBtn">
	         </td>
	        </tr> 
	        
	        <tr>
	         <th class="text-right" width=10%>전화</th>
	         <td width=90% class="inline">
	          <select name=phone1 class="input-sm">
	           <option>010</option>
	          </select>
	          <input type=text name=phone id=phone size=12 class="input-sm">
	          <input type=button value="중복체크" class="btn btn-sm btn-primary" id="phoneBtn">
	         </td>
	        </tr> 
	        
	        <tr>
	         <th class="text-right" width=10%>이메일</th>
	         <td width=90% class="inline">
	          <input type=text name=email id=email size=55 class="input-sm">
	          <input type=button value="중복체크" class="btn btn-sm btn-primary" id="emailBtn">
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-right" width=10%>우편번호</th>
	         <td width=90% class="inline">
	          <input type=text name=post id=post size=10 class="input-sm">
	          <input type=button value="우편번호 검색" class="btn btn-sm btn-warning" id="postBtn">
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-right" width=10%>주소</th>
	         <td width=90% class="inline">
	          <input type=text name=addr1 id=addr1 size=55 class="input-sm" readonly>
	         </td>
	        </tr>
	        
	        <tr>
	         <th class="text-right" width=10%>상세주소</th>
	         <td width=90% class="inline">
	          <input type=text name=addr2 id=addr2 size=55 class="input-sm">
	         </td>
	        </tr>
	        
	        <tr>
	          <td colspan="2" class="text-center">
	           <input type="button" value="회원가입" class="btn btn-success btn-sm" id="joinBtn">
	           <input type=button value="취소" class="btn btn-danger btn-sm" onclick="javascript:history.back()">
	          </td>
	        </tr>
	      </table>
	      </form>
	    </div>
	    <div id="dialog" title="중복체크" style="display: none"></div>
  		<div class="col-sm-2"></div>
  		</div>
  	</div>
</div>