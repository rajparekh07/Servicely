<%@ page import="servicely.database.Device" %><%
    int deviceId = Integer.parseInt(request.getParameter("id"));

    if(Device.findDevice(deviceId) == null ) {
        response.sendError(404);
    }
%>