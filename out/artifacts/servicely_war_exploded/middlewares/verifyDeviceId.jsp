<%@ page import="servicely.database.Device" %><%
    if(request.getParameter("id") == null) {
        response.sendError(404);

    }
    int deviceId = Integer.parseInt(request.getParameter("id") );

    if(Device.findDevice(deviceId) == null ) {
        response.sendError(404);
    }
%>