<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<%
    String view = "submissions";
    request.setAttribute("view", view);
%>
<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <c:import url="${bundle.path}/partials/shared/categoryNav.jsp" charEncoding="UTF-8"/>
    <bundle:scriptpack>
        <bundle:script src="${bundle.location}/js/myRequests.js" />
    </bundle:scriptpack>

    <bundle:variable name="head">
        <title>Kinetic Data ${kapp.name}</title>
    </bundle:variable>
    <c:import url="partials/static/submissionsByKapp.jsp" charEncoding="UTF-8"/>
    <app:bodyContent/>
</bundle:layout>