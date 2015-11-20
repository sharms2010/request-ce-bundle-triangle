<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="package/initialization.jspf" %>

<% com.kineticdata.core.authentication.Identity identity = 
        (com.kineticdata.core.authentication.Identity) request.getAttribute("identity");
    java.util.Map<String,String> searchOptions = new java.util.HashMap<>();
    searchOptions.put("createdBy", identity.getUsername());
    request.setAttribute("searchOptions", searchOptions);    
 %>

<bundle:layout page="views/layouts/packageLayout.jsp">
    <bundle:variable name="head">
        <title>Kinetic Data ${app:escape(kapp.name)}</title>
    </bundle:variable>
    <bundle:stylepack>
        <bundle:style src="${bundle.packagePath}/css/helper.css "/>
    </bundle:stylepack>
    <bundle:scriptpack>
        <bundle:script src="${bundle.packagePath}/js/helper.js" />
    </bundle:scriptpack>
   
<div class="container">
      <h1 style="float:left">Helper Console</h1>
      <c:if test="${identity.isSpaceAdmin()}">
        <button type="button" data-toggle="modal" class="btn btn-info pull-right" data-target="#newObject">Build New Object</button>
        <%--<a href="${bundle.spaceLocation}/app/#/author/forms" class="btn btn-info pull-right" role="button">Build New Object</a>--%>
       </c:if>
</div>

<div class="container">
    <div class="row">

        <div id="helperFormList" class="col-sm-4">
            <div class="panel panel-default">
              <!-- Default panel contents -->
                <div class="panel-heading">
                    <h3 class="panel-title">Helper Objects</h3>
                </div>
              <div class="panel-body">
                <p>The following objects have been configured in the Helper KAPP${user.spaceAdmin}</p>
              </div>

              <!-- List group -->
              <div class="list-group">
                <c:forEach items="${kapp.forms}" var="form">
                    <a href="#" data-for="${app:escape(form.slug)}"class="list-group-item">${app:escape(form.name)}</a>
                </c:forEach>
              </div>
            </div>
        </div>

        <div id="helperObjectDetailsDiv" class="col-sm-8">
            <div id="inner">
            </div>
            <div id="helperObjectDetails">
            </div>
        </div>
            
    </div>
</div>

</bundle:layout>

<!-- Modal -->
<div id="newObject" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Create a new Object</h4>
      </div>
      <div class="modal-body">
        <form role="form">
            <div class="form-group">
              <label for="object-name">Object Name</label>
              <input type="text" id="object-name" class="form-control" id="object-name" placeholder="Friendly Object Name">
            </div>
            <div class="form-group">
              <label for="object-slug">Object Slug</label>
              <input type="text" id="object-slug" class="form-control" id="object-slug" placeholder="Name for URL">
            </div>
            <div class="form-group">
              <label for="object-description">Object Description</label>
              <input type="text" id="object-description" class="form-control" id="object-description" placeholder="Description of Object">
            </div>
          </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" id="createObject" class="btn btn-success">Create Object</button>
      </div>
    </div>

  </div>
</div>

<style>
#inner {
    width: 0%;
    margin: 0 auto;
}

.list-group{
    max-height:320px;
    overflow-y:scroll; 
}

</style>


