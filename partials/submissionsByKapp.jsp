<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<c:if test="${view eq 'submissions'}">
    <c:set scope="request" var="submissionsList" value="${SubmissionHelper.retrieveRecentSubmissions('Service')}"/>
    <c:import url="partials/static/submissions/submissions.jsp" charEncoding="UTF-8"/>
</c:if>

<c:if test="${view eq 'catalog'}">
    <c:if test="${table eq 'request-draft'}">
        <c:set scope="request" var="submissionsList" value="${submissionsListDraft}"/>
        <c:import url="partials/static/submissions/submissionsList.jsp" charEncoding="UTF-8"/>
    </c:if>
    <c:if test="${table eq 'request-submitted'}">
        <c:set scope="request" var="submissionsList" value="${submissionsListSubmitted}"/>
        <c:import url="partials/static/submissions/submissionsList.jsp" charEncoding="UTF-8"/>
    </c:if>
    <c:if test="${table eq 'approval'}">
        <c:set scope="request" var="submissionsList" value="${submissionsListApproval}"/>
        <c:import url="partials/static/submissions/submissionsList.jsp" charEncoding="UTF-8"/>
    </c:if>
</c:if>
