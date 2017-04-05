<%@ page import="servicely.utils.Escaper" %>
<%@ page import="servicely.database.User" %>
<%@ page import="servicely.responses.JSONResponse" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 06-Apr-17
  Time: 1:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--@TODO Middleware--%>

<%
    String email = Escaper.escapeString(request.getParameter("email"));
    String password = Escaper.escapeString(request.getParameter("password"));
    if(User.attemptLogin(email, password)) {
        try {
            session.setAttribute("user", User.where("email",email));
            JSONResponse.init().success().make();
        } catch (Exception e) {
            JSONResponse.init().error(e.getMessage());
        }
    } else {
        JSONResponse.init().failed().make();
    }
%>