<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<c:if test="${view eq 'submissions'}">
    <c:set scope="request" var="submissionsList" value="${SubmissionHelper.retrieveRecentSubmissions(type,state)}"/>
    <c:import url="${bundle.path}/partials/submissions.jsp" charEncoding="UTF-8"/>
</c:if>

<c:if test="${view eq 'catalog'}">
    <c:if test="${table eq 'request-draft'}">
        <c:set scope="request" var="submissionsList" value="${submissionsListDraft}"/>
        <c:import url="${bundle.path}/partials/submissionsList.jsp" charEncoding="UTF-8"/>
    </c:if>
    <c:if test="${table eq 'request-submitted'}">
        <c:set scope="request" var="submissionsList" value="${submissionsListSubmitted}"/>
        <c:import url="${bundle.path}/partials/submissionsList.jsp" charEncoding="UTF-8"/>
    </c:if>
    <c:if test="${table eq 'approval'}">
        <c:set scope="request" var="submissionsList" value="${submissionsListApproval}"/>
        <c:import url="${bundle.path}/partials/submissionsList.jsp" charEncoding="UTF-8"/>
    </c:if>
</c:if>
