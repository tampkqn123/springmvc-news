<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="userURL" value = "/trang-chu/dang-ky"/>
<c:url var="userAPI" value="/api/user"/>
<html>
<head>
    <title>Chỉnh sửa USER</title>
    <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
	<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				try {
					ace.settings.check('breadcrumbs', 'fixed')
				} catch (e) {
				}
			</script>

			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="<c:url value='/quan-tri/trang-chu'/>">Trang Chủ</a>
				</li>
				
			</ul>
			<!-- /.breadcrumb -->
		</div>
		<div class="page-content">
			<div class="row">
				<div class="col-xs-12">
					<c:if test="${not empty message}">
						<div class="alert alert-${alert}">
  							${message}
						</div>
					</c:if>
					<form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="model">
					  <fieldset>
					    <div id="legend">
					      <legend class="">Register</legend>
					    </div>
					    <div class="control-group">
					      <!-- Username -->
					      <label class="control-label"  for="form-field-1">Username</label>
					      <div class="controls">
					        <form:input path="userName" cssClass="col-xs-10 col-sm-5"/>
					      </div>
					    </div>
			 
					    <div class="control-group">
					      <!-- Password-->
					      <label class="control-label" for="password">Password</label>
					      <div class="controls">
					        <form:password path="password" cssClass="col-xs-10 col-sm-5" id="password"/>
					      </div>
					    </div>
					 
					    <div class="control-group">
					      <!-- Password -->
					      <label class="control-label"  for="confirmPassword">Password (Confirm)</label>
					      <div class="controls">
					        <form:password path="confirmPassword" cssClass="col-xs-10 col-sm-5" id="confirmPassword"/>
					      </div>
					    </div>
					    
					    <div class="control-group">
					      <!-- E-mail -->
					      <label class="control-label" for="fullName">Full Name</label>
					      <div class="controls">
					        <form:input path="fullName" cssClass="col-xs-10 col-sm-5" id="fullName"/>
					      </div>
					    </div>
					    
					    <form:hidden path="roleCode" id="roleCode" value="USER"/>
					    <form:hidden path="status" id="status" value="1"/>
					    <div class="control-group">
					      <!-- Button -->
					      <div class="controls">
					        <button class="btn btn-success" id="btnAddOrUpdateUser">Register</button>
					      </div>
					    </div>
					  </fieldset>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>	
<script type="text/javascript">
	$('#btnAddOrUpdateUser').click(function (e) {
	    e.preventDefault(); //nếu ko có thì sẽ mặc định submit vào url đang đứng 
	    var data = {};
	    var formData = $('#formSubmit').serializeArray();
	    $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
	    var cfpass = $('#password').val();
	    var pass = $('#confirmPassword').val();
	    if(cfpass == confirmPassword){
	    	addUser(data);
	    } else {
	    	window.location.href = "${userURL}?message=error_system";
	    }    
	});
	
	function addUser(data){
		$.ajax({
            url: '${userAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${userURL}?&message=insert_success";
            },
            error: function (error) {
            	window.location.href = "${userURL}?message=error_system";
            }
        });
	}
	
</script>
</body>
</html>