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
request.setCharacterEncoding("utf-8");
if(action!=null && action.equalsIgnoreCase("search")){
    keyword=request.getParameter("keyword");
}
%>
<jsp:include page="header.jsp" />
<form action="StudentMnt.jsp" method="post">
    <input type="hidden" name="Action" value="search" />
<div class="ui-field-contain">
    <label for="search-1" class="ui-hidden-accessible">搜索:</label>
    <input name="keyword" id="search-1" type="search" value="" placeholder="关键词" >
         <input type="submit" value="查询" data-mini="true">
    </div>
</form>
<table class="ui-responsive table-stroke" id="table-column-toggle" data-role="table" data-mode="columntoggle">
     <thead>
       <tr>
         <th>学号</th>
         <th>姓名</th>
         <th data-priority="2">电话</th>
         <th data-priority="3">电邮</th>
         <th data-priority="1">状态</th>
       </tr>
     </thead>
     <tbody>
<%
sql="SELECT * FROM `user` WHERE `Status`<>'已删除' " +
    " AND (`Name` LIKE '%"+keyword+"%' OR `RealName` LIKE '%"+keyword+"%' OR `Tel` LIKE '%"+keyword+"%' OR `Email` LIKE '%"+keyword+"%')";
rs=stmt.executeQuery(sql);
while(rs.next()){
%>         
       <tr>
         <td><%=(rs.getObject("Name")!=null ? rs.getString("Name") : "") %></td>
         <td><a href="StudentDisplay.jsp?id=<%=rs.getObject("Id") %>" data-rel="external"><%=(rs.getObject("RealName")!=null ? rs.getString("RealName") : "") %></a></td>
         <td><%=(rs.getObject("Tel")!=null ? rs.getString("Tel") : "") %></td>
         <td><%=(rs.getObject("Email")!=null ? rs.getString("Email") : "") %></td>
         <td><%=(rs.getObject("Status")!=null ? rs.getString("Status") : "") %></td>
       </tr>
<%}%>
     </tbody>
</table>
<a href="StudentAdd.jsp" data-rel="external" class="ui-btn ui-mini" >新增</a>
<jsp:include page="footer.jsp" />