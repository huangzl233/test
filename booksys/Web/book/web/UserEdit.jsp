<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,prj.db.*,java.util.*" errorPage="" %>
﻿<%
request.setCharacterEncoding("utf-8");
response.setHeader("Pragma","No-cache");    
response.setHeader("Cache-Control","no-cache");

Class.forName(DbConfig.DriverName); 
Connection conn = DriverManager.getConnection(DbConfig.ConnString); 
Statement stmt = conn.createStatement();
ResultSet rs = null;
String sql = null;
String keyword="";
String action=request.getParameter("Action");
String id = request.getParameter("id");
if(action!=null && action.equalsIgnoreCase("save")){
    String fId=request.getParameter("fId");
    String fName=request.getParameter("fName");
    String fPassword=request.getParameter("fPassword");
    String fRealName=request.getParameter("fRealName");
    String fTel=request.getParameter("fTel");
    String fEmail=request.getParameter("fEmail");
    String fStatus=request.getParameter("fStatus");
    String fTime=request.getParameter("fTime");

    sql = "UPDATE `user` SET `Name` = '"+fName+"',`RealName` = '"+fRealName+"',`Tel` = '"+fTel+"',`Email` = '"+fEmail+"' WHERE `Id`=" + id;
    sql = sql.replace("'null'", "null");

    stmt.executeUpdate(sql);

    session.setAttribute("ErrMsg", "操作成功！");
	response.sendRedirect("UserMnt.jsp");
    return;
}
%>
<jsp:include page="header.jsp" />
﻿<%
        sql = "SELECT `user`.* FROM `user` WHERE `user`.`Id`="+id;

        rs = stmt.executeQuery(sql);
        if(rs.next()){
%>
<form action="UserEdit.jsp" method="post" data-ajax="false">
    <input type="hidden" name="Action" value="save" />
    <input type="hidden" name="id" value="<%=id%>" />
    <div class="ui-field-contain">
    <label for="fName">用户名：</label>
    <input name="fName" id="fName" type="text" value="<%=((rs.getObject("Name") == null) ? "" : rs.getObject("Name"))%>" placeholder="用户名" >
    <label for="fRealName">姓名：</label>
    <input name="fRealName" id="fRealName" type="text" value="<%=((rs.getObject("RealName") == null) ? "" : rs.getObject("RealName"))%>" placeholder="姓名" >
    <label for="fTel">联系电话：</label>
    <input name="fTel" id="fTel" type="text" value="<%=((rs.getObject("Tel") == null) ? "" : rs.getObject("Tel"))%>" placeholder="联系电话" >
    <label for="fEmail">Email：</label>
    <input name="fEmail" id="fEmail" type="text" value="<%=((rs.getObject("Email") == null) ? "" : rs.getObject("Email"))%>" placeholder="Email" >
    </div>


    <input type="submit" value="保存" data-mini="true">
</form>
﻿<%}%>

<a href="UserMnt.jsp" data-rel="external" data-ajax="false" class="ui-btn ui-mini" >返回</a>
<jsp:include page="admin-footer.jsp" />
