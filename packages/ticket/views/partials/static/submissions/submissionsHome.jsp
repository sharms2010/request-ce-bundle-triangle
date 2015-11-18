<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../../../package/initialization.jspf" %>

<div class="row">
  <c:set var="count" value="0"/>
    <c:forEach items="${submissionsList}" var="submission">
      <c:if test="${count < 8}">
            <div class="col-md-12 well">
              <div class="row">
                <div class="col-md-12">
                  <a href="${bundle.spaceLocation}/request-details?id=${submission.id}">${submission.getValue('Summary').getValue()}</a>
                </div>
              </div>
              <div class="row">
                <div class="col-md-7 col-xs-7"><i class="fa fa-group fa-fw"></i>${submission.getValue('Assigned Group').getValue()}
                </div>
                <div class="col-md-5 col-xs-5"><i class="fa fa-bookmark fa-fw"></i>${submission.getValue('State').getValue()}
                </div>
              </div>
              <div class="row">
                <div class="col-md-7 col-xs-7">
                  <i class="fa fa-user fa-fw"></i>${submission.getValue('Assigned Individual').getValue()}
                </div>
                <div class="col-md-5 col-xs-5 text-danger"><i class="fa fa-calendar fa-fw"></i> a month ago
                </div>
              </div>
            </div>
        <c:set var="count" value="${count+1}"/> 
      </c:if>
    </c:forEach>    
</div>
