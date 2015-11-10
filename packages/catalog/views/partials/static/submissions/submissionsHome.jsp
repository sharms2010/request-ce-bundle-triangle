<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../../../package/initialization.jspf" %>
<table class="table table-striped table-hover">
    <c:forEach items="${submissionsList}" var="submission">
        <tr>
          <td>${app:escape(submission.form.name)}</td>
          <td class="hidden-xs" rowspan="2">${submission.coreState}</td>
        </tr>
        <tr>
          <td><a href="#">Request #KR0000000000788923 - 10/28/2015</a></td>
        </tr>
    </c:forEach>
</table>