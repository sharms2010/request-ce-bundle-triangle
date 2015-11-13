<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="package/initialization.jspf" %>
<%
    com.kineticdata.core.authentication.Identity identity = 
        (com.kineticdata.core.authentication.Identity) request.getAttribute("identity");
    java.util.Map<String,String> searchOptions = new java.util.HashMap<>();
    searchOptions.put("createdBy", identity.getUsername());
    request.setAttribute("searchOptions", searchOptions);
    String view = "submissions";
    request.setAttribute("view", view);
%>
<bundle:layout page="views/layouts/packageLayout.jsp">
    <c:import url="${bundle.packagePath}/views/partials/shared/categoryNav.jsp" charEncoding="UTF-8"/>
    <bundle:scriptpack>
        <bundle:script src="${bundle.packagePath}/js/myRequests.js" />
    </bundle:scriptpack>
    <bundle:stylepack>
        <bundle:style src="${bundle.packagePath}/css/myRequests.css "/>
    </bundle:stylepack>
    <bundle:variable name="head">
        <title>Kinetic Data ${app:escape(kapp.name)}</title>
    </bundle:variable>
    <c:import url="views/partials/static/submissionsByKapp.jsp" charEncoding="UTF-8"/>
    <app:bodyContent/>
</bundle:layout>