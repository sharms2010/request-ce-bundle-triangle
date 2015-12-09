<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>
<bundle:layout page="layouts/layout.jsp">
  <c:import url="${bundle.path}/partials/shared/categoryNav.jsp" charEncoding="UTF-8"/>
  <bundle:scriptpack>
    <bundle:script src="${bundle.location}/js/service.js" />
  </bundle:scriptpack>
  <bundle:stylepack>
    <bundle:style src="${bundle.location}/css/service.css "/>
  </bundle:stylepack>
  <bundle:variable name="head">
    <title>${form.name}</title>
  </bundle:variable>
  <section class="page container pad-bot-40">
    <header class="page-header">
      <h2>${form.name}
        <small> for: 
          <span id="reqForUser">${identity.username}</span> 
          <button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#personSearchModal" data-personField="ReqForUserID">Change User</button>
        </small>
      </h2>
    </header>
    <div class="errors"></div>
    <app:bodyContent/>
  </section>
</bundle:layout>

<%-- Person Search Div --%>
<div class="modal" tabindex="-1" role="dialog" id="personSearchModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Find a User</h4>
      </div>
      <div class="modal-body">
        <div id="searchInput">
          <div class="form-group">
              <label for="first-name" class="control-label">First Name:</label>
              <input type="text" class="form-control" id="first-name">
          </div>
          <div class="form-group">
            <label for="last-name" class="control-label">Last Name:</label>
            <input class="form-control" id="last-name"></input>
          </div>
        </div>
      </div>
      <div id="personTableDiv" style="display:none">
        <table id="personTable">
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="searchForPerson">Search</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->