<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../../bundle/initialization.jspf" %>

<c:forEach var="submission" items="${submissionsList}">
    <tr>	
        <td class="font-bold pad-bot-none">${text.escape(submission.form.name)}</td>
        <td class="font-bold text-right gray hidden-xs" rowspan="2">${submission.coreState}</td>
    </tr>
    <tr>
        <td class="font-bold pad-top-none"><a href="${bundle.kappLocation}/request-details?id=${submission.id}">${submission.getLabel()} - ${submission.submittedAt}</a></td>
    </tr>
</c:forEach>
