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
   
<div class="container hidden-xs mgn-bot-40 mgn-top-40 search-catalog">
      <h1>Helper Console</h1>
</div>

<div class="container">
    <div class="row">

        <div id="helperFormList" class="col-sm-3">
            <div class="panel panel-default">
              <!-- Default panel contents -->
                <div class="panel-heading">
                    <h3 class="panel-title">Helper Objects</h3>
                </div>
              <div class="panel-body">
                <p>The following objects have been configured in the Helper KAPP</p>
              </div>

              <!-- List group -->
              <div class="list-group">
                <c:forEach items="${kapp.forms}" var="form">
                    <a href="#" data-for="${app:escape(form.slug)}"class="list-group-item">${app:escape(form.name)}</a>
                </c:forEach>
              </div>
            </div>
        </div>


        <div id="helperObjectDetails" class="col-sm-9">
            <div class="panel panel-default">
              <!-- Default panel contents -->
                <div class="panel-heading">
                    <h3 class="panel-title">Helper Details</h3>
                </div>
                <div class="panel-body">
                    <form class="form-inline" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default">Search</button>
                    </form>
                </div>

                <!-- List group -->
                <div id="helperSubmissionList"class="list-group">
                </div>
                <div id="helperForm">
                    ...
                </div>
            </div>
        </div>
    </div>
</div>


    <app:bodyContent/>
</bundle:layout>
