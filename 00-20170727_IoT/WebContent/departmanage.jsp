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
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
		<meta name="ProgId" content="FrontPage.Editor.Document">
<script type="text/javascript">

</script>
		<link href="res/bootstrap.min.css" type="text/css" rel="stylesheet">
		<link rel="stylesheet"
			href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">

		<script src="res/jquery-3.2.1.min.js"></script>
		<script
			src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
			<script src="http://www.my97.net/dp/My97DatePicker/WdatePicker.js"></script>
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
	//文本框失去焦点后
	$(function() {
		var ok1=false;
		$("form :input.required").each(function() {
			var $required = $("<strong class='high'>*</strong>"); //创建元素
			//$(this).parent().append($required);  //追加到文档中 
			$(this).parent().prepend($required);
		});
		//文本框失去焦点后
		$('form :input')
				.blur(
						function() {
							var $parent = $(this).parent();
							if ($(this).is('#DptID11')) {
								//验证用户名
								if (this.value == "") {
									var errorMsg = '不能为空';
									$parent
											.append('<td><span class="formtips onError" style="color:red;font-size:10px">'
													+ errorMsg + '</span></td>');
								}
								else if (!$("#DptID11").val().match(
										/^[0-9a-zA-Z\u4e00-\u9fa5_]{1,16}$/)) {
									var errorMsg = '由字母和数字组成';
									$parent
											.append('<td><span class="formtips onError" style="color:red;font-size:10px">'
													+ errorMsg + '</span></td>');
								}
								else{
									ok1=true;
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
			//var numError = $('form .onError').length;
			if (ok1) {
				alert("增加成功");
			}
			else{
				return false;
			}
		});


	
	$('#search').click(function(){
   	 	var params = $("#formSearch").serialize(); 
   	 alert(params);
			window.location.href="departmentQueryAll?"+params;
   });
   
	$('#addsubmit1').click(function(){
   	 	var params = $("#formAdd").serialize(); 
		//alert(params);
		var addDptID = document.getElementById("addDptID").value;
		var depName = document.getElementsByName("dptName")[0].value;
		if(addDptID == "" || depName =="")
		{
			alert("部门ID或部门名称为空，请重新输入");
		}
		else
		{
			$.ajax( {  
        	
             type : "POST",  
             url : "departmentAdd",  
             data :params,  
             success : function(data) {  
                 window.location.href="departmentQueryAll"; 
             }  
         }); 
		}
   });
    
    $('#editsubmit').click(function(){
   	 	var params = $("#formEdit").serialize(); 
   	 	alert(params);
         $.ajax( {  
             type : "POST",  
             url : "departmentEdit",  
             data :params,  
             success : function(data) {  
            	 window.location.href="departmentQueryAll";
             }  
         });  
   });
   
   $('#deletesubmit').click(function(){
    	var params = $("#formDelete").serialize(); 
		 $.ajax( {  
	         type : "POST",  
	         url : "departmentDelete",  
	         data :params,  
	         success : function(data) {  
	        	 gotopage(1);
	         }  
	     });  
   });
 });  
 
//删除
function deleteDpt(id){
	
	var dptId = document.getElementById("tableList").rows[id].cells[1].innerText;
	alert(dptId);
	$('#deleteID1').val(dptId); 
	$('#DptID1').val(dptId);

}


function deleteDptAfirm(){
	//var params = $("#formDelete").serialize(); 
	 	//alert(params);
	//var dptId = document.getElementById("tableList").rows[id].cells[1].innerText;
	var params="department.departmentId="+document.getElementsByName("department.departmentId")[0].value;
	 $.ajax( {  
         type : "POST",  
         url : "departmentDelete",  
         data :params,  
         success : function(data) { 
         	gotopage(1); 
         }  
     });  
}


//编辑
function editNode(id){
	
	var sensorId = document.getElementById("tableList").rows[id].cells[1].innerText;
	alert(sensorId);
	document.getElementById("tableAdd").rows[0].cells[1].val("111")

}
   
	//新增重置
	function resetform() {
		$("input").val('');
		$("textarea").val('');
	}
	
	//修改重置
	function editform() {
		$("#editDptAddress").val('');
		$("#editDptTel").val('');
		$("#editRemark").val('');
	}
	
	
	
	//局部提交表单
	function formSubmit() { 
	
		var dptId = document.getElementsByName("dptId")[0].value;
		var depName = document.getElementsByName("dptName")[0].value;
		
		if(dptId!="" && dptId!=null)
		{
			window.location.href="departmentQueryAll?department.departmentId="+dptId;
		}
		else if(depName!="" && depName!=null)
		{
			window.location.href="departmentQueryAll?department.departmentName="+depName;
		}
		else
		{
			window.location.href="departmentQueryAll";
		}
	}
	
	function gotopage(page){
		window.location.href="departmentQueryAll?paging.currentPage="+page;
	} 
	
	function changeNode(id){
	
	var dptId = document.getElementById("tableList").rows[id].cells[1].innerText;
	var dptName = document.getElementById("tableList").rows[id].cells[2].innerText;
	//var userName = document.getElementById("tableList").rows[id].cells[3].innerText;
	var dptTel = document.getElementById("tableList").rows[id].cells[4].innerText;
	var dptRemark = document.getElementById("tableList").rows[id].cells[5].innerText;
	$('#deleteID1').val(dptId);
	$('#editDptID').val(dptId);
	$('#editDptName').val(dptName);
	//$('#editUserName').val(userName);
	$('#editDptTel').val(dptTel);
	$('#editRemark').val(dptRemark);
}

</script>

<body bgcolor="#f1f1f1">
	<div id="div-2">
			<div>
				<h2 style="text-align:center">
					<b>部门信息管理</b>
				</h2>
			</div>
			<div>
				<div id="div3" class="div-3">
				<form id="formSearch" action="">
					<table width="500px" height="2%;" border="0" cellspacing="0"
						cellpadding="0" align="right">
						<tr height="2%;">
							<td align="right" style="font-size:15px;"><label
								for="firstname">部门ID:</label></td>
							<td width="20%;"><input type="text" class="form-control"
								id="dptId" name="dptId"></td>
							<td align="right" style="font-size:15px;"><label
								for="dptName">部门名称:</label></td>
							<td width="20%;"><input type="text" class="form-control"
								id="dptName" name="dptName"></td>
							<td>
								<button type="button" class="btn btn-primary btn-sm" id="search" onclick="formSubmit()">查询</button>
							</td>
							<td>
								<button type="button" class="btn btn-primary btn-sm"
									id="addsubmit" data-toggle="modal" data-target="#addModal">新增</button>
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
                		<input type="text" id="deleteID1" style="width: 25px; border-style:none; text-align:center;" name="department.departmentId"/>
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

				<!-- 新增信息 -->
				<div style="float: left;" class="modal fade" id="addModal"
					tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
					aria-hidden="true">
					<div class="modal-dialog"
						style="width:70%;padding:0px;margin-top:0px;">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h3 style="text-align:center" class="modal-title"
									id="addModalLabel">
									<b>新增部门信息</b>
								</h3>
							</div>
							<div class="modal-body" style="margin:10px">
								<form id="formAdd"  method="post" action="">
									<table width="85%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td style="font-size:15px; padding:5px"><label
												class="col-sm-12 control-label">&nbsp;部&nbsp;&nbsp;门&nbsp;&nbsp;ID&nbsp;</label></td>
											<td><input type="text" name="department.departmentId" sylte="width:50%;" id="addDptID"
												class="form-control" placeholder="请输入类似D1"></td>
											<td style="font-size:15px; padding:10px"><label
												class="col-sm-12 control-label">部&nbsp;&nbsp;门&nbsp;&nbsp;名</label></td>
											<td><input type="text" name="department.departmentName" sylte="width:50%;" id="dptName"
												class="form-control" placeholder="请输入部门名"></td>
										</tr>
										
										<tr>
											<td style="font-size:15px; padding:10px"><label
												class="col-sm-12 control-label">部门电话</label></td>
											<td><input type="text" name="department.tel" class="form-control" id="dptTel"></td>
											<td style="font-size:15px; padding:10px"><label
												class="col-sm-12 control-label">部门地址</label></td>
											<td><input type="text" name="department.address" class="form-control" id="depAddress"></td>
										</tr>
										<tr>
											<td style="font-size:15px; padding:10px"><label
												class="col-sm-12 control-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</label></td>
											<td><textarea type="text" id="dptRemark" name="department.remark" class="form-control"></textarea></td>
										</tr>
									</table>
								</form>
							</div>
							<div style="margin:5px" class="modal-footer">
								<table align="center">
									<tr>
										<td>
											<button type="button" class="btn btn-primary btn-sm"
											data-dismiss="modal">取消</button>
											<button type="button" id="res" onclick="resetform()" class="btn btn-primary btn-sm">重置</button>
											<button type="button" id="addsubmit1" class="btn btn-primary btn-sm">保存</button>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 修改信息 -->
				<div style="float: center;" class="modal fade" id="editModal"
					tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
					aria-hidden="true">
					<div class="modal-dialog"
						style="width:70%;padding:0px;margin-top:0px;">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h3 style="text-align:center" class="modal-title"
									id="addModalLabel">
									<b>修改部门信息</b>
								</h3>
							</div>
							
							<form id="formEdit" method="post" action="">
								<div class="modal-body" style="margin:10px">
									<table width="85%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td style="font-size:15px; padding:10px"><label
												for="firstname" class="col-sm-12 control-label">&nbsp;部&nbsp;&nbsp;门&nbsp;&nbsp;ID&nbsp;</label></td>
											<td><input type="text" id="editDptID" name="department.departmentId" sylte="width:50%;" class="form-control" readonly="readonly"></td>
											<td style="font-size:15px; padding:10px"><label
												for="lastname" class="col-sm-12 control-label">部门名称</label></td>
											<td><input type="text" id="editDptName" name="department.departmentName" class="form-control" readonly="readonly"></td>
										</tr>
										
										<tr>
											<td style="font-size:15px; padding:10px"><label
												for="lastname" class="col-sm-12 control-label">部门电话</label></td>
											<td><input type="text" name="department.tel" class="form-control"
												id="editDptTel"></td>
											<td style="font-size:15px; padding:10px"><label
												for="lastname" class="col-sm-12 control-label">部门地址</label></td>
											<td><input type="text" name="department.address" class="form-control"
												id="editDptAddress"></td>
										</tr>
										<tr>

										</tr>
										<tr>
											<td style="font-size:15px; padding:10px"><label
												for="lastname" class="col-sm-12 control-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</label></td>
											<td><textarea type="text" name="department.remark" class="form-control"
													id="editRemark"></textarea></td>
										</tr>
									</table>
								</div>
								<div class="modal-footer">
									<table align="center">
										<tr>
											<td>
												<button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">取消</button>
												<button type="button" class="btn btn-primary btn-sm" onclick="editform()">重置</button>
												<button type="button" id="editsubmit" class="btn btn-primary btn-sm">保存</button>
											</td>
										</tr>
									</table>
								</div>
							</form>
						</div>
					</div>
				</div>
				
				<!-- 列表-->
				<div>
					<table id="tableList" class="table table-striped" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<th><b>序号</b></th>
							<th><b>部门ID</b></th>
							<th><b>部门名</b></th>
							<th><b>部门职工</b></th>
							<th><b>部门电话</b></th>
							<th><b>部门地址</b></th>
							<th>备注</th>
							<th><b>操&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作</b></th>
						</tr>

						<s:iterator id="dm" value="departmentList" status="st">
						<tr>
							<td><s:property value="#st.index+1" /></td>

							<td><s:property value="#dm.departmentId" /></td>

							<td><s:property value="#dm.departmentName" /></td>

							<td><s:property value="#dm.user.userName" /></td>

							<td><s:property value="#dm.tel" /></td>

							<td><s:property value="#dm.address" /></td>

							<td><s:property value="#dm.remark" /></td>
							<td style="cursor:pointer;">
							<a data-toggle="modal" data-target="#editModal" style="font-size: 15px;color:337ab7" href="javascript:void(0)" onclick="javascript:changeNode(<s:property value="#st.index+1"/>);"><span
									class="glyphicon glyphicon-pencil"></span>&nbsp;编辑</a>
							<a data-toggle="modal" data-target="#deleteModal" style="font-size: 15px;color:337ab7" href="javascript:void(0);" onclick="javascript:changeNode(<s:property value="#st.index+1"/>);"><span
									class="glyphicon glyphicon-trash"></span>&nbsp;删除</a>
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
	</div>
</body>
</html>