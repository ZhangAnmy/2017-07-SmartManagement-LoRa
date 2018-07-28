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
.div-2 {
	backgroud: #f00;
	width: 95%;
	float: center;
	margin-left: 20px;
	margin-top: 20px;
}

table,th,td {
	text-align: center;
	font-size:10px;
}

a:link {
	color: #337ab7;
	font-size: 10px;
	
}
</style>

<script type="text/javascript">
	function gotopage(page){
		window.location.href="maintainQueryEntity?paging.currentPage="+page;
	}

</script>

<body style="background-color: #f1f1f1;">
	<div id="div2" class="div-2">
			<table class="table table-hover" border="0" cellspacing="0"
				cellpadding="0">
				<tr bgcolor="#F0F0F0"><td><b>序号</b></td>
				<td><b>编号</b></td>
				<td><b>状态</b></td>
				<td><b>损坏时间</b></td>
				<td><b>详细地址</b></td>
				<td><b>负责人</b></td>
				<td><b>负责人电话</b></td>
				<td><b>维修人</b></td>
				<td><b>维修人电话</b></td>
				<td><b>维修时间</b></td>
				<td><b>损坏原因</b></td>
				<td><b>备注</b></td>
				</tr>

				<s:iterator id="ml" value="maintainList" status="st">
					<tr>
						<td><s:property value="#st.index+1" /></td>

						<td><s:property value="#ml.entityid" /></td>

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
					</tr>
				</s:iterator>
			</table>
	</div>
	<!-- 翻页 -->
				<div align="right" >
				<ul class="pagination pagination-xs">
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
</body>
</html>
