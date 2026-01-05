<%@ page import="dao.KostDAO" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    KostDAO dao = new KostDAO();
    dao.delete(id);
    response.sendRedirect("jenis_kost.jsp");
%>
