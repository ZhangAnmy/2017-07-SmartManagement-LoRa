<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld "%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title></title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="res/bootstrap.min.css" type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="res/jquery-3.2.1.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<style>
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
	font-size: 15px;
}

input.text {
	text-align: center;
	padding: 10px;
}

.div-page {
	margin-top: 10px;
}
</style>

<script type="text/javascript">
$(function(){
var str=location.href; //取得整个地址栏
var num=str.indexOf("&")+1;
if(num!=0) 
{
	num=str.indexOf("?")+1;
	str = str.substr(num);
	var arr=str.split("&");
	var n = [];
	for(var i=0;i<4;i++)
	{
		n[i]=arr[i].indexOf("=")+1;
		arr[i]=arr[i].substr(n[i]);
		if(arr[i]!="")
			switch(i){
			case 0:$("#queryId").val(arr[i]); break;
			case 1:$("#queryArea").val(decodeURI(arr[i])); break;
			case 2:$("#queryType").val(decodeURI(arr[i])); break;
			case 3:$("#queryStatus").val(decodeURI(arr[i])); break;
		}
	}
}

 
var ok = new Array();
var ok1 = new Array();
for(var i=0;i<8;i++)
	ok[i]=0;

    $("form :input.required").each(function(){ 
        var $required = $("<strong class='high'>*</strong>"); //创建元素
        //$(this).parent().append($required);  //追加到文档中 
        $(this).parent().prepend($required); 
    }); 
    //文本框失去焦点后
    $('form :input').blur(function(){ 
        var $parent = $(this).parent(); 
        if($(this).is('#entityId')){ 
        	//验证监控点编号
        	if (this.value == "") {		
			  $("#tish1").html("不能为空");
		      $("#tish1").css("color","red");
		      ok[0]=0;
			}
           else if (!$("#entityId").val().match(/^[0-9]+$/)){ 
              	 $("#tish1").html("只能为数字");
		         $("#tish1").css("color","red");
		         ok[0]=0;
            }
           else{
        	   ok[0]=1;
        	   $("#tish1").html("");
           }
        }
          if($(this).is('#selectAddType')){ 
        	if (this.value == "") {		
			  $("#tish2").html("类型不能为空");
		         $("#tish2").css("color","red");
		         ok[1]=0;
			}
           else{
        	   ok[1]=1;
        	   $("#tish2").html("");
           }
        }
        if($(this).is('#selectAddLongitude')){ 
        	if (this.value == "") {		
			  $("#tish3").html("经度不能为空");
		         $("#tish3").css("color","red");
		         ok[2]=0;
			}
			else if (!$("#selectAddLongitude").val().match(/^\d+(\.\d+)?$/)){ 
              	 $("#tish3").html("只能为数字");
		         $("#tish3").css("color","red");
		         ok[2]=0;
            }
           else{
           	   ok[2]=1;
        	   $("#tish3").html("");
           }
        }
        if($(this).is('#selectAddLatitude')){ 
        	//验证类型
        	if (this.value == "") {		
			  $("#tish4").html("纬度不能为空");
		         $("#tish4").css("color","red");
		         ok[3]=0;
			}
			else if (!$('#selectAddLatitude').val().match(/^\d+(\.\d+)?$/)){ 
              	 $("#tish4").html("只能为数字");
		         $("#tish4").css("color","red");
		         ok[3]=0;
            }
           else{
          		ok[3]=1;
        	   $("#tish4").html("");
           }
        }
        if($(this).is('#selectAddUser')){ 
        	//验证类型
        	if (this.value == "") {		
			  $("#tish5").html("不能为空");
		         $("#tish5").css("color","red");
		         ok[4]=0;
			}
           else{
        	   ok[4]=1;
        	   $("#tish5").html("");
           }
        }
        if($(this).is('#selectAddArea')){ 
       
        	if (this.value == "") {		
			  $("#tish6").html("不能为空");
		         $("#tish6").css("color","red");
		         ok[5]=0;
			}
           else{
           	  ok[5]=1;
        	   $("#tish6").html("");
           }
        }
        if($(this).is('#selectAddStreet')){ 
    
        	if (this.value == "") {		
			  $("#tish7").html("不能为空");
		         $("#tish7").css("color","red");
		         ok[6]=0;
			}
           else{
           	   ok[6]=1;
        	   $("#tish7").html("");
           }
        }
        if($(this).is('#selectAddAddress')){ 
    
        	if (this.value == "") {		
			  $("#tish8").html("不能为空");
		         $("#tish8").css("color","red");
		         ok[7]=0;
			}
           else{
           	   ok[7]=1;
        	   $("#tish8").html("");
           }
        }
        
        if($(this).is('#editLongitude')){ 
        	if (this.value == "") {		
			  $("#edit1").html("经度不能为空");
		         $("#edit1").css("color","red");
		         ok1[0]=0;
			}
			else if (!$("#editLongitude").val().match(/^\d+(\.\d+)?$/)){ 
              	 $("#edit1").html("只能为数字");
		         $("#edit1").css("color","red");
		         ok1[0]=0;
            }
           else{
           	   ok1[0]=1;
        	   $("#edit1").html("");
           }
        }
        if($(this).is('#editLatitude')){ 
        	//验证类型
        	if (this.value == "") {		
			  $("#edit2").html("纬度不能为空");
		         $("#edit2").css("color","red");
		         ok1[1]=0;
			}
			else if (!$('#editLatitude').val().match(/^\d+(\.\d+)?$/)){ 
              	 $("#edit2").html("只能为数字");
		         $("#edit2").css("color","red");
		         ok1[1]=0;
            }
           else{
          		ok1[1]=1;
        	   $("#edit2").html("");
           }
        }
        if($(this).is('#editUser')){ 
        	//验证类型
        	if (this.value == "") {		
			  $("#edit3").html("不能为空");
		         $("#edit3").css("color","red");
		         ok1[2]=0;
			}
           else{
        	   ok1[2]=1;
        	   $("#edit3").html("");
           }
        }
        if($(this).is('#editArea')){ 
       
        	if (this.value == "") {		
			  $("#edit4").html("不能为空");
		         $("#edit4").css("color","red");
		         ok1[3]=0;
			}
           else{
           	  ok1[3]=1;
        	   $("#edit4").html("");
           }
        }
        if($(this).is('#editStreetAddress')){ 
    
        	if (this.value == "") {		
			  $("#edit5").html("不能为空");
		         $("#edit5").css("color","red");
		         ok1[4]=0;
			}
           else{
           	   ok1[4]=1;
        	   $("#edit5").html("");
           }
        }
        if($(this).is('#editDetailAddress')){ 
    
        	if (this.value == "") {		
			  $("#edit6").html("不能为空");
		         $("#edit6").css("color","red");
		         ok1[5]=0;
			}
           else{
           	   ok1[5]=1;
        	   $("#edit6").html("");
           }
        }  
    });  
	
	$('#addsubmit1').click(function(){
		subform();
	});
		
		//新增
	$('#addsubmit').click(function(){	
		for(var i=0;i<8;i++){
		    //alert(ok[i]);
	 		if(ok[i] == 0) break;}
	 	//if(i==8){
      	var id=document.getElementById("entityId").value;
      	var params = $("#formAdd").serialize();
      	$.ajax({  
             type : "POST",  
             url : "entityQueryAll",  
             data :"entity.entityId="+id, 
             success : function(data) {
             	var jsondata = eval("(" + data+ ")");
             	if(jsondata==""){
				$.ajax({  
            		type : "POST",  
             		url : "entityAdd",  
             		data :params,  
             		success : function(data) {
             			window.location.href="entityQuery?paging.currentPage=1"; 
             		}  
         		});
        		alert("增加成功。");
             }
             else 
             alert("编号已存在，请重新输入。");
             } 
         });		
        //}
        //else 
        //alert("请检查输入。");
   });
   
      $('#editsubmit').click(function(){
      	for(var i=0;i<6;i++){
		    //alert(ok1[i]);
	 		if(ok1[i] == 0) break;}
	 	if(i==6){
        var entityId=document.getElementById("editEntityId").value;
   	 	var params = $("#formEdit").serialize(); 
   	 	params = params + "&entity.entityId=" + entityId;
         $.ajax( {  
             type : "POST",  
             url : "entityEdit",  
             data :params,  
             success : function(data) {  
            	 window.location.href="entityQuery?paging.currentPage=1";
             }  
         });
         alert("保存成功。");
         }
         else
         alert("请检查格式。");  
   });
	});

	//重置
	function subform() {
		$("input").val('');
		$("textarea").val('');
		$("select").val("");
		$("span").html("");
	}
	//编辑重置
	function subformEdit(){ 
		$('#editLongitude').val('');
		$('#editLatitude').val('');
		$('#editUser').val("");
		$('#editArea').val('');
		$('#editStreetAddress').val('');
		$('#editDetailAddress').val('');
		$('#editRemark').val('');
		$("span").html("");
	}
	//跳转页面
	function gotopage(page){
	window.location.href="entityQuery?paging.currentPage="+page;
	}
	
	//删除
	function deleteEntity(id){
	var entityId = document.getElementById("tableList").rows[id].cells[1].innerText;
	//alert(entityId);
	$('#deleteID1').val(entityId); 
	}
	
	function deleteEntityAfirm(){
	
	var params = $("#formDelete").serialize(); 
	$.ajax({  
		type : "POST",  
		url : "entityDelete",  
		data :params,  
		success : function(data) {
		window.location.href="entityQuery?paging.currentPage=1";
	}  
	}); 
}

	function editEntity(id){
			var type;
		$.ajax({  
			type : "POST",  
			url : "entityQueryAll",  
			data : {"entity.entityId" : id}, 
			async : false,  
			success : function(data) {
				var jsondata = eval("(" + data+ ")");
				type=jsondata[0].entityType;
				document.getElementById("editEntityId").value=jsondata[0].entityId;
				document.getElementById("editEntityType").value=jsondata[0].entityType;
				document.getElementById("editLongitude").value=jsondata[0].longitude;
				document.getElementById("editLatitude").value=jsondata[0].latitude;
				document.getElementById("editUser").value=jsondata[0].user.userName;
				document.getElementById("editArea").value=jsondata[0].area;
				document.getElementById("editStreetAddress").value=jsondata[0].streetAddress;
				document.getElementById("editDetailAddress").value=jsondata[0].detailAddress;
				document.getElementById("editRemark").value=jsondata[0].remark;
		}  
		}); 
        var user=document.getElementById("editUser");
        $.ajax({  
			type : "POST",  
			url : "userQueryEntity",  
			data : {"user.dep.departmentName" : type}, 
			success : function(data) {
				var jsondata = eval("(" + data+ ")");
				for(var i=0; i<jsondata.length;i++){
					var userOption = document.createElement('option');
					userOption.text = jsondata[i].userName;
					userOption.value = jsondata[i].userId;
					user.add(userOption);
				}
				}
		});  
		
		}
		
	 function typeChange(){
        var type=document.getElementById("selectAddType").value;
        var user=document.getElementById("selectAddUser");

        $.ajax({  
			type : "POST",  
			url : "userQueryEntity",  
			data : {"user.dep.departmentName" : type}, 
			success : function(data) {
				var jsondata = eval("(" + data+ ")");
				$("#selectAddUser option[value !='']").remove();
				for(var i=0; i<jsondata.length;i++){
					var userOption = document.createElement('option');
					userOption.text = jsondata[i].userName;
					userOption.value = jsondata[i].userId;
					user.add(userOption);
				}
				}
		});  
       }
   
	function formSubmit() { 
		var params = $("#formSearch").serialize(); 	
		//alert(params); 
		window.location.href="entityQuery?"+params;
		}	
</script>

<body bgcolor="#f1f1f1">
	<div id="div2" class="div-2">
		<div>
			<h2 style="text-align:center">
				<b>监控点列表</b>
			</h2>
		</div>

		<div>
			<div id="div3" class="div-3">
				<form id="formSearch" method="post" action="">
					<table id="tableSearch" width="90%" height="2%;" border="0"
						cellspacing="0" cellpadding="0" align="right">
						<tr height="2%;">
							<td align="right" style="font-size:15px;"><label
								for="firstname">监控点编号:</label></td>
							<td width="15%;"><input type="text" class="form-control"
								id="queryId" name="entity.entityId"></td>
							<td align="right" style="font-size:15px;"><label
								for="lastname">监控区域:</label></td>
							<td width="10%;" height="10%;"><select id="queryArea" class="form-control"
								name="entity.area">
									<option value="">-区域-</option>
									<option value="岳麓">岳麓</option>
									<option value="天心">天心</option>
									<option value="开福">开福</option>
									<option value="雨花">雨花</option>
									<option value="望城">望城</option>
									<option value="芙蓉">芙蓉</option>
							</select>
							</td>
							<td align="right" style="font-size:15px;"><label
								for="lastname">监控点类型:</label></td>
							<td width="10%;" height="10%;"><select id="queryType" class="form-control"
								name="entity.entityType">
									<option value="">-类型-</option>
									<option value="古树">古树</option>
									<option value="井盖">井盖</option>
									<option value="下水道">下水道</option>
									<option value="垃圾桶">垃圾桶</option>
							</select></td>
							<td align="right" style="font-size:15px;"><label
								for="lastname">监控点状态:</label></td>
							<td width="10%;" height="10%;"><select id="queryStatus" class="form-control"
								name="entity.entityStatus">
									<option value="">-状态-</option>
									<option value="正常">正常</option>
									<option value="预警">预警</option>
									<option value="告警">告警</option>
							</select></td>
							<td>
								<button type="button" class="btn btn-primary btn-sm" id="search"
									onclick="formSubmit()">查询</button>
							</td>
							<td>
								<button type="button" class="btn btn-primary btn-sm"
									id="addsubmit1" data-toggle="modal" data-target="#addModal">新增</button>
							</td>
						</tr>
					</table>
				</form>
			</div>


			<!-- 新增信息 -->
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
								<b>新增监控点信息</b>
							</h3>
						</div>
						<div class="modal-body" style="margin:20px">
							<form id="formAdd" method="post" action="">
								<table id="tableAdd" width="95%" border="0" cellspacing="0"
									cellpadding="0">
									<tr>
										<td style="font-size:15px; padding:10px"><label
											for="firstname" class="col-sm-12 control-label">监控点编号</label>
										</td>
										<td><input type="text" class="form-control" id="entityId"
											placeholder="只能为数字" name="entity.entityId">
										</td>
										<td style="font-size:15px; padding:5px"><label
											for="lastname" class="col-sm-12 control-label">监控点类型</label>
										</td>
										<td><select id="selectAddType" class="form-control"
											name="entity.entityType" onchange="typeChange()">
												<option value="">--请选择--</option>
												<option value="下水道">下水道</option>
												<option value="井盖">井盖</option>
												<option value="垃圾桶">垃圾桶</option>
												<option value="古树">古树</option>
										</select></td>
										</tr>
										<tr height="5%">
										<td></td>
										<td><span class="formtips onError" id="tish1"
											style="color:red;font-size:10px" class="formtips"></span>
										</td>
										<td></td>
										<td><span class="formtips onError" id="tish2"
											style="color:red;font-size:10px" class="formtips"></span>
										</td>
										</tr>
									<tr>
										<td style="font-size:15px; padding:5px"><label
											class="col-sm-12 control-label">经&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;度</label>
										</td>
										<td><input type="text" class="form-control" id="selectAddLongitude"
											name="entity.longitude"></td>
										<td style="font-size:15px; padding:5px"><label
											for="lastname" class="col-sm-12 control-label">纬&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;度</label>
										</td>
										<td><input type="text" class="form-control" id="selectAddLatitude"
											name="entity.latitude"></td>
									</tr>
									<tr height="5%">
										<td></td>
										<td><span class="formtips onError" id="tish3"
											style="color:red;font-size:10px" class="formtips"></span>
										</td>
										<td></td>
										<td><span class="formtips onError" id="tish4"
											style="color:red;font-size:10px" class="formtips"></span>
										</td>
										</tr>
									<tr>
										<td style="font-size:15px; padding:5px"><label
											for="lastname" class="col-sm-12 control-label">负&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;责&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;人</label>
										</td>
										<td><select id="selectAddUser" class="form-control"
											name="entity.userId">
												<option value="">--请选择--</option>
										</select></td>
										<!-- td><input type="text" class="form-control" id="sleectAddUser"
											name="entity.user"></td>-->
										<td style="font-size:15px; padding:5px"><label
											for="lastname" class="col-sm-12 control-label">区&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;域</label>
										</td>
										<td><select id="selectAddArea" class="form-control" name="entity.area">
												<option value="">--请选择--</option>
												<option value="岳麓">岳麓</option>
												<option value="天心">天心</option>
												<option value="开福">开福</option>
												<option value="雨花">雨花</option>
												<option value="望城">望城</option>
												<option value="芙蓉">芙蓉</option>
										</select></td>
									</tr>
									<tr height="5%">
										<td></td>
										<td><span class="formtips onError" id="tish5"
											style="color:red;font-size:10px" class="formtips"></span>
										</td>
										<td></td>
										<td><span class="formtips onError" id="tish6"
											style="color:red;font-size:10px" class="formtips"></span>
										</td>
									</tr>
									<tr>
										<td style="font-size:15px; padding:5px"><label
											for="lastname" class="col-sm-12 control-label">街&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;道</label>
										</td>
										<td><input id="selectAddStreet" type="text" class="form-control" id="address"
											name="entity.streetAddress"></td>
										<td style="font-size:15px; padding:10px"><label
											for="lastname" class="col-sm-12 control-label">详&nbsp;细&nbsp;地&nbsp;址&nbsp;</label>
										</td>
										<td><input id="selectAddAddress" type="text" class="form-control" id="address"
											name="entity.detailAddress">
										</td>
									</tr>
									<tr height="5%">
										<td></td>
										<td><span class="formtips onError" id="tish7"
											style="color:red;font-size:10px" class="formtips"></span>
										</td>
										<td></td>
										<td><span class="formtips onError" id="tish8"
											style="color:red;font-size:10px" class="formtips"></span>
										</td>
									</tr>
									<tr>
										<td style="font-size:15px; padding:10px"><label
											for="lastname" class="col-sm-12 control-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</label>
										</td>
										<td><input type="text" class="form-control" id="lastname"
											name="entity.remark">
										</td>
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
										<button type="button" id="res" onclick="subform()"
											class="btn btn-primary btn-sm">重置</button>
										<button type="button" id="addsubmit"
											class="btn btn-primary btn-sm">保存</button>
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
						<div class="modal-body" style="margin:10px">
							<form id="formEdit" method="post" action="">
								<table width="95%" border="0" cellspacing="0" cellpadding="0"
									id="tableEdit">
									<tr>
										<td style="font-size:15px; padding:5px"><label
											for="firstname" class="col-sm-12 control-label">监控点编号</label>
										</td>
										<td><input type="text" readonly="readonly"
											sylte="width:50%;" class="form-control" id="editEntityId">
										</td>
										<td style="font-size:15px; padding:5px"><label
											for="lastname" class="col-sm-12 control-label">监控点类型</label>
										</td>
										<td><input type="text" readonly="readonly"
											sylte="width:50%;" class="form-control" id="editEntityType"
											name="entity.entityType"></td>
									</tr>
									<tr>
										<td style="font-size:15px; padding:5px"><label
											class="col-sm-12 control-label">经&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;度</label>
										</td>
										<td><input type="text" class="form-control"
											id="editLongitude" name="entity.longitude"></td>
										<td style="font-size:15px; padding:5px"><label
											for="lastname" class="col-sm-12 control-label">纬&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;度</label>
										</td>
										<td><input type="text" class="form-control"
											id="editLatitude" name="entity.latitude"></td>
									</tr>
									<tr height="5%">
										<td></td>
										<td><span class="formtips onError" id="edit1"
											style="color:red;font-size:10px" class="formtips"></span>
										</td>
										<td></td>
										<td><span class="formtips onError" id="edit2"
											style="color:red;font-size:10px" class="formtips"></span>
										</td>
										</tr>
									<tr>
										<td style="font-size:15px; padding:5px"><label
											for="lastname" class="col-sm-12 control-label">负&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;责&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;人</label>
										</td>
										<td><select id="editUser" class="form-control"
											name="entity.userId">
										</select></td>
										<td style="font-size:15px; padding:5px"><label
											for="lastname" class="col-sm-12 control-label">区&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;域</label>
										</td>
										<td><select id="editArea" class="form-control" name="entity.area">
												<option value="">--请选择--</option>
												<option value="岳麓">岳麓</option>
												<option value="天心">天心</option>
												<option value="开福">开福</option>
												<option value="雨花">雨花</option>
												<option value="望城">望城</option>
												<option value="芙蓉">芙蓉</option>
										</select></td>
									</tr>
									<tr height="5%">
										<td></td>
										<td><span class="formtips onError" id="edit3"
											style="color:red;font-size:10px" class="formtips"></span>
										</td>
										<td></td>
										<td><span class="formtips onError" id="edit4"
											style="color:red;font-size:10px" class="formtips"></span>
										</td>
										</tr>
									<tr>
										<td style="font-size:15px; padding:5px"><label
											for="lastname" class="col-sm-12 control-label">街&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;道</label>
										</td>
										<td><input type="text" class="form-control"
											id="editStreetAddress" name="entity.streetAddress"></td>
										<td style="font-size:15px; padding:10px"><label
											for="lastname" class="col-sm-12 control-label">详&nbsp;细&nbsp;地&nbsp;址&nbsp;</label>
										</td>
										<td><input type="text" class="form-control"
											id="editDetailAddress" name="entity.detailAddress">
										</td>
									</tr>
									<tr height="5%">
										<td></td>
										<td><span class="formtips onError" id="edit5"
											style="color:red;font-size:10px" class="formtips"></span>
										</td>
										<td></td>
										<td><span class="formtips onError" id="edit6"
											style="color:red;font-size:10px" class="formtips"></span>
										</td>
										</tr>
									<tr>
										<td style="font-size:15px; padding:10px"><label
											for="lastname" class="col-sm-12 control-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</label>
										</td>
										<td><input type="text" class="form-control"
											id="editRemark" name="entity.remark">
										</td>
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
										<button type="button" id="res" onclick="subformEdit()"
											class="btn btn-primary btn-sm">重置</button>
										<button id="editsubmit" type="button"
											class="btn btn-primary btn-sm">保存</button>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- 删除信息 -->
			<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-body">
							<form id="formDelete" method="post" action="">
								<a>你确认要删除</a> <input type="text" id="deleteID1" style="width: 55px; border-style:none; text-align:center;"
									name="entity.entityId" /> <a>么？</a>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="deleteid"
								onclick="deleteEntityAfirm()">确认</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
						</div>
					</div>
				</div>
			</div>
			<table id="tableList" class="table table-striped" border="0"
				cellspacing="0" cellpadding="0">
				<tr bgcolor="#F0F0F0">
					<th><b>序号</b></th>
					<th><b>编号</b></th>
					<th><b>监控类型</b></th>
					<th><b>状态</b></th>
					<th><b>事件类型</b></th>
					<th><b>所在区域</b></th>
					<th><b>详细地址</b></th>
					<th><b>负责人</b></th>
					<th><b>负责人电话</b></th>
					<th><b>备注</b></th>
					<th><b>查看</b></th>
					<th><b>操作</b></th>
				</tr>

				<s:iterator id="ent" value="entityList" status="st">
					<tr>
						<td><s:property value="#st.index+1" /></td>

						<td id="entityid"><s:property value="#ent.entityId" /></td>

						<td><s:property value="#ent.entityType" /></td>

						<td><s:property value="#ent.entityStatus" /></td>

						<td><s:property value="#ent.statusType" /></td>

						<td><s:property value="#ent.area" /></td>

						<td><s:property value="#ent.detailAddress" /></td>

						<td><s:property value="#ent.user.userName" /></td>

						<td><s:property value="#ent.user.tel" /></td>

						<td><s:property value="#ent.remark" /></td>
						<td><a
							href="entityTreeQueryById?entityId=<s:property value="#ent.entityId" />"><span
								class="glyphicon glyphicon-new-window"></span>&nbsp;详情</a></td>
						<td><a data-toggle="modal" data-target="#editModal"
							href="javascript:void(0)"
							onclick="javascript:editEntity(<s:property value="#ent.entityId"/>);"><span
								class="glyphicon glyphicon-pencil"></span>&nbsp;编辑</a> <a
							href="javascript:void(0)"
							onclick="javascript:deleteEntity(<s:property value="#st.index+1"/>);"
							data-toggle="modal" data-target="#deleteModal"><span
								class="glyphicon glyphicon-trash"></span>&nbsp;删除</a></td>
					</tr>
				</s:iterator>

			</table>
		</div>
		<!-- 翻页 -->
		<div align="right">
			<ul class="pagination">
				<s:if test="paging.currentPage<=1">
					<li class="previous disabled"><a href="javascript:void(0);">首页</a>
					</li>
				</s:if>
				<s:else>
					<li><a href="javascript:void(0);"
						onclick="javascript:gotopage(1);">首页</a></li>
				</s:else>
				<s:if test="paging.currentPage<=1">
					<li class="disabled"><a href="javascript:void(0);">上一页</a>
				</s:if>
				<s:else>
					<li><a href="javascript:void(0);"
						onclick="javascript:gotopage(${paging.currentPage-1});">上一页</a></li>
				</s:else>



				<s:if test="paging.totalPage<5">
					<!--<span>-->
					<s:bean name="org.apache.struts2.util.Counter" id="counter">
						<s:param name="first" value="1" />
						<s:param name="last" value="paging.totalPage" />
						<s:iterator>

							<s:if test="current==paging.currentPage+1">

								<li class="active"><a href="javascript:void(0);"><s:property />
								</a>
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

									<li class="active"><a href="javascript:void(0);"><s:property />
									</a>
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

										<li class="active"><a href="javascript:void(0);"><s:property />
										</a>
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
						<li class="disabled"><a href="javascript:void(0);">尾页</a></li>
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
