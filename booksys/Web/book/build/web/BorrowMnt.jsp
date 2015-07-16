<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,prj.db.*,java.util.*" errorPage="" %>
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
if(action!=null && action.equalsIgnoreCase("delete")){
    String id = request.getParameter("id");
    sql = "UPDATE `appointment` SET `Status`='已删除' WHERE `Id`=" + id;
    stmt.executeUpdate(sql);
    session.setAttribute("ErrMsg", "操作成功！");
}

%>
<jsp:include page="header.jsp" />
<ul data-role="listview" data-inset="true"data-filter-placeholder="搜索" data-filter="true">
    <li data-role="list-divider">图书借阅记录</li>
<%
sql="SELECT a.*, u.Name AS UserIdName, b.Name AS BookIdName FROM `appointment` a INNER JOIN `user` u ON a.UserId=u.Id "
 + " INNER JOIN `book` b ON a.BookId=b.Id "
 + " WHERE (a.`Status`='已借出' OR a.`Status`='已归还' )" +
    " AND (u.Name LIKE '%"+keyword+"%' OR b.Name LIKE '%"+keyword+"%' )";
rs=stmt.executeQuery(sql);
while(rs.next()){
%>     
    <li>
        <a data-rel="external" data-ajax="false" href="BorrowDisplay.jsp?id=<%=rs.getObject("Id")%>">
            <h2><%=((rs.getObject("BookIdName") == null) ? "" : rs.getObject("BookIdName"))%></h2>
            <p><strong>借书人：</strong><%=((rs.getObject("UserIdName") == null) ? "" : rs.getObject("UserIdName"))%></p>
            <p><strong>借出时间：</strong><%=((rs.getObject("BorrowTime") == null) ? "" : rs.getObject("BorrowTime"))%></p>
            <p><strong>必须归还时间：</strong><%=((rs.getObject("ShouldReturnTime") == null) ? "" : rs.getObject("ShouldReturnTime"))%></p>
        <p class="ui-li-aside">状态：<%=((rs.getObject("Status") == null) ? "" : rs.getObject("Status"))%></p>
        </a>
    </li>
<%}%>    
</ul>

<%--
<a href="AppointmentAdd.jsp" data-rel="external" data-ajax="false" class="ui-btn ui-mini" >新增</a>
--%>
<jsp:include page="admin-footer.jsp" />
