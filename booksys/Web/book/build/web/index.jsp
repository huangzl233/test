<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,prj.db.*,java.util.*" errorPage="" %>
<%
if(session.getAttribute("UserId")==null){
    response.sendRedirect("login.jsp");
    return;
}
%>
<%

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
if(action!=null && action.equalsIgnoreCase("lose")){
    String id = request.getParameter("id");
    sql = "UPDATE `user` SET `Status`='已挂失' WHERE `Id`=" + userId;
    stmt.executeUpdate(sql);
    response.sendRedirect("login.jsp");
}
if(action!=null && action.equalsIgnoreCase("cancel")){
    String id = request.getParameter("id");
    sql = "UPDATE `user` SET `Status`='已注销' WHERE `Id`=" + userId;
    stmt.executeUpdate(sql);
    response.sendRedirect("login.jsp");
}
%>

<jsp:include page="header.jsp" />
<a class="ui-btn ui-corner-all" href="BookSearch.jsp">图书查询</a>
<a class="ui-btn ui-corner-all" href="index.jsp?Action=lose">挂失</a>
<a class="ui-btn ui-corner-all" href="index.jsp?Action=cancel">注销</a>
<a class="ui-btn ui-corner-all" href="MyAppointments.jsp">我的预约</a>
<a class="ui-btn ui-corner-all" href="MyBorrow.jsp">我的借阅记录</a>
<a class="ui-btn ui-corner-all" href="logout.jsp">退出登录</a>
<jsp:include page="footer.jsp" />
