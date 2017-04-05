<%@page import="servicely.Startup" %>

<%
    String initResults = Startup.start();
    if(initResults.equals("true")){
        out.println("Init Successful");
        response.sendRedirect("/");
    } else {
        out.print(initResults);
    }

%>