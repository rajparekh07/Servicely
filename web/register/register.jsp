<%@ page import="servicely.database.User" %>
<%@ page import="servicely.responses.JSONResponse" %>
<%@ page import="servicely.requests.JSONRequest" %>

<%@ page import="servicely.utils.Escaper" %>
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
    JSONRequest jsonRequest = JSONRequest.init(request);

   String name = Escaper.escapeString(jsonRequest.getParameter("name"));
   String email = Escaper.escapeString(jsonRequest.getParameter("email"));
   String mobileNumber = Escaper.escapeString(jsonRequest.getParameter("mobileNumber"));
   String password = Escaper.escapeString(jsonRequest.getParameter("password"));
   User user = new User(name, email, mobileNumber, password);
   String jsonResponse = "";
   try {
       if(user.save() > 0) {
           try {
               session.setAttribute("user", (User.where("email",email)));
               jsonResponse = JSONResponse.init().success().make();
           } catch (Exception e) {
               jsonResponse = JSONResponse.init().error(e.getMessage()).make();
           }
       } else {
           jsonResponse = JSONResponse.init().failed().make();
       }
   } catch (Exception e) {
       e.printStackTrace();
       jsonResponse = JSONResponse.init().error(e.getMessage()).make();

   }

   response.setContentType("application/json");
   response.getWriter().write(jsonResponse);
%>