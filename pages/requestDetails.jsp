<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<%
    request.setAttribute("time", new TimeHelper());
%>
<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <c:import url="${bundle.path}/partials/categoryNav.jsp" charEncoding="UTF-8"/>
    <bundle:scriptpack>
        <bundle:script src="${bundle.location}/js/requestDetails.js" />
    </bundle:scriptpack>
    <bundle:variable name="head">
        <title>Kinetic Data ${text.escape(kapp.name)}</title>
    </bundle:variable>
    <c:set var="timezone" value="${param['timezone']}" scope="session"/>
    <c:set var="submission" value="${Submissions.retrieve(param.id)}" />
    <div class ="container-fluid details splitBackgound">
        <div class="container">
            <div class="left-column col-md-4 p-y-3">
                <h1>${submission.form.name}</h1>
                <h4>Request ID:</h4>
                <h4>${submission.id}</h4>
                <h4>Request Date:</h4>
                <h4 id="submittedAt">${time.format(submission.submittedAt,'MM/dd/YYYY HH:mm:ss','America/Chicago', Locale.ENGLISH)}</h4>
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
            <div class="right-details col-md-8 p-y-4">
                <c:catch var="runsException">
                    <c:set var="runs" value="${TaskRuns.find(submission)}"/>
                </c:catch>
                <c:if test="${runsException eq null }">
                <ul>
                    <c:forEach var="run" items="runs">
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
                </c:if>
                <c:if test="${runsException ne null}">
                    <p>${runsException}</p>
                </c:if>
            </div>
        </div>
    </div>
    <app:bodyContent/>
</bundle:layout>