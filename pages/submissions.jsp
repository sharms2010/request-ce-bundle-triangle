<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <c:import url="${bundle.path}/partials/categoryNav.jsp" charEncoding="UTF-8"/>
    <bundle:scriptpack>
        <bundle:script src="${bundle.location}/js/myRequests.js" />
    </bundle:scriptpack>
    <bundle:variable name="head">
        <title>Kinetic Data ${kapp.name}</title>
    </bundle:variable>
    
    <div class="container requests m-y-4">
        <div class="row m-b-4">
            <div class="hidden-xs hidden-sm col-md-4">
                <h1 class="line-height-50">Your Submissions</h1>
            </div>
            <div class="col-sm-7 col-md-5">
                <div class="col-xs-4">
                    <h4 class="pull-right gray line-height-50">FILTER BY:</h4>
                </div>
                <div class="col-xs-8 p-t-1 input-field">
                    <form role="form">
                        <div class="input-group">
                            <input type="text" class="form-control" />
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-play fa-rotate-90"></i>
                                </button>
                            </span>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-sm-5 col-md-3 veiw-style pull-right">
                <div class="col-xs-6 p-r-1">
                    <h4 class="pull-right gray line-height-50">VIEW AS:</h4>
                </div>
                <div class="col-xs-3 p-l-1 p-r-1">
                    <i id="list" class="fa fa-list-ul fa-2x gray icon--height-50 pull-right" style="line-height:50px"></i>
                </div>
                <div class="col-xs-3 p-l-1">
                    <i id="grid" class="fa fa-th-large fa-2x gray icon--height-50 pull-right" style="line-height:50px"></i>
                </div>
            </div>
        </div>
        <c:choose>
            <c:when test="${param['state']}">
                <c:set scope="request" var="submissionsList" value="${SubmissionHelper.retrieveRecentSubmissions(param['type'], param['state'])}"/>
            </c:when>
            <c:otherwise>
                <c:set scope="request" var="submissionsList" value="${SubmissionHelper.retrieveRecentSubmissions(param['type'])}"/>
            </c:otherwise>
        </c:choose>
        <div class="grid">
            <c:forEach items="${submissionsList}" var="submission">
                <div class="col-sm-4 col-md-3 rightside">
                    <div class="panel panel-default">
                        <div class="panel-heading  background-tertiary p-t-1">
                        </div>
                        <div class="panel-body text-center">
                            <span class="fa-stack center-block icon--size">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa ${category.getAttributeValue("Icon")} fa-stack-1x fa-inverse"></i>
                            </span>
                            <h3 class="max-min-height">${text.escape(submission.form.name)}</h3>
                            <div class="font-medium gray">${submission.createdAt}</div>
                            <p class="font-bold gray">${submission.coreState}</p>
                            <a class="display-blk" href="${bundle.spaceLocation}?page=requestDetails&id=${submission.id}">
                                <button class="btn btn-primary">DETAILS
                                <i class="icon-control-feedback fa fa-play"></i>
                                </button>
                            </a>
                            <a href="${bundle.kappLocation}/${submission.form.slug}">
                                <button class="btn btn-primary m-t-1">REORDER
                                <i class="icon-control-feedback fa fa-play"></i>
                                </button>
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="list">
            <ul class="list-unstyled">
                <c:forEach items="${submissionsList}" var="submission">
                    <div class="panel panel-default">
                        <div class="panel-heading  background-tertiary p-t-1">
                        </div>
                        <div class="panel-body text-center">
                            <li>
                                <div class="col-sm-2">
                                    <span class="pull-left">
                                        <span class="fa-stack center-block icon--size">
                                            <i class="fa fa-circle fa-stack-2x"></i>
                                            <i class="fa ${category.getAttributeValue("Icon")} fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </span>
                                </div>
                                <div class="col-sm-8">
                                    <span class="pull-left text-left panel__valign-text">
                                        <h3>${text.escape(submission.form.name)}</h3>
                                        <p class="font-bold gray">${submission.createdAt}</p>
                                        <div class="font-bold gray">${submission.coreState}</div>
                                    </span>
                                </div>
                                <div class="col-sm-2">
                                    <span class="pull-right text-left panel__valign-buttons">
                                        <a href="${bundle.kappLocation}?page=requestDetails&id=${submission.id}">
                                            <button class="btn btn-primary">DETAILS
                                            <i class="icon-control-feedback fa fa-play"></i>
                                            </button>
                                        </a>
                                        <a href="${bundle.kappLocation}/${submission.form.slug}">
                                            <button class="btn btn-primary">REORDER
                                            <i class="icon-control-feedback fa fa-play"></i>
                                            </button>
                                        </a>
                                    </span>
                                </div>
                            </li>
                        </div>
                    </div>                    
                </c:forEach>
            </ul>
        </div>
    </div>
</bundle:layout>