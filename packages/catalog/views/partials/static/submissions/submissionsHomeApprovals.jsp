<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../../../package/initialization.jspf" %>
<table class="table table-hover">
	<c:set var="count" value="0"/>
    <c:forEach items="${submissionsList}" var="submission">
    	<c:if test="${submission.type.name == 'Approval'}">
    		<c:if test="${count < 3}">
	        	<tr>	
		          <td>${app:escape(submission.form.name)}</td>
		          <td class="hidden-xs" rowspan="2">${submission.coreState}</td>
		        </tr>
		        <tr>
		          <td><a href="#">${submission.getLabel()} - 10/28/2015</a></td>
		        </tr>
		        <c:set var="count" value="${count+1}"/>	
		    </c:if>
        </c:if>
    </c:forEach>
</table>