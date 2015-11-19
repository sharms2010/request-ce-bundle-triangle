<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../../../package/initialization.jspf" %>

	<c:set var="count" value="0"/>
    <c:forEach var="submission" items="${submissionsList}">
    	<c:if test="${submission.type.name != 'Approval'}">
            <c:if test="${count < 3}">
                <tr>	
                  <td class="font-bold pad-bot-none">${app:escape(submission.form.name)}</td>
                  <td class="font-bold text-right gray hidden-xs" rowspan="2">${submission.coreState}</td>
                </tr>
                <tr>
                  <td class="font-bold pad-top-none"><a href="${bundle.spaceLocation}/request-details?id=${submission.id}">${submission.getLabel()} - ${submission.submittedAt}</a></td>
                </tr>
                <c:set var="count" value="${count+1}"/>	
            </c:if>
        </c:if>
    </c:forEach>
