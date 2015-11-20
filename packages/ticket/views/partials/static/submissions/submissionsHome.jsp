<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../../../package/initialization.jspf" %>

<ul class="list-group submissions-list">
  <c:set var="count" value="0"/>
    <c:forEach items="${submissionsList}" var="submission">
      <c:if test="${count < 8}">
        <li class="list-group-item">
              <div class="row">
                <div class="col-md-12">
                  <a href="#ticketDetails">${submission.getValue('Summary').getValue()}</a>
                </div>
              </div>
              <div class="row">
                <div class="col-md-7"><i class="fa fa-group fa-fw"></i>${submission.getValue('Assigned Group').getValue()}
                </div>
                <div class="col-md-5"><i class="fa fa-bookmark fa-fw"></i>${submission.getValue('State').getValue()}
                </div>
              </div>
              <div class="row">
                <div class="col-md-7">
                  <i class="fa fa-user fa-fw"></i>${submission.getValue('Assigned Individual').getValue()}
                </div>
                <div class="col-md-5"><i class="fa fa-calendar fa-fw"></i><span class="date-time-relative" display="none">${submission.createdAt}</span>
                </div>
              </div>
        </li>
        <c:set var="count" value="${count+1}"/> 
      </c:if>
    </c:forEach>    
</ul>
<div class="text-center">
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="active"><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</div>
