<%
    session.removeAttribute("user");
    response.sendRedirect("/");
%>