<%@ page import="servicely.utils.Escaper" %>
<%@ page import="servicely.database.User" %>
<%@ page import="servicely.responses.JSONResponse" %>
<%@ page import="servicely.requests.JSONRequest" %>
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
    String jsonResponse = "";


    JSONRequest jsonRequest = JSONRequest.init(request);
    String email = Escaper.escapeString(jsonRequest.getParameter("email"));

    String password = Escaper.escapeString(jsonRequest.getParameter("password"));

    if(User.attemptLogin(email, password)) {
        try {
            session.setAttribute("user", User.where("email",email));
            jsonResponse = JSONResponse.init().success().make();
        } catch (Exception e) {
            jsonResponse = JSONResponse.init().error(e.getMessage()).make();
        }
    } else {
        jsonResponse = JSONResponse.init().failed().make();
    }
    response.setContentType("application/json");
    response.getWriter().write(jsonResponse);
%>