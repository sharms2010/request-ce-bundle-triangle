<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../package/initialization.jspf"%>
<%@page import="java.util.*" %>
<%@page import="org.json.simple.*" %>
<%
	Map<String,Object> results = new LinkedHashMap<String,Object>();
	results.put("Heading", "Another Ajax Example");
	results.put("Body", "Example using an Ajax call to retrieve JSON data from another file.");
	results.put("Footer", "That is all.");
	out.print(JSONValue.toJSONString(results));
%>