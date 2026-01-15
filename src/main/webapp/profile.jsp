<%-- 
    Document   : profile
    Created on : 13 Jan 2026, 11.37.38
    Author     : MyBook Hype AMD
--%>

<%@ page session="true" %>
<%
if(session.getAttribute("user")==null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>My Profile</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-10">

<div class="max-w-md mx-auto bg-white p-6 rounded shadow">

<h2 class="text-xl font-bold mb-4">My Profile</h2>

<p><b>Username:</b> <%= session.getAttribute("user") %></p>
<p><b>Role:</b> Admin</p>

<a href="dashboardAdmin.jsp" class="mt-4 inline-block text-indigo-600">? Back Dashboard</a>

</div>

</body>
</html>

