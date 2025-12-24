<%-- 
    Document   : main
    Created on : 24 Des 2025, 11.38.16
    Author     : MyBook Hype AMD
--%>

<%
//tangkap request dari url
    String hal = request.getParameter("halaman");
    String url = hal + ".jsp";
    if (hal != null) {
//diarahkan sesuai request,jika ada request di url
%>
<jsp:include page=
"<%= url%>" />
<%
} else { // tidak ada request di url, diarahkan ke hal home
%>
<%@include file="home.jsp" %>
<%
    }
%>
