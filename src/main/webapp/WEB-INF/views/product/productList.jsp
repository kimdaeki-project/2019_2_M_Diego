<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../layout/bootStrap.jsp" />
</head>
<body>

	<div class="container">
		
		<div class="jumbotron page-header">
			<h1>Product List</h1>
		</div>
		
		<table class="table">
			<thead>
				<tr >
					
					<th><input type="checkbox" id="checkAll"></th>
					<th>Product Num</th>
					<th>Category</th>
					<th>Product Name</th>
					<th>Price</th>
					<th>Count</th>
					<th>Sales</th>
					<th>Contents</th>
					<th>Warning</th>
					<th>Color</th>
					<th>Size</th>
					<th>Option</th>
					<th>Date</th>
				</tr>

			</thead>

			<tbody>

				<c:forEach items="${list}" var="product" varStatus="p">
					<tr class="warning">
						<td><input type="checkbox" class="listCheck product${p.index }" value="${product.pro_num }"></td>
						<td>${product.pro_num}</td>
						<td>${product.cat_ref}</td>
						<td>${product.pro_name}</td>
						<td>${product.pro_price}</td>
						<td>${product.pro_count}</td>
						<td>${product.pro_sale}</td>
						<td>${product.pro_contents}</td>
						<td>${product.pro_warning}</td>
						<td>${product.pro_color}</td>
						<td>${product.pro_size}</td>
						<td>${product.pro_vital}</td>
						<td>${product.pro_date}</td>

					</tr>

				</c:forEach>

			</tbody>
		</table>

		<div>
			<form action="./productList" id="frm">
				<input type="hidden" id="curPage" value="1" name="curPage">
				<select id="kind" name="kind">
					<option id="kt" value="kt">Category</option>
					<option id="kw" value="kw">Product Name</option>
					<option id="kc" value="kc">Price</option>
				</select> 
				
				<input type="text" id="search" name="search" value="${pager.search}">
				
				<button>검색</button>
			</form>
		</div>

		<div>
			<ul class="pagination">
				<c:if test="${pager.curBlock gt 1}">
					<li><span id="${pager.startNum-1}" class="list">이전</span></li>
				</c:if>
				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li><span id="${i}" class="list">${i}</span></li>
				</c:forEach>
				<c:if test="${pager.curBlock lt pager.totalBlock}">
					<li><span id="${pager.lastNum+1}" class="list">다음</span></li>
				</c:if>
			</ul>
		</div>
				
			
					<button class="btn btn-primary" onclick="location.href='./productInsert' ">상품 등록</button>
				
				
					<button class="btn btn-danger" id="pro_del">상품 삭제</button>
				
	</div>
	<script type="text/javascript">
	  	var kind = '${pager.kind}'
		if(kind == ''){
			kind = "kt";
		}
		$("#"+kind).prop("selected", true);
	 	$(".list").click(function() {
			$("#curPage").val($(this).attr("id"));
			$("#frm").submit();
		});
	  </script>







</body>
</html>