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
String id = request.getParameter("id");
if(action!=null && action.equalsIgnoreCase("borrow")){
    sql = "UPDATE `appointment` SET `Status`='已借出',`BorrowTime`=now(),`ShouldReturnTime`=DATE_ADD(now(),INTERVAL 7 DAY) WHERE `Id`=" + id;
    stmt.executeUpdate(sql);
    session.setAttribute("ErrMsg", "操作成功！");
}
%>
<jsp:include page="header.jsp" />
<%
sql="SELECT a.*, u.Name AS UserIdName, b.Name AS BookIdName FROM `appointment` a INNER JOIN `user` u ON a.UserId=u.Id "
 + " INNER JOIN `book` b ON a.BookId=b.Id WHERE a.`Id`="+id;

        //sql = "SELECT `appointment`.* FROM `appointment` WHERE `appointment`.`Id`="+id;

        rs = stmt.executeQuery(sql);
        if(rs.next()){
%>
    <p>用户：<%=((rs.getObject("UserIdName") == null) ? "" : rs.getObject("UserIdName"))%></p>
    <p>图书：<%=((rs.getObject("BookIdName") == null) ? "" : rs.getObject("BookIdName"))%></p>
    <p>预约时间：<%=((rs.getObject("Time") == null) ? "" : rs.getObject("Time"))%></p>
    <p>状态：<%=((rs.getObject("Status") == null) ? "" : rs.getObject("Status"))%></p>
    <p>借出时间：<%=((rs.getObject("BorrowTime") == null) ? "未借出" : rs.getObject("BorrowTime"))%></p>
    <p>归还时间：<%=((rs.getObject("ReturnTime") == null) ? "未归还" : rs.getObject("ReturnTime"))%></p>
    <p>必须归还时间：<%=((rs.getObject("ShouldReturnTime") == null) ? "未借出" : rs.getObject("ShouldReturnTime"))%></p>

    <a href="AppointmentDisplay.jsp?Action=borrow&id=<%=id%>" data-rel="external" data-ajax="false" class="ui-btn ui-mini" >借出</a>
    <a href="AppointmentMnt.jsp?Action=delete&id=<%=id%>" data-rel="external" data-ajax="false" class="ui-btn ui-mini" >删除</a>
<%}%>

<a href="AppointmentMnt.jsp" data-rel="external" data-ajax="false" class="ui-btn ui-mini" >返回</a>
<jsp:include page="admin-footer.jsp" />
