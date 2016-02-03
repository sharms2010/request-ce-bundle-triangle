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
            <div class="form-group has-feedback">
                <input type="hidden" value="search" name="page">
                <input type="text" class="states form-control predictiveText x" name="q"/>
                <i class="form-control-feedback fa fa-search search-catalog-icon"></i>
            </div>
        </form>
    </div>
    <!-- Teal category nav -->
    <div class="nav m-b-4">
        <div class="container">
            <div class="row">
                <c:forEach var="category" items="${kapp.categories}">
                <div class="col-sm-odd col-xs-odd">
                    <a href="${bundle.spaceLocation}/${kapp.slug}?page=categories&category=${category.name}">
                        <div class="nav__box text-center">
                            <span class="fa-stack fa-4x center-block hidden-sm hidden-xs">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa ${category.getAttributeValue("fa-logo")} fa-stack-1x fa-inverse"></i>
                            </span>
                            <span class="fa-stack fa-3x center-block visible-sm-inline-block">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa ${category.getAttributeValue("fa-logo")} fa-stack-1x fa-inverse"></i>
                            </span>
                            <span class="fa-stack fa-2x center-block visible-xs-inline-block">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa ${category.getAttributeValue("fa-logo")} fa-stack-1x fa-inverse"></i>
                            </span>
                            <div class="hidden-xs font-light">${text.escape(category.name)}</div>
                            <h5 class="visible-xs font-bold">${text.escape(category.name)}</h5>
                        </div>
                    </a>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <!-- set variables at parent level to be used to not display panels -->
    <c:set scope="request" var="submissionsListDraft" value="${SubmissionHelper.retrieveRecentSubmissions('Service', 'Draft', 3)}"/>
    <c:set scope="request" var="submissionsListSubmitted" value="${SubmissionHelper.retrieveRecentSubmissions('Service', 'Submitted', 3)}"/>
    <c:set scope="request" var="submissionsListApproval" value="${SubmissionHelper.retrieveRecentSubmissions('Approval', 3)}"/>
    <!-- Approval and Requests panel display
    If{not empty list} is used  to not display panel if the list is empty-->
    <div class="container m-b-4">
        <div class="row">
            <div class="col-sm-7 leftside">
                <c:if test="${not empty submissionsListDraft}">
                <div class="panel panel-default">
                    <div class="panel-heading background-tertiary">
                        <div class="panel-title"><h4 class="white">YOUR REQUESTS - DRAFT</h4></div>
                    </div>
                    <div class="panel-body">
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
                                <c:import url="partials/static/submissionsByKapp.jsp" charEncoding="UTF-8"/>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td class="font-bold" colspan="2"><center><a href="${bundle.spaceLocation}/${kapp.slug}/my-requests">VIEW MORE</a></center></td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
                </c:if>
                <c:if test="${not empty submissionsListSubmitted}">
                <div class="panel panel-default">
                    <div class="panel-heading background-tertiary">
                        <div class="panel-title"><h4 class="white">YOUR REQUESTS - SUBMITTED</h4></div>
                    </div>
                    <div class="panel-body">
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
                                <c:import url="partials/static/submissionsByKapp.jsp" charEncoding="UTF-8"/>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td class="font-bold" colspan="2"><center><a href="${bundle.spaceLocation}/${kapp.slug}/my-requests">VIEW MORE</a></center></td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
                </c:if>
                <c:if test="${not empty submissionsListApproval}">
                <div class="panel panel-default ">
                    <div class="panel-heading background-tertiary">
                        <div class="panel-title">
                            <h4 class="white">YOUR APPROVALS</h4>
                        </div>
                    </div>
                    <div class="panel-body">
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
                                <c:import url="partials/static/submissionsByKapp.jsp" charEncoding="UTF-8"/>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td class="font-bold" colspan="2"><center><a href="#">VIEW MORE</a></center></td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
                </c:if>
            </div>
            <!-- Alerts display panel
            If{bundleExists} will not display panel if the alerts bundle is not include in the space-->
            <div class="col-sm-5">
                <c:if test="${alertsBundleExists}">
                <div class="panel panel-default">
                    <div class="panel-heading background-quaternary">
                        <div class="panel-title"><h4>ALERTS</h4></div>
                    </div>
                    <c:import url="partials/static/alerts.jsp" charEncoding="UTF-8"/>
                </div>
                </c:if>
                <!-- Kinetic Twitter feed -->
                <div class=" hidden-xs">
                    <a class="twitter-timeline" href="https://twitter.com/KineticData" data-widget-id="569678005275226112" data-chrome="nofooter">Tweets by @KineticData</a>
                </div>
            </div>
        </div>
    </div>
    <app:bodyContent/>
</bundle:layout>
<script>
    var data = <json:array  name="array" var="form" items="${kapp.forms}">
        <c:if test="${(form.type.name == 'Service') || (form.type.name == 'Template')}">
            <json:object>
                <json:property name="formName" value="${form.name}"/>
                <json:property name="formSlug" value="${form.slug}"/>
            </json:object>
        </c:if>
    </json:array>;
    forms = [];
    map = {};
    $.each(data, function (i, form) {
        map[form.formName] = form;
        forms.push(form.formName);
    });
    var substringMatcher = function(strs) {
        return function findMatches(q, cb) {
        var matches, substringRegex;
        // an array that will be populated with substring matches
        matches = [];
        // regex used to determine if a string contains the substring `q`
        substrRegex = new RegExp(q, 'i');
        // iterate through the pool of strings and for any string that
        // contains the substring `q`, add it to the `matches` array
        $.each(strs, function(i, str) {
            if (substrRegex.test(str)) {
                matches.push(str);
            }
        });
        cb(matches);
        };
    };
    $('.predictiveText').typeahead({
            hint: true,
            highlight: true,
            minLength: 1,
        },
        {
        source: substringMatcher(forms)
        }).on('typeahead:selected', function(event, datum) {
            window.location.href = window.bundle.kappLocation() + "/" + map[datum].formSlug;
        $(this).off('keyup');
        }).on('keyup', function(event) {
            if (event.which == 13){
                $(this).closest('form').submit();
            }
        });
</script>