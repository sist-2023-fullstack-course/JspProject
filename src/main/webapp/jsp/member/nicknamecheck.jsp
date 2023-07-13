<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
  <div class="container" style="width: 100%;">
  	<div class="row">
  		<table class="table">
  		  <tr>
  		    <td>닉네임 : <input type=text name=nickname id=nicknameInput size=15 class="input-sm">
  		    	<input type=button value="중복체크" class="btn btn-sm btn-warning" id="checkBtn">
  		    </td>
  		  </tr>
  		  <tr>
  		    <td class="text-center" id="res">
  		    </td>
  		  </tr>
  		  <tr id="ok">
  		    <td class="text-center">
  		      <input type=button value="확인" id="okBtn" class="btn btn-sm btn-primary">
  		    </td>
  		  </tr>
  		</table>
  	</div>
  </div>
</body>
