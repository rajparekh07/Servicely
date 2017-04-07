<%@ page import="servicely.requests.JSONRequest" %>
<%@ page import="servicely.utils.Escaper" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="servicely.database.Device" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="servicely.database.DeviceService" %>
<%@ page import="servicely.database.Service" %>

<%

    String query = request.getParameter("id");
//    String query = Escaper.escapeString(jsonRequest.getParameter("query"));

    JSONArray array = new JSONArray();

    try {
        if( query != null ) {
            Device device = Device.findDevice(Integer.parseInt(query));
            ResultSet rs = DeviceService.where("device_id", String.valueOf(device.id));
            rs.beforeFirst();
            while (rs.next()) {
                JSONObject object = new JSONObject();
                Service service = Service.findService(rs.getInt("service_id"));

                object.put("name", service.name);
                object.put("id", service.id);
                object.put("device_service_id", rs.getInt("id"));
                object.put("cost", rs.getFloat("cost"));

                array.add(object);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    response.setContentType("application/json");
    response.getWriter().write(array.toJSONString());



%>
