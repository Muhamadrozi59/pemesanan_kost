<%@ page import="dao.KostDAO" %>
<%@ page import="model.Kost" %>

<%
    String idParam = request.getParameter("id");

    if (idParam == null) {
        out.println("<h3>ID kost tidak ditemukan</h3>");
        return;
    }

    int id = Integer.parseInt(idParam);
    KostDAO dao = new KostDAO();
    Kost k = dao.getById(id);
%>
