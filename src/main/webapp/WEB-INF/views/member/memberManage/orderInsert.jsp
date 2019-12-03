<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Insert</title>
</head>
<body>
<c:import url="../../layout/bootStrap.jsp"/>
<form class="form-horizontal" method="post" action="orderInsert" enctype="multipart/form-data">
  <div class="form-group">
    <label class="control-label col-sm-2" for="id">ID</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="id" value="${member.id }" readonly="readonly" name="id">
    </div>
  </div>
    <div class="form-group">
    <label class="control-label col-sm-2" for="fname">상품사진</label>
    <div class="col-sm-10">
      <input type="file" class="form-control" id="fname" name="fname">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="pro_num">상품번호</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="pro_num" value="9999" name="pro_num" readonly="readonly">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="pro_info">상품정보</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="pro_info" value="성주셔츠" name="pro_info" readonly="readonly">
      
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="pro_count">주문수량</label>
    <div class="col-sm-10">
      <select class="form-control  getSum" name="pro_count" id="count" name="pro_count">
      	<c:forEach begin="0" end="9" varStatus="c">
      		<option>${c.count }</option>
      	</c:forEach>
      </select>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="price">가격</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="price" placeholder="가격을 입력하세요" name="price" value="50000" readonly="readonly">
    </div>
  </div>
    <div class="form-group">
    <label class="control-label col-sm-2" >보유 POINT</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" value="${point.total_point }" readonly="readonly">
    </div>
  </div>
      <div class="form-group">
    <label class="control-label col-sm-2" for="point">사용 POINT</label>
    <div class="col-sm-10">
      <input type="text" class="form-control getSum" id="point" placeholder="사용할 포인트를 입력하세요" name="${point.point_value }">
    </div>
  </div>
    <div class="form-group">
    <label class="control-label col-sm-2" for="coupon">쿠폰</label>
    <div class="col-sm-10">
      <select class="form-control getSum" id="coupon">
      <option value="1">사용할 쿠폰을 선택하세요</option>
      <c:forEach items="${couponList }" var="coupon" varStatus="i">
        <option value="${coupon.sales_value }">${coupon.coup_name } (${coupon.discount }%)</option>
      </c:forEach>
      </select>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2">주문금액</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="sum" placeholder="총 주문 금액" readonly="readonly">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-success" id="orderInsert">주문</button>
    </div>
  </div>
</form>
<script type="text/javascript">
	$(".getSum").change(function () {
		var point = 0;
		if ($("#point").val() != "") {
			point = $("#point").val();			
		}
		var coupon = 1;
		if ($("#coupon").val() != "") {
			coupon = $("#coupon").val();
		}

		var count = 1;
		if ($("#count").val() != "") {
			count = $("#count").val();
		}
		
		var price = 0;
		if ($("#price").val()!="") {
			price = $("#price").val();
		}
		
		
		console.log(point);
		console.log(coupon);
		$("#sum").prop("value",(price*count-point)*coupon);
		
	});





</script>
</body>
</html>