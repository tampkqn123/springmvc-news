<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="userURL" value = "/quan-tri/nguoi-dung/danh-sach"/>
<c:url var="editUserURL" value="/quan-tri/nguoi-dung/chinh-sua"/>
<c:url var="userAPI" value="/api/user"/>
<html>
<head>
    <title>Chỉnh sửa USER</title>
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

				<li><a href="<c:url value='/quan-tri/nguoi-dung/danh-sach?page=1&limit=5'/>">USER</a></li>
				<c:if test="${not empty model.id}">
					<li class="active">Cập nhập USER</li>
				</c:if>
				<c:if test="${empty model.id}">
					<li class="active">Thêm USER</li>
				</c:if>
				
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
						<div class="form-group">
							  <label for="roleCode" class="col-sm-3 control-label no-padding-right">Vai Trò:</label>
							  <div class="col-sm-9">
							  	 <form:select path="roleCode" id="roleCode">
							  	 	<form:option value="" label="-- Chọn vai trò --"/>
							  	 	<form:options items="${roles}"/>
							  	 </form:select>
							  </div>
						</div>
						<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">UserName</label>
								<div class="col-sm-9">
									<c:if test="${not empty model.id}">
										<input type="text" id="userName" name="userName" value="${model.userName}" cssClass="col-xs-10 col-sm-5" readonly/>
									</c:if>
									<c:if test="${empty model.id}">
										<form:input path="userName" cssClass="col-xs-10 col-sm-5"/>
									</c:if>
								</div>
						</div>
						<div class="form-group">
						  	<label for="password" class="col-sm-3 control-label no-padding-right">PassWord:</label>
						  	<div class="col-sm-9">
						  		<form:password path="password" cssClass="col-xs-10 col-sm-5" id="password"/>
						  	</div>
						</div>
						<div class="form-group">
						  	<label for="fullName" class="col-sm-3 control-label no-padding-right">FullName:</label>
						  	<div class="col-sm-9">
						  		<form:input path="fullName" cssClass="col-xs-10 col-sm-5" id="fullName"/>
						  	</div>
						</div>
						<div class="form-group">
							  <label for="status" class="col-sm-3 control-label no-padding-right">Status:</label>
							  <div class="col-sm-9">
							  	 <form:select path="status" id="status">
							  	 	<form:option value="1" label="Hoạt động"/>
							  	 	<form:option value="0" label="Không hoạt động"/>
							  	 </form:select>
							  </div>
						</div>
						<form:hidden path="id" id="userId"/>
						<div class="clearfix form-actions">
							<div class="col-md-offset-3 col-md-9">
											<c:if test="${not empty model.id}">
												<button class="btn btn-info" type="button" id="btnAddOrUpdateUser">
													<i class="ace-icon fa fa-check bigger-110"></i>
													Cập nhật USER
												</button>
											</c:if>
											<c:if test="${empty model.id}">
												<button class="btn btn-info" type="button" id="btnAddOrUpdateUser">
													<i class="ace-icon fa fa-check bigger-110"></i>
													Thêm USER
												</button>
											</c:if>

											&nbsp; &nbsp; &nbsp;
											<button class="btn" type="reset">
												<i class="ace-icon fa fa-undo bigger-110"></i>
												Hủy
											</button>
							</div>		
						</div>
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
	    var id = $('#userId').val();
	    if(id == ""){
	    	addUser(data);
	    } else {
	    	updateUser(data);
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
            	window.location.href = "${editUserURL}?id="+result.id+"&message=insert_success";
            },
            error: function (error) {
            	window.location.href = "${userURL}?page=1&limit=5&message=error_system";
            }
        });
	}
	
	function updateUser(data){
		$.ajax({
            url: '${userAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${editUserURL}?id="+result.id+"&message=update_success";
            },
            error: function (error) {
            	window.location.href = "${editUserURL}?id="+result.id+"&message=error_system";
            }
        });
	}

</script>
</body>
</html>