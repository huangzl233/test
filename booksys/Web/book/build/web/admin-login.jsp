<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="prj.db.DbConfig"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

Class.forName(DbConfig.DriverName); 
Connection conn = DriverManager.getConnection(DbConfig.ConnString); 
Statement stmt = conn.createStatement();
ResultSet rs = null;
String sql = null;
String action=request.getParameter("Action");
String name = request.getParameter("name");
if(name==null) name="";
if(action!=null && action.equalsIgnoreCase("login")){
    String password=request.getParameter("password");
    sql="SELECT * FROM `Admin` WHERE `Status`<>'已删除' AND `Name`='"+name+"' AND `Password`='"+password+"'";
    rs=stmt.executeQuery(sql);
    if(rs.next()){
        session.setAttribute("userId", rs.getObject("Id"));
        session.setAttribute("userName", rs.getObject("Name"));
        session.setAttribute("role", "管理员");
        response.sendRedirect("admin-index.jsp");
        return;
    }
}
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>校园图书管理系统</title>
<!--jQuery & jQuery Mobile-->
<link rel="stylesheet" href="js/jquery-mobile/jquery.mobile-1.4.5.min.css" type="text/css" />
<script type="text/javascript" src="js/jquery.min-1.11.2.js"></script>
<script type="text/javascript" src="js/jquery-mobile/jquery.mobile-1.4.5.min.js"></script>

<style type="text/css">
ul { list-style:none;}
</style>

</head>

    <body>
        <article id="index" data-role="page">
            <section data-role="content">
                <div style="margin-top:10em;">
                    <form action="admin-login.jsp" method="post" data-ajax="false">
                    <input type="hidden" name="Action" id="Action" value="login" />
                    <label for="name" class="ui-hidden-accessible">用户名</label>
                    <input name="name" id="name" type="text" placeholder="用户名" value="<%=name%>" data-clear-btn="true" />
                    <label for="password" class="ui-hidden-accessible">密码</label>
                    <input name="password" id="password" type="password" placeholder="密码" value="" data-clear-btn="true" />
                    <button>登录</button>
                    </form>
                </div>
            <!--<a href="reg.php" rel="external" data-role="button">没有账户？</a>-->
            </section>
        </article>
    </body>
</html>
