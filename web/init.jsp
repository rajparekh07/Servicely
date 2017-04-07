<%@page import="servicely.Startup" %>

<%
    String initResults = Startup.start();
    if(initResults.equals("true")){
        System.out.println("Init Successful");
    } else {
        out.print(initResults);
    }

%>