<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../layout/bootStrap.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../layout/nav.jsp" />
	<div class="container">
		<h2>Admin Join</h2>
		<form id="frm" action="./adminJoin" method="post">
			<!-- Id -->
			<div class="form-group">
				<label class="control-label col-sm-2" for="Id">Id:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="admin_id"
						placeholder="Enter id" name="admin_id">
					<div id="checkIdResult"></div>
				</div>
			</div>
			<div class="form-group">
				<label for="pw" class="control-label col-sm-2">Password:</label>
				<div class="col-sm-10">
					<input type="password" name="admin_pw" required="required"
						class="form-control" id="pw">
				</div>
			</div>
			<div class="form-group">
				<label for="pw2" class="control-label col-sm-2">PasswordConfirm:</label>
				<div class="col-sm-10">
					<input type="password" name="pw2" required="required"
						class="form-control" id="pw2">
				</div>
				<div class="alert alert-success" id="alert-success">비밀번호가
					일치합니다.</div>
				<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지
					않습니다.</div>
			</div>
			<div class="form-group">
				<label for="name" class="control-label col-sm-2">Name:</label>
				<div class="col-sm-10">
					<input type="text" name="admin_name" required="required"
						class="form-control" id="name">
				</div>
			</div>
			<button type="submit" id="submit"  class="btn btn-primary">Submit</button>
		</form>
	</div>

</body>
<script type="text/javascript">
	var idCheck = false;
	$("#admin_id").blur(function() {
		var id = $(this).val();
		$.post("./adminCheckId", {
			id : id
		}, function(data) {
			data = data.trim();
			if (data == 'pass') {
				$("#checkIdResult").html('사용가능한 ID');
				$("#checkIdResult").attr("class", "text-success");
				idCheck = true;
			} else {
				$("#checkIdResult").html('중복된 ID');
				$("#checkIdResult").attr("class", "text-danger");
				idCheck = false;
				$("#admin_id").val("");

			}
		});
	});

	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pw = $("#pw").val();
			var pw2 = $("#pw2").val();
			if (pw != "" || pw2 != "") {
				if (pw == pw2) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
	});
</script>
</html>