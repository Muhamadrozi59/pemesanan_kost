<%-- 
    Document   : main
    Created on : 24 Des 2025, 11.38.16
    Author     : MyBook Hype AMD
--%>

<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String halaman = request.getParameter("halaman");

    // default page
    String url = "home.jsp";

    if (halaman != null && !halaman.trim().isEmpty()) {
        url = halaman.trim() + ".jsp";
    }
%>

<jsp:include page="<%= url %>" />
