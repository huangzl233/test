<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,prj.db.*,java.util.*" errorPage="" %>
﻿<%
request.setCharacterEncoding("utf-8");
Class.forName(DbConfig.DriverName); 
Connection conn = DriverManager.getConnection(DbConfig.ConnString); 
Statement stmt = conn.createStatement();
ResultSet rs = null;
String sql = null;
String keyword="";
String action=request.getParameter("Action");
if(action!=null && action.equalsIgnoreCase("save")){
    String fId=request.getParameter("fId");
    String fName=request.getParameter("fName");
    String fPassword=request.getParameter("fPassword");
    String fRealName=request.getParameter("fRealName");
    String fTel=request.getParameter("fTel");
    String fEmail=request.getParameter("fEmail");
    String fStatus=request.getParameter("fStatus");
    String fTime=request.getParameter("fTime");

    sql = "INSERT INTO `user` (`Name`,`Password`,`RealName`,`Tel`,`Email`,`Status`,`Time`) VALUES("
 + "'"+fName+"','"+fPassword+"','"+fRealName+"','"+fTel+"','"+fEmail+"','正常','"+fTime+"')";
    sql = sql.replace("'null'", "null");
    stmt.executeUpdate(sql);

    session.setAttribute("ErrMsg", "操作成功！");
	response.sendRedirect("UserMnt.jsp");
    return;
}
%>
<jsp:include page="header.jsp" />
<form action="UserAdd.jsp" method="post" data-ajax="false">
    <input type="hidden" name="Action" value="save" />
    <div class="ui-field-contain">
    
    <label for="fName">用户名：</label>
    <input name="fName" id="fName" type="text" value="" placeholder="用户名" >
    <label for="fPassword">密码：</label>
    <input name="fPassword" id="fPassword" type="text" value="" placeholder="密码" >
    <label for="fRealName">姓名：</label>
    <input name="fRealName" id="fRealName" type="text" value="" placeholder="姓名" >
    <label for="fTel">联系电话：</label>
    <input name="fTel" id="fTel" type="text" value="" placeholder="联系电话" >
    <label for="fEmail">电子邮箱：</label>
    <input name="fEmail" id="fEmail" type="text" value="" placeholder="电子邮箱" >
    </div>
    <input type="submit" value="保存" data-mini="true">
</form>

<a href="UserMnt.jsp" data-rel="external" class="ui-btn ui-mini" >返回</a>
<jsp:include page="admin-footer.jsp" />
