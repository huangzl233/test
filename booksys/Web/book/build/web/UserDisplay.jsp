<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,prj.db.*,java.util.*" errorPage="" %>
﻿<%
request.setCharacterEncoding("utf-8");
response.setHeader("Pragma","No-cache");    
response.setHeader("Cache-Control","no-cache");    

Class.forName(DbConfig.DriverName); 
Connection conn = DriverManager.getConnection(DbConfig.ConnString); 
Statement stmt = conn.createStatement();
ResultSet rs = null;
String sql = null;
String keyword="";
String action=request.getParameter("Action");
String id = request.getParameter("id");
if(action!=null && action.equalsIgnoreCase("refind")){
    sql = "UPDATE `user` SET `Status`='正常' WHERE `Id`=" + id;
    stmt.executeUpdate(sql);
    session.setAttribute("ErrMsg", "操作成功！");
}
%>
<jsp:include page="header.jsp" />
﻿<%
        sql = "SELECT `user`.* FROM `user` WHERE `user`.`Id`="+id;

        rs = stmt.executeQuery(sql);
        if(rs.next()){
%>
    <p>用户名：﻿<%=((rs.getObject("Name") == null) ? "" : rs.getObject("Name"))%></p>
    <p>姓名：﻿<%=((rs.getObject("RealName") == null) ? "" : rs.getObject("RealName"))%></p>
    <p>联系电话：﻿<%=((rs.getObject("Tel") == null) ? "" : rs.getObject("Tel"))%></p>
    <p>Email：﻿<%=((rs.getObject("Email") == null) ? "" : rs.getObject("Email"))%></p>
    <p>状态：﻿<%=((rs.getObject("Status") == null) ? "" : rs.getObject("Status"))%></p>

    <a href="UserMnt.jsp?Action=delete&id=<%=id%>" data-rel="external" data-ajax="false" class="ui-btn ui-mini" >删除</a>
    <a href="UserEdit.jsp?id=<%=id%>" data-rel="external" data-ajax="false" class="ui-btn ui-mini" >编辑</a>
<%
    if(rs.getString("Status").equals("已挂失")) {
%>
<a href="UserDisplay.jsp?Action=refind&id=<%=id%>" data-rel="external" data-ajax="false" class="ui-btn ui-mini" >解除挂失</a>
<%        
    }
%>
﻿<%}%>

<a href="UserMnt.jsp" data-rel="external" data-ajax="false" class="ui-btn ui-mini" >返回</a>
<jsp:include page="admin-footer.jsp" />
