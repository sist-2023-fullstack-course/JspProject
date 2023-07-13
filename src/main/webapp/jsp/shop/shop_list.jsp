<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear">
    <h2 class="sectiontitle">��ǰ</h2>
      <div class="row">
        <div class="text-center">
          <a href="../goods/goods_list.do?type=1" class="btn btn-sm btn-danger">��ü ��ǰ</a>
          <a href="../goods/goods_list.do?type=2" class="btn btn-sm btn-success">����Ʈ ��ǰ</a>
          <a href="../goods/goods_list.do?type=3" class="btn btn-sm btn-primary">�Ż�ǰ</a>
          <a href="../goods/goods_list.do?type=4" class="btn btn-sm btn-info">Ư�� ��ǰ</a>
        </div>
      </div>
      <div style="height: 20px"></div>
      <div class="row">
        <c:forEach var="vo" items="${list }">
          <div class="col-md-3">
		    <div class="thumbnail">
		      <a href="../goods/goods_detail_before.do?no=${vo.no }&type=${type}">
		        <img src="${vo.goods_poster }" title="${vo.goods_name }" style="width:100%">
		        <div class="caption">
		          <p>${vo.goods_price }</p>
		        </div>
		      </a>
		    </div>
		  </div>
        </c:forEach>
      </div>
      <div style="height: 10px"></div>
      <div class="row">
        <div class="text-center">
          <a href="../goods/goods_list.do?page=${curpage>1?curpage-1:curpage}&type=${type}" class="btn btn-sm btn-danger">����</a>
            ${curpage } page / ${totalpage } pages
          <a href="../goods/goods_list.do?page=${curpage<totalpage?curpage+1:curpage}&type=${type}" class="btn btn-sm btn-primary">����</a>
        </div>
      </div>
  </main>
</div>
</body>
</html>