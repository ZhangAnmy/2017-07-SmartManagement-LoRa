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
		<link href="res/mistake.css" type="text/css" rel="stylesheet">
		<link href="res/bootstrap.min.css" type="text/css" rel="stylesheet">
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css.css">
		<script src="res/jquery-3.2.1.min.js"></script>
		<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
}

input.text {
	text-align: center;
	padding: 10px;
}
</style>

<script type="text/javascript">
//文本框失去焦点后
$(function(){ 
    $("form :input.required").each(function(){ 
        var $required = $("<strong class='high'>*</strong>"); //创建元素
        //$(this).parent().append($required);  //追加到文档中 
        $(this).parent().prepend($required); 
    }); 
    //文本框失去焦点后
    $('form :input').blur(function(){ 
        var $parent = $(this).parent(); 
        if($(this).is('#username')){ 
        	//验证用户名
            if (!$("#username").val().match(/^[0-9a-zA-Z\u4e00-\u9fa5_]{3,16}$/)){ 
              var errorMsg = '仅由3-16位中文、英文、数字及“_”、“-”组成'; 
              $parent.append('<td><span class="formtips onError" style="color:red;font-size:10px">'+errorMsg+'</span></td>'); 
           }
        } 
        if($(this).is('#DptID')){ 
        	//验证用户名
            if (!$("#DptID").val().match(/^[A-Za-z0-9]+$/)){ 
              var errorMsg = '只能输入数字或者字母'; 
              $parent.append('<td><span class="formtips onError" style="color:red;font-size:10px">'+errorMsg+'</span></td>'); 
           }
        } 
        
        if($(this).is('#realname')){
        	var myReg = /^[\u4e00-\u9fa5]+$/;
        	var myReg1=/^[a-zA-Z]+$/;
        	 if (!(myReg.test($("input[id=realname]").val()))&&(!(myReg1.test($("input[id=realname]").val())))) {
        		 var errorMsg = '请输入正确的姓名'; 
                 $parent.append('<td class="formtips onError" style="color:red;font-size:10px">'+errorMsg+'</td>'); 
        	 }
          //  if(this.value==""||(!(this.value.match(/^[\u4e00-\u9fa5]+$/)))||(!(/^[A-Za-z_-]+$/.test(username.value)))){ 
           //     var errorMsg = '请输入正确的姓名'; 
           //     $parent.append('<td class="formtips onError" style="color:red;font-size:10px">'+errorMsg+'</td>'); 
           // }
        } 
        if($(this).is('#mobile')){
        	 if (!$("#mobile").val().match(/^(((13[0-9]{1})|159|153)+\d{8})$/))  {
        		 var errorMsg = '请输入正确的电话格式'; 
                 $parent.append('<td class="formtips onError" style="color:red;font-size:10px">'+errorMsg+'</td>'); 
        	 }
        } 
        if($(this).is('#email')){
       	 if(!$("#email").val().match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/))   {
       		 var errorMsg = '请输入正确的邮箱格式'; 
                $parent.append('<td class="formtips onError" style="color:red;font-size:10px">'+errorMsg+'</td>'); 
       	 }
       } 
        if($(this).is('#unempty')){ 
        	//验证用户名
           if(this.value==""){ 
              var errorMsg = '此项不能为空'; 
              $parent.append('<td><span class="formtips onError" style="color:red;font-size:10px">'+errorMsg+'</span></td>'); 
           }
        } 
    }); 
    $("form :input").focus(function(){ 
        var $parent = $(this).parent(); 
        $parent.find(".formtips").remove(); 
    }); 
    //最终提交验证
    $("#send").click(function(){ 
       var $parent = $(this).parent().parent(); 
       
       $parent.find(".formtips").remove(); 
       $("form .required:input").trigger('blur'); 
       var numError = $('form .onError').length; 
       if(numError){ 
          return false; 
       }
          alert("增加用户成功");
       
    }); 
    
    $('#addsubmit').click(function(){
   	 	var params = $("#formAdd").serialize(); 

         $.ajax( {  
        
             type : "POST",  
             url : "sensorNodeAdd",  
             data :params,  
             success : function() {  
            	 alert("增加节点成功");
                 window.location.href="sensorNodeQueryAll"; 
             }  
         });  
   });
    
    $('#editsubmit').click(function(){
   	 	var params = $("#formEdit").serialize(); 
   	 	alert(params);
         $.ajax( {  
        
             type : "POST",  
             url : "sensorNodeEdit",  
             data :params,  
             success : function() {  
            	 alert("成功");
             }  
         });  
   });
    
    
    $('#deletesubmit').click(function(){
   	 	var params = $("#formEdit").serialize(); 
   	 	alert(params);
         $.ajax( {  
        
             type : "POST",  
             url : "sensorNodeDelete",  
             data :params,  
             success : function() {  
            	 alert("成功");
             }  
         });  
   });
   
});
//重置
function subform(){
    $("input").val(''); 
    $("textarea").val(''); 
    }
	
</script>

<body bgcolor="#f1f1f1">
	<div id="div-2" class="table-responsive">

			<div class="modal-header">
				<h2 style="text-align:center">
					<b>传感器节点列表</b>
				</h2>
			</div>
			<div class="modal-body">
				 <div id="div3" class="div-3">
					<!-- 原始的按钮 -->
					<!-- 信息警告消息的上下文按钮 -->
					<button type="button" class="btn btn-primary btn-sm" id="addnode" data-toggle="modal" data-target="#addModal">新增</button>
					<button type="button" class="btn btn-primary btn-sm"
						id="deletenode">删除</button>
		         </div>
            
            	<!-- 新增信息 -->
             <div style="padding:50px; float: left;" class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
				<div class="modal-dialog" style="width:500px">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h3 style="text-align:center" class="modal-title" id="addModalLabel">
				                 <b>新增传感器节点</b>
			                </h3>
                        </div>
			  <div class="modal-body" style="margin:20px">
			  <form id="formAdd" name="formAdd" method="post" action="">
			   
			    <table width="85%" border="0" cellspacing="0" cellpadding="0">
				   <tr>
					  <td style="font-size:15px; padding:5px"><label for="firstname"
						class="col-sm-12 control-label">&nbsp;节点编号;</label></td>
					  <td><input type="text" sylte="width:50%;" id="DptID" 
					  class="form-control"  placeholder="请输入类似A11" name="sensorNode.sensorId"></td>
			 	  </tr>
				 <tr>
					<td style="font-size:15px; padding:10px"><label for="lastname"
						class="col-sm-12 control-label">节点类型</label></td>
					   <td><select class="form-control" name="sensorNode.sensorType">
					           	<option value="000">--请选择--</option>
						       <option value="1">水位传感器</option>
						       <option value="2">倾角传感器</option>
					            <option value="3">超声波测距传感器</option>
					             <option value="4">温度传感器</option>
					              <option value="5">光照传感器</option>
					    </select></td>
				</tr>
				<tr>
					<td align="center" style="font-size:15px; padding:10px"><label
						for="lastname" class="col-sm-12 control-label">监&nbsp;控&nbsp;点</label></td>
					<td><select class="form-control" name="sensorNode.entityId">
					           	<option value="000">--请选择--</option>
						       <option value="1">古树</option>
						       <option value="2">井盖</option>
					            <option value="3">垃圾桶</option>
					            
					</select></td>
				</tr>
				 <tr>
					<td style="font-size:15px; padding:10px;">安装时间</td>
					<td><input type="text" class="form-control" placeholder="YY-MM-DD" name="sensorNode.setTime" onclick="WdatePicker()"/></td>
				</tr>
				<tr>
					<td style="font-size:15px; padding:10px"><label for="lastname"
						class="col-sm-12 control-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</label></td>
					<td><textarea type="text" class="form-control" id="lastname"
						placeholder="备注" name="sensorNode.remark"></textarea></td>
				</tr>
			</table>
		  </form>
			</div>
				<div style="margin:5px" class="modal-footer">
			        <table align="center">
				       <tr>
						<td>
						<button type="button" class="btn btn-info" data-dismiss="modal">取消</button>
						<button type="button" id="res" onclick="subform()" class="btn btn-primary btn-sm">重置</button>
						<button type="button"  id="addsubmit" class="btn btn-primary btn-sm">保存</button>
						</td>
				       </tr>
					</table>
				</div>
			 </div>
	      </div>
	    
       </div>
		<!-- 修改信息 -->
        <div style="padding:5px; float: center;" class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
				<div class="modal-dialog" style="width:500px">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h3 style="text-align:center" class="modal-title" id="editModalLabel">
				                 <b>修改节点信息</b>
			                </h3>
                        </div>
			  <div class="modal-body" style="margin:20px">
			  <form id="formEdit" method="post" action="">
			      <table width="85%" border="0" cellspacing="0" cellpadding="0">
				   <tr>
					  <td style="font-size:15px; padding:5px"><label for="firstname"
						class="col-sm-12 control-label">&nbsp;节点编号;</label></td>
					  <td><input type="text" sylte="width:50%;" id="DptID" 
					  class="form-control" id="firstname" placeholder="请输入类似A11"></td>
			 	  </tr>
				 <tr>
					<td style="font-size:15px; padding:10px"><label for="lastname"
						class="col-sm-12 control-label">节点类型</label></td>
					   <td><select class="form-control" name="sensorNode.sensorType">
					           	<option value="000">--请选择--</option>
						       <option value="水位传感器">水位传感器</option>
						       <option value="倾角传感器">倾角传感器</option>
					            <option value="超声波测距传感器">超声波测距传感器</option>
					             <option value="温度传感器">温度传感器</option>
					              <option value="光照传感器">光照传感器</option>
					             </select></td>
				</tr>
				<tr>
					<td align="center" style="font-size:15px; padding:10px"><label
						for="lastname" class="col-sm-12 control-label">监&nbsp;控&nbsp;点</label></td>
					<td><input type="text" id="DptID" readonly="readonly"
						class="form-control"  placeholder="监控点" name="sensorNode.entityId"></td>
				</tr>
				 <tr>
					<td style="font-size:15px; padding:10px;">安装时间</td>
					<td><input type="text" class="form-control" placeholder="YY-MM-DD" onclick="WdatePicker()" name="sensorNode.setTime"/></td>
					</tr>
				<tr>
					<td style="font-size:15px; padding:10px"><label for="lastname"
						class="col-sm-12 control-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</label></td>
					<td><textarea type="text" class="form-control" 
						placeholder="备注" name="sensorNode.remark"></textarea></td>
				</tr>
			</table>
			</form>
			</div>
				<div style="margin:5px" class="modal-footer">
			        <table align="center">
				       <tr>
						<td>
						<button type="button" class="btn btn-primary btn-sm">取消</button>
						<button type="button" class="btn btn-primary btn-sm">重置</button>
						<button type="button" id="editsubmit" class="btn btn-primary btn-sm">保存</button>
						</td>
				       </tr>
					</table>
				</div>
			 </div>
			
	      </div>
       </div>  
     	<!-- 列表-->
            <div>
	           	<table class="table table-striped" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td>序号</td>
						<td>节点编号</td>
						<td>节点类型</td>
						<td>监控点</td>
						<td>状态</td>
						<td>位置</td>
						<td>安装时间</td>
						<td>备注</td>
						<td>操作</td>
					</tr>
			
					<s:iterator id="sn" value="sensorNodeList" status="st">
					
					<tr>
						<td><s:property value="#st.index+1" /></td>
						<td><s:property value="#sn.sensorId" /></td>
						<td><s:property value="#sn.sensorType" /></td>
						<td><s:property value="#sn.entity.entityId" /></td>
						<td><s:property value="#sn.entity.entityStatus" /></td>
						<td><s:property value="#sn.entity.area" /></td>	
						<td><s:property value="#sn.setTime" /></td>
						<td><s:property value="#sn.remark" /></td>
						<td data-toggle="modal" data-target="#editModal"><a
								href="javascript:void(0)"><span
									class="glyphicon glyphicon-pencil"></span>&nbsp;编辑</a>
							<a
								href="sensorNodeDelete?sensorNode.sensorId=<s:property value="#sn.sensorId" />"><span
									class="glyphicon glyphicon-pencil"></span>&nbsp;删除</a>
							</td>
					</tr>
				</s:iterator>
			</table>
			</div>
			<!-- 翻页 -->
			<div align="right" class="modal-footer">
				<button>
					<a href="#">首页</a>
				</button>
				<button>
					<a href="#">上一页</a>
				</button>
				<button>
					<a href="#">下一页</a>
				</button>
				<button>
					<a href="#">最后一页</a>
				</button>
		 </div>
	</div>
</div>

</body>
</html>