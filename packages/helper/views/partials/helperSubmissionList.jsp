<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../package/initialization.jspf"%>


<div class="panel panel-default">
  <!-- Default panel contents -->
    <div class="panel-heading">
        <h3 class="panel-title">${kapp.getForm(param['formSlug']).title}</h3>
    </div>
    <div class="panel-body">
        
        <div class="col-sm-9">
            <div class="form-group">
                <input type="text" id="search" class="form-control" placeholder="Filter List">
            </div>
        </div>
        <div class="col-sm-3">
            <a href="${bundle.kappLocation}/${param['formSlug']}" class="btn btn-info pull-left" role="button">Add Record</a>
        </div>
    </div>

    <!-- List group -->
    <div id="helperSubmissionList" class="list-group submissionList">
    	<c:forEach items="${controller.getRecords(param['formSlug'], 'Draft')}" var="helperSubmission">
			<li class="list-group-item">
				<a href="${bundle.spaceLocation}/submissions/${app:escape(helperSubmission.id)}">${helperSubmission.label}</a>
			</li>
		</c:forEach>
    </div>
</div>
