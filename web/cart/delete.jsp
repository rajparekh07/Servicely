<%@ page import="servicely.utils.Escaper" %>
<%@ page import="servicely.database.User" %>
<%@ page import="servicely.responses.JSONResponse" %>
<%@ page import="servicely.requests.JSONRequest" %>
<%@ page import="servicely.database.DeviceService" %>
<%@ page import="servicely.database.Service" %>
<%@ page import="servicely.database.Device" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Set" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--@TODO Middleware--%>

<%
    String jsonResponse = "";


    JSONRequest jsonRequest = JSONRequest.init(request);
    Long dsId = (Long) jsonRequest.getObjectParameter("device_services");
    List deviceServiceList = null;
    try {
        deviceServiceList = (List) session.getAttribute("deviceServiceList");
        Set hs = new HashSet();

        DeviceService ds = DeviceService.findDeviceService(dsId.intValue());
        for(Object deviceService : deviceServiceList) {
            if(ds.id != ((DeviceService)deviceService).id) {
                hs.add(deviceService);
            }
        }
        deviceServiceList.clear();
        deviceServiceList.addAll(hs);
        session.setAttribute("deviceServiceList", deviceServiceList);
        jsonResponse = JSONResponse.init().success().make();
    } catch (Exception e) {
        throw e;
    }
    response.setContentType("application/json");
    response.getWriter().write(jsonResponse);
%>