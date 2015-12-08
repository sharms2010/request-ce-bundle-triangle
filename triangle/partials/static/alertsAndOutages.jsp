
<%@page import="org.json.simple.JSONObject"%>
<%@page pageEncoding="UTF-8" contentType="application/json" trimDirectiveWhitespaces="true"%>
<%@include file="../../bundle/initialization.jspf" %>

<% 
    JSONObject obj = new JSONObject();
    obj.put("date","2015-12-01T16:46:36.694Z");
    obj.put("details","This is another test of the alerts and outages system for norm");
    request.setAttribute("obj", obj); 
%>


<div class="panel-body alert-outages-body">
   <c:set scope="request" var="jsonObject" value="${json.parse(obj)}"/>
   <p>${jsonObject.date}</p>
   <div>${jsonObject.details}</div>
</div>