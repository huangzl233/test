<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="prj.db.DbConfig"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Class.forName(DbConfig.DriverName); 
Connection conn = DriverManager.getConnection(DbConfig.ConnString); 
Statement stmt = conn.createStatement();
ResultSet rs = null;
String sql = null;
String keyword="";
String action=request.getParameter("Action");
String id = request.getParameter("id");
request.setCharacterEncoding("utf-8");
if(action!=null && action.equalsIgnoreCase("save")){
    String name=request.getParameter("Name");
    
    response.sendRedirect("StudentMnt.jsp");
}
%>
<jsp:include page="header.jsp" />
<form action="StudentEdit.jsp" method="post" data-ajax="false">
    <input type="hidden" name="Action" value="save" />
    <input type="hidden" name="id" value="<%=id%>" />
<%
sql="SELECT * FROM `User` WHERE `Id`="+id;
rs=stmt.executeQuery(sql);
if(rs.next() ) {
%>    
    <div class="ui-field-contain">
    <label for="search-1">学号：</label>
    <input name="keyword" id="search-1" type="number" value="<%=%>" placeholder="学号" >
    </div>
    <input type="submit" value="保存" data-mini="true">
<%}%>
</form>

<a href="StudentMnt.jsp" data-rel="external" class="ui-btn ui-mini" >返回</a>
<jsp:include page="footer.jsp" />