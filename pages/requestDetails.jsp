<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <c:import url="${bundle.path}/partials/categoryNav.jsp" charEncoding="UTF-8"/>
    <bundle:scriptpack>
        <bundle:script src="${bundle.location}/js/requestDetails.js" />
    </bundle:scriptpack>
    <bundle:variable name="head">
        <title>Kinetic Data ${text.escape(kapp.name)}</title>
    </bundle:variable>
    <c:set var="submission" value="${Submissions.retrieve(param.id)}" />
    <div class ="container-fluid details splitBackgound">
        <div class="container">
            <div class="left-column col-md-4 p-y-3">
                <h1>${submission.form.name}</h1>
                <h4>Request ID:</h4>
                <h4>${submission.id}</h4>
                <h4>Request Date:</h4>
                <h4>${submission.submittedAt}</h4>
                <h4>Status:</h4>
                <h4>${submission.coreState}</h4>
                <p>This could be instructions. This could be a brief description. This could also be a status update. Esto podría ser instrucciones. Esto podría ser una breve descripción. Esto también podría ser una actualización de estado. Kini mahimong mga panudlo. Kini mahimo nga usa ka mubo nga paghulagway. Kini mahimo usab nga usa ka status update.</p>
                <a href="${bundle.spaceLocation}/submissions/${submission.id}?review">
                    <button class="btn btn-primary">Review Request
                    <i class="icon-control-feedback fa fa-play"></i>
                    </button>
                </a>
            </div>
            <div class="right-details col-md-8 p-b-4 p-t-4">
                <ul>
                    <c:forEach var="run" items="${TaskRuns.find(submission)}">
                        <c:forEach var="task" items="${run.tasks}">
                            <li class="panel panel-default arrow_box">
                                <div class="panel-body">
                                    <h4>${task.name}</h4>
                                    <h4>${task.createdAt}</h4>
                                    <c:forEach var="entry" items="${task.messages}">
                                        <p class="font-bold gray">${text.escape(entry.message)}</p>
                                    </c:forEach>
                                </div>
                            </li>
                        </c:forEach>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <app:bodyContent/>
</bundle:layout>