<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="package/initialization.jspf" %>
<%@page import="com.kineticdata.bundles.*"%>

<%
//  to check if submissions are turning to json
    java.util.Map<String,String[]> searchOptions = new java.util.HashMap<>();
    searchOptions.put("end", new String[] {"2015-12-30T21:00:00.000Z"} );
    searchOptions.put("start", new String[] {"2015-11-01T21:00:00.000Z"} );
    
    com.kineticdata.core.models.Kapp kapp = (com.kineticdata.core.models.Kapp) request.getAttribute("kapp");
    com.kineticdata.core.services.BundleSubmissionService submissionsGet = (com.kineticdata.core.services.BundleSubmissionService)request.getAttribute("submissions");
    List<com.kineticdata.core.models.Submission> submissions = submissionsGet.searchByKapp(kapp, searchOptions);
    request.setAttribute("jsonTest", submissions);
    
//  static object to check the json tag lib
    JSONObject obj = new JSONObject();
    obj.put("date","2015-12-01T16:46:36.694Z");
    obj.put("firstName","Chad");
    obj.put("lastName","Rehm");
    obj.put("Address","6565 the drive");
    obj.put("State","Minnesota");
    request.setAttribute("obj", obj);
%>

<h1>Json TabLib Test Page</h1>
<br>
<p>Dynamic json Object</p>
<json:array var="jsonTest" items="${jsonTest}">
    <json:object>
        <json:property name="created date" value="${jsonTest.createdAt}"/>
        <json:property name="firstName" value="${jsonTest.getValueByName('firstName')}"/>
        <json:property name="lastName" value="${jsonTest.getValueByName('lastName')}"/>
        <json:property name="address" value="${jsonTest.getValueByName('Address')}"/>
        <json:property name="state" value="${jsonTest.getValueByName('State')}"/>
        <json:property name="date" value="${jsonTest.getValueByName('date')}"/> 
    </json:object>
</json:array>

<br>
<p>Static Json Object</p>
<c:set var="jsonObject" value="${obj}"/>
<json:array>
    <json:object>
        <json:property name="date" value="${jsonObject.date}"/>
        <json:property name="firstName" value="${jsonObject.firstName}"/>
        <json:property name="lastName" value="${jsonObject.lastName}"/>
        <json:property name="Address" value="${jsonObject.Address}"/>
        <json:property name="State" value="${jsonObject.State}"/>
    </json:object>
</json:array>