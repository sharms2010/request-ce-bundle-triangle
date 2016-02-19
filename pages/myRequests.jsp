<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<%
    String view = "submissions";
    request.setAttribute("view", view);
%>
<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <c:import url="${bundle.path}/partials/categoryNav.jsp" charEncoding="UTF-8"/>
    <bundle:scriptpack>
        <bundle:script src="${bundle.location}/js/myRequests.js" />
    </bundle:scriptpack> 
    <bundle:variable name="head">
        <title>Kinetic Data ${kapp.name}</title>
    </bundle:variable>
    <c:set scope="request" var="type" value="${param['type']}"/>
    <c:set scope="request" var="state" value="${param['state']}"/>
    
<div class="container requests m-t-4 m-b-4">
    <div class="row m-b-4">
        <div class="hidden-xs hidden-sm col-md-4">
            <h1 class="line-height-50">Your Requests</h1>
        </div>
        <div class="col-sm-7 col-md-5">
            <div class="col-xs-4">
                <h4 class="pull-right gray line-height-50">FILTER BY:</h4>
            </div>
            <div class="col-xs-8 p-t-1">
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
    <c:import url="${bundle.path}/partials/submissionsByKapp.jsp" charEncoding="UTF-8"/>
</div>
    <app:bodyContent/>
</bundle:layout>