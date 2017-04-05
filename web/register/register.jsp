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
    String name = Escaper.escapeString(request.getParameter("name"));
    String email = Escaper.escapeString(request.getParameter("email"));
    String mobileNumber = Escaper.escapeString(request.getParameter("mobileNumber"));
    String password = Escaper.escapeString(request.getParameter("password"));
    User user = new User(name, email, mobileNumber, password);
    try {
        if(user.save() > 0) {
            try {
                session.setAttribute("user", User.where("email",email));
                JSONResponse.init().success().make();
            } catch (Exception e) {
                JSONResponse.init().error(e.getMessage());
            }
        } else {
            JSONResponse.init().failed().make();
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>