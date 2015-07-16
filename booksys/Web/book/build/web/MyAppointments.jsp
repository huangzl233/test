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
if(action!=null && action.equalsIgnoreCase("appointment")){
    String id = request.getParameter("id");
    sql = "INSERT INTO `appointment` (`UserId`,`BookId`,`Time`,`Status`,`BorrowTime`,`ReturnTime`,`ShouldReturnTime`) VALUES("
 + ""+userId+","+id+",now(),'未借出',NULL,NULL,NULL)";
    stmt.executeUpdate(sql);
    session.setAttribute("ErrMsg", "操作成功！");
}

%>
<jsp:include page="header.jsp" />
<ul data-role="listview" data-inset="true"data-filter-placeholder="搜索" data-filter="true">
    <li data-role="list-divider">我的预约</li>
<%
sql="SELECT a.*, u.Name AS UserIdName, b.Name AS BookIdName FROM `appointment` a INNER JOIN `user` u ON a.UserId=u.Id "
 + " INNER JOIN `book` b ON a.BookId=b.Id "
 + " WHERE a.`Status`<>'已删除' " +
    " AND (u.Name LIKE '%"+keyword+"%' OR b.Name LIKE '%"+keyword+"%' )"
 + " AND a.UserId="+userId;
rs=stmt.executeQuery(sql);
while(rs.next()){
%>     
    <li>
        <a data-rel="external" data-ajax="false" href="MyAppointmentDisplay.jsp?id=<%=rs.getObject("Id")%>">
            <h2><%=((rs.getObject("BookIdName") == null) ? "" : rs.getObject("BookIdName"))%></h2>
            <p><strong>预约时间：<%=((rs.getObject("Time") == null) ? "" : rs.getObject("Time"))%></strong></p>
        <p class="ui-li-aside"><%=((rs.getObject("Status") == null) ? "" : rs.getObject("Status"))%></p>
        </a>
    </li>
<%}%>    
</ul>

<%--
<a href="AppointmentAdd.jsp" data-rel="external" data-ajax="false" class="ui-btn ui-mini" >新增</a>
--%>
<jsp:include page="footer.jsp" />
