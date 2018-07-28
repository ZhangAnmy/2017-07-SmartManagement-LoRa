<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld " %>
<html>
	<head>
		<title>管理平台</title>
		<script language="javascript" type="text/javascript">
		window.moveTo(0,0);
		window.resizeTo(screen.availWidth, screen.availHeight);
		</script>
	</head>
	<frameset cols="*,700" frameborder="no" border="0" framespacing="0" name="frmsMenu1"> 
		<frameset rows="42,*,250" cols="*" frameborder="NO" border="0" framespacing="0" name="formBody"> 
					<frame src="top.jsp" name="frmToolBar" scrolling="no" noresize>
					<frame src="callist.jsp" name="frmMain" >
					<frame src="pielist.jsp" name="frmfootBar" scrolling="no" noresize>
		</frameset>
		<frame src="map.jsp" name="frmMap" scrolling="no" > 
	
	</frameset>
	<body>

	</body>
</html>
