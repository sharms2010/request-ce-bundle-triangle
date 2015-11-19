<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../package/initialization.jspf"%>


<div class="panel panel-default">
  <!-- Default panel contents -->
    <div class="panel-heading">
        <h3 class="panel-title">Helper Details</h3>
    </div>
    <div class="panel-body">
        <form class="form-inline" role="search">
            <div class="form-group">
                <input type="text" id="search" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default">Search</button>
        </form>
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
