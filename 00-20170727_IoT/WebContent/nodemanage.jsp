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
	font-size: 15px;
	padding: 10px;
}

.div-page{
	margin-top: 10px;
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
   	 	
   	 	var ssID=document.getElementById("newSSID").value;
   	 		
   	 	if(ssID==null || ssID=="")
   	 	{
   	 		alert("节点编号不能为空，请重新输入");
   	 	}
   	 	else
   	 	{
   	 		if(ssID.startsWith("A")) 
   	 		params = params + "&sensorNode.sensorType=倾角传感器";
	   	 	else if(ssID.startsWith("U")) 
	   	 		params = params + "&sensorNode.sensorType=超声波传感器";
	   	 	else if(ssID.startsWith("W")) 
	   	 		params = params + "&sensorNode.sensorType=水位传感器";
	   	 	else if(ssID.startsWith("L")) 
	   	 		params = params + "&sensorNode.sensorType=光照传感器";
	   	 	else if(ssID.startsWith("T")) 
	   	 		params = params + "&sensorNode.sensorType=温湿度传感器";
	   	 		
	   	 	 $.ajax( {  
        
             type : "POST",  
             url : "sensorNodeAdd",  
             data :params,  
             success : function(data) {  
            	 gotopage(1); 
             }  
         });  
   	 	}
   });
    
    $('#search').click(function(){
   	 	var params = $("#formSearch").serialize(); 
		window.location.href="sensorNodeQuery?"+params;
   });
    
    $('#deletesubmit').click(function(){
    	var params = $("#formDelete").serialize(); 
		 $.ajax( {  
         type : "POST",  
         url : "sensorNodeDelete",  
         data :params,  
         success : function(data) {  
        	 gotopage(1);
         }  
     });  
   });
    
    $('#editsubmit').click(function(){
   	 	var params = $("#formEdit").serialize(); 
         $.ajax( {  
             type : "POST",  
             url : "sensorNodeEdit",  
             data :params,  
             success : function(data) {  
            	 gotopage(1);
             }  
         });  
   });
});

//新增重置
function subform() {
		$("input").val('');
		$("textarea").val('');
		$("select").val("");
}

//修改重置
function Editsubform(){
	$('#EntityID').val('');
	$('#SetTime').val('');
	$('#Remark').val('');
}
	
//跳转页面
function gotopage(page){
	window.location.href="sensorNodeQuery?paging.currentPage="+page;
}

function changeNode(id){
	var sensorId = document.getElementById("tableList").rows[id].cells[1].innerText;
	var sensorType = document.getElementById("tableList").rows[id].cells[2].innerText;
	var entityId = document.getElementById("tableList").rows[id].cells[3].innerText;
	var setTime = document.getElementById("tableList").rows[id].cells[6].innerText;
	var remark = document.getElementById("tableList").rows[id].cells[7].innerText;
	  $('#deleteID1').val(sensorId);
	  $('#SensorID1').val(sensorId);
	  $('#SensorType1').val(sensorType);
	  $('#EntityID').val(entityId);
	  $('#SetTime').val(setTime);
	  $('#Remark').val(remark);
}

</script>

<body bgcolor="#f1f1f1">
	<div id="div-2" class="div-2">
	
			<div>
				<h2 style="text-align:center">
					<b>传感器节点列表</b>
				</h2>
			</div>
			<div id="div3" class="div-3">
			<form id="formSearch" action="">
					<table width="500px" height="2%;" border="0" cellspacing="0"
						cellpadding="0" align="right">
						<tr height="2%;">
							<td align="right" style="font-size:15px;"><label
								for="firstname">节点编号:</label></td>
							<td width="20%;"><input type="text" class="form-control"
								id="firstname" name="sensorNode.sensorId"></td>
							<td align="right" style="font-size:15px;"><label
								for="lastname">节点类型:</label></td>
							<td width="25%;" height="10%;"><select class="form-control" name="sensorNode.sensorType">
									<option value="">--请选择--</option>
									<option value="水位传感器">水位传感器</option>
									<option value="倾角传感器">倾角传感器</option>
									<option value="超声波传感器">超声波传感器</option>
									<option value="温度传感器">温度传感器</option>
									<option value="光照传感器">光照传感器</option>
							</select></td>
							<td>
								<button type="button" class="btn btn-primary btn-sm" id="search">查询</button>
							</td>
							<td>
								<button type="button" class="btn btn-primary btn-sm"
									id="adduser" data-toggle="modal" data-target="#addModal">新增</button>
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
                		<input type="text" id="deleteID1" style="width: 55px; border-style:none; text-align:center;" name="sensorNode.sensorId"/>
                		<a>么？</a>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="deletesubmit" >确认</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

            	<!-- 新增信息 -->
             <div style="float: center;" class="modal fade" id="addModal"
					tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
					aria-hidden="true">
					<div class="modal-dialog"
						style="width:50%;padding:0px;margin-top:0px;">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h3 style="text-align:center" class="modal-title"
									id="addModalLabel">
									<b>新增传感器节点</b>
								</h3>
							</div>
			  <div class="modal-body" style="margin:20px">
			  <form id="formAdd"  method="post" action="">
			   
			    <table width="85%" border="0" cellspacing="0" cellpadding="0">
				   <tr>
					  <td style="font-size:15px; padding:5px">&nbsp;节点编号</td>
					  <td><input type="text" sylte="width:50%;" id="newSSID" 
					  class="form-control"  placeholder="请输入类似A10001" name="sensorNode.sensorId"></td>
			 	  </tr>
				 <!-- tr>
					<td style="font-size:15px; padding:10px"><label for="lastname"
						class="col-sm-12 control-label">节点类型</label></td>
					   <td><select class="form-control" name="sensorNode.sensorType">
					           	<option value="">--请选择--</option>
						        <option value="水位传感器">水位传感器</option>
						        <option value="倾角传感器">倾角传感器</option>
					            <option value="超声波传感器">超声波传感器</option>
					            <option value="温度传感器">温度传感器</option>
					            <option value="光照传感器">光照传感器</option>
					    </select></td>
				</tr-->
				
				<tr>
					<td align="center" style="font-size:15px; padding:10px">监&nbsp;控&nbsp;点ID</td>
					<td><input type="text" id="DptID"
						class="form-control"  placeholder="监控点ID" name="sensorNode.entityId"></td>
				</tr>
				 <tr>
					<td align="center" style="font-size:15px; padding:10px;">安装时间</td>
					<td><input type="text" class="form-control" placeholder="YY-MM-DD" name="sensorNode.setTime" onclick="WdatePicker()"/></td>
				</tr>
				<tr>
					<td align="center" style="font-size:15px; padding:10px">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</td>
					<td><textarea type="text" class="form-control" id="lastname" name="sensorNode.remark"></textarea></td>
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
						<button type="button" id="addsubmit" class="btn btn-primary btn-sm">保存</button>
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
						style="width:50%;padding:0px;margin-top:0px;">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h3 style="text-align:center" class="modal-title"
									id="addModalLabel">
									<b>修改传感器节点信息</b>
								</h3>
							</div>
			  <div class="modal-body" style="margin:10px">
			  <form id="formEdit" method="post" action="">
			      <table width="85%" border="0" cellspacing="0" cellpadding="0" id="tableAdd">
				   <tr>
					  <td style="font-size:15px; padding:5px">&nbsp;节点编号</td>
					  <td><input type="text" sylte="width:50%;" id="SensorID1" readonly="readonly"
					  class="form-control" name="sensorNode.sensorId"></td>
			 	  </tr>
				 <tr>
					<td style="font-size:15px; padding:10px">节点类型</td>
					<td><input type="text" sylte="width:50%;" id="SensorType1" readonly="readonly"
					  class="form-control" name="sensorNode.sensorType"></td>
					   <!--  select class="form-control" name="sensorNode.sensorType">
					           <option value="000">--请选择--</option>
						       <option value="水位传感器">水位传感器</option>
						       <option value="倾角传感器">倾角传感器</option>
					           <option value="超声波传感器">超声波传感器</option>
					           <option value="温度传感器">温度传感器</option>
					            <option value="光照传感器">光照传感器</option>
					        </select>-->
				</tr>
				<tr>
					<td align="center" style="font-size:15px; padding:10px">监&nbsp;控&nbsp;点ID</td>
					<td><input type="text" id="EntityID"
						class="form-control" name="sensorNode.entityId"></td>
				</tr>
				 <tr>
					<td style="font-size:15px; padding:10px;">安装时间</td>
					<td><input type="text" class="form-control" placeholder="YY-MM-DD" id="SetTime" onclick="WdatePicker()" name="sensorNode.setTime"/></td>
					</tr>
				<tr>
					<td style="font-size:15px; padding:10px">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</td>
					<td><textarea type="text" id="Remark" class="form-control" name="sensorNode.remark"></textarea></td>
				</tr>
			</table>
			</form>
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
			 </div>
			
	      </div>
       </div>  
     	<!-- 列表-->
            <div>
	           	<table id="tableList" class="table table-striped" border="0" cellspacing="0"
						cellpadding="0">
					<tr>
						<th>序号</th>
						<th>节点编号</th>
						<th>节点类型</th>
						<th>监控点</th>
						<th>状态</th>
						<th>位置</th>
						<th>安装时间</th>
						<th>备注</th>
						<th>操作</th>
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
						<td>
							<a data-toggle="modal" data-target="#editModal" href="javascript:void(0)" onclick="javascript:changeNode(<s:property value="#st.index+1"/>);"><span
									class="glyphicon glyphicon-pencil"></span>&nbsp;编辑</a>
							<a  href="javascript:void(0);" onclick="javascript:changeNode(<s:property value="#st.index+1"/>);" data-toggle="modal" data-target="#deleteModal" ><span
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