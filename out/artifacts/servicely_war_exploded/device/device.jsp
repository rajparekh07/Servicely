<%@ page import="servicely.requests.JSONRequest" %>
<%@ page import="servicely.utils.Escaper" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="servicely.database.Device" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.sql.SQLException" %>

<%

    String query = request.getParameter("id");
//    String query = Escaper.escapeString(jsonRequest.getParameter("query"));
    ResultSet devices = null;
    JSONObject object = new JSONObject();

    try {
        if( query != null ) {
            Device device = Device.findDevice(Integer.parseInt(query));
            object.put("id", device.id);
            object.put("name", device.name);
            object.put("type", device.type);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.setContentType("application/json");
    response.getWriter().write(object.toJSONString());



%>
