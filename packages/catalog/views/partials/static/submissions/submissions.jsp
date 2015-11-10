<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../../../package/initialization.jspf" %>
<div class="container requests">
    <div class="row margin-bottom-40">
        <div class="hidden-xs hidden-sm col-md-4">
          <h1>Your Requests</h1>
        </div>
        <div class="col-sm-6 col-md-5">
          <div class="row">
            <div class="col-xs-4">
              <h4 class="pull-right">FILTER BY:</h4>
            </div>
            <div class="col-xs-8">
              <form role="form"> 
                <div class="form-group has-feedback">
                  <input type="text" class="form-control" />
                  <i class="form-control-feedback fa fa-play fa-rotate-90 easter"></i>
                </div>
              </form>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-md-3 veiw-style">
          <div class="row pull-right">
            <div class="col-xs-6">
              <h4 class="pull-right">VIEW AS:</h4>
            </div>
            <div class="col-xs-3">
              <i id="grid" class="fa fa-th fa-2x"></i>
            </div>
            <div class="col-xs-3">
              <i id="list" class="fa fa-list-ul fa-2x"></i>
            </div>
          </div>
        </div>
    </div>
    <div class="grid">
        <c:forEach items="${submissionsList}" var="submission">
            <div class="col-sm-3 rightside">
              <div class="panel panel-default">
                <div class="panel-heading">
                </div>
                <div class="panel-body text-center">
                  <span class="fa-stack fa-4x center-block hidden-sm hidden-xs">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa fa-frown-o fa-stack-1x fa-inverse"></i>
                  </span>
                  <span class="fa-stack fa-3x center-block visible-sm-inline-block">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa fa-frown-o fa-stack-1x fa-inverse"></i>
                  </span>
                  <span class="fa-stack fa-2x center-block visible-xs-inline-block">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa fa-frown-o fa-stack-1x fa-inverse"></i>
                  </span>
                  <h3><a href="${bundle.spaceLocation}/submissions/${submission.id}">${app:escape(submission.form.name)}</a></h3>
                  <div>${submission.createdAt}</div>
                  <div>${submission.coreState}</div>
                  <button class="btn btn-primary">DETAILS
                    <i class="icon-control-feedback fa fa-play"></i>
                  </button>
                </div>
              </div>
            </div>
        </c:forEach>
    </div>
    <div class="row list">
        <c:forEach items="${submissionsList}" var="submission">
        <div class="panel panel-default">
          <div class="panel-heading">
          </div>
          <div class="panel-body text-center">
            <ul>
              <li>
                <div class="col-sm-2">
                  <span class="pull-left">
                    <span class=" fa-stack fa-4x  hidden-sm hidden-xs">
                      <i class="fa fa-circle fa-stack-2x"></i>
                      <i class="fa fa-frown-o fa-stack-1x fa-inverse"></i>
                    </span>
                    <span class="fa-stack fa-3x visible-sm-inline-block">
                      <i class="fa fa-circle fa-stack-2x"></i>
                      <i class="fa fa-frown-o fa-stack-1x fa-inverse"></i>
                    </span>
                    <span class="fa-stack fa-2x visible-xs-inline-block">
                      <i class="fa fa-circle fa-stack-2x"></i>
                      <i class="fa fa-frown-o fa-stack-1x fa-inverse"></i>
                    </span>
                  </span>
                </div>
                <div class="col-sm-8">
                  <span class="pull-left">
                    <h3><a href="${bundle.spaceLocation}/submissions/${submission.id}">${app:escape(submission.form.name)}</a></h3>
                    <p>${submission.createdAt}</p>
                    <div>${submission.coreState}</div>
                  </span>
                </div>
                <div class="col-sm-2">
                  <span class="pull-right">
                    <button class="btn btn-primary">DETAILS
                      <i class="icon-control-feedback fa fa-play"></i>
                    </button>
                  </span>
                </div>
              </li>
            </ul>
          </div>
        </div>
        </c:forEach>
    </div>
</div>
<!-- <table class="table table-striped table-hover">
    <thead>
        <tr>
            <th class="date">Created At</th>
            <th>Created By</th>
            <th>Form</th>
            <th>State</th>
            <th class="nosort">Submission</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${submissionsList}" var="submission">
            <tr>
                <td>${submission.createdAt}</td>
                <td>${app:escape(submission.createdBy)}</td>
                <td>${app:escape(submission.form.name)}</td>
                <td>${submission.coreState}</td>
                <td><a href="${bundle.spaceLocation}/submissions/${submission.id}">${submission.id}</a></td>
            </tr>
        </c:forEach>
    </tbody>
</table> -->