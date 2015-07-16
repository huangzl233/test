<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("userId")==null){
    response.sendRedirect("admin-login.jsp");
    return;
}
%>
<jsp:include page="header.jsp" />
<a class="ui-btn ui-corner-all" href="UserMnt.jsp">学生信息管理</a>
<a class="ui-btn ui-corner-all" href="BookMnt.jsp">图书信息管理</a>
<a class="ui-btn ui-corner-all" href="AppointmentMnt.jsp">借阅预约管理</a>
<a class="ui-btn ui-corner-all" href="BorrowMnt.jsp">图书借阅归还</a>
<a class="ui-btn ui-corner-all" href="Overdue.jsp">借阅超时通知</a>
<a class="ui-btn ui-corner-all" href="admin-logout.jsp">退出登录</a>
<jsp:include page="admin-footer.jsp" />
