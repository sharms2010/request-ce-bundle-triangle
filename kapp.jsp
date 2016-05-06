<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@page import="java.io.File,com.kineticdata.core.web.bundles.Bundle"%>
<%@include file="bundle/initialization.jspf" %>
<%@include file="bundle/router.jspf" %>

<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <bundle:variable name="head">
        <title>Kinetic Data ${text.escape(kapp.name)}</title>
    </bundle:variable>
    <bundle:scriptpack>
        <bundle:script src="${bundle.location}/js/catalog.js" />
    </bundle:scriptpack>  
    <!-- search -->
    <div class="container m-y-4 input-field">
        <h1 class="p-b-1 text-center">How can we help you today?</h1>
        <form class="input-field--responsive" action="${bundle.kappLocation}" method="GET" role="form">
            <div class="input-group">
                <input id="search" autocomplete="off" type="text" class="form-control" name="q">
                <input type="hidden" value="search" name="page">
                <span class="input-group-btn">
                    <button id="search-button" class="btn" type="button">
                        <i class="fa fa-search"></i>
                    </button>
                </span>
            </div><!-- /input-group -->
        </form>
    </div>
    <!-- Teal category nav -->
    <div class="nav m-b-4">
        <div class="container">
            <div class="row text-center">
                <c:forEach var="bundleCategory" items="${CategoryHelper.getCategories(kapp)}">
                    <c:set var="formsStatusActive" value="${FormHelper.getFormsByStatus(bundleCategory.category,'Active')}"/>
                    <c:if test="${fn:toLowerCase(category.getAttribute('Hidden').value) ne 'true' && not empty formsStatusActive }">
                        <div class="nav__box col-sm-2 col-xs-2 col-centered">
                            <a href="${bundle.spaceLocation}/${kapp.slug}?page=category&category=${bundleCategory.slug}">
                                <div class="text-center">
                                    <span class="fa-stack center-block icon--size">
                                        <i class="fa fa-circle fa-stack-2x"></i>
                                        <i class="fa ${bundleCategory.getAttributeValue("Icon")} fa-stack-1x fa-inverse"></i>
                                    </span>
                                    <h3 class="font-light">${text.escape(bundleCategory.name)}</h3>
                                    <div>${bundleCategory.getAttributeValue("Description")}</div>
                                </div>
                            </a>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
<!-- Approval and Requests panel display
    If{not empty list} is used  to not display table if the list is empty-->
    <div class="container m-b-4">
        <div class="row">
            <div class="col-sm-7 leftside">
                <c:set scope="request" var="submissionsListApproval" value="${SubmissionHelper.retrieveRecentSubmissions('Approval', 3)}"/>
                <c:if test="${not empty submissionsListApproval}">
                    <div class="panel panel-default ">
                        <div class="panel-heading background-tertiary">
                            <div class="panel-title">
                                <h4 class="white">YOUR APPROVALS</h4>
                            </div>
                        </div>
                        <div class="panel-body">
                            <c:set scope="request" var="type" value="Approval"/>
                            <c:set scope="request" var="state" value=""/>
                            <c:set scope="request" var="submissionsList" value="${submissionsListApproval}"/>
                            <c:import url="${bundle.path}/partials/submissionsTable.jsp" charEncoding="UTF-8"/>
                        </div>
                    </div>
                </c:if>
                <c:set scope="request" var="submissionsListDraft" value="${SubmissionHelper.retrieveRecentSubmissions('Service', 'Draft', 3)}"/>
                <c:if test="${not empty submissionsListDraft}">
                    <div class="panel panel-default">
                        <div class="panel-heading background-tertiary">
                            <div class="panel-title"><h4 class="white">YOUR REQUESTS - DRAFT</h4></div>
                        </div>
                        <div class="panel-body">
                            <c:set scope="request" var="type" value="Service"/>
                            <c:set scope="request" var="state" value="Draft"/>
                            <c:set scope="request" var="submissionsList" value="${submissionsListDraft}"/>
                            <c:import url="${bundle.path}/partials/submissionsTable.jsp" charEncoding="UTF-8"/>
                        </div>
                    </div>
                </c:if>
                <div class="panel panel-default">
                    <div class="panel-heading background-tertiary">
                        <div class="panel-title"><h4 class="white">YOUR REQUESTS - SUBMITTED</h4></div>
                    </div>
                    <div class="panel-body">
                        <c:set scope="request" var="submissionsListSubmitted" value="${SubmissionHelper.retrieveRecentSubmissions('Service', 'Submitted', 3)}"/>
                        <c:choose>
                            <c:when test="${not empty submissionsListSubmitted}">
                                <c:set scope="request" var="type" value="Service"/>
                                <c:set scope="request" var="state" value="Submitted"/>
                                <c:set scope="request" var="submissionsList" value="${submissionsListSubmitted}"/>
                                <c:import url="${bundle.path}/partials/submissionsTable.jsp" charEncoding="UTF-8"/>
                            </c:when>
                            <c:otherwise>
                                <p class="text-center">There are no Requests to display</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            <div class="col-sm-5">
                <!-- Kinetic Twitter feed -->
                <div class=" hidden-xs">
                    <a class="twitter-timeline" href="https://twitter.com/KineticData" data-widget-id="569678005275226112" data-chrome="nofooter">Tweets by @KineticData</a>
                </div>
            </div>
        </div>
    </div>                   
    <app:bodyContent/>
</bundle:layout>
