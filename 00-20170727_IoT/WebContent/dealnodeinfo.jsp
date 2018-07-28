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
<script src="http://www.my97.net/dp/My97DatePicker/WdatePicker.js"></script>
<script src="js/qikoo.js"></script>
</head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("message", "000");
%>

<style>
.div-1 {
	position: absolute;
	right: 10px;
	left: 10px;
	top: 100px;
	background: #f1f1f1;
	width: 100%;
	height: 90%;
	display: none;
}

.div-2 {
	backgroud: #f00;
	width: 95%;
	float: center;
	margin-left: 20px;
	margin-top: 20px;
}

.div-3 {
	float: right;
	margin-bottom: 10px;
	padding-right: 10px;
}

table,th,td {
	text-align: center;
	font-size:13px;
}

input.text {
	text-align: center;
	padding: 10px;
}

a:link {
	color: #337ab7;
	font-size: 15px;
	
}
</style>

<script type="text/javascript">
	//文本框失去焦点后
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
							if ($(this).is('#entityID')) {
								//验证监控点编号
								if (this.value == "") {
									var errorMsg = '不能为空';
									$parent
											.append('<td><span class="formtips onError" style="color:red;font-size:10px">'
													+ errorMsg + '</span></td>');
								} else if (!$("#entityID").val().match(
										/^[A-Za-z0-9]+$/)) {
									var errorMsg = '只能输入数字或者字母';
									$parent
											.append('<td><span class="formtips onError" style="color:red;font-size:10px">'
													+ errorMsg + '</span></td>');
								} else {
									ok1 = true;
								}
							}


							if ($(this).is('#chargeName')) {
								//验证负责人
								if (this.value == "") {
									//	var myReg = /^[\u4e00-\u9fa5]+$/;
									var errorMsg = '不能为空';
									$parent
											.append('<td><span class="formtips onError" style="color:red;font-size:10px">'
													+ errorMsg + '</span></td>');
								} else if (!$("#chargeName").val().match(
										/^[\u4e00-\u9fa5]+$/)&&(!$("#chargeName").val().match(
										/^[A-Za-z0-9]+$/))) {
									var errorMsg = '请输入正确的姓名';
									$parent
											.append('<td class="formtips onError" style="color:red;font-size:10px">'
													+ errorMsg + '</td>');
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
				alert("增加成功");
			} else {
				return false;
			}
		});
		
	$('#search').click(function(){
   	 	var params = $("#formSearch").serialize(); 
		window.location.href="maintainQuery?"+params;
   });
   
	$('#addsubmit1').click(function(){
   	 	var params = $("#formAdd").serialize(); 
   	 	var entyId=document.getElementById("entityID").value;
   	 	if(entyId==null || entyId=="")
   	 	{
   	 		alert("监控点编号不能为空，请重新输入");
   	 	}
   	 	else
   	 	{
   	 		 $.ajax( {  
             type : "POST",  
             url : "maintainAdd",  
             data :params,  
             success : function(data) {  
                 window.location.href="maintainQuery"; 
             }  
         }); 
   	 	}
   });
    
    $('#editsubmit').click(function(){
   	 	var params = $("#formEdit").serialize(); 
   	 	//alert(params);
         $.ajax( {  
             type : "POST",  
             url : "maintainEdit",  
             data :params,  
             success : function(data) {  
            	 window.location.href="maintainQuery";
             }  
         });  
   });
   
   $('#deletesubmit').click(function(){
    	var params = $("#formDelete").serialize(); 
	 	//alert(params);
	
	 $.ajax( {  
	        
         type : "POST",  
         url : "maintainDelete",  
         data :params,  
         success : function(data) {  
        	 //alert(data);
        	 gotopage(1);
         }  
     });  
   });
 });  

function deleteDpt(id){
	
	var dptId = document.getElementById("tableList").rows[id].cells[1].innerText;
	//alert(dptId);
	$('#deleteID1').val(dptId); 
	$('#DptID1').val(dptId);
}


function deleteDptAfirm(){
	//var params = $("#formDelete").serialize(); 
	 	//alert(params);
	var params="maintain.entityid="+document.getElementsByName("deleteID1")[0].value;
	//alert(params);
	 $.ajax( {  
         type : "POST",  
         url : "maintainDelete",  
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
   
	//重置
	function resetform() {
		$("input").val('');
		$("textarea").val('');
	}
	//修改重置
	function editform() {
	  $('#editRemark').val('');
	  $('#status').val('');
	  $('#maintainTime').val('');
	  $('#mainTel').val('');
	  $('#mainMem1').val('');
	  $('#maintaincause').val('');
	}
	
	//局部提交表单
	function formSubmit() { 
		var entyId = document.getElementsByName("entyId")[0].value;
		//var depName = document.getElementsByName("dptName")[0].value;
		if(entyId!="" && entyId!=null)
		{
			window.location.href="maintainQuery?maintain.entityid="+entyId;
		}
		/*else if(depName!="" && depName!=null)
		{
			window.location.href="maintainQuery?maintain.departmentName="+depName;
		}*/
		else
		{
			window.location.href="maintainQuery";
		}
	}
	
	function gotopage(page){
		window.location.href="maintainQuery?paging.currentPage="+page;
	} 
	
	function changeNode(id){
	
	var entyId = document.getElementById("tableList").rows[id].cells[1].innerText;
	var entyType = document.getElementById("tableList").rows[id].cells[2].innerText;
	var recordTime = document.getElementById("tableList").rows[id].cells[4].innerText;
	var entyAddress = document.getElementById("tableList").rows[id].cells[5].innerText;
	var resMem = document.getElementById("tableList").rows[id].cells[6].innerText;
	var resTel = document.getElementById("tableList").rows[id].cells[7].innerText;
	
	  $('#deleteID1').val(entyId);
	  $('#entityId1').val(entyId);
	  $('#entityType1').val(entyType);
	  $('#recordTime1').val(recordTime);
	  $('#entityAddress').val(entyAddress);
	  $('#resPonseP1').val(resMem);
	  $('#resPonseT1').val(resTel);
}
	
</script>

<body bgcolor="#f1f1f1">
	<div id="div2" class="div-2">
		<div>
			<h2 style="text-align:center">
				<b>监控点维修记录</b>
			</h2>
		</div>
		<div>
			<div id="div3" class="div-3">
				<form id="formSearch" action="">
					<table width="500px" height="2%;" border="0" cellspacing="0"
						cellpadding="0" align="right">
						<tr height="2%;">
							<td align="right" style="font-size:15px;"><label
								for="firstname">监控点编号:</label></td>
							<td width="20%;"><input type="text" class="form-control"
								id="entyId" name="maintain.entityid"></td>
							<td align="right" style="font-size:15px;"><label
								for="lastname">监控点类型:</label></td>
							<td width="25%;" height="10%;"><select class="form-control" id="entyType" name="maintain.entity.entityType">
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
	                		<input type="text" id="deleteID1" name="deleteID1" style="width: 45px; border-style:none; text-align:center;" name="department.departmentId"/>
	                	<a>么？</a>
	                </form>
	           	 	</div>
	            	<div class="modal-footer">
	                	<button type="button" class="btn btn-primary" onclick="deleteDptAfirm()">确认</button>
	                	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	           	 	</div>
	        	</div>
	    	</div>
		</div>

			<!-- 新增维修信息 -->
			<div style="float: center;" class="modal fade" id="addModal"
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
								<b>新增监控点维修信息</b>
							</h3>
						</div>
						<div class="modal-body">
							<form id="formAdd"  method="post" action="">
								<table width="95%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td style="font-size:15px; padding:10px"><label
											for="firstname" class="col-sm-12 control-label">监控点编号</label></td>
										<td><input type="text" sylte="width:50%;"
											class="form-control" id="entityID" name="maintain.entityid"></td>
										<!--  <td style="font-size:15px; padding:5px"><label
											for="lastname" class="col-sm-12 control-label">监控点类型</label></td>

										<td><select class="form-control" id="select" type="select" name="">
												<option value="">--请选择--</option>
												<option value="古树">古树</option>
												<option value="井盖">井盖</option>
												<option value="下水道">下水道</option>
												<option value="垃圾桶">垃圾桶</option>
										</select></td>-->
										
										<td style="font-size:15px; padding:10px"><label
											for="status" class="col-sm-12 control-label">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态</label></td>
										<td><input type="text" class="form-control"
											id="status" name="maintain.status"></td>
									</tr>		
									<!-- <tr>
										<td style="font-size:15px; padding:10px"><label
											for="lastname" class="col-sm-12 control-label">负&nbsp;&nbsp;&nbsp;&nbsp;责&nbsp;&nbsp;&nbsp;&nbsp;人</label></td>
										<td><input type="text" class="form-control"
											id="chargeName" name="maintain.respmem"></td>
										<td style="font-size:15px; padding:10px"><label
											for="lastname" class="col-sm-12 control-label">负责人电话</label></td>
										<td><input type="text" class="form-control" id="Mobile" name="maintain.respmemtel"></td>
									</tr> -->
									
									<!--  tr>
										
										<td style="font-size:15px; padding:10px"><label
											for="lastname" class="col-sm-12 control-label">所&nbsp;在&nbsp;区&nbsp;域&nbsp;</label></td>

										<td><select class="form-control" id="select1" type="select" name="">
												<option value="">--请选择--</option>
												<option value="岳麓区">岳麓区</option>
												<option value="天心区">天心区</option>
												<option value="开福区">开福区</option>
												<option value="雨花区">雨花区</option>
												<option value="望城区">望城区</option>
												<option value="芙蓉区">芙蓉区</option>
										</select></td>
									</tr>-->
									
									<tr>
										<td style="font-size:15px; padding:10px"><label
											for="lastname" class="col-sm-12 control-label">损&nbsp;坏&nbsp;时&nbsp;间&nbsp;</label></td>
										<td><input type="text" class="form-control" id="lastname" name="maintain.recordtime"
											placeholder="YY-MM-DD" onclick="WdatePicker()"></td>
										<td style="font-size:15px; padding:10px"><label
											for="lastname" class="col-sm-12 control-label">维&nbsp;修&nbsp;时&nbsp;间&nbsp;</label></td>
										<td><input type="text" class="form-control" id="lastname" name="maintain.maintaintime"
											placeholder="YY-MM-DD" onclick="WdatePicker()"></td>
									</tr>

									<tr>
										<td style="font-size:15px; padding:10px"><label
											for="lastname" class="col-sm-12 control-label">维&nbsp;&nbsp;&nbsp;&nbsp;修&nbsp;&nbsp;&nbsp;&nbsp;人</label></td>
										<td><input type="text" class="form-control" id="lastname" name="maintain.maintainpeople"></td>
										<td style="font-size:15px; padding:10px"><label
											for="lastname" class="col-sm-12 control-label">维修人电话</label></td>
										<td><input type="text" class="form-control" id="Mobile" name="maintain.maintainmemtel"></td>
									</tr>

									<tr>
										
										<td style="font-size:15px; padding:10px"><label
											for="lastname" class="col-sm-12 control-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</label></td>
										<td><input type="text" class="form-control" id="lastname" name="maintain.remark"></td>
										<td style="font-size:15px; padding:10px"><label
											for="lastname" class="col-sm-12 control-label">维&nbsp;修&nbsp;原&nbsp;因&nbsp;</label></td>
										<td><textarea type="text" class="form-control" id="lastname" name="maintain.cause"></textarea></td>
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
							<button type="button" class="close" data-dismiss="modal"
								aria-label="close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h3 style="text-align:center" class="modal-title"
								id="addModalLabel">
								<b>修改监控点信息</b>
							</h3>
						</div>
						
						<div class="modal-body">
							<form id="formEdit" method="post" action="">
								<table width="95%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td style="font-size:15px; padding:10px"><label
											for="firstname" class="col-sm-12 control-label">监控点编号</label></td>
										<td><input type="text" readonly="readonly"
											sylte="width:50%;" class="form-control" id="entityId1" name="maintain.entityid"></td>
										<td style="font-size:15px; padding:10px"><label
											for="lastname" class="col-sm-12 control-label">监控点类型</label></td>
										<td><input type="text" readonly="readonly"
											sylte="width:50%;" class="form-control" id="entityType1" name="maintain.entitytype"></td>
									</tr>
									<tr>
										<td style="font-size:15px; padding:10px"><label
											for="lastname" class="col-sm-12 control-label">负&nbsp;&nbsp;&nbsp;&nbsp;责&nbsp;&nbsp;&nbsp;&nbsp;人</label></td>
										<td><input type="text" readonly="readonly"
											class="form-control" id="resPonseP1" name="maintain.respmem"></td>
										<td style="font-size:15px; padding:10px"><label
											for="lastname" class="col-sm-12 control-label">负责人电话</label></td>
										<td><input type="text" readonly="readonly" id="resPonseT1" name="maintain.respmemtel"
											class="form-control" id="lastname"></td>
									</tr>




									<tr>
										<td style="font-size:15px; padding:10px"><label
											for="lastname" class="col-sm-12 control-label">损&nbsp;坏&nbsp;时&nbsp;间&nbsp;</label></td>
										<td><input type="text" readonly="readonly" id="recordTime1" name="maintain.recordtime"
											class="form-control" id="lastname"></td>
										<td style="font-size:15px; padding:10px"><label
											for="lastname" class="col-sm-12 control-label">维&nbsp;修&nbsp;时&nbsp;间&nbsp;</label></td>
										<td><input type="text" class="form-control" id="maintainTime" name="maintain.maintaintime"
											onclick="WdatePicker()"></td>
									</tr>

									<tr>
										<td style="font-size:15px; padding:10px"><label
											for="lastname" class="col-sm-12 control-label">维&nbsp;&nbsp;&nbsp;&nbsp;修&nbsp;&nbsp;&nbsp;&nbsp;人</label></td>
										<td><input type="text" class="form-control" id="mainMem1" name="maintain.maintainpeople"></td>
										<td style="font-size:15px; padding:10px"><label
											for="lastname" class="col-sm-12 control-label">维修人电话</label></td>
										<td><input type="text" class="form-control" id="mainTel" name="maintain.maintainmemtel"></td>
									</tr>

									<tr>
										<td style="font-size:15px; padding:10px"><label
											for="lastname" class="col-sm-12 control-label">所&nbsp;在&nbsp;地&nbsp;址&nbsp;</label></td>
										<td><input type="text" readonly="readonly" class="form-control" id="entityAddress"></td>
										<td style="font-size:15px; padding:10px"><label
											for="lastname" class="col-sm-12 control-label">维&nbsp;修&nbsp;原&nbsp;因&nbsp;</label></td>
										<td><textarea type="text" class="form-control" name="maintain.cause" id="maintaincause"></textarea></td>

									</tr>
									<tr>
										<td style="font-size:15px; padding:10px"><label
											for="status" class="col-sm-12 control-label">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态</label></td>
										<td><input type="text" class="form-control"
											id="status" name="maintain.status"></td>
										<td style="font-size:15px; padding:10px"><label
											for="lastname" class="col-sm-12 control-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</label></td>
										<td><input type="text" class="form-control" id="editRemark" name="maintain.remark"></td>
									</tr>
								</table>
							</form>
						</div>
						
						<div style="margin:5px" class="modal-footer">
							<table align="center">
								<tr>
									<td>
										<button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">取消</button>
										<button type="button" class="btn btn-primary btn-sm" onclick="editform()">重置</button>
										<button type="submit" id="editsubmit" class="btn btn-primary btn-sm">保存</button>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>


			<table id="tableList" class="table table-striped" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
				<th><b>序号</b></th>
				<th><b>编号</b></th>
				<th><b>类型</b></th>
				<th><b>状态</b></th>
				<th><b>损坏时间</b></th>
				<th><b>详细地址</b></th>
				<th><b>负责人</b></th>
				<th><b>负责人电话</b></th>
				<th><b>维修人</b></th>
				<th><b>维修人电话</b></th>
				<th><b>维修时间</b></th>
				<th><b>损坏原因</b></th>
				<th><b>备注</b></th>
				<th><b>操&nbsp;&nbsp;作</b></th>
				</tr>

				<s:iterator id="ml" value="maintainList" status="st">
					<tr>
						<td><s:property value="#st.index+1" /></td>

						<td><s:property value="#ml.entityid" /></td>

						<td><s:property value="#ml.entity.entityType" /></td>

						<td><s:property value="#ml.status" /></td>

						<td><s:property value="#ml.recordtime" /></td>

						<td><s:property value="#ml.entity.detailAddress" /></td>

						<td><s:property value="#ml.user.userName" /></td>
						
						<td><s:property value="#ml.user.tel" /></td>

						<td><s:property value="#ml.maintainpeople" /></td>

						<td><s:property value="#ml.maintainmemtel" /></td>

						<td><s:property value="#ml.maintaintime" /></td>
                        <td><s:property value="#ml.cause" /></td>
						<td><s:property value="#ml.remark" /></td>
						<td style="cursor:pointer;">
						<a data-toggle="modal" data-target="#editModal" style="font-size: 12px;color:337ab7" href="javascript:void(0)" onclick="javascript:changeNode(<s:property value="#st.index+1"/>);"><span
									class="glyphicon glyphicon-pencil"></span>&nbsp;编辑</a>
						<!--  </br>
							<a  style="font-size: 12px;color:337ab7" href="javascript:void(0);" onclick="javascript:changeNode(<s:property value="#st.index+1"/>);" data-toggle="modal" data-target="#deleteModal" ><span
									class="glyphicon glyphicon-trash"></span>&nbsp;删除</a>-->
						</td>
					</tr>
				</s:iterator>
			</table>

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
