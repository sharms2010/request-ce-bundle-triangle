<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>

<bundle:layout page="layouts/layout.jsp">
	<c:import url="${bundle.path}/partials/shared/categoryNav.jsp" charEncoding="UTF-8"/>
    <bundle:scriptpack>
        <bundle:script src="${bundle.location}/js/requestDetails.js" />
    </bundle:scriptpack>
    <bundle:stylepack>
        <bundle:style src="${bundle.location}/css/requestDetails.css "/>
    </bundle:stylepack>
    <bundle:variable name="head">
        <title>Kinetic Data ${text.escape(kapp.name)}</title>
    </bundle:variable>
      <c:set var="submission" value="${submissions.retrieve(param.id)}" />
      
      <div class ="container-fluid details splitBackgound">
      <div class="container">
      <div id="leftDetails" class="col-md-4 pad-bot-40 pad-top-40">
        <h1>${submission.form.name}</h1>
        <h4>Request ID:</h4>
        <h4>${submission.id}</h4>
       
        <h4>Request Date:</h4>
        <h4>${submission.submittedAt}</h4>
        
        <h4>Status:</h4>
        <h4>${submission.coreState}</h4>
      
        <p>This could be instructions. This could be a brief description. This could also be a status update. Esto podría ser instrucciones. Esto podría ser una breve descripción. Esto también podría ser una actualización de estado. Kini mahimong mga panudlo. Kini mahimo nga usa ka mubo nga paghulagway. Kini mahimo usab nga usa ka status update.</p>

        <button class="btn btn-primary">BUTTON HERE
          <i class="icon-control-feedback fa fa-play"></i>
        </button>
      </div>
      <div id="rightDetails" class="col-md-8 pad-bot-40 pad-top-40">
        <ul>
          <c:forEach var="run" items="${runs.find(submission)}">
              <c:forEach var="task" items="${run.tasks}">
                  <li class="panel panel-default arrow_box">
                      <div class="panel-body">
                          <h4>${task.getName()}</h4>
                          <h4>${task.getCreateDate()}</h4>
                          <p class="font-bold gray">${task.getResult('output')}</p>
                      </div>
                  </li>
              </c:forEach>
          </c:forEach>
        </ul>
      </div>
      </div>
      </div>
    <app:bodyContent/>
</bundle:layout>
