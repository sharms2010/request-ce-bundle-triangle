<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../bundle/initialization.jspf" %>
<c:set scope="request" var="submissionsList" value="${submissions.searchByKapp(kapp, searchOptions)}"/>

<c:if test="${view eq 'submissions'}">
<c:import url="partials/static/submissions/submissions.jsp" charEncoding="UTF-8"/>
</c:if>

<c:if test="${view eq 'catalog'}">
	<c:if test="${table eq 'request'}">
		<c:import url="partials/static/submissions/submissionsHome.jsp" charEncoding="UTF-8"/>
	</c:if>
	<c:if test="${table eq 'approval'}">
		<c:import url="partials/static/submissions/submissionsHomeApprovals.jsp" charEncoding="UTF-8"/>
	</c:if>
</c:if>
