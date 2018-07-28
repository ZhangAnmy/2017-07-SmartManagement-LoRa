<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'usermangepage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	
 <script type="text/javascript">
        function gotopage(currentpage){
            window.location.href='${pageContext.request.contextPath}/ListUserServlet?currentpage='+currentpage;
        }
    </script>

  </head>
  
  <body>
  <div class="modal-header">
				<h2 style="text-align:center">
					<b>用户信息管理</b>
				</h2>
			</div>
  
  <div>
 	<table class="table table-hover" border="0" cellspacing="0"
					cellpadding="0">
					<tr bgcolor="#F0F0F0">
						<th width="4px"></th>
						<td><b>序号</b></td>
						<td><b>登录名</b></td>
						<td><b>真实姓名</b></td>
						<td><b>所属部门</b></td>
						<td><b>电话</b></td>
						<td><b>邮件</b></td>
						<td><b>权限</b></td>
						<td><b>备注</b></td>
						<td><b>编辑</b></td>
					</tr>

           <c:forEach var="c" items="${requestScope.Pagination.list}" varStatus="status">
            <tr>
                <td width="3px">
							<div class="col-sm-offset-1 col-sm-12">
								<label class="checkbox-inline"> <input type="checkbox"
									id="checkbox" value="#sn.id">
								</label>
							</div>
						</td>

                <td>${c.userId }1</td>
                <td>${c.userName }zz</td>
                <td>${c }真实姓名</td>
                <td>${c.departmentId }xx</td>
                <td>${c.tel }xxx</td>
                <td>${c.email }xxx</td>
                <td>${c.userAuth }xxx</td>
                <td>${c.remark }xxx</td>
                <td data-toggle="modal" data-target="#editModal" id="edituser"><a
					href="#"><span class="glyphicon glyphicon-pencil"></span>&nbsp;编辑</a></td>
            </tr>
        </c:forEach>					
  </table>
  
  </div>

  <div>
       共[${Pagination.totalrecord }]条记录,
           每页<input type="text" id="pagesize" value="${Pagination.pagesize }" style="width: 30px" maxlength="2">条,
        共[${Pagination.totalpage }]页,
        当前[${Pagination.currentpage }]页
     &nbsp;&nbsp;&nbsp;
    <button href="javascript:void(0)" onclick="gotopage(${Pagination.previouspage})">上一页</button>
        <c:forEach var="pagenum" items="${Pagination.pagebar}">
            <button href="javascript:void(0)" onclick="gotopage(${pagenum})">${pagenum} </button>
        </c:forEach>
       &nbsp;    
    <button href="javascript:void(0)" onclick="gotopage(${Pagination.nextpage})">下一页</button>
   </div>
  </body>
</html>
