ï»¿<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,prj.db.*,java.util.*" errorPage="" %>
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

if(action!=null && action.equalsIgnoreCase("save")){
    String fId=request.getParameter("fId");
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
    String fInstockQty=request.getParameter("fInstockQty");
    String fStatus=request.getParameter("fStatus");

    //sql = "UPDATE `book` SET `Name` = '"+fName+"',`ISBN` = '"+fISBN+"',`Price` = "+fPrice+",`Pic` = '"+fPic+"',`Introduction` = '"+fIntroduction+"',`Qty` = "+fQty+",`InstockQty` = "+fInstockQty+" WHERE `Id`=" + fId;
    sql = "UPDATE `book` SET `Name` = '"+fName+"',`ISBN` = '"+fISBN+"',`Price` = "+fPrice+",`Introduction` = '"+fIntroduction+"',`Qty` = "+fQty+" WHERE `Id`=" + id;
    sql = sql.replace("'null'", "null");

    stmt.executeUpdate(sql);

    session.setAttribute("ErrMsg", "æä½æåï¼");
	response.sendRedirect("BookMnt.jsp");
    return;
}
%>
<jsp:include page="header.jsp" />
<%
        sql = "SELECT `book`.* FROM `book` WHERE `book`.`Id`="+id;

        rs = stmt.executeQuery(sql);
        if(rs.next()){
%>
<form action="BookEdit.jsp" method="post" data-ajax="false">
    <input type="hidden" name="Action" value="save" />
    <input type="hidden" name="id" value="<%=id%>" />
    <div class="ui-field-contain">
    <label for="fName">名称</label>
    <input name="fName" id="fName" type="text" value="<%=((rs.getObject("Name") == null) ? "" : rs.getObject("Name"))%>" placeholder="åç§°" >
    <label for="fISBN">ISBN</label>
    <input name="fISBN" id="fISBN" type="text" value="<%=((rs.getObject("ISBN") == null) ? "" : rs.getObject("ISBN"))%>" placeholder="ISBN" >
    <label for="fPrice">价格</label>
    <input name="fPrice" id="fPrice" type="text" value="<%=((rs.getObject("Price") == null) ? "" : rs.getObject("Price"))%>" placeholder="ä»·æ ¼" >

    <label for="fIntroduction">介绍</label>
    <input name="fIntroduction" id="fIntroduction" type="text" value="<%=((rs.getObject("Introduction") == null) ? "" : rs.getObject("Introduction"))%>" placeholder="ä»ç»" >
    <label for="fQty">总数量</label>
    <input name="fQty" id="fQty" type="text" value="<%=((rs.getObject("Qty") == null) ? "" : rs.getObject("Qty"))%>" placeholder="æ°é" 
    </div>


    <input type="submit" value="保存" data-mini="true">
</form>
<%}%>

<a href="BookMnt.jsp" data-rel="external" data-ajax="false" class="ui-btn ui-mini" >返回</a>
<jsp:include page="admin-footer.jsp" />
