<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="package/initialization.jspf" %>
<bundle:layout page="views/layouts/packageLayout.jsp">
  <c:import url="${bundle.packagePath}/views/partials/shared/categoryNav.jsp" charEncoding="UTF-8"/>
    <bundle:variable name="head">
        <title>${app:escape(form.name)}</title>
    </bundle:variable>
    <section class="page container">
     <header class="page-header">
       <h2>${app:escape(form.name)}
         <small> for: 
           <span id="reqForUser"></span> 
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