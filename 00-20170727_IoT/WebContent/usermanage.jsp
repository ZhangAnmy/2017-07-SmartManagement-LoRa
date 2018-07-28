<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld "%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link href="res/mistake.css" type="text/css" rel="stylesheet">
<link href="res/bootstrap.min.css" type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css.css">
<script src="res/jquery-3.2.1.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("message", "000");
%>

<style>
#div-2 {
	backgroud: #f00;
	width: 95%;
	float: center;
	margin-left: 30px;
	margin-top: 20px;
}

.div-3 {
	float: right;
	margin-bottom: 10px;
	padding-right: 10px;
}

table,th,td {
	text-align: center;
	font-size: 15px;
}

input.text {
	text-align: center;
	padding: 10px;
}
</style>

<script type="text/javascript">
	$(function() {
		var ok1 = false;
		var ok2 = false;
		$("form :input.required").each(function() {
			var $required = $("<strong class='high'>*</strong>"); //创建元素
			//$(this).parent().append($required);  //追加到文档中 
			$(this).parent().prepend($required);
		});
		//文本框失去焦点后
		$("form :input")
				.blur(
						function() {
							var $parent = $(this).parent();
							if ($(this).is('#username')) {
								//验证登录名
								if (this.value == "") {
								var errorMsg = '用户名不能为空';
								$parent
										.append('<td><span class="formtips onError" style="color:red;font-size:10px">'
												+ errorMsg + '</span></td>');
							}
							else if (!$("#username").val().match(
										/^[0-9a-zA-Z\u4e00-\u9fa5_]{3,16}$/)) {
									var errorMsg = '由3-16位字母数字中文组成';
									$parent
											.append('<td><span class="formtips onError" style="color:red;font-size:10px">'
													+ errorMsg + '</span></td>');
								}
							else {
									ok1 = true;
								}
							}
							if ($(this).is('#userpassword')) {
								//验证登录名
								if (this.value == "") {
									var errorMsg = '密码不能为空';
									$parent
											.append('<td><span class="formtips onError" style="color:red;font-size:10px">'
													+ errorMsg + '</span></td>');
								} else {
									ok2 = true;
								}
							}
						});
		$("form :input").focus(function() {
			var $parent = $(this).parent();
			$parent.find(".formtips").remove();
		});
		//最终提交验证
		$("#send").click(function() {
			var $parent = $(this).parent().parent();
			$parent.find(".formtips").remove();
			$("form :input").trigger('blur');
			if (ok1 && ok2) {
				alert("增加用户成功");
			} else {
				return false;
			}

		});
		
    $('#search').click(function(){
   	 	var params = $("#formSearch").serialize(); 
   	 	//alert(params);
		window.location.href="userQuery?"+params;
   });
    

    $('#deletesubmit').click(function(){
    	var params = $("#formDelete").serialize(); 
		var userId = document.getElementById("delUserID").value;
		var deleteParams = "userLogin.userId="+userId;
		 $.ajax( {  
		        
	         type : "POST",  
	         url : "userDelete",  
	         data :params,  
	         success : function(data) { 
	        	// alert("delete user success"); 
	        	  $.ajax( {  
			         type : "POST",  
			         url : "userLoginDelete",  
			         data :deleteParams,  
			         success : function(data) {  
			         	 //alert("delete userlogin success");
			        	 gotopage(1);
			         }  
	     		});
	         }  
	     });  
	   });

    $('#editsubmit').click(function(){
   	 	var params = $("#formEdit").serialize(); 
         $.ajax( {  
        
             type : "POST",  
             url : "userEdit",  
             data :params,  
             success : function(data) {  
            	 gotopage(1);
             }  
         });  
   });

});
	
    
//跳转页面
function gotopage(page){

	window.location.href="userQuery?paging.currentPage="+page;
}

function changeNode(id){
	var userId = document.getElementById("tableList").rows[id].cells[1].innerText;
	var userName = document.getElementById("tableList").rows[id].cells[2].innerText;
	var userDpt = document.getElementById("tableList").rows[id].cells[3].innerText;
	var userTel = document.getElementById("tableList").rows[id].cells[4].innerText;
	var uerEmail = document.getElementById("tableList").rows[id].cells[5].innerText;
	var remark = document.getElementById("tableList").rows[id].cells[6].innerText;
	$('#deleteID1').val(userName);
	$('#delUserID').val(userId);
	//$('#addUserID').val(userId);
	$('#editUserID').val(userId);
	$('#userName2').val(userName);
	if(userDpt=="古树")
	{
		$('#UserDpt').val("D1");
	}
	else if(userDpt=="井盖")
	{
		$('#UserDpt').val("D2");
	}
	else if(userDpt=="下水道")
	{
		$('#UserDpt').val("D3");
	}
	else if(userDpt=="垃圾桶")
	{
		$('#UserDpt').val("D4");
	}
	
	$('#Tel').val(userTel);
	$('#Email').val(uerEmail);
	$('#Remark').val(remark);
}

//新增重置
function subform() {
	$("input").val('');
	$("textarea").val('');
	$("password").val('');
}

//修改重置
function Editsubform(){
	$("#UserDpt").val('');
	$("#Tel").val('');
	$("#Email").val('');
	$("#Remark").val('');
}

function deleteUserAfirm(){
	//var params = $("#formDelete").serialize(); 
	//alert(params);
	var userId = document.getElementById("delUserID").value;
	var params="user.userId="+userId;
	 $.ajax( {  
         type : "POST",  
         url : "userDelete",  
         data :params,  
         success : function(data) { 
         	gotopage(1); 
         }  
     });  
}

function formSubmit() { 
	
		var userName = document.getElementsByName("userName1")[0].value;
		var depType = document.getElementsByName("dptType")[0].value;
		if(userName!="" && userName!=null)
		{
			window.location.href="userQuery?user.userName="+userName;
		}
		else if(depType!="" && depType!=null)
		{
			window.location.href="userQuery?user.dep.departmentName="+depType;
		}
		else
		{
			window.location.href="userQuery";
		}
	}
	
function addSubmit(){
   	 	var params = $("#formAdd").serialize(); 
   	 	//var userRemark = "user.userlogin.password="+document.getElementById("addUserRemark").value;
   	 	var addDptName = document.getElementById("addDptName").value;
   	 	if(addDptName=="古树")
   	 	{
   	 		params=params+"&user.departmentId=D1"
   	 	}
   	 	else if(addDptName=="下水道")
   	 	{
   	 		params=params+"&user.departmentId=D3"
   	 	}
   	 	else if(addDptName=="井盖")
   	 	{
   	 		params=params+"&user.departmentId=D2"
   	 	}
   	 	else if(addDptName=="垃圾桶")
   	 	{
   	 		params=params+"&user.departmentId=D4"
   	 	}
   	 	
		//alert(params);
		
		var addUserId = "userLogin.userId="+document.getElementById("addUserID").value;
   	 	var userLoginName = "userLogin.username="+document.getElementById("addLoginName").value;
   	 	var password = "userLogin.password="+document.getElementById("addUserPwd").value;
        var addParams = addUserId+"&"+userLoginName+"&"+password;
        alert(addParams);
        $.ajax( {  
             type : "POST",  
             url : "userAdd", 
             async: false, 
             data :params,  
             success : function(data) {
            		 //alert("user add success");
            		  $.ajax( {  
					     type : "POST",  
					     url : "userLoginAdd", 
					     async: false, 
					     data :addParams,  
					     success : function(data) {
					     //alert("userlogin add success");
					        gotopage(1); 
					      }  
					  }); 
             }  
         }); 
}
	
</script>

<body bgcolor="#f1f1f1">
	<div id="div-2">
			<div>
				<h2 style="text-align:center">
					<b>用户信息管理</b>
				</h2>
			</div>
			<div>
				<div id="div3" class="div-3">
				<form id="formSearch" action="">
					<table width="500px" height="2%;" border="0" cellspacing="0"
						cellpadding="0" align="right">
						<tr height="2%;">
							<td align="right" style="font-size:15px;"><label
								for="firstname">姓名:</label></td>
							<td width="20%;"><input type="text" class="form-control"
								id="user.userName" name="user.userName"></td>
							<td align="right" style="font-size:15px;"><label
								for="lastname">所属部门:</label></td>
							<td width="25%;" height="10%;"><select class="form-control" id="user.dep.departmentName" name="user.dep.departmentName">
									<option value="">--请选择--</option>
									<option value="古树">古树</option>
									<option value="井盖">井盖</option>
									<option value="下水道">下水道</option>
									<option value="垃圾桶">垃圾桶</option>
							</select></td>
							<td>
								<button type="button" class="btn btn-primary btn-sm" id="search">查询</button>
							</td>
							<td>
								<button type="button" class="btn btn-primary btn-sm"
									id="addsubmit1" data-toggle="modal" data-target="#addModal">新增</button>
							</td>
						</tr>
					</table>
					</form>
				</div>


				<!-- 删除信息 -->
				<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-dialog">
				        <div class="modal-content">
				            <div class="modal-body">
				                <form id="formDelete"  method="post" action="">
				                	<a>你确认要删除</a>
                					<input type="hidden" id="delUserID" style="width: 0px;" name="user.userId"/>
                					<input type="text" id="deleteID1" style="width: 65px; border-style:none; text-align:center;" name="user.userName"/>
                					<a>么？</a>
				                </form>
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-primary" id="deletesubmit">确认</button>
				                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				            </div>
				        </div>
				    </div>
				</div>

				<!-- 新增用户弹窗 -->
				<div style="float: center;" class="modal fade" id="addModal"
					tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
					aria-hidden="true">
					<div class="modal-dialog"
						style="width:70%;padding:0px;margin-top:0px;">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h3 style="text-align:center" class="modal-title" id="addModalLabel">
									<b>新增用户</b>
								</h3>
							</div>
							<div class="modal-body" style="margin:10px">
								<form id="formAdd"  method="post" action="">
									<table width="95%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td style="font-size:15px; padding:10px;">登&nbsp;录&nbsp;名</td>
											<td><input type="text" id="addLoginName" name="user.userLogin.username"
												placeholder="长度为3-16" class="form-control"
												style="font-size:15px" /></td>
											<td style="font-size:15px; padding:10px;">密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
											<td><input type="password" id="addUserPwd" name="user.userLogin.password"
												class="form-control" style="font-size:15px" /></td>
										</tr>
										<tr>
											<td style="font-size:15px; padding:10px;">用&nbsp;户&nbsp;ID</td>
											<td><input type="text" id="addUserID" name="user.userId"
												class="form-control" style="font-size:15px" /></td>
											<td style="font-size:15px; padding:10px;">真实姓名</td>
											<td><input type="text" id="addUserName" name="user.userName"
												class="form-control" style="font-size:15px" /></td>
										</tr>
										<tr>
											<td style="font-size:15px; padding:10px;">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话</td>
											<td><input type="text" id="addUserTel" name="user.tel" class="form-control" /></td>
											<td style="font-size:15px; padding:10px;">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;件</td>
											<td><input type="text" id="addUserEmail" name="user.email" class="form-control"
												style="font-size:15px" /></td>
										</tr>
										<!--  <tr>
											<td style="font-size:15px; text-align:right; padding:10px;"
												colspan="2">权&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;限</td>
											<td style="text-align:left;" colspan="2"><label>
													<input type="radio" name="optionsRadiosinline"
													id="optionsRadios3"checked="checked"> <b>普通管理员</b>
											</label> <label> <input type="radio"
													name="optionsRadiosinline" id="optionsRadios3"> <b>超级管理员</b></label></td>
										</tr>-->
										<tr>
										<td style="font-size:15px; padding:10px;">所属部门</td>
											<td><select class="form-control" name="user.dep.departmentName" id="addDptName">
													<option value="">--请选择--</option>
													<option value="古树">古树</option>
													<option value="井盖">井盖</option>
													<option value="下水道">下水道</option>
													<option value="垃圾桶">垃圾桶</option>
											</select></td>
										</tr>

									</table>
								</form>
							</div>
							<div class="modal-footer">
								<table align="center">
									<tr>
										<td>
											<button type="button" class="btn btn-info" data-dismiss="modal">取消</button>
											<button type="button" id="res" onclick="subform()" class="btn btn-primary btn-sm">重置</button>
											<button type="button" id="addsubmit" onclick="addSubmit()" class="btn btn-primary btn-sm">保存</button>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 修改用戶信息 -->
				<div style="float: center;" class="modal fade" id="editModal"
					tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
					<div class="modal-dialog" style="width:70%;padding:0px;margin-top:0px;">
						<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h3 style="text-align:center" class="modal-title"
										id="addModalLabel">
										<b>修改用户信息</b>
									</h3>
								</div>
								
							<form id="formEdit" method="post" action="">	
								<div class="modal-body" id="editDiv">
									<table width="85%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<!--td style="font-size:15px; padding:10px; text-align:right"><label
												for="firstname">&nbsp;登&nbsp;&nbsp;录&nbsp;&nbsp;名&nbsp;</label></td> -->
											<td style="display:none"><input type="hidden" id="editUserID" style="width: 0px;" name="user.userId"/></td>
											<td style="font-size:15px; padding:10px; text-align:right"><label
												for="lastname">真实姓名</label></td>
											<td><input type="text" readonly="readonly"
												class="form-control" id="userName2" name="user.userName"></td>
											<td style="font-size:15px; padding:10px; text-align:right"><label
												for="lastname">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话</label></td>
											<td><input type="text" class="form-control" id="Tel" name="user.tel"></td>
										</tr>

										<tr>
											<td align="center"
												style="font-size:15px; padding:10px; text-align:right"><label
												for="lastname">所属部门</label></td>
											<td><select class="form-control" name="user.departmentId" id="UserDpt">
													<option value="">--请选择--</option>
													<option value="D1">古树</option>
													<option value="D2">井盖</option>
													<option value="D3">下水道</option>
													<option value="D4">垃圾桶</option>
											</select></td>
											<td style="font-size:15px; padding:10px; text-align:right"><label
												for="lastname">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;件</label></td>
											<td><input type="text" class="form-control"
												id="Email" name="user.email" placeholder="邮件"></td>
										</tr>
										<tr>
											<td style="font-size:15px; padding:10px; text-align:right"><label
												for="lastname">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</label></td>
											<td><textarea type="text" class="form-control"
													id="Remark" name="user.remark"></textarea></td>
										</tr>
										<!--  <tr>
											<td style="font-size:15px; text-align:right; padding:10px;"
												colspan="2">权&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;限</td>
											<td style="text-align:left;" colspan="2">
											<label>
												<input type="radio" name="optionsRadiosinline"
													id="optionsRadios3"> <b>普通管理员</b>
											</label> 
											<label> 
											<input type="radio" name="optionsRadiosinline" 
											id="optionsRadios3"> <b>超级管理员</b></label></td>
										</tr>-->
									</table>
								</div>
								<div style="margin:5px" class="modal-footer">
									<table align="center">
										<tr>
											<td>
												<button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">取消</button>
												<button type="button" onclick="Editsubform()" class="btn btn-primary btn-sm">重置</button>
												<button type="button" id="editsubmit" class="btn btn-primary btn-sm">保存</button>
											</td>
										</tr>
									</table>
								</div>
							</form>	
						</div>
					</div>
				</div>
				
				<table id="tableList" class="table table-striped" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<th><b>序号</b></th>
						<th style="display:none"></th>
						<!--  th><b>登录名</b></th>-->
						<th><b>真实姓名</b></th>
						<th><b>所属部门</b></th>
						<th><b>电话</b></th>
						<th><b>邮件</b></th>
						<th><b>备注</b></th>
						<th><b>操&nbsp;&nbsp;&nbsp;&nbsp;作</b></th>
					</tr>

					<s:iterator id="ul" value="userList" status="st">
						<tr>
							
							<td><s:property value="#st.index+1" /></td>
							
							<td style="display:none"><s:property value="#ul.userId" /></td>

							<td><s:property value="#ul.userName" /></td>

							<td><s:property value="#ul.dep.departmentName" /></td>

							<td><s:property value="#ul.tel" /></td>

							<td><s:property value="#ul.email" /></td>

							<td><s:property value="#ul.remark" /></td>

							<td style="cursor:pointer;">
							<a data-toggle="modal" style="font-size:15px; color:337ab7" data-target="#editModal" href="javascript:void(0)" onclick="javascript:changeNode(<s:property value="#st.index+1"/>);"><span
									class="glyphicon glyphicon-pencil"></span>&nbsp;编辑</a>
							<a  style="font-size:15px; color:337ab7" href="javascript:void(0);" onclick="javascript:changeNode(<s:property value="#st.index+1"/>);" data-toggle="modal" data-target="#deleteModal" ><span
									class="glyphicon glyphicon-trash"></span>&nbsp;删除</a>
							</td>
						</tr>
					</s:iterator>

				</table>
			</div>
			
			<!-- 翻页 -->
				<div align="right" >
				<ul class="pagination">
				<s:if test="paging.currentPage<=1">
                <li class="previous disabled"><a href="javascript:void(0);" >首页</a></li>
	            </s:if>
	            <s:else>
	                <li><a href="javascript:void(0);"
	                       onclick="javascript:gotopage(1);">首页</a></li>
	            </s:else>
	            <s:if test="paging.currentPage<=1">
	            <li class="disabled"><a href="javascript:void(0);">上一页</a>
	                </s:if>
	                <s:else>
	            <li><a href="javascript:void(0);" onclick="javascript:gotopage(${paging.currentPage-1});">上一页</a></li>
	            </s:else>
	            

	            
	            <s:if test="paging.totalPage<5">
	            <!--<span>-->
	            <s:bean name="org.apache.struts2.util.Counter" id="counter">
	            <s:param name="first" value="1" />
	            <s:param name="last" value="paging.totalPage" />
	            <s:iterator>
	         
	            <s:if test="current==paging.currentPage+1">
	
	            <li class="active"><a href="javascript:void(0);"><s:property /></a>
	
	            </s:if>
	             <s:else>
	            <li><a href="javascript:void(0);"
	                   onclick="javascript:gotopage(<s:property />);"><s:property />
	            </a>
	            </s:else>
	           
	            </s:iterator>
	            </s:bean>
	           
	               
	             </s:if>
	             
	             
	          
	        <s:else>
	      	 	<s:if test="paging.currentPage<paging.totalPage-4">
	            <!--<span>-->
	            <s:bean name="org.apache.struts2.util.Counter" id="counter">
	            <s:param name="first" value="paging.currentPage" />
	            <s:param name="last" value="paging.currentPage+4" />
	            <s:iterator>
	          
	               <s:if test="current==paging.currentPage+1">
	
	            <li class="active"><a href="javascript:void(0);"><s:property /></a>
	
	            </s:if>
	            <s:else>
	            <li><a href="javascript:void(0);"
	                   onclick="javascript:gotopage(<s:property />);"><s:property />
	            </a>
	       	  </s:else>
	            </s:iterator>
	            </s:bean>
	             </s:if>   
	             
	             <s:else>
	              <s:if test="paging.currentPage>=paging.totalPage-4">
	            <!--<span>-->
	            <s:bean name="org.apache.struts2.util.Counter" id="counter">
	            <s:param name="first" value="paging.totalPage-4" />
	            <s:param name="last" value="paging.totalPage" />
	            <s:iterator>
	         
	            <s:if test="current==paging.currentPage+1">
	
	            <li class="active"><a href="javascript:void(0);"><s:property /></a>
	
	            </s:if>
	             <s:else>
	            <li><a href="javascript:void(0);"
	                   onclick="javascript:gotopage(<s:property />);"><s:property />
	            </a>
	            </s:else>
	           
	            </s:iterator>
	            </s:bean>
	            
	             </s:if>   
	           </s:else>
	           </s:else>

				<s:if test="paging.totalPage>=paging.currentPage">
	            <s:if test="paging.totalPage==paging.currentPage">
	            <li class="disabled"><a href="javascript:void(0);">下一页</a></li>
	            <li class="disabled"><a href="javascript:void(0);" >尾页</a></li>
	            </s:if>
	            <s:else>
	             <li><a href="javascript:void(0);"
	                       onclick="javascript:gotopage(${paging.currentPage+1})">下一页</a></li>
	            <li><a href="javascript:void(0);"
	                       onclick="javascript:gotopage(${paging.totalPage});">尾页</a></li>
	            </s:else>
	            </s:if>
	            </ul>
			 </div>
			 <!-- 翻页 -->
	</div>
</body>
</html>
