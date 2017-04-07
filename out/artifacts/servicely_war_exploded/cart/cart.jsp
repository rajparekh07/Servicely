<%@ page import="java.util.List" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="servicely.database.Device" %>
<%@ page import="servicely.database.DeviceService" %>
<%@ page import="servicely.database.Service" %>
<%@ page import="org.json.simple.JSONObject" %><%
    List deviceList = (List) session.getAttribute("deviceServiceList");
    JSONArray array = new JSONArray();
    if(deviceList != null) {
        for(Object listItem : deviceList) {
            DeviceService ds = (DeviceService) listItem;
            Device device = Device.findDevice(ds.device_id);
            Service service = Service.findService(ds.service_id);
            JSONObject object = new JSONObject();

            object.put("device_service_id", ds.id);
            object.put("device_name", device.name);
            object.put("service_name", service.name);
            object.put("cost", ds.cost);
            array.add(object);
        }
    }
    response.setContentType("application/json");
    response.getWriter().write(array.toJSONString());
%>