<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../../bundle/initialization.jspf" %>
<div class="container requests mgn-top-40 mgn-bot-40">
    <div class="row mgn-bot-40">
        <div class="hidden-xs hidden-sm col-md-4">
          <h1 class="line-height-50">Your Requests</h1>
        </div>
        <div class="col-sm-7 col-md-5">
            <div class="col-xs-4">
              <h4 class="pull-right gray line-height-50">FILTER BY:</h4>
            </div>
            <div class="col-xs-8 pad-top-10">
              <form role="form"> 
                <div class="form-group has-feedback">
                  <input type="text" class="form-control" />
                  <i class="form-control-feedback fa fa-play fa-rotate-90 gray pos-top-none pad-top-10"></i>
                </div>
              </form>
          </div>
        </div>
        <div class="col-sm-5 col-md-3 veiw-style pull-right">
            <div class="col-xs-6 pad-rgt-10">
              <h4 class="pull-right gray line-height-50">VIEW AS:</h4>
            </div>
            <div class="col-xs-3 pad-lft-10 pad-rgt-10">
              <i id="list" class="fa fa-list-ul fa-2x gray line-height-50 pull-right"></i>
            </div>
            <div class="col-xs-3 pad-lft-10">
              <i id="grid" class="fa fa-th-large fa-2x gray line-height-50 pull-right"></i>
            </div>
        </div>
    </div>
    <div class="grid">
        <c:forEach items="${submissionsList}" var="submission">
            <div class="col-sm-4 col-md-3 rightside">
              <div class="panel panel-default">
                <div class="panel-heading  background-tertiary pad-top-10">
                </div>
                <div class="panel-body text-center">
                  <span class="fa-stack fa-4x center-block hidden-sm hidden-xs">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa ${submission.form.getAttributeValue("FA Logo")} fa-stack-1x fa-inverse"></i>
                  </span>
                  <span class="fa-stack fa-3x center-block visible-sm-inline-block">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa ${submission.form.getAttributeValue("FA Logo")} fa-stack-1x fa-inverse"></i>
                  </span>
                  <span class="fa-stack fa-2x center-block visible-xs-inline-block">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa ${submission.form.getAttributeValue("FA Logo")} fa-stack-1x fa-inverse"></i>
                  </span>
                  <h3 class="max-min-height">${text.escape(submission.form.name)}</h3>
                  <div class="font-medium gray">${submission.createdAt}</div>
                  <p class="font-bold gray">${submission.coreState}</p>
                  <a class="display-blk" href="${bundle.kappLocation}/request-details?id=${submission.id}">
                    <button class="btn btn-primary">DETAILS
                      <i class="icon-control-feedback fa fa-play"></i>
                    </button>
                  </a>
                  <a href="${bundle.kappLocation}/${submission.form.slug}">
                    <button class="btn btn-primary mgn-top-10">REORDER
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
          <div class="panel-heading  background-tertiary pad-top-10">
          </div>
          <div class="panel-body text-center">
            <ul class="list-unstyled">
              <li>
                <div class="col-sm-2">
                  <span class="pull-left">
                    <span class=" fa-stack fa-4x  hidden-sm hidden-xs">
                      <i class="fa fa-circle fa-stack-2x"></i>
                      <i class="fa ${submission.form.getAttributeValue("FA Logo")} fa-stack-1x fa-inverse"></i>
                    </span>
                    <span class="fa-stack fa-3x visible-sm-inline-block">
                      <i class="fa fa-circle fa-stack-2x"></i>
                      <i class="fa ${submission.form.getAttributeValue("FA Logo")} fa-stack-1x fa-inverse"></i>
                    </span>
                    <span class="fa-stack fa-2x visible-xs-inline-block">
                      <i class="fa fa-circle fa-stack-2x"></i>
                      <i class="fa ${submission.form.getAttributeValue("FA Logo")} fa-stack-1x fa-inverse"></i>
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
                    <a href="${bundle.kappLocation}/request-details?id=${submission.id}">
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
</div>

