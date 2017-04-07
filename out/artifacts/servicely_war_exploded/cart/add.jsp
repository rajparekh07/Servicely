<%@ page import="servicely.utils.Escaper" %>
<%@ page import="servicely.database.User" %>
<%@ page import="servicely.responses.JSONResponse" %>
<%@ page import="servicely.requests.JSONRequest" %>
<%@ page import="servicely.database.DeviceService" %>
<%@ page import="servicely.database.Service" %>
<%@ page import="servicely.database.Device" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Set" %>
<%@ page import="org.json.simple.JSONArray" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--@TODO Middleware--%>

<%
    String jsonResponse = "";


    JSONRequest jsonRequest = JSONRequest.init(request);
    JSONArray dsIds = (JSONArray) jsonRequest.getObjectParameter("device_services");
    List deviceServiceList = null;
    try {
        Set hs = new HashSet();

        deviceServiceList = (List) session.getAttribute("deviceServiceList");
        if(deviceServiceList==null) deviceServiceList = new ArrayList();
        for(Object dsId : dsIds) {
            DeviceService ds = DeviceService.findDeviceService(((Long)dsId).intValue());

            int count = 0;
            for(Object deviceService : deviceServiceList) {
                if(ds.id != ((DeviceService)deviceService).id) {
                   count++;
                }
            }
            if(count > 0 || deviceServiceList.size() < 1) {
                hs.add(ds);
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