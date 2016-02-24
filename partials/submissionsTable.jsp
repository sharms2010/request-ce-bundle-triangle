<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
    <table class="table m-a-0">
        <thead>
            <tr>
                <td class="font-bold p-t-0 gray">SUMMARY</td>
                <td class="font-bold p-t-0 text-right gray hidden-xs">STATUS</td>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="submission" items="${submissionsList}">
                <tr>
                    <td class="font-bold p-b-0">${text.escape(submission.form.name)}</td>
                    <td class="font-bold text-right gray hidden-xs" rowspan="2">${submission.coreState}</td>
                </tr>
                 <c:choose>
                    <c:when test="${submission.coreState == 'Draft'}">
                        <tr>
                            <td class="font-bold p-t-0"><a href="${bundle.spaceLocation}/submissions/${submission.id}">${submission.getLabel()} - ${submission.createdAt}</a></td>
                        </tr>
                    </c:when>
                    <c:when test="${submission.form.type.name == 'Approval' and submission.coreState == 'Submitted'}">
                        <tr>
                            <td class="font-bold p-t-0"><a href="${bundle.spaceLocation}/submissions/${submission.id}?review">${submission.getLabel()} - ${submission.submittedAt}</a></td>
                        </tr>
                    </c:when>        
                    <c:otherwise>
                        <tr>
                            <td class="font-bold p-t-0"><a href="${bundle.kappLocation}?page=requestDetails&id=${submission.id}">${submission.getLabel()} - ${submission.submittedAt}</a></td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </tbody>
        <tfoot>
        <tr>
            <td class="font-bold" colspan="2"><center><a href="${bundle.spaceLocation}/${kapp.slug}?page=submissions&type=${type}&state=${state}">VIEW MORE</a></center></td>
        </tr>
        </tfoot>
    </table>