<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../../bundle/initialization.jspf" %>

<c:forEach var="submission" items="${submissionsList}">
    <tr>	
        <td class="font-bold p-b-0">${text.escape(submission.form.name)}</td>
        <td class="font-bold text-right gray hidden-xs" rowspan="2">${submission.coreState}</td>
    </tr>
     <c:choose>
        <c:when test="${table eq 'request-draft'}">
            <tr>
                <td class="font-bold p-t-0"><a href="${bundle.spaceLocation}/${submission.id}">${submission.getLabel()} - ${submission.createdAt}</a></td>
            </tr>
        </c:when>
        <c:otherwise>
            <tr>
                <td class="font-bold p-t-0"><a href="${bundle.kappLocation}/request-details?id=${submission.id}">${submission.getLabel()} - ${submission.submittedAt}</a></td>
            </tr>
        </c:otherwise>
    </c:choose>
</c:forEach>
