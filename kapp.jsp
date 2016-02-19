<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>
<%@include file="bundle/router.jspf" %>

<%@page import="java.io.File,com.kineticdata.core.web.bundles.Bundle"%>
<%
    String view = "catalog";
    request.setAttribute("view", view);
    // Determine if the alerts bundle is installed on the server
    //  Bundle bundle = (Bundle)request.getAttribute("bundle");
    String alertsBundlePath = request.getServletContext().getRealPath(bundle.getPath() + "/../alerts");
    File alertsBundleDirectory = new File(alertsBundlePath);
    if (alertsBundleDirectory.exists() && alertsBundleDirectory.canRead()) {
    request.setAttribute("alertsBundleExists", true);
    }
%>
<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <bundle:variable name="head">
        <title>Kinetic Data ${text.escape(kapp.name)}</title>
    </bundle:variable>
    <c:if test="${alertsBundleExists}">
        <bundle:scriptpack>
            <bundle:script src="${bundle.location}/js/catalog.js" />
        </bundle:scriptpack>
    </c:if>
    <!-- search -->
    <div class="container m-b-4 m-t-4 search-catalog">       
        <h1 class="p-b-1 text-center">How can we help you today?</h1>
        <form action="${bundle.kappLocation}" method="GET" role="form">
            <div class="input-group">
                <input id="search" autocomplete="off" type="text" class="form-control" name="q">
                <input type="hidden" value="search" name="page">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button">
                        <i id="search-icon" class="fa fa-search"></i>
                    </button>
                </span>
            </div><!-- /input-group -->
        </form>
    </div>
    <!-- Teal category nav -->
    <div class="nav m-b-4">
        <div class="container">
            <div class="row text-center">
                <c:forEach var="category" items="${kapp.categories}">
                    <c:if test="${fn:toLowerCase(category.getAttribute('Hidden').value) ne 'true' && not empty category.forms}">
                        <div class="col-sm-2 col-xs-2 col-centered">
                            <a href="${bundle.spaceLocation}/${kapp.slug}?page=category&category=${category.name}">
                                <div class="nav__box text-center">
                                    <span class="fa-stack center-block icon--size">
                                        <i class="fa fa-circle fa-stack-2x"></i>
                                        <i class="fa ${category.getAttributeValue("fa-logo")} fa-stack-1x fa-inverse"></i>
                                    </span>
                                    <div class="font-light">${text.escape(category.name)}</div>
                                </div>
                            </a>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
    <!-- set variables at parent level to be used to not display panels -->
    <c:set scope="request" var="submissionsListDraft" value="${SubmissionHelper.retrieveRecentSubmissions('Service', 'Draft', 3)}"/>
    <c:set scope="request" var="submissionsListSubmitted" value="${SubmissionHelper.retrieveRecentSubmissions('Service', 'Submitted', 3)}"/>
    <c:set scope="request" var="submissionsListApproval" value="${SubmissionHelper.retrieveRecentSubmissions('Approval', 3)}"/>
    <!-- Approval and Requests panel display
    If{not empty list} is used  to not display table if the list is empty-->
    <div class="container m-b-4">
        <div class="row">
            <div class="col-sm-7 leftside">
                <div class="panel panel-default">
                    <div class="panel-heading background-tertiary">
                        <div class="panel-title"><h4 class="white">YOUR REQUESTS - DRAFT</h4></div>
                    </div>
                    <div class="panel-body">
                        <c:choose>
                            <c:when test="${not empty submissionsListDraft}">
                                <table class="table m-a-0">
                                    <thead>
                                        <tr>
                                            <td class="font-bold p-t-0 gray">SUMMARY</td>
                                            <td class="font-bold p-t-0 text-right gray hidden-xs">STATUS</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="table" value="request-draft" scope="session"/>
                                        <h3>${text.escape(form.name)}</h3>
                                        <c:import url="partials/submissionsByKapp.jsp" charEncoding="UTF-8"/>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td class="font-bold" colspan="2"><center><a href="${bundle.spaceLocation}/${kapp.slug}?page=myRequests&type=Service&state=Draft">VIEW MORE</a></center></td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </c:when>
                            <c:otherwise>
                                <h2 class="text-center">There are no Drafts to display</h2>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading background-tertiary">
                        <div class="panel-title"><h4 class="white">YOUR REQUESTS - SUBMITTED</h4></div>
                    </div>
                    <div class="panel-body">
                        <c:choose>
                            <c:when test="${not empty submissionsListSubmitted}">
                                <table class="table m-a-0">
                                    <thead>
                                        <tr>
                                            <td class="font-bold p-t-0 gray">SUMMARY</td>
                                            <td class="font-bold p-t-0 text-right gray hidden-xs">STATUS</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="table" value="request-submitted" scope="session"/>
                                        <h3>${text.escape(form.name)}</h3>
                                        <c:import url="partials/submissionsByKapp.jsp" charEncoding="UTF-8"/>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td class="font-bold" colspan="2"><center><a href="${bundle.spaceLocation}/${kapp.slug}?page=myRequests&type=Service&state=Submitted">VIEW MORE</a></center></td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </c:when>
                            <c:otherwise>
                                <h2 class="text-center">There are no Submissions to display</h2>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="panel panel-default ">
                    <div class="panel-heading background-tertiary">
                        <div class="panel-title">
                            <h4 class="white">YOUR APPROVALS</h4>
                        </div>
                    </div>
                    <div class="panel-body">
                        <c:choose>
                            <c:when test="${not empty submissionsListApproval}">
                                <table class="table m-a-0">
                                    <thead>
                                        <tr>
                                            <td class="font-bold p-t-0 gray">SUMMARY</td>
                                            <td class="font-bold p-t-0 text-right gray hidden-xs">STATUS</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="table" value="approval" scope="session"/>
                                        <h3>${text.escape(form.name)}</h3>
                                        <c:import url="partials/submissionsByKapp.jsp" charEncoding="UTF-8"/>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td class="font-bold" colspan="2"><center><a href="${bundle.spaceLocation}/${kapp.slug}?page=myRequests&type=Approval">VIEW MORE</a></center></td>
                                    </tr>
                                    </tfoot>
                                </table>
                             </c:when>
                            <c:otherwise>
                                <h2 class="text-center">There are no Approvals to display</h2>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            <!-- Alerts display panel
            If{bundleExists} will not display panel if the alerts bundle is not include in the space-->
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
