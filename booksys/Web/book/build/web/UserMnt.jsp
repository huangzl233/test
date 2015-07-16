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

Integer userId = (Integer)request.getSession().getAttribute("UserId");
if(action!=null && action.equalsIgnoreCase("search")){
    keyword=request.getParameter("keyword");
}
if(action!=null && action.equalsIgnoreCase("delete")){
    String id = request.getParameter("id");
    sql = "UPDATE `user` SET `Status`='已删除' WHERE `Id`=" + id;
    stmt.executeUpdate(sql);
    session.setAttribute("ErrMsg", "操作成功！");
}

%>
<jsp:include page="header.jsp" />
<ul data-role="listview" data-inset="true"data-filter-placeholder="搜索" data-filter="true">
    <li data-role="list-divider">我的预约</li>
<%
sql="SELECT * FROM `user` WHERE `Status`<>'已删除' " +
    " AND (`Name` LIKE '%"+keyword+"%' OR `Name` LIKE '%"+keyword+"%' )";
rs=stmt.executeQuery(sql);
while(rs.next()){
%>     
    <li>
        <a data-rel="external" data-ajax="false" href="UserDisplay.jsp?id=<%=rs.getObject("Id")%>">
            <h2><%=((rs.getObject("Name") == null) ? "" : rs.getObject("Name"))%>（<%=((rs.getObject("RealName") == null) ? "" : rs.getObject("RealName"))%>）</h2>
            <p><strong>联系电话：</strong><%=((rs.getObject("Tel") == null) ? "" : rs.getObject("Tel"))%></p>
            <p><strong>电子邮箱：</strong><%=((rs.getObject("Email") == null) ? "" : rs.getObject("Email"))%></p>
            <p class="ui-li-aside"><%=((rs.getObject("Status") == null) ? "" : rs.getObject("Status"))%></p>
        </a>
    </li>
<%}%>    
</ul>

<a href="UserAdd.jsp" data-rel="external" class="ui-btn ui-mini" >新增</a>
<jsp:include page="admin-footer.jsp" />
