<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../../package/initialization.jspf" %>
<c:set scope="request" var="submissionsList" value="${submissions.searchByKapp(kapp, searchOptions)}"/>


<c:import url="views/partials/static/submissions/submissionsHome.jsp" charEncoding="UTF-8"/>
