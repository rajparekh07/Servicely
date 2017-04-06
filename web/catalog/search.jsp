<%@ page import="servicely.requests.JSONRequest" %>
<%@ page import="servicely.utils.Escaper" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="servicely.database.Device" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.sql.SQLException" %>

<%

    String query = request.getParameter("query");
//    String query = Escaper.escapeString(jsonRequest.getParameter("query"));
    ResultSet devices = null;

   try {
       if( query != null ) {
           devices = Device.where("name","LIKE","%"+query+"%");
       } else {
           devices = Device.all();
       }
   } catch (Exception e) {
       e.printStackTrace();
   }
    JSONArray array = new JSONArray();
    try {
        while (devices.next()) {
            JSONObject jsonObject = new JSONObject();

            jsonObject.put("id", devices.getInt("id"));
            jsonObject.put("name", devices.getString("name"));
            jsonObject.put("type", devices.getString("type"));

            array.add(jsonObject);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    response.setContentType("application/json");
    response.getWriter().write(array.toJSONString());



%>
