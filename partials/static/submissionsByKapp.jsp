<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../bundle/initialization.jspf" %>

<c:if test="${view eq 'submissions'}">
            <c:set scope="request" var="submissionsList" 
               value="${SubmissionHelper.retrieveRecentSubmissions('Service')}"/>
<c:import url="partials/static/submissions/submissions.jsp" charEncoding="UTF-8"/>
</c:if>

<c:if test="${view eq 'catalog'}">
    <c:if test="${table eq 'request'}">
        <c:set scope="request" var="submissionsList" 
               value="${SubmissionHelper.retrieveRecentSubmissions('Service', 3)}"/>
        <c:import url="partials/static/submissions/submissionsList.jsp" charEncoding="UTF-8"/>
    </c:if>
    <c:if test="${table eq 'approval'}">
        <c:set scope="request" var="submissionsList" 
               value="${SubmissionHelper.retrieveRecentSubmissions('Approval', 3)}"/>
        <c:import url="partials/static/submissions/submissionsList.jsp" charEncoding="UTF-8"/>
    </c:if>
</c:if>
