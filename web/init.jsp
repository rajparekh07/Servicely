<%@page import="servicely.Startup" %>

<%
    String initResults = Startup.start();
    out.println(initResults.equals("true")?"Init Successful":initResults);
%>