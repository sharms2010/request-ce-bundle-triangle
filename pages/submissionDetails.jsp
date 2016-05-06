<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<c:catch var="submissionException">
    <c:set var="submission" value="${Submissions.retrieve(param.id)}" scope="page"/>
</c:catch>
<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <c:import url="${bundle.path}/partials/categoryNav.jsp" charEncoding="UTF-8"/>
    <bundle:scriptpack>
        <bundle:script src="${bundle.location}/js/requestDetails.js" />
    </bundle:scriptpack>
    <bundle:variable name="head">
        <title>Kinetic Data ${text.escape(kapp.name)}</title>
    </bundle:variable>
    <c:set var="timezone" value="${param['timezone']}" scope="session"/>
    <div class ="container-fluid details splitBackgound">
        <div class="container">
            <c:choose>
                <c:when test="${submissionException != null}">
                    <h3>Unable to retrieve submission</h3>
                </c:when>
                <c:otherwise>
                <c:set var="submission" value="${Submissions.retrieve(param.id)}" />
                    <div id="left-column" class="left-column col-md-4 p-y-3">
                        <h1>${submission.form.name}</h1>
                        <h4>Request ID:</h4>
                        <h4>${submission.id}</h4>
                        <h4>Request Date:</h4>
                        <h4 data-moment>${time.format(submission.submittedAt)}</h4>
                        <h4>Status:</h4>
                        <c:if test="${submission.form.getField('Status') == null}">   
                            <h4>${submission.coreState}</h4>
                        </c:if>
                        <c:if test="${submission.form.getField('Status') != null}">
                            <h4>${submission.getValue('Status')}</h4>
                        </c:if>
                        <c:if test="${not empty submission.form.description}">
                            <p>${submission.form.description}</p>
                        </c:if>
                        <c:if test="${empty submission.form.description}">
                            <p>If there is content included in the description section of the form it will display here.  To get to the description section go to the Admin Console.  Select Author tab and choose the form.  Under the form name select the General category.</p>
                        </c:if>
                        <a href="${bundle.spaceLocation}/submissions/${submission.id}?review">
                            <button class="btn btn-primary">Review Request
                            <i class="icon-control-feedback fa fa-play"></i>
                            </button>
                        </a>
                    </div>
                    <div id="right-column" class="right-details col-md-8 p-y-3">
                        <c:choose>
                            <c:when test="${kapp.hasAttribute('Task Server Url') && kapp.hasAttribute('Task Source Name')}">
                                <c:catch var="runsException">
                                    <c:set var="runs" value="${TaskRuns.find(submission)}"/>
                                </c:catch>
                            </c:when>
                            <c:otherwise>
                                <c:set var="runs" value="${[]}"/>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${runsException != null}">
                                <p>There was a problem retrieving post processing task information for this submission.</p>
                                <hr>
                                ${text.escape(taskRunException.message)}
                            </c:when>
                            <c:when test="${empty runs}">
                                <ul>
                                    <c:if test="${submission.coreState == 'Draft'}">
                                        <li class="panel panel-default arrow_box">
                                            <div class="panel-body">
                                                <h3>Started</h3>
                                                <h4 data-moment>${time.format(submission.createdAt)}</h4>
                                            </div>
                                        </li>
                                    </c:if>
                                    <c:if test="${submission.coreState == 'Submitted'}">
                                        <li class="panel panel-default arrow_box">
                                            <div class="panel-body">
                                                <h3>Submitted</h3>
                                                <h4 data-moment>${time.format(submission.submittedAt)}</h4>
                                            </div>
                                        </li>
                                        <li class="panel panel-default arrow_box">
                                            <div class="panel-body">
                                                <h3>In Progress</h3>
                                                <h4 data-moment>${time.format(submission.submittedAt)}</h4>
                                                <p>The request is in progress.</p>
                                            </div>
                                        </li>
                                    </c:if>
                                    <c:if test="${submission.coreState == 'Closed'}">
                                        <li class="panel panel-default arrow_box">
                                            <div class="panel-body">
                                                <h3>Submitted</h3>
                                                <h4 data-moment>${time.format(submission.submittedAt)}</h4>
                                            </div>
                                        </li>
                                        <li class="panel panel-default arrow_box">
                                            <div class="panel-body">
                                                <h3>Completed</h3>
                                                <h4 data-moment>${time.format(submission.closedAt)}</h4>
                                                <p>The request has been completed.</p>
                                            </div>
                                        </li>
                                    </c:if>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <ul>
                                    <c:forEach var="run" items="${runs}">
                                        <c:forEach var="task" items="${run.tasks}">
                                            <li class="panel panel-default arrow_box">
                                                <div class="panel-body">
                                                    <h4>${task.name}</h4>
                                                    <h4 data-moment>${task.createdAt}</h4>
                                                    <c:forEach var="entry" items="${task.messages}">
                                                        <p class="font-bold gray">${text.escape(entry.message)}</p>
                                                    </c:forEach>
                                                </div>
                                            </li>
                                        </c:forEach> 
                                    </c:forEach>
                                </ul>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</bundle:layout>
<script>

</script>
