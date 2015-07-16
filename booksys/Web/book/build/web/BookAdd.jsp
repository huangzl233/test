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

if(action!=null && action.equalsIgnoreCase("save")){
    String fName=request.getParameter("fName");
    if(fName==null || fName.trim().length()==0) fName="null";
    String fISBN=request.getParameter("fISBN");
    if(fISBN==null || fISBN.trim().length()==0) fISBN="null";
    String fPrice=request.getParameter("fPrice");
    if(fPrice==null || fPrice.trim().length()==0) fPrice="null";
    String fPic=request.getParameter("fPic");
    if(fPic==null || fPic.trim().length()==0) fPic="null";
    String fIntroduction=request.getParameter("fIntroduction");
    if(fIntroduction==null || fIntroduction.trim().length()==0) fIntroduction="null";
    String fQty=request.getParameter("fQty");
    if(fQty==null || fQty.trim().length()==0) fQty="null";
    String fInstockQty=fQty;
    String fStatus=request.getParameter("fStatus");

   	sql = "INSERT INTO `book` (`Name`,`ISBN`,`Price`,`Pic`,`Introduction`,`Qty`,`InstockQty`,`Status`) VALUES("
 + "'"+fName+"','"+fISBN+"',"+fPrice+",'"+fPic+"','"+fIntroduction+"',"+fQty+","+fInstockQty+",'正常')";
    sql = sql.replace("'null'", "null");
    stmt.executeUpdate(sql);

    session.setAttribute("ErrMsg", "操作成功！");
	response.sendRedirect("BookMnt.jsp");
    return;
}
%>
<jsp:include page="header.jsp" />
<form action="BookAdd.jsp" method="post" data-ajax="false">
    <input type="hidden" name="Action" value="save" />
    <div class="ui-field-contain">
    <label for="fName">名称：</label>
    <input name="fName" id="fName" type="text" value="" placeholder="名称，必须填写" >
    <label for="fISBN">ISBN：</label>
    <input name="fISBN" id="fISBN" type="text" value="" placeholder="ISBN，必须填写" >
    <label for="fPrice">价格：</label>
    <input name="fPrice" id="fPrice" type="number" value="" placeholder="价格" >
    <!--
    <label for="fPic">Pic：</label>
    <input name="fPic" id="fPic" type="text" value="" placeholder="Pic" >
    -->
    <label for="fIntroduction">介绍：</label>
    <textarea name="fIntroduction" id="fIntroduction" type="text" value="" placeholder="介绍" cols="80" rows="5" ></textarea>
    <label for="fQty">数量：</label>
    <input name="fQty" id="fQty" type="number" value="1" placeholder="数量，必须填写" >
    </div>
    <input type="submit" value="保存" data-mini="true">
</form>

<a href="BookMnt.jsp" data-rel="external" data-ajax="false" class="ui-btn ui-mini" >返回</a>
<jsp:include page="admin-footer.jsp" />
