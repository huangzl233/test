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
    sql = "UPDATE `book` SET `Status`='已删除' WHERE `Id`=" + id;
    stmt.executeUpdate(sql);
    session.setAttribute("ErrMsg", "操作成功！");
}

%>
<jsp:include page="header.jsp" />


<ul data-role="listview" data-inset="true"data-filter-placeholder="搜索" data-filter="true">
    <li data-role="list-divider">图书</li>
<%
sql="SELECT * FROM `book` WHERE `Status`<>'已删除' " +
    " AND (`Name` LIKE '%"+keyword+"%' OR `ISBN` LIKE '%"+keyword+"%' )";
rs=stmt.executeQuery(sql);
while(rs.next()){
%>     
    <li>
        <a data-rel="external" data-ajax="false" href="BookDetail.jsp?id=<%=rs.getObject("Id")%>">
            <h2><%=((rs.getObject("Name") == null) ? "" : rs.getObject("Name"))%></h2>
            <p><strong>ISBN：<%=((rs.getObject("ISBN") == null) ? "" : rs.getObject("ISBN"))%></strong></p>
            <p>单价：￥<%=((rs.getObject("Price") == null) ? "" : rs.getObject("Price"))%>元</p>
            <p><%=((rs.getObject("Introduction") == null) ? "" : rs.getObject("Introduction"))%></p>
        <p class="ui-li-aside">在库数量：<%=((rs.getObject("InstockQty") == null) ? "" : rs.getObject("InstockQty"))%></p>
        </a>
    </li>
<%}%>    
</ul>


<jsp:include page="footer.jsp" />
