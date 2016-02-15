<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<div class="grid">
    <c:forEach items="${submissionsList}" var="submission">
    <div class="col-sm-4 col-md-3 rightside">
        <div class="panel panel-default">
            <div class="panel-heading  background-tertiary p-t-1">
            </div>
            <div class="panel-body text-center">
                <span class="fa-stack fa-4x center-block hidden-sm hidden-xs">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa ${submission.form.getAttributeValue("fa-logo")} fa-stack-1x fa-inverse"></i>
                </span>
                <span class="fa-stack fa-3x center-block visible-sm-inline-block">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa ${submission.form.getAttributeValue("fa-logo")} fa-stack-1x fa-inverse"></i>
                </span>
                <span class="fa-stack fa-2x center-block visible-xs-inline-block">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa ${submission.form.getAttributeValue("fa-logo")} fa-stack-1x fa-inverse"></i>
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
    <c:forEach items="${submissionsList}" var="submission">
    <div class="panel panel-default">
        <div class="panel-heading  background-tertiary p-t-1">
        </div>
        <div class="panel-body text-center">
            <ul class="list-unstyled">
                <li>
                    <div class="col-sm-2">
                        <span class="pull-left">
                            <span class=" fa-stack fa-4x  hidden-sm hidden-xs">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa ${submission.form.getAttributeValue("fa-logo")} fa-stack-1x fa-inverse"></i>
                            </span>
                            <span class="fa-stack fa-3x visible-sm-inline-block">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa ${submission.form.getAttributeValue("fa-logo")} fa-stack-1x fa-inverse"></i>
                            </span>
                            <span class="fa-stack fa-2x visible-xs-inline-block">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa ${submission.form.getAttributeValue("fa-logo")} fa-stack-1x fa-inverse"></i>
                            </span>
                        </span>
                    </div>
                    <div class="col-sm-8">
                        <span class="pull-left text-left">
                            <h3>${text.escape(submission.form.name)}</h3>
                            <p class="font-bold gray">${submission.createdAt}</p>
                            <div class="font-bold gray">${submission.coreState}</div>
                        </span>
                    </div>
                    <div class="col-sm-2">
                        <span class="pull-right text-left">
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
            </ul>
        </div>
    </div>
    </c:forEach>
</div>