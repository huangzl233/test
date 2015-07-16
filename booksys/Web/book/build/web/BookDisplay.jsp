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
%>
<jsp:include page="header.jsp" />
<%
        sql = "SELECT `book`.* FROM `book` WHERE `book`.`Id`="+id;

        rs = stmt.executeQuery(sql);
        if(rs.next()){
%>
    <p>名称：<%=((rs.getObject("Name") == null) ? "" : rs.getObject("Name"))%></p>
    <p>ISBN：<%=((rs.getObject("ISBN") == null) ? "" : rs.getObject("ISBN"))%></p>
    <p>价格：<%=((rs.getObject("Price") == null) ? "" : rs.getObject("Price"))%></p>
    <!--<p>Pic：<%=((rs.getObject("Pic") == null) ? "" : rs.getObject("Pic"))%></p>-->
    <p>总数量：<%=((rs.getObject("Qty") == null) ? "" : rs.getObject("Qty"))%></p>
    <p>在库数量：<%=((rs.getObject("InstockQty") == null) ? "" : rs.getObject("InstockQty"))%></p>
    <!--<p>Status：<%=((rs.getObject("Status") == null) ? "" : rs.getObject("Status"))%></p>-->
    <p>介绍：<%=((rs.getObject("Introduction") == null) ? "" : rs.getObject("Introduction"))%></p>

    <a href="BookMnt.jsp?Action=delete&id=<%=id%>" data-rel="external" data-ajax="false" class="ui-btn ui-mini" >删除</a>
    <a href="BookEdit.jsp?id=<%=id%>" data-rel="external" data-ajax="false" class="ui-btn ui-mini" >编辑</a>

<%}%>

<a href="BookMnt.jsp" data-rel="external" data-ajax="false" class="ui-btn ui-mini" >返回</a>
<jsp:include page="admin-footer.jsp" />
