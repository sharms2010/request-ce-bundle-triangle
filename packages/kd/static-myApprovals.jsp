<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="package/initialization.jspf" %>
<%
    com.kineticdata.core.authentication.Identity identity = 
        (com.kineticdata.core.authentication.Identity) request.getAttribute("identity");
    java.util.Map<String,String> searchOptions = new java.util.HashMap<>();
    searchOptions.put("createdBy", identity.getUsername());
    request.setAttribute("searchOptions", searchOptions);
%>
<bundle:layout page="views/layouts/packageLayout.jsp">

    <bundle:variable name="head">
        <title>Kinetic Data ${app:escape(kapp.name)}</title>
    </bundle:variable>
        
    <div class="row">
        <div class="col-xs-12">
            <div class="row">
                <div class="col-md-8">
                    <h3>${app:escape(form.name)}</h3>
                    <c:set scope="request" var="searchForm" value="${kapp.getForm('approval')}"/>
                    <c:import url="views/partials/static/submissionsByForm.jsp" charEncoding="UTF-8"/>
                </div>
                <div class="col-md-4">
                    <h3>Other Stuff</h3>
                    <div style="border:1px solid #777; padding:15px;">TODO</div>
                </div>
            </div>
        </div>
    </div>
                
    <app:bodyContent/>
</bundle:layout>